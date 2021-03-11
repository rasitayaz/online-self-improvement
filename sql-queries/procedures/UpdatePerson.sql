USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE UpdatePerson;

GO
CREATE PROCEDURE UpdatePerson
   @PersonID SMALLINT,
   @MailAddress VARCHAR(50),
   @PhoneNumber VARCHAR(15)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Person 
	SET MailAddress = @MailAddress
	WHERE @MailAddress IS NOT NULL	and ID = @PersonID
	UPDATE Person 
	SET PhoneNumber = @PhoneNumber
	WHERE @PhoneNumber IS NOT NULL	and ID = @PersonID
END
GO