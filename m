Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA13764
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 17:14:58 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37C32B71.50F0B4B6@thepuffingroup.com>
Date: Tue, 24 Aug 1999 19:32:01 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100
References: <199908242255.PAA09913@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Matthew Wilcox wrote:
> The linux-2.2.3-19990808.tar.gz is only 291 bytes.
> 19990807 was the last "full" tarball.

Actually, I've fixed this now and now you should find a splendid 13MB
file named linux-2.2.1-19990824.tar.gz.

> > Can you ssh out?  CVS_RSH=ssh should do the trick if so.
> 
> Didn't have ssh...but "socksify" command seems to work
> rather nicely. Found it in /opt/socks/bin and cvs can now
> talk to the puffin.external.hp.com.

I'm heavenly ignorant of socks, but if you intend to commit code, you
really have to get ssh working.  It's the only way we can know that you
are you when you commit code, and makes life a lot simpler.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
