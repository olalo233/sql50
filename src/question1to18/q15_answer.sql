# Q15
# 按各科成绩对学科进行排序，并显示排名，Score重复时保留名次空缺
# 所谓保留名次空缺，意思是两个人的成绩一样时，会出现两个“第n名”，之后的学生则是“第n+1名”
# 按学科排序，学科内按成绩排序
# 有一个自连接的小技巧，用sc中的score和自己进行对比，来计算“比当前分数高的分数有几个”
# 使用左联结，不然最高分会消失
select sc1.CId,
       sc1.SId,
       sc1.score,
       count(sc1.score) as score_grade
from SC as sc1
         left join
     SC as sc2
     on sc1.CId = sc2.CId
         and sc1.score < sc2.score
group by sc1.CId,
         sc1.SId,
         sc1.score
order by sc1.CId,
         score_grade;

# +---+---+-----+-----------+
# |CId|SId|score|score_grade|
# +---+---+-----+-----------+
# |01 |01 |80.0 |1          |
# |01 |03 |80.0 |1          |
# |01 |05 |76.0 |2          |
# |01 |02 |70.0 |3          |
# |01 |04 |50.0 |4          |
# |01 |06 |31.0 |5          |
# |02 |01 |90.0 |1          |
# |02 |07 |89.0 |1          |
# |02 |05 |87.0 |2          |
# |02 |03 |80.0 |3          |
# |02 |02 |60.0 |4          |
# |02 |04 |30.0 |5          |
# |03 |01 |99.0 |1          |
# |03 |07 |98.0 |1          |
# |03 |03 |80.0 |2          |
# |03 |02 |80.0 |2          |
# |03 |06 |34.0 |4          |
# |03 |04 |20.0 |5          |
# +---+---+-----+-----------+


