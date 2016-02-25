proc sort data=projectw.customer;
by c_incomegrp;
run;
proc freq data=projectw.customer;
tables c_incomegrp/nocum nopercent;
run;
