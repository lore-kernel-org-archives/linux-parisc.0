Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA25022
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Apr 2000 06:04:31 -0600
From: BOSCHINI@ICIL64.CILEA.IT
Date: Mon, 03 Apr 2000 14:03:44 +0000 (MET-01DST)
Subject: Re: kernel make oldconfig error on HP-735 10.20
To: PARISC-LINUX@THEPUFFINGROUP.COM
Message-id: <01JNSVG4EE4Y0010LR@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII

From:	IN%"boschini@uff16c.cilea.it"  "Matteo Boschini"  3-APR-2000 14:02:35.64
To:	IN%"mgyula@gigant.sch.bme.hu"
CC:	IN%"boschini@cilea.it"
Subj:	RE: kernel make oldconfig error on HP-735 10.20

Return-path: <boschini@uff16c.cilea.it>
Received: from DIRECTORY-DAEMON by ICIL64.CILEA.IT (PMDF V5.2-31 #32154)
 id <01JNSVESJOB40010T5@ICIL64.CILEA.IT> for boschini@ICIL64.CILEA.IT
 (ORCPT rfc822;boschini@cilea.it); Mon, 3 Apr 2000 14:02:33 MET-01DST
Received: from uff16c.cilea.it (uff16c.cilea.it [131.175.1.107])
 by ICIL64.CILEA.IT (PMDF V5.2-31 #32154)
 with ESMTP id <01JNSVERUORC00108J@ICIL64.CILEA.IT> for boschini@cilea.it; Mon,
 03 Apr 2000 14:02:32 +0000 (MET-01DST)
Received: from localhost (boschini@localhost)	by uff16c.cilea.it (8.9.3/8.9.3)
 with ESMTP id OAA01349; Mon, 03 Apr 2000 14:04:57 +0200
Date: Mon, 03 Apr 2000 14:04:57 +0200 (CEST)
From: Matteo Boschini <boschini@uff16c.cilea.it>
Subject: RE: kernel make oldconfig error on HP-735 10.20
To: mgyula@gigant.sch.bme.hu
Cc: boschini@cilea.it
Message-id: <Pine.LNX.4.21.0004031359590.1332-100000@uff16c.cilea.it>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Original-recipient: rfc822;boschini@cilea.it


Yes, I found out...

But still, while running gmake oldconfig, I get the following errors:


/bin/bash: invalid character 45 in exportstr for DRIVERS-y
/bin/bash: invalid character 45 in exportstr for DRIVERS-
/bin/bash: invalid character 45 in exportstr for DRIVERS-m
/bin/bash: invalid character 45 in exportstr for DRIVERS-n

and so forth....

and when I try running 

gmake dep

I get

/bin/bash: invalid character 45 in exportstr for DRIVERS-y 
/bin/bash: invalid character 45 in exportstr for DRIVERS-
/bin/bash: invalid character 45 in exportstr for DRIVERS-m
/bin/bash: invalid character 45 in exportstr for DRIVERS-n 
Make: Unknown flag argument C.  Stop.
gmake: *** [archdep] Error 1                                                    


any clue ?

Thanks already, 

Matteo Boschini
