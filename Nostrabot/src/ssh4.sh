#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@10.0.1.189
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "sh /home/ansible/playbooks/linux/llamadas/llamadas.sh 'un cordial saludo te habla alexa, se informa que en este momento se tienen problemas con el sitio web' '3173002602' \r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1

