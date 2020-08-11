# Q14
# 查询各科成绩最高分、最低分和平均分，显示为：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
# 要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
# 使用case表达式
select sc.CId,
       max(sc.score)                                              as 最高分,
       min(sc.score)                                              as 最低分,
       AVG(sc.score)                                              as 平均分,
       count(*)                                                   as 选修人数,
       sum(IF(sc.score >= 60, 1, 0)) / count(*)                   as 及格率,
       sum(IF(sc.score >= 70 and sc.score < 80, 1, 0)) / count(*) as 中等率,
       sum(IF(sc.score >= 80 and sc.score < 90, 1, 0)) / count(*) as 优良率,
       sum(IF(sc.score >= 90, 1, 0)) / count(*) as 优秀率
from SC sc
GROUP BY sc.CId
ORDER BY count(*) DESC, sc.CId;
