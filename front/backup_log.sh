DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
yesterday=`date -d "1 day ago" +"%Y%m%d"`

mypath1="/usr/local/bgs/logs"
mypath2="null"
mypath3="null"
mypath4="null"

for mypath in $mypath1 $mypath2 $mypath3 $mypath4
do
	my_path=`echo $mypath|sed "s/\//\_/g"`
	if [ "$mypath" != "null" ] ; then
		if [ -d $mypath ] ; then
			cd $mypath
			myfiles=`find ./ -maxdepth 1 -type f -daystart -ctime +0 -ctime -2`
			if [ -z "$myfiles" ] ; then
				echo "There is NO log file for yesterday in $mypath."
			else
				echo "There are log files for yesterday in $mypath."
				mkdir $my_path$yesterday
				find ./ -maxdepth 1 -type f -daystart -ctime +0 -ctime -2|xargs -i cp {} $my_path$yesterday/
				#myfiles=`echo $myfiles|sed "s/\.\///g"`
				tar -zcvf $my_path$yesterday.tar.gz $my_path$yesterday/ >/dev/null
				if [ ! -d $DIR/snapshot ] ; then 
					mkdir $DIR/snapshot
				fi
				mv $my_path$yesterday.tar.gz $DIR/snapshot
				rm -rf $my_path$yesterday/
				echo "$my_path$yesterday.tar.gz is already generated in current folder ./snapshot"
			fi
		else
			echo "log path \"$mypath\" is not exist."
		fi
	fi
done

