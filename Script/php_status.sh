#!/bin/bash
CURL=`which curl`
function idle {
  	$CURL "http://127.0.0.1/php-fpm-status" 2>/dev/null| grep -w '^idle processes:' | awk  '{print $3}'
	}
function total {
  	$CURL "http://127.0.0.1/php-fpm-status" 2>/dev/null| grep -w '^total processes:' |  awk  '{print $3}'
	}
function active {
  	$CURL "http://127.0.0.1/php-fpm-status" 2>/dev/null| grep -w '^active processes:' | awk '{print $3}'
	}

function listen_queue {
  	$CURL "http://127.0.0.1/php-fpm-status" 2>/dev/null| grep -w "^listen queue:" | awk  '{print $3}'
}
function slow_requests {
  	output=` $CURL "http://127.0.0.1/php-fpm-status" 2>/dev/null| grep -w "^slow requests:"| awk  '{print $3}'`
	if [ "$output" == "" ];then
		echo 0
	else
		echo $output
	fi
  
       }
# Run the requested function
$1
