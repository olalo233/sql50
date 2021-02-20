# Q7
# 查询没有学全所有课程的同学的信息
# 反向思考，全选课的同学之外就是没选全的
select *
from Student as s
where s.sid not in (
    select sc.sid
    from SC as sc
    group by sc.sid
    having count(sc.cid) = (select count(cid) from Course)
);

# +---+-----+-------------------+----+
# |SId|Sname|Sage               |Ssex|
# +---+-----+-------------------+----+
# |05 |周梅   |1991-12-01 00:00:00|女   |
# |06 |吴兰   |1992-01-01 00:00:00|女   |
# |07 |郑竹   |1989-01-01 00:00:00|女   |
# |09 |张三   |2017-12-20 00:00:00|女   |
# |10 |李四   |2017-12-25 00:00:00|女   |
# |11 |李四   |2012-06-06 00:00:00|女   |
# |12 |赵六   |2013-06-13 00:00:00|女   |
# |13 |孙七   |2014-06-01 00:00:00|女   |
# +---+-----+-------------------+----+
