## Script written for merging data sets comprised of the X, Y and Subject ID values.
##
##
##
## setting adn getting working directory. In your working directory should be a folder named UCI HAR Dataset. From this folder
## the files should be read.


ReadAppendSet<-function(folder){

   ## setting up the main path
   
   path1<-paste(paste(getwd(),"UCI HAR Dataset",sep="/"),folder,sep="/")

   ## reading features data set: list of the registered features

   pathFeat<-file.path(paste(getwd(),"UCI HAR Dataset",sep="/"),"features.txt")
   features<-read.table(pathFeat,header=F,as.is=T, col.names=c("FeatID","FeatName"))
     
    ## reading the activity labels

    pathActv<-file.path(paste(getwd(),"UCI HAR Dataset",sep="/"),"activity_labels.txt")
    actLabel<-read.table(pathActv,header=F,as.is=T, col.names=c("ActID","ActName"))
    actLabel$ActName<-as.factor(actLabel$ActName)
   
   ## reading y data set: list of the activities
   
   pathy_def<-file.path(path1,paste0("y_",folder,".txt"))
   y_data<-read.table(pathy_def,header=F,col.names=c("ActID"))


   ## reading x data set: values of the registered features
   
   pathx_def<-file.path(path1,paste0("X_",folder,".txt"))
   x_data<-read.table(pathx_def,header=F,col.names=features$FeatName)

   ## reading subject data: list of subjects in the study
   
   path_def<-file.path(path1,paste0("subject_",folder,".txt"))
   subject_data<-read.table(path_def,header=F,col.names=c("Subject"))
   
     

   ## Appending the data sets. We first subset the x_data, since we
   ## only need the measurements on the mean and standard deviation

   coln<-grep(".*mean\\(\\)|.*std\\(\\)",features$FeatName)                    
   x_subset<-x_data[,coln]
   append_data<-cbind(x_subset,y_data$ActID,subject_data$Subject)
   names(append_data)[ncol(x_subset)+1]<-paste("ActID")
   names(append_data)[ncol(x_subset)+2]<-paste("Subject")
 

   data_merged<-merge(append_data,actLabel)
   
   
   
   ## return appended data
   
   data_merged

}

MergeSet<-function(data1,data2){
   ## we merge the data sets
   dataMerged<-rbind(data1,data2)
   
   ## read the column names and change some of them, the ones with the "mean" and "sd".
   cnames<-colnames(dataMerged)
   cnames<-gsub("\\.+mean\\.+",cnames, replacement="Mean")
   cnames<-gsub("\\.+std\\.+",cnames, replacement="SD")
   colnames(dataMerged)<-cnames
   dataMerged
}


MeltedData<-function(data1){

  library(reshape2)
  ## melting and recasting..
  varId<- c("ActID","ActName","Subject")
  varMeasu<-setdiff(colnames(data1),varId)
  dataMelted<-melt(data1,id=varId,measure.vars=varMeasu)
  
  ## It returns the second data set, independent tidy data set with the average of each variable for each actv, and each subject.
  dcast(dataMelted,Subject+ActName~variable,mean)
}


####### Main function 
####### Parms: file1 and file2
####### file1 : filename of the merged data set with only mean and std measurements.
####### file2 : filename of the data set with the average of each variable for each activity and each subject in the file1. 

MainTidy<-function(file1,file2){

   ### file1 : merged data set with only mean and std measurements.
   ### file2 : data set with the average of each variable for each activity and each subject in the file1. 

   ### We first read and append the data sets from different directories: train and test set. 
   data1<-ReadAppendSet("train")
   data2<-ReadAppendSet("test")
   
   ### We apply the Merge function so that we have the whole data set, train+test both together. 
   datamerged<-MergeSet(data1,data2)
   
   ### and finally melting process, being a data set with the average of each variable for each activity and each subject in the 
   ### previous data set (datamerged).
   
   dataMelted<-MeltedData(datamerged)
   #dataMelted
   
   ### Output Delivery System: both data sets, datamerged and dataMelted are written to a .txt file. 
   ### file1 : filename of the merged data set with only mean and std measurements.
   ### file2 : filename of the data set with the average of each variable for each activity and each subject in the file1.
    
   outpath1<-file.path(paste(getwd(),"UCI HAR Dataset",sep="/"),paste(file1,".txt",sep=""))
   outpath2<-file.path(paste(getwd(),"UCI HAR Dataset",sep="/"),paste(file2,".txt",sep=""))
   
   write.table(datamerged,file=outpath1,sep="\t",col.names=TRUE,row.names=FALSE, quote=FALSE, na=".")
   write.table(dataMelted,file=outpath2,sep="\t",col.names=TRUE,row.names=FALSE, quote=FALSE, na=".")

}