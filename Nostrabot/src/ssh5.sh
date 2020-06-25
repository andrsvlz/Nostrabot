#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no ansible@10.0.1.189
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible\r"
interact -o -nobuffer -re $prompt return
send "ansible-playbook playbooks/linux/selenium/selenium.yml -i 10.0.1.189\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
exit 1

