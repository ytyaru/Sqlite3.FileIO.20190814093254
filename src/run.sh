#SCRIPT_DIR=$(cd $(dirname $0); pwd)
#cd "$SCRIPT_DIR"
#for path in `ls -1 | grep .sql | sort`; do
#	echo $path
#	sqlite3 < $path
#done

# カレントディレクトリを設定
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# 入力ファイル作成
echo -e "id\tname\tclass\tpoint
0\tYamada\t0\t92
1\tSuzuki\t0\t21
2\tTanaka\t1\t55
3\tAbe\t1\t19" > ./points.tsv

# 集計＆ファイル出力
sqlite3 :memory: ".headers on" ".separator \"\t\"" ".output ./class_averages.tsv" ".import ./points.tsv points" "select class, avg(cast(point as int)) as ave from points group by class order by ave desc;"

