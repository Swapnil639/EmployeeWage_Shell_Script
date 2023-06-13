#!/bin/bash


get_work_hrs ()
{
    emp_attendance=$1
    case $emp_attendance in
        0)
            no_of_hrs_per_day=0
            ;;
        1)
            no_of_hrs_per_day=8
            ;;
        2)
            no_of_hrs_per_day=4
            ;;
    esac
    echo "$no_of_hrs_per_day"
}

wage_per_hr=20
max_hrs=100
max_days=20
total_working_hrs=0
total_working_days=0
declare -A daily_wages

while (( total_working_hrs < max_hrs && total_working_days < max_days ))
do
    (( total_working_days++ ))
    emp_attendance=$(( RANDOM % 3 ))
    no_of_hrs_per_day=$( get_work_hrs $emp_attendance )
    (( total_working_hrs += no_of_hrs_per_day ))
    daily_wage=$(( no_of_hrs_per_day * wage_per_hr ))
    daily_wages["Day $total_working_days"]=$daily_wage
done

total_salary=$(( total_working_hrs * wage_per_hr ))
echo "Total salary is $total_salary"
echo "Daily wages:"
for key in "${!daily_wages[@]}"
do
    echo "$key: ${daily_wages[$key]}"
done
