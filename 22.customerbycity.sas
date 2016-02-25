proc tabulate data=projectw.customer;
class c_country c_city c_emp_status;
table c_country*c_city * c_emp_status ;
run;
