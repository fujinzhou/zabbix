#!/bin/bash
#Fucation:zabbix low-level discovery
memcache() {
            port=($(sudo netstat -tpln | awk -F "[ :]+" '/[m]emcached/ && /0.0.0.0/ {print $5}'))
            printf '{\n'
            printf '\t"data":[\n'
               for key in ${!port[@]}
                   do
                       if [[ "${#port[@]}" -gt 1 && "${key}" -ne "$((${#port[@]}-1))" ]];then
                          printf '\t {\n'
                          printf "\t\t\t\"{#MEMPORT}\":\"${port[${key}]}\"},\n"
                     else [[ "${key}" -eq "((${#port[@]}-1))" ]]
                          printf '\t {\n'
                          printf "\t\t\t\"{#MEMPORT}\":\"${port[${key}]}\"}\n"
                       fi
               done
                          printf '\t ]\n'
                          printf '}\n'
}
$1
