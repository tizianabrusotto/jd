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

// delimiter ;


call get_coder_salary(103, @my_salary);
select @my_salary;

-- exercise
-- create procedure get_department_led
-- in: employee id
-- out: department name
--        name of department led by in param, or '!!!'

-- exercise /2
-- create procedure get_department_name
-- in: employee id
-- out: department name in which the employee works
--        name of department or '!!!'
