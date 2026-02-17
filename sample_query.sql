SELECT 
    t.theatre_name,
    s.screen_name,
    m.movie_name,
    l.language_name,
    f.format_name,
    sh.show_date,
    sh.show_start_time,
    sh.show_end_time,
    sh.ticket_price,
    sh.show_status
FROM `show` sh
JOIN screen s ON sh.screen_id = s.screen_id
JOIN theatre t ON s.theatre_id = t.theatre_id
JOIN movie m ON sh.movie_id = m.movie_id
JOIN language l ON sh.language_id = l.language_id
JOIN format f ON sh.format_id = f.format_id
WHERE sh.show_date = '2026-02-20'
  AND t.theatre_id = 1
ORDER BY sh.show_start_time;
