use [db_name]

CREATE PROCEDURE [dbo].[VLLRS_TULELEM_TULTIPUSMEGJ_1]
	(@tultipusid int)
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY

		declare @parus int = dbo.FGETPAR(1430) -- Rögzítő felhasználót, így csak 1x kérem, de akkor is, ha felesleges
		declare @cikkcsopstring varchar(max) = REPLACE((select TULTIPUS.MEGJ from TULTIPUS where TULTIPUS.TULTIPUSID = @tultipusid), CHAR(10), '') -- Tulajdonság típus megj. mezője, ez lesz felbontva cikkcsoportkódokra a szűréshez

        -- törlés
		DELETE from TULELEM
		where
			TULELEM.TULTIPUSID = @tultipusid
			and TULELEM.CIKKID not in 
				(select CIKK.CIKKID from CIKK with (nolock) where CIKK.CIKKCSOPORTKOD in (select * from string_split(@cikkcsopstring, CHAR(13))))

        -- töltés
		INSERT INTO TULELEM (TULTIPUSID, CRUS, UPUS, CIKKID, DELSTATUS, TULELEMFORRAS, BELSOMEGJ)
		select
			@tultipusid TULTIPUSID,	@parus CRUS, @parus UPUS, CIKK.CIKKID CIKKID, 1 DELSTATUS, 1 TULELEMFORRAS, 'JOB töltötte' BELSOMEGJ
		from 
			CIKK with (nolock)
		where 
			CIKK.CIKKCSOPORTKOD in (select * from string_split(@cikkcsopstring, CHAR(13)))
			and CIKK.CIKKID not in (select TULELEM.CIKKID from TULELEM with (nolock) where TULELEM.TULTIPUSID = @tultipusid)

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	END CATCH
END