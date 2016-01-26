SELECT *
FROM SERVER_LOG
JOIN PAGES
  ON server_log.page_url = pages.page_url
WHERE client_IP_address = "192.225.213.20"
  AND request_datetime = "4//25/14"
  AND pages.page = "/admin"
;


SELECT COUNT (*)
FROM status_codes
JOIN status_codes
  ON server_log.HTTP_code = status_codes.status_code
JOIN pages
  ON server_log.page_url = pages.page
WHERE status_code = 500
GROUP BY server_log.page_url, server_log.status_code
;


-- select
-- from
-- join
-- where
-- group by
-- order by
-- having