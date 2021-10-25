--2
	--а)
	CREATE TABLE Users (
		id INT NOT NULL,
		email VARCHAR(50) NOT NULL,
		password VARCHAR(50) NOT NULL,
		regDate DATETIME NOT NULL DEFAULT GETDATE()
	);

	CREATE TABLE Friends (
		userID INT NOT NULL,
		friendID INT NOT NULL
	);

	CREATE TABLE Walls (
		userID INT NOT NULL,
		senderID INT NOT NULL,
		msg VARCHAR(255) NOT NULL,
		sendDate DATETIME NOT NULL DEFAULT GETDATE()
	);

	CREATE TABLE Groups (
		id INT NOT NULL,
		name VARCHAR(20) NOT NULL,
		description VARCHAR(255) NOT NULL DEFAULT ''
	);

	CREATE TABLE GroupMembers (
		groupID INT NOT NULL,
		userID INT NOT NULL
	);

	--б)
	INSERT INTO Users(id,email,password) VALUES(1, 'asd@mail.com', 'asd12345');
	INSERT INTO Users(id,email,password) VALUES(2, 'dsa@mail.com', 'asd12345');
	INSERT INTO Users(id,email,password) VALUES(3, 'sda@mail.com', 'asd12345');
	INSERT INTO Users(id,email,password) VALUES(4, 'asds@mail.com', 'asd12345');

	INSERT INTO Friends VALUES(1,2);
	INSERT INTO Friends VALUES(1,3);
	INSERT INTO Friends VALUES(3,4);

	INSERT INTO Walls(userId,senderID,msg) VALUES(2,1,'This is a message.');
	INSERT INTO Walls(userId,senderID,msg) VALUES(1,2,'This is a reply.');
	INSERT INTO Walls(userId,senderID,msg) VALUES(3,4,'Random text.');

	INSERT INTO Groups VALUES(1,'FriendsGroup','This is a group of friends');
	INSERT INTO Groups(id,name) VALUES(2,'EmptyGroup');

	INSERT INTO GroupMembers VALUES(1,1);
	INSERT INTO GroupMembers VALUES(1,2);
	INSERT INTO GroupMembers VALUES(1,3);
	INSERT INTO GroupMembers VALUES(1,4);

	DROP TABLE Users,Friends,Walls,Groups,GroupMembers;