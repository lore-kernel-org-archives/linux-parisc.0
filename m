Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA31202
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Feb 2000 12:52:47 -0700
Sender: frowand@hermes.mvista.com
Message-ID: <38AC42AB.A0C41847@mvista.com>
Date: Thu, 17 Feb 2000 10:49:15 -0800
From: Frank Rowand <frank_rowand@mvista.com>
Reply-To: frowand@mvista.com
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Virtual mapping of IO cards
References: <200002161838.KAA07528@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 

< stuff deleted >

> AFAIK, the processor can only HPMC if a LOAD times out.
> What about processor STORE?

Yes, a bad store can HPMC.  The reason for this is that not being able to write
data successfully means that you have possible data corruption (for
example, data that you had expected to be in persistent storage is not there).

< stuff deleted >

> grant
> 
> Grant Grundler

-Frank
-- 
MontaVista Software, Inc
frank_rowand@mvista.com
