use [db_name]

declare @cikkid int = null
declare @td_fotipus int = null

select
	lek_ktd.CIKKID,
	SUM(lek_ktd.MENNY * lek_ktd.MESZORZO * lek_ktd.AR) ERTEK
from
	(
		select
			CIKKCSOM.CIKKID CIKKID,
			CIKKCSOM.MENNY MENNY,
			(
				select top 1 CSOMANYAR.AR from CSOMANYAR with (nolock)
				where CSOMANYAR.CSOMANYID = CSOMANY.CSOMANYID and convert(date, CSOMANYAR.DATUMTOL) <= GETDATE()
				order by CSOMANYAR.CSOMANYARID desc
			) AR,
			CIKKME.MESZORZO MESZORZO
		from
			CIKKCSOM with (nolock)
			join CSOMANY with (nolock) on CIKKCSOM.CSOMANYID = CSOMANY.CSOMANYID
			left join CIKKME with (nolock) on CIKKCSOM.CIKKID = CIKKME.CIKKID and CIKKME.ME = CIKKCSOM.CSOMME
		where
			CIKKCSOM.CIKKID = ISNULL(@cikkid, CIKKCSOM.CIKKID)
			and CSOMANY.TD_FOTIPUS = ISNULL(@td_fotipus, CSOMANY.TD_FOTIPUS)
	) lek_ktd
	join CIKK with (nolock) on lek_ktd.CIKKID = CIKK.CIKKID
group by lek_ktd.CIKKID
;