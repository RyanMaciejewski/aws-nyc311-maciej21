-- Average resolution time (buggy approach)
SELECT
  agency,
  AVG(
    date_diff(
      'day',
      date_parse(created_date, '%Y-%m-%d %H:%i:%s'),
      date_parse(closed_date,  '%Y-%m-%d %H:%i:%s')
    )
  ) AS avg_days_to_close
FROM nyc311_db.complaints
GROUP BY agency
ORDER BY avg_days_to_close DESC;

-- Average resolution time (updated approach)