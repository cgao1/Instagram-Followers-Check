library(rjson)
# open files
followers <- "followers.json"
followers_data <- fromJSON(file=followers)
following <- "following.json"
following_data <- fromJSON(file=following)


appending<-function(x){
  followinglist=list()
  i=1
  for (value in i:length(final)) {
    followinglist<-append(followinglist,final[i])
    i<-i+3
  }  
  return(as.data.frame(t(as.data.frame(followinglist))))
}

#following
newlist<-list(unlist(following_data))
newlist<-as.data.frame(newlist)
colnames(newlist)<-"col1"

newlist$col2<- ifelse(newlist$col1=="",1,0)
df2<-newlist[newlist$col2=="0",]

df2<-df2[-1,]
df<-as.data.frame(df2[,1])
colnames(df)<-"col1"
final<-list(df$col1)[[1]]


followinglist<-na.omit(appending(final))
rownames(followinglist)<-c(1:length(followinglist[[1]]))
colnames(followinglist)<-c("following")
View(followinglist)

# followers
newlist<-list(unlist(followers_data))
newlist<-as.data.frame(newlist)
colnames(newlist)<-"col1"

newlist$col2<- ifelse(newlist$col1=="",1,0)
df2<-newlist[newlist$col2=="0",]

df2<-df2[-1,]
dffollwers<-as.data.frame(df2[,1])
colnames(dffollwers)<-"col1"
final<-list(dffollwers$col1)[[1]]

followerslist<-na.omit(appending(final))
rownames(followerslist)<-c(1:length(followerslist[[1]]))
colnames(followerslist)<-c("followers")
View(followerslist)


# Compare who does not follow you that you follow
people<-function(x,y){
  following<-x
  follower<-y
  instagrampeople<-following[[1]][!following[[1]] %in% follower[[1]]]
  print(instagrampeople)
}

instagrampeople<-people(followinglist,followerslist)
