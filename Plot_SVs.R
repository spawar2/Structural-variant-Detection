# Author: Shrikant Pawar Date: 10/09/19
# Purpose: Plotting different SV's for different coverages of Pacbio data
# Creating objects with different coverages
Thirtyx <- c(60,8414,10904,93,0,2,5);
Threepointthreex <- c(2, 789, 1080, 7, 0, 0, 0);
Threepointsevenx <- c(2, 870, 1187, 7, 0, 0, 0);
Sevenpointtwox <- c(5, 1701, 2246, 12, 0, 0, 0);
Fourteenpointsixx <- c(15, 3604, 4559, 27, 0, 0, 0);
# Creating dataframe with above data
Data <- data.frame(Thirtyx, Fourteenpointsixx, Sevenpointtwox, Threepointsevenx, Threepointthreex)
rownames(Data) <- c("INV","DEL","INS","DUP","TRA","INVDUP","DEL/INV")
Data <- as.matrix(Data)
# Barplot to plot
barplot(Data, main="Distribution of SV's (Sniffles) along different coverages",
  xlab="Coverage (x)", ylab="Count", col=c("darkblue","red", "green", "yellow", "black", "orange", "violet"),
  legend = rownames(Data), beside=TRUE, names.arg=c("30.2","14.6","7.22","3.74","3.30")
)
# Reading the unique files sorted in excel for above 4 data objects
setwd("/Users/yalegenomecenter/Desktop/CSV files")
MyData <- read.csv(file="Uniques.csv", header=TRUE, sep=",")
# subsetting SV's from all unique sets for plotting
AandB <- data.frame(MyData[,1],MyData[,2])
AandB <- na.omit(AandB)
AandC <- data.frame(MyData[,4],MyData[,5])
AandC <- na.omit(AandC)
AandD <- data.frame(MyData[,7],MyData[,8])
AandD <- na.omit(AandD)
AandE <- data.frame(MyData[,10],MyData[,11])
AandE <- na.omit(AandE)
for (i in c("<INV>","<DEL>","<INS>","<DUP>","<TRA>","<INVDUP>","<DEL/INV>")){
  print(dim(AandE[which(AandE[,2]==i),]))
}
# Create objects with different SV's from above
AandBplot <- c(41,4800,6349,47,0,2,5)
AandCplot <- c(49,6685,8631,58,0,2,5)
AandDplot <- c(52,7510,9677,62,0,2,5)
AandEplot <- c(52,7589,9780,62,0,2,5)
# Creating dataframe with above data
Data1 <- data.frame(AandBplot, AandCplot, AandDplot, AandEplot)
rownames(Data1) <- c("INV","DEL","INS","DUP","TRA","INVDUP","DEL/INV")
Data1 <- as.matrix(Data1)
barplot(Data1, main="Distribution of unique SV's (Sniffles) along different coverages",
  xlab="Coverage Difference (x)", ylab="Count", col=c("darkblue","red", "green", "yellow", "black", "orange", "violet"),
  legend = rownames(Data1), beside=TRUE, names.arg=c("30.2-14.6","30.2-7.22","30.2-3.74","30.2-3.30"))
abline(h=4800)
# Finding the list of common SV's from all uniques throughout
colnames(AandB) <- c("ID", "SV")
colnames(AandC) <- c("ID", "SV")
colnames(AandD) <- c("ID", "SV")
colnames(AandE) <- c("ID", "SV")
first <- merge(AandB, AandC, by="ID", all = T)
second <- merge(first, AandD, by="ID", all = T)
third <- merge(second, AandE, by="ID", all = T)
# Calculate the missings from 30X which are lost in each of the other coverages.
dim(third[which(third[,2]=="<INS>"),])
dim(third[which(third[,2]=="<INV>"),])
dim(third[which(third[,2]=="<DUP>"),])
dim(third[which(third[,2]=="<DEL>"),])
dim(third[which(third[,2]=="<TRA>"),])
dim(third[which(third[,2]=="<INVDUP>"),])
dim(third[which(third[,2]=="<DEL/INV>"),])
--------IDS are not consistent so cant use above id common sort-------------------
# Making a file with common file with all the info.
setwd("/Users/yalegenomecenter/Desktop/")
MyData <- read.csv(file="All_Coverages.csv", header=TRUE, sep=",")
df1 = data.frame(MyData[,1],MyData[,2])
df2 = data.frame(MyData[,7],MyData[,8])
df3 = data.frame(MyData[,13],MyData[,14])
df4 = data.frame(MyData[,19],MyData[,20])
df5 = data.frame(MyData[,25],MyData[,26])
colnames(df1) <- c("POS","VAR")
colnames(df2) <- c("POS","VAR")
colnames(df3) <- c("POS","VAR")
colnames(df4) <- c("POS","VAR")
colnames(df5) <- c("POS","VAR")

for (i in 1) {df<-merge(x=df1,y=df2,by="POS",all=TRUE);
dff<-merge(x=df,y=df3,by="POS",all=TRUE);
dfff<-merge(x=dff,y=df4,by="POS",all=TRUE);
dffff<-merge(x=dfff,y=df5,by="POS",all=TRUE);
dim(dffff)
}























