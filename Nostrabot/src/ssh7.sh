#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@192.168.47.27
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible-playbook /home/ansible/playbooks/set/windows-desktop/accion_critica.yml -i /home/ansible/playbooks/set/inventario/inventario.yaml -u dtaborda -e \'ansible_password=\"MosaiCo2019\"\' -vvvv\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1



