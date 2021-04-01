#!/bin/bash
#
# add.sh add-user <user>
# add.sh add-todo <user> <todo>
#
# Usage:
#    add.sh add-user John
#    add.sh add-user Paul
#    add.sh add-todo John Meeting
#    add.sh add-todo Paul "Make breakfast"
#

add_user() {
    echo "User: $1"
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
	INSERT INTO "user" (name) VALUES ('$1');
	SELECT name as "User added" from "user" where name='$1';
EOF
}

add_todo() {
    echo "User: $1"
    echo "Todo: $2"
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
        INSERT INTO "user" (name) values ('$1');
        INSERT INTO todo (task, done, user_id) SELECT '$2', FALSE , id from "user" WHERE name='$1';        
        SELECT task as "Todo added" from todo where task='$2';
EOF
}

main() {
    if [[ "$1" == "add-user" ]]
    then
        add_user "$2"
    elif [[ "$1" == "add-todo" ]]
    then
        add_todo "$2" "$3"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@" 2> /dev/null
fi
