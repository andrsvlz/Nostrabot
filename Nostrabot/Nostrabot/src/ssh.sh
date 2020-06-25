#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@10.0.1.189
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible-playbook playbooks/linux/notifications.yml -i 10.0.1.189, -u ansible -e 'Session_ID=2019/07/05-28' -e 'site=COP' -e 'Specification=BK_Diario_Pruebaautomatizacion' \r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1
