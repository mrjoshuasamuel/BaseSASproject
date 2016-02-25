proc format;
	value age 18-25='Young'
			  26-45='Middle Age'
			  46-100='Senior Citizens';
run;
proc sort data=projectw.customer;
by c_age;
run;
proc freq data=projectw.customer;
format c_age age.;
tables c_age / nocum nopercent;
run;
