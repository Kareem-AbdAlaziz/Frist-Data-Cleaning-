CREATE TABLE copy1
LIKE ordata;

SELECT * FROM copy1;

INSERT copy1 
SELECT * FROM ordata;

ALTER TABLE copy1 
RENAME COLUMN `Review Text`TO review_text;

SELECT Title,review_text,
		ROW_NUMBER() OVER (
			PARTITION BY Review_ID,`Clothing ID` ,Age,Title,review_text,Rating) AS row_num
	FROM 
		copy1;
        
WITH dup AS 
(
SELECT *,
		ROW_NUMBER() OVER (
			PARTITION BY Review_ID,`Clothing ID` ,Age,Title,review_text,Rating) AS row_num
	FROM copy1
		
)SELECT * FROM dup
WHERE row_num = 1;    

DELETE FROM copy1
WHERE Title = '' AND review_text = '';  

SELECT * FROM copy1
WHERE Title = '';

DELETE FROM copy1
WHERE Title = ''; 

SELECT * FROM copy1;

SELECT * FROM copy1
WHERE `Clothing ID` = null;

select * from copy1
where `Division Name` != 'General';

select count(Review_ID) from ordata;
select count(Review_ID) from copy1;

select distinct(`Title`) from copy1;

select * from copy1
where `Division Name` = 1;

delete from copy1  
where `Division Name` = 1;

SELECT * FROM copy1
where review_text= ''








