Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA10522
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 10:05:05 -0600
Date: Wed, 7 Jul 1999 18:05:26 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philipp Rumpf <prumpf@suse.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        Hannu Martikka <martikka@stybba.ntc.nokia.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
Message-ID: <19990707180526.F386@mencheca.ch.genedata.com>
References: <3782F26C.78876DDD@thepuffingroup.com> <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com> <19990707121251.B386@mencheca.ch.genedata.com> <19990707172338.C29058@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990707172338.C29058@suse.de>; from Philipp Rumpf on Wed, Jul 07, 1999 at 05:23:38PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 07, 1999 at 05:23:38PM +0200, Philipp Rumpf wrote:
> > > I have problems with Linux on C360. Here is what I tried:
> > 
> > According to http://www.hp.com/unixwork/hpc360/page6.htm, the C360
> > has a PA-8500 CPU which is PA-RISC version 2.0.  This port is
> > currently only targetting the PA-RISC 1.1 family of processors since
> > this is where most of the demand is.  In time, I'm sure we will
> > support the PA-RISC 2.0 series of processors, but we don't right now.
> 
> Still, I _think_ we should be able to run the kernel on PA2.0 in narrow mode.
> 
> As soon as I can get my hands on a PA2.0 box, I can test that.

I think you're right for the moment.  The TLB instructions are 
different between the two variants though; maybe there's some other
stuff?

I guess the bootloader needs to force the W bit to 0?  I note that on
an interruption, the W bit is set to the value of the default width
bit, but how to set the default width bit is implementation defined. 
Anyone care to hint at how to set the default width bit too?

-- 
"A `puffin shuttle' also runs in the summer when the cute, meaty birds
are abundant on nearby cliffs."

Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
