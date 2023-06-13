#!/bin/bash

isPresent=1;
attendence=$(( RANDOM % 2 ));

if [ $isPresent -eq $attendence ]
then
    echo "Employee is Present"
else
    echo "Employee is Abscent"
fi
