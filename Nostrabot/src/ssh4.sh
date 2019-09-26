#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@10.0.1.189
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "sh /home/ansible/playbooks/linux/llamadas/llamadas.sh 'un cordial saludo, se informa que en este momento se tienen problemas con el sitio web' '3167419020' \r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1
