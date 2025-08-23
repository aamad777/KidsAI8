CREATE TABLE IF NOT EXISTS interactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ts TEXT NOT NULL,
  kid TEXT,
  mode TEXT,
  question TEXT,
  answer TEXT,
  book TEXT
);
