SELECT
  *
FROM
  users
ORDER BY
  created_at
LIMIT
  5;
-- Found the 5 oldest users, limiting to the 5 oldest
SELECT
  DAYNAME(created_at) AS pop_day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  pop_day
ORDER BY
  total;
-- What day of the week are most users registering on?
-- Thursday and Sunday
SELECT
  username,
  image_url
FROM
  users
  LEFT JOIN photos ON users.id = photos.user_id
WHERE
  photos.created_at IS NULL;
-- Find users who have never posted photos (are inactive)
SELECT
  username,
  photos.id,
  photos.image_url,
  COUNT(*) AS total
FROM
  photos
  JOIN likes ON likes.photo_id = photos.id
  JOIN users ON photos.user_id = users.id
GROUP BY
  photos.id
ORDER BY
  total DESC
LIMIT
  1;
-- Finding who has the most likes on a single photo
SELECT
  (
    SELECT
      COUNT(*)
    FROM
      photos
  ) / (
    SELECT
      COUNT(*)
    FROM
      users
  ) AS avg_user_post;
-- How many times does the average user post? 
SELECT
  tags.tag_name,
  COUNT(*) AS total
FROM
  photo_tags
  JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY
  tags.id
ORDER BY
  total DESC
LIMIT
  5;
-- Find the 5 most popular hashtags
SELECT
  username,
  COUNT(*) AS num_likes
FROM
  users
  JOIN likes ON users.id = likes.user_id
GROUP BY
  users.id
HAVING
  num_likes = (
    SELECT
      COUNT(*)
    FROM
      photos
  );
-- Find the users who have liked every photo (bots)