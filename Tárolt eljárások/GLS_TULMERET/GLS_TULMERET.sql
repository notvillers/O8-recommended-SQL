use [db_name]

CREATE PROCEDURE [dbo].[VLLRS_TABLA_FUVMOD_EGYEDI_1]
	 @csommodid int, @tultipusid int
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY
		declare @parus int = dbo.FGETPAR(1430) -- Rögzítő felhasználót, így csak 1x kérem, viszont akkor is, ha felesleges

		-- törlés
		delete TULELEM
		where TULELEM.TULTIPUSID = @tultipusid and (not exists (select * from dbo.VLLRS_FUVMOD_TILTOTT_CIKK_1(@csommodid) c where c.CIKKID = TULELEM.CIKKID) or TULELEM.DELSTATUS = 2)

		--töltés
		insert into TULELEM (TULTIPUSID, CRUS, UPUS, CIKKID, DELSTATUS, TULELEMFORRAS, BELSOMEGJ)
		select @tultipusid, @parus, @parus, c.CIKKID, 1, 1, 'JOB töltötte: ' + CAST(GETDATE() as varchar(20))
		from dbo.VLLRS_FUVMOD_TILTOTT_CIKK_1(@csommodid) c
		where
			not exists (select * from TULELEM where TULELEM.TULTIPUSID = @tultipusid1 and TULELEM.CIKKID = c.CIKKID)

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	END CATCH
END