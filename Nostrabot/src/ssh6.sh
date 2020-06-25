#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@192.168.47.27
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible-playbook /home/ansible/playbooks/set/inventario/t.yaml -i inventario.yaml -e \"tipo_conexion=local\" -vvvv\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1



