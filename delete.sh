#!/bin/bash
#
# delete.sh delete-todo <todo-id>
# delete.sh delete-done
#
# Usage:
#    delete.sh delete-todo 99
#    delete.sh delete-done
#

delete-todo() {
echo "Todo-id: $1"
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
	SELECT task as "Todo removed" from todo
where id=$1;
	DELETE FROM todo
WHERE id=$1;
EOF
}

delete-done() {
	export PGPASSWORD=admin
        psql -v ON_ERROR_STOP=1 -h localhost -U admin -d tododb <<EOF
	DELETE FROM todo
WHERE done=true;
EOF
echo "Done todos removed"
}

main(){
	if [[ "$1" == "delete-todo" ]]
    then
        delete-todo "$2"
    elif [[ "$1" == "delete-done" ]]
    then
        delete-done
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@" 2> /dev/null
fi
