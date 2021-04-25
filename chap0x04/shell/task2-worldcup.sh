#!/usr/bin/env bash
function help_file()
{
        echo "-a        统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比"
	echo "-b        统计不同场上位置的球员数量、百分比"
	echo "-c        名字最长的球员是谁？名字最短的球员是?"
	echo "-d        年龄最大的球员是谁？年龄最小的球员是谁？"
	echo "-h        获取帮助信息"
}

function get_age()
{
	player_number=0
	allage=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)
	
	# 20岁以下人数
	age1=0
	# 20-30岁之间人数
	age2=0
	# 30岁以上人数
	age3=0

	for i in $allage
	do
		if [ $i != 'Age' ];
        then let player_number=player_number+1
		    if   [ $i -lt 20 ];
            then let age1=age1+1
		    elif [ $i -ge 20 ] && [ $i -le 30 ];
            then let age2=age2+1
		    elif [ $i -gt 30 ];
            then let age3=age3+1
			fi
		fi
	done

	avg1=$(echo "scale=2; $age1*100/$player_number" | bc -l)
	avg2=$(echo "scale=2; $age2*100/$player_number" | bc -l)
	avg3=$(echo "scale=2; $age3*100/$player_number" | bc -l)
	echo "20岁以下的人数与比例分别为: ${age1}和${avg1}%"
	echo "20-30岁的人数与比例分别为: ${age2}和${avg2}%"
	echo "30岁以上的人数与比例分别为: ${age3}和${avg3}%" 
	
}


function get_position()
{
    player_number=0
	# 所有位置的集合
    allposition=$(awk -F '\t' '{print $5}' worldcupplayerinfo.tsv)
        
    Goalie_number=0
    Defender_number=0
    Midfielder_number=0
	Forward_number=0
	
	for i in $allposition
	do
		if [ $i != 'Position' ];
        then let player_number=player_number+1
		    if   [ $i == 'Goalie' ];
            then let Goalie_number=Goalie_number+1
		    elif [ $i == 'Defender' ];
            then let Defender_number=Defender_number+1
		    elif [ $i == 'Midfielder' ];
            then let Midfielder_number=Midfielder_number+1
		    elif [ $i == 'Forward' ];
            then let Forward_number=Forward_number+1
            fi
        fi
	done

	avg1=$(echo "scale=2; $Goalie_number*100/$player_number" | bc -l)
	avg2=$(echo "scale=2; $Defender_number*100/$player_number" | bc -l)
	avg3=$(echo "scale=2; $Midfielder_number*100/$player_number" | bc -l)
	avg4=$(echo "scale=2; $Forward_number*100/$player_number" | bc -l)
        number5=$(echo "scale=2;$player_number-$Goalie_number-$Defender_number-$Midfielder_number-$Forward_number " | bc -l)
        avg5=$(echo "scale=2; $number5*100/$player_number" | bc -l)
        echo "Goalie位置的人数与比例分别为: ${Goalie_number}和${avg1}%"
	echo "Defender位置的人数与比例分别为: ${Defender_number}和${avg2}%"
	echo "Midfielder位置的人数与比例分别为: ${Midfielder_number}和${avg3}%"
	echo "Forward位置的人数与比例分别为: ${Forward_number}和${avg4}%"  
        echo "Défenseur位置的人数与比例分别为: ${number5}和${avg5}%" 

}
function get_longest_shortest()
{
	number=0
	allname=$( awk -F '\t' '{print length($9)}' worldcupplayerinfo.tsv)

        longestname_length=0
	shortestname_length=10

	for i in $allname
	do
		let number=number+1
		   if [ $i -gt $longestname_length ];
           then longestname_length=$i
           fi
	done

        for i in $allname
        do 
                let number=number+1
		   if [ $i -lt $shortestname_length ];
           then shortestname_length=$i
           fi
	done

	longestname=$(awk -F '\t' 'length($9)=='$longestname_length' {print $9}' worldcupplayerinfo.tsv)
	shortestname=$(awk -F '\t' 'length($9)=='$shortestname_length' {print $9}' worldcupplayerinfo.tsv)
	echo "名字最长的球员:$longestname"
	echo "名字最短的球员:$shortestname"

}

function get_oldest_youngest()
{
	number=0
	allage=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv)
        allname=$(awk -F '\t' '{print $9}' worldcupplayerinfo.tsv)	
	
        oldestage=0
	youngestage=1000
	
	for i in $allage
	do
        let number=number+1
        if [ $i != 'Age' ];
        then 
		   if [ $i -gt $oldestage ];
           then oldestage=$i
                oldestname=$(awk -F '\t' 'NR=='$number' {print $9}' worldcupplayerinfo.tsv)
		   fi
		   if [ $i -lt $youngestage ];
           then	youngestage=$i
                youngestname=$(awk -F '\t' 'NR=='$number' {print $9}' worldcupplayerinfo.tsv)
		   fi
        fi
	done

        echo "年龄最大的球员是:$oldestname,他的年龄是:$oldestage岁。"
	echo "年龄最小的球员是:$youngestname,他的年龄是:$youngestage岁。"
}

while [ "$1" != "" ] ; do
	case $1 in
		-a)
			get_age
			;;
		-b)
			get_position
			;;
		-c)
			get_longest_shortest
			;;
		-d)
			get_oldest_youngest
			;;
		-h|--help)
			usage
			;;
	esac
	shift
done
