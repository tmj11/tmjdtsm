clc
clearvars -except ym2
%restoredefaultpath

%load package and setup folders for data
import tmjdtsm.*
addpath('Data')
addpath('KalmanFilter')

%setup dates and load data
startdate=datetime(19850101,'ConvertFrom','yyyyMMdd');
dates=dateshift(startdate,'end','month',0:275);
maturities=[0.5 1 2 3 4 5 7 10]*12;

[yields,datesShifted,missingdateFlags] = getGSWyields(maturities,dates);
data=yields./100;

%OOP script


%ym2=atsm(5,'test2');



ym2=estimate(ym2,data,maturities);


table(round(ym2.theta,6),'RowNames',ym2.names.theta)