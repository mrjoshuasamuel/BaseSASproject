libname projectw "S:\Bank Project\Base SQL Macros\Data Sets";

proc sort data=projectw.geography;
by g_brnch_cd;
run;
proc sort data=projectw.loans;
by g_brnch_cd;
run;
data projectw.disburse_pending;
merge projectw.geography(in=geo) projectw.loans(in=loans);
by g_brnch_cd;
if geo=1 and loans=1;
pending_disburse=approved-disbursd;
if pending_disburse>0;
keep city approved disbursd pending_disburse;
run;
proc print data=projectw.disburse_pending;
run;	
