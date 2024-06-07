ALTER TABLE
  playlists
MODIFY
  playlist_name VARCHAR(50) DEFAULT 'Lift/Run';
-- modified playlist name to default to 'Lift/Run'
INSERT INTO
  playlists (
    playlist_name,
    artist,
    album,
    song,
    genre,
    date_added
  )
VALUES
  (
    default,
    'Erra',
    'Erra',
    'Memory Fiction',
    'Metalcore',
    '2023-08-07'
  );
-- tested out inserting values 
INSERT INTO
  playlists (
    playlist_name,
    artist,
    album,
    song,
    genre,
    date_added
  )
VALUES
  (
    default,
    'Time, The Valuator',
    'How Fleeting, How Fragile',
    'Elusive Reasons',
    'Metalcore',
    '2023-08-07'
  ),
  (
    default,
    'Sunsleep',
    'I Hope to See Again With Brand New Eyes',
    'Dive',
    'Metalcore',
    '2023-08-07'
  ),
  (
    default,
    'Ghost Atlas',
    'All Is in Sync, and Theres Nothing Left to Sing About',
    'Cry Wolf',
    'Metalcore',
    '2023-08-07'
  ),
  (
    default,
    'Polaris',
    'The Death Of Me',
    'Above My Head',
    'Metalcore',
    '2023-08-07'
  ),
  (
    default,
    'Ghost Atlas',
    'All Is in Sync, and Theres Nothing Left to Sing About',
    'Surrogate Lover',
    'Metalcore',
    '2023-08-07'
  ),
  (
    default,
    'Spiritbox',
    'Eternal Blue',
    'Silk In The Strings',
    'Metalcore',
    '2023-08-07'
  );
-- input new information into playlists table 
ALTER TABLE
  playlists
MODIFY
  album VARCHAR (100);
-- album char leng too small, increased char length
SELECT
  *
FROM
  playlists;
-- Checked work