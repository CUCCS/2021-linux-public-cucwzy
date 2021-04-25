 #!/usr/bin/enkv bash
function help_file
{
       echo "-a        统计访问来源主机TOP 100和分别对应出现的总次数" 
       echo "-b        统计访问来源主机TOP 100 IP和分别对应出现的总次数"
       echo "-c        统计最频繁被访问的URL TOP 100"
       echo "-d        统计不同响应状态码的出现次数和对应百分比"
       echo "-e        分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
       echo "-f URL    给定URL输出TOP 100访问来源主机"
       echo "-h        获取帮助信息"
}

function get_Top100()
{
	echo "访问来源主机TOP 100和分别对应出现的总次数:"
	more +2 web_log.tsv | awk -F '\t' '{print $1}' | sort | uniq -c | sort -nr | head -n 100
}

function get_TopIP()
{
	echo "访问来源主机TOP 100 IP和分别对应出现的总次数:"
	more +2 web_log.tsv | awk -F '\t' '{print $1}' | grep -E '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' | sort | uniq -c | sort -nr | head -n 100
}

function get_frequent_URL()
{
	echo "最频繁被访问的URL TOP 100:"
	more +2 web_log.tsv | awk -F '\t' '{print $5}' | sort | uniq -c | sort -nr | head -n 100
}

function get_response()
{
	echo "不同响应状态码的出现次数和对应百分比:"	
	awk '{a[$6]++}{num++}END{for(i in a){{if(i!="response") print i,a[i],a[i]/num*100"%"}}}' web_log.tsv
}

function get_4xx()
{
	echo "不同4XX状态码对应的TOP 10 URL和对应出现的总次数:"
	echo "403:"
	more +2 web_log.tsv | awk -F '\t' '{print $6,$5}' | grep '403 ' | sort | uniq -c | sort -nr | head -n 10
	echo "404:"
	more +2 web_log.tsv | awk -F '\t' '{print $6,$5}' | grep '404 ' | sort | uniq -c | sort -nr | head -n 10
}

function get_host()
{	
       echo "给定URL输出TOP 100访问来源主机"
       URL="$1"
	more +2 web_log.tsv | awk -F '\t' '{ if ($5=="'$URL'") {print $1} }' | sort | uniq -c | sort -nr | head -n 100
}

while [ "$1" != "" ] ; do
	case $1 in
       -a)
              get_Top100
              ;;
       -b)
              get_TopIP
              ;;
       -c)
              get_frequent_URL
              ;;
       -d)
              get_response
              ;;
       -e)
              get_4xx
              ;;
       -f)  
              get_host "$2"
              ;;    
       -h) 
              help_file
              ;;
    esac
	shift
done
