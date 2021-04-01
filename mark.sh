#!/bin/bash
#
# mark.sh mark-todo <todo-id>
# mark.sh unmark-todo <todo-id>
#
# Usage:
#    mark.sh mark-todo 32
#    mark.sh unmark-todo 32
#

mark-todo() {
    echo "Todo-id: $1"
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
	UPDATE todo SET
done = true WHERE
id = $1;
SELECT task as "Marked as done" from todo
where id = $1;
EOF
}

unmark-todo() {
    echo "Todo-id: $1"
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
	UPDATE todo SET
done = false::boolean WHERE
id = $1;
SELECT task as "Marked as *not* done" from todo
where id = $1;
EOF
}

main() {
    if [[ "$1" == "mark-todo" ]]
    then
        mark-todo "$2"
    elif [[ "$1" == "unmark-todo" ]]
    then
        unmark-todo "$2"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@" 2> /dev/null
fi
