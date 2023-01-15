#!/bin/bash
sleep 20

if [ `ls -U1 /var/opt/mssql/data | grep $DB_NAME | wc -l` -eq 0 ]; then
    cd /docker-entrypoint-initdb.d
    sql_file="demo.sql"

    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i $sql_file
    # if [ $? -eq 0 ] then
    #     echo "${sql_file} completed."
    # else
    #     echo "${sql_file} failed."
    # fi
fi
