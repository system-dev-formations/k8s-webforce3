CREATE TABLE todos
(
    todo_id     INTEGER PRIMARY KEY AUTOINCREMENT ,
    title       TEXT            NOT NULL,
    text        TEXT            NOT NULL,
    done        CHAR(50),
    pub_date    DATETIME           NOT NULL
);

INSERT INTO `todos` ( `title`, `text`, `done`, `pub_date`) VALUES
('test', 'test', '0', '2019-11-20 10:00:00'),
('qwerty', 'yyy', '0', '2019-11-20 12:45:45');