--STORED PROCEDURE THAT LISTS TOP 10 MOVIES 
CREATE PROC spTopRatedMovies
AS 
BEGIN
SELECT TOP 250
	   MOVIE.name AS Movie_Name
      ,YEAR([release_date]) AS Year
      ,[rate] AS Rate
	  , DIRECTOR.name AS Director_Name
	  ,CATEGORY.name AS Category_Name
      ,[photo] AS Photo
FROM            dbo.MOVIE_CATEGORY INNER JOIN
                dbo.CATEGORY ON dbo.MOVIE_CATEGORY.categoryID = dbo.CATEGORY.id INNER JOIN
                dbo.MOVIE INNER JOIN
                dbo.DIRECTOR ON dbo.MOVIE.directorID = dbo.DIRECTOR.id ON dbo.MOVIE_CATEGORY.movieID = dbo.MOVIE.id 
ORDER BY rate DESC
END
exec spTopRatedMovies

--STORED PROC THAT LISTS ALL MOVIES IN A CATEGORY
CREATE PROC spCategories( @CATEGORY VARCHAR(30))
AS 
BEGIN
SELECT       
      
			 dbo.MOVIE.name AS Movie
			, dbo.MOVIE.release_date AS Release_Date
			, dbo.MOVIE.rate AS Rate , dbo.MOVIE.photo 
FROM          dbo.CATEGORY INNER JOIN
             dbo.MOVIE_CATEGORY ON dbo.CATEGORY.id = dbo.MOVIE_CATEGORY.categoryID INNER JOIN
             dbo.MOVIE ON dbo.MOVIE_CATEGORY.movieID = dbo.MOVIE.id 
WHERE CATEGORY.name=@CATEGORY
ORDER BY rate DESC
END

exec spCategories @CATEGORY='DRAMA'



--STORED PROC THAT LISTS ALL ACTORS IN THE MOVIE


CREATE PROC spACTORS( @moviename VARCHAR(30))
AS 
BEGIN
SELECT      dbo.ACTOR.name AS ACTOR_NAME,
			dbo.ACTOR.age,
			dbo.COUNTRY.name
			
			
FROM dbo.ACTOR,dbo.MOVIE_CAST,dbo.MOVIE,dbo.COUNTRY
WHERE MOVIE.name=@moviename and
	MOVIE_CAST.movieID=MOVIE.id and
	MOVIE_CAST.actorID=ACTOR.id and
	ACTOR.countryID=COUNTRY.id
	
END
exec spACTORS @moviename='The Matrix'


--STORED PROC THAT LISTS ALL MOVIES THAT ACTOR PLAYED
CREATE PROC spMOVIES( @actorname VARCHAR(30))
AS 
BEGIN
SELECT     dbo.MOVIE.name AS NAME
FROM dbo.ACTOR,dbo.MOVIE_CAST,dbo.MOVIE
WHERE ACTOR.name=@actorname and
	MOVIE_CAST.movieID=MOVIE.id and
	MOVIE_CAST.actorID=ACTOR.id
END
exec spMOVIES @actorname='Liv Tyler'

--Selecting actors who played more than 2 movie
SELECT	*
FROM(
SELECT ACTOR.id,ACTOR.name,COUNT(MOVIE.id) AS TOTAL_PLAYED
FROM ACTOR,MOVIE,MOVIE_CAST
WHERE ACTOR.id=MOVIE_CAST.actorID and
	MOVIE.id=MOVIE_CAST.movieID 
Group by ACTOR.id,ACTOR.name)TABLE1
WHERE TABLE1.TOTAL_PLAYED>2
ORDER BY TABLE1.TOTAL_PLAYED desc




select top 10 table1.playerID,table1.firstName,table1.lastName,COUNT(*) as TotalGoals
from
(select p.playerID,p.firstName,p.lastName 
from player p, player_team pt, goals g
where p.playerID=pt.playerID and g.playerID =pt.playerID and g.isOwnGoal=0 and pt.season='13-14')table1
group by table1.playerID,table1.firstName,table1.lastName
order by TotalGoals desc
Goals desc










-- STORED PROC TO ADD MOVIE
GO
CREATE PROCEDURE sp_AddMovie
       
       @name   VARCHAR(30), 
       @release_date  DATE , 
       @rate  float , 
       @directorID int, 
       @countryID  INT, 
       @categoryID  INT,
	   @runTimeMinutes INT                   
AS 
BEGIN 
SET NOCOUNT ON 
INSERT INTO MOVIE
          ( name,
            release_date,
            rate,
            directorID,
            countryID,
            categoryID,
			RunTimeMinutes                
          ) 
VALUES 
          ( @name,
            @release_date,
            @rate,
            @directorID,
            @countryID ,
            @categoryID,
			@runTimeMinutes                 
          ) 
END 
GO
SELECT * FROM MOVIE
exec sp_AddMovie
     @name  = 'New Movie Added To Movie Table', 
     @release_date = '1962-11-14' , 
     @rate       = 10.0   , 
     @directorID =    2  , 
     @countryID  =    4  , 
     @categoryID = 1,
	 @runTimeMinutes= 110 



-- STORED PROC TO UPDATE MOVIE
CREATE procedure sp_UpdateMovie  
(  
   @id INT,  
   @name VARCHAR(30),  
   @release_date date,  
   @rate float,  
   @directorID int,  
   @countryID int,
   @categoryID int
)  
AS    
BEGIN  
UPDATE MOVIE SET  
name = @name, release_date = @release_date, rate = @rate,
       directorID = @directorID, countryID=@countryID, categoryID=@categoryID 
WHERE id = @id  
END 


SELECT* FROM MOVIE
EXEC sp_UpdateMovie @id=7,
     @name  ='degisti', 
     @release_date = '1962-11-14' , 
     @rate       = 10.0   , 
     @directorID =    2  , 
     @countryID  =    4  , 
     @categoryID = 1 

-- TRIGGER TO AVOID DELETING A RECORD ON AWARDS TABLE
Create Trigger trg_CantDeleteReward on Reward
after delete
as
begin
raiserror('You cannot delete a record on reward table.',1,1)
rollback transaction
end

delete from REWARD where reward.id=1

-- TRGIGER TO LIST ALL MOVIES AFTER INSERTING A MOVIE
create trigger trg_MovieList on MOVIE
after insert
as
begin
select * from MOVIE
end 





--COMPUTED COLUMN
SELECT name AS Movie_Name,
             runTimeMinutes AS Runtime_Minutes,
		     runTimeMinutes/60 AS [Hours],
		     runTimeMinutes%60 AS [Minutes]
FROM MOVIE


--VIEW 1 MOVIES THAT ARE ABOVE THE AVERAGE


CREATE VIEW [dbo].[MoviesAboveAverage] AS 
SELECT          dbo.MOVIE.name AS Movie_Name, dbo.MOVIE.release_date AS Release_Date,
                dbo.MOVIE.rate AS Rate, dbo.MOVIE.photo AS Photo,
                dbo.CATEGORY.name AS CategoryName, dbo.DIRECTOR.name AS Director_Name
FROM            dbo.MOVIE_CATEGORY INNER JOIN
                dbo.CATEGORY ON dbo.MOVIE_CATEGORY.categoryID = dbo.CATEGORY.id INNER JOIN
                dbo.MOVIE INNER JOIN
                dbo.DIRECTOR ON dbo.MOVIE.directorID = dbo.DIRECTOR.id ON dbo.MOVIE_CATEGORY.movieID = dbo.MOVIE.id
WHERE        (dbo.MOVIE.rate >(SELECT AVG(rate) AS Expr1
                               FROM  dbo.MOVIE))
GO


-- VIEW 2 MoviesThatWonAwards

CREATE VIEW MoviesThatWonAwardsInLastDecade AS
SELECT        REWARD.name AS Reward,dbo.MOVIE.name AS Movie_Name, dbo.MOVIE.release_date AS Release_Date
              , dbo.MOVIE.rate AS Rate, dbo.MOVIE.photo AS Photo,
                dbo.CATEGORY.name AS CategoryName, dbo.DIRECTOR.name AS Director_Name
FROM            dbo.MOVIE_CATEGORY INNER JOIN
                dbo.CATEGORY ON dbo.MOVIE_CATEGORY.categoryID = dbo.CATEGORY.id INNER JOIN
                dbo.DIRECTOR INNER JOIN
                dbo.MOVIE ON dbo.DIRECTOR.id = dbo.MOVIE.directorID ON dbo.MOVIE_CATEGORY.movieID = dbo.MOVIE.id INNER JOIN
                dbo.REWARD ON dbo.MOVIE.id = dbo.REWARD.movieID
WHERE reward_year BETWEEN 2008 AND 2018


--VIEW 3 RATE STATISTICS ACCORDING TO CATEGORIES

CREATE VIEW RateStatistics AS
SELECT CATEGORY.name AS Category_Name
	   ,AVG(rate) AS [AverageRate]
	   ,MAX(rate) AS [MaximumRate]
	   ,MIN(rate) AS [MinimumRate]
FROM dbo.CATEGORY INNER JOIN
     dbo.MOVIE_CATEGORY ON dbo.CATEGORY.id = dbo.MOVIE_CATEGORY.categoryID INNER JOIN
     dbo.MOVIE ON dbo.MOVIE_CATEGORY.movieID = dbo.MOVIE.id
GROUP BY CATEGORY.name 

--VIEW 4 DISPLAYING ACTORS INFO WHO IS YOUNGER THAN 90
CREATE VIEW ActorsInformation AS
SELECT      dbo.ACTOR.name AS Actor_Name , dbo.ACTOR.age AS Actor_Age ,dbo.COUNTRY.name as Actor_Country ,dbo.MOVIE.name AS Movie_Name, dbo.MOVIE.rate AS Movie_Rate, dbo.MOVIE.release_date as Release_Date
FROM        dbo.ACTOR INNER JOIN
            dbo.COUNTRY ON dbo.ACTOR.countryID = dbo.COUNTRY.id INNER JOIN
            dbo.MOVIE ON dbo.COUNTRY.id = dbo.MOVIE.countryID INNER JOIN
            dbo.MOVIE_CAST ON dbo.ACTOR.id = dbo.MOVIE_CAST.actorID AND dbo.MOVIE.id = dbo.MOVIE_CAST.movieID
WHERE ACTOR.age<90 