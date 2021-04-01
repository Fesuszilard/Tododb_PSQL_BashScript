#!/bin/bash
#
# list.sh list-users
# list.sh list-todos
# list.sh list-user-todos
#
# Usage:
#    list.sh list-users
#    list.sh list-todos Paul
#    list.sh list-user-todos John
#    list.sh list-user-todos "John Doe"
#

list_users() {
    export PGPASSWORD=admin
    psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
SELECT * FROM "user"
EOF
}

list_todos() {
    export PGPASSWORD=admin
    psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
SELECT * FROM "todo"
EOF
}

list_user_todos() {
    echo "User: $1"
     if [[ $1 ]]
       then
     export PGPASSWORD=admin	
     psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
       select task from todo inner join "user" on "user".id=todo.user_id where name like '$1'
EOF
     else
     export PGPASSWORD=admin	
     psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
       select task from todo inner join "user" on "user".id=todo.user_id
EOF
fi
}

main() {
    if [[ "$1" == "list-users" ]]
    then
        list_users
    elif [[ "$1" == "list-todos" ]]
    then
        list_todos
    elif [[ "$1" == "list-user-todos" ]]
    then
        list_user_todos "$2"
    fi
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@" 2> /dev/null
fi
