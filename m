Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA05849
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 11:24:24 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906211723.KAA39308@bart.allegro.com>
Subject: Re: [parisc-linux] HPUX binary compatibility
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 10:23:17 -0700 (PDT)
Cc: law@cygnus.com, Matthew.Wilcox@genedata.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19990621105017.N30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 10:50:17 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

> > Just write translators on the hpux emulation side.
> 
> Yes, this is certainly what we'll do.  But if we can be clever and get a
> bunch of compatibility for free, then we should.

The problem with translators is that they don't work in all cases.

The most important case is where you want to link some .o files
together: some are compiled for Linux, some for HP-UX. 

*That's* why having different system call numbers is important.

-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/
