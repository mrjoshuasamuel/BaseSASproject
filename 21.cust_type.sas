proc sort data=projectw.customer out=projectw.custsort;
by cust_code;
run;
proc sort data=projectw.loans out=projectw.loansort;
by cust_code;
run;
data projectw.custtype;
merge projectw.custsort(in=cs) projectw.loansort(in=ct);
by cust_code;
if cs and ct;
retain Status ;
if applied>approved then Status="Rejected";
else if applied < approved then Status="Disbursed";
run;
proc sort data=projectw.custtype;
by cust_type status;
run;
proc freq data=projectw.custtype;
tables cust_type status;
run;
