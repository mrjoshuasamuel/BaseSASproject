proc sort data=projectw.customer;
by c_city;
run;
proc freq data=projectw.customer;
tables c_city / nocum nopercent;
run;
