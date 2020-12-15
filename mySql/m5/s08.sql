-- procedure with parameters

use me;

drop procedure if exists get_coder_salary;

delimiter //

create procedure get_coder_salary(
	in p_coder_id integer,
    out p_salary decimal(8, 2)
) begin
	select salary
	into p_salary
	from coders
	where coder_id = p_coder_id;
end;

create procedure get_department_led(
	in p_employee_id integer,
    out p_department_name varchar(30)
) begin
	select department_name
	into p_department_name
	from departments
	where manager_id = p_employee_id;
end;

// delimiter ;

call get_coder_salary(13404, @my_salary);
select @my_salary;

-- exercise
-- create procedure get_department_led
-- in: employee id
-- out: department name
--        name of department led by in param, or '!!!'
