# Tododb_PSQL_BashScript

After install the postgres ,  enter in the psql as postgres user:
sudo su - postgres
psql

install up the tododb database to the psql:
\i <path of the todo.sql>


Now you have to exit from psql and outside you can use the scripts




./add.sh  - to add new items to the todolist,
./delete.sh - delete items from the todolist,
./list.sh - show what is in the todolist,
./mark.sh - change the done column value in the task table,
./todo.sh - for general use, you can use this script for all function.
