-- https://www.hackerrank.com/challenges/interviews/problem

select ct.contest_id, ct.hacker_id, ct.name,
    sum(total_submissions) as total_submissions,
    sum(total_accepted_submissions) as total_accepted_submissions,
    sum(total_views) as total_views,
    sum(total_unique_views) as total_unique_views
from Contests ct
    join Colleges co on ct.contest_id = co.contest_id
    join Challenges ch on co.college_id = ch.college_id
    left join
    (select challenge_id, sum(total_submissions) as total_submissions,
        sum(total_accepted_submissions) as total_accepted_submissions
    from Submission_Stats
    group by challenge_id) ss
    on ch.challenge_id = ss.challenge_id
    left join
    (select challenge_id, sum(total_views) as total_views,
        sum(total_unique_views) as total_unique_views
    from View_Stats
    group by challenge_id) vs
    on ch.challenge_id = vs.challenge_id
group by ct.contest_id, ct.hacker_id, ct.name
having not (sum(total_views) = 0 and sum(total_unique_views) = 0 and sum(total_submissions) = 0 and sum(total_accepted_submissions) = 0)
order by ct.contest_id