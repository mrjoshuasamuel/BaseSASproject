*a);
proc sort data=projectw.time;
by time_code;
run;
proc sort data=projectw.loans;
by time_code;
run;
data projectw.loansbytime;
merge projectw.loans (in=loans) projectw.time(in=tim);
by time_code;
if loans and tim;
keep applied year;
run;
proc sort data=projectw.loansbytime;
by year;
run;
proc sort data=projectw.time;
by year;
run;
data projectw.loansbyyear;
merge projectw.loansbytime(in=lt) projectw.time(in=t);
by year;
if first.year then;
	do;
		Tapplied+applied;
	end;
if last.year;
keep year tapplied;
run;
proc sort data=projectw.loansbyyear;
by tapplied;
run;

proc print data=projectw.loansbyyear;
run;
*b);




