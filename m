Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA09436
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 04:12:29 -0600
Date: Wed, 7 Jul 1999 12:12:51 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
Message-ID: <19990707121251.B386@mencheca.ch.genedata.com>
References: <3782F26C.78876DDD@thepuffingroup.com> <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com>; from Hannu Martikka on Wed, Jul 07, 1999 at 01:05:35PM +0300
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 07, 1999 at 01:05:35PM +0300, Hannu Martikka wrote:
> Hi!
> 
> I have problems with Linux on C360. Here is what I tried:

According to http://www.hp.com/unixwork/hpc360/page6.htm, the C360
has a PA-8500 CPU which is PA-RISC version 2.0.  This port is
currently only targetting the PA-RISC 1.1 family of processors since
this is where most of the demand is.  In time, I'm sure we will
support the PA-RISC 2.0 series of processors, but we don't right now.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
