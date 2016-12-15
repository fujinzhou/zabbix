#!/bin/bash
#chck for php and sphinx used cpu and memory
phpmem(){
    ps aux|grep "php"|grep -v "grep"|grep -v "processstatus.sh"|awk '{sum+=$6}; END{print sum}'
}
phpcpu(){
    ps aux|grep "php"|grep -v "grep"|grep -v "processstatus.sh"|awk '{sum+=$3}; END{print sum}'
}
phpnum(){
    ps aux|grep "php"|grep -v "grep"|grep -v "processstatus.sh"| wc -l
}

sphinxmem(){
    ps aux|grep "sphinx"|grep -v "grep"|grep -v "processstatus.sh"|awk '{sum+=$6}; END{print sum}'
}
sphinxcpu(){
    ps aux|grep "sphinx"|grep -v "grep"|grep -v "processstatus.sh"|awk '{sum+=$3}; END{print sum}'
}
sphinxnum(){
    ps aux|grep "sphinx"|grep -v "grep"|grep -v "processstatus.sh"| wc -l
}

case "$1" in
phpmem)
phpmem
;;
phpcpu)
phpcpu
;;
phpnum)
phpnum
;;
sphinxmem)
sphinxmem
;;
sphinxcpu)
sphinxcpu
;;
sphinxnum)
sphinxnum
;;
*)
echo "Usage: $0 {phpmem|phpcpu|phpnum|sphinxmem|sphinxcpu|sphinxnum}"
esac
