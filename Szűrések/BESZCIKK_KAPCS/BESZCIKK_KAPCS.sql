exists
  (
    select 
      * 
    from 
      BESZCIKKAZON ba with (nolock)
    where 
      ba.PID = BESZCIKK.PID 
      and BESZCIKK.BESZCIKKID = ba.BESZCIKKID 
      and exists
        (
          select 
            *
          from 
            CIKKAZON ca with (nolock) 
            left join CIKK c with (nolock) on ca.CIKKID = c.CIKKID
          where 
            ca.CIKKAZON = ba.CIKKAZON 
            and c.DELSTATUS = 1
        )
  )