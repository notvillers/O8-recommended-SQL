USE [dbname]

CREATE FUNCTION [dbo].[VLLRS_FUVMOD_TILTOTT_CIKK_1](@csommodid int)
RETURNS TABLE
AS
RETURN
	select
		*
	from
		(
			select 
				c.CIKKID CIKKID,
				c.XMERET XMERET,
				c.YMERET YMERET,
				c.ZMERET ZMERET,
				(select MAX(meret) from (values (ISNULL(c.XMERET, 0)), (ISNULL(c.YMERET, 0)), (ISNULL(c.ZMERET, 0))) as value(meret)) MAXMERET,
				case (select MAX(meret) from (values (c.XMERET), (c.YMERET), (c.ZMERET)) as value(meret)) 
					when c.XMERET then 'X' 
					when c.YMERET then 'Y' 
					when c.ZMERET then 'Z'
					else 'NA'
				end MAXOLDAL,
				c.CSOMMODID CSOMMODID
			from
				CIKK c with (nolock)
			where
				c.DELSTATUS = 1
		) vllrs_meret
	where
		ISNULL(vllrs_meret.MAXMERET, 0) > 0
		and (300 < 
			case vllrs_meret.MAXOLDAL 
				when 'X' then ((2 * (vllrs_meret.YMERET + vllrs_meret.ZMERET)) + vllrs_meret.XMERET) 
				when 'Y' then ((2 * (vllrs_meret.XMERET + vllrs_meret.ZMERET)) + vllrs_meret.YMERET) 
				when 'Z' then ((2 * (vllrs_meret.XMERET + vllrs_meret.YMERET)) + vllrs_meret.ZMERET)
				when 'NA' then 0
			end
		or vllrs_meret.CSOMMODID = ISNULL(@csommodid, vllrs_meret.CSOMMODID))
			