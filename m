Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA10689
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Aug 1999 16:49:54 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com,
        Ingo Matthaes <imatthae@grcbd508.grc.hp.com>
Subject: Re: [parisc-linux] unsatisfied symbols
Date: Wed, 4 Aug 1999 00:32:19 +0200
Content-Type: text/plain
References: <19990803114003.A5018@grcbd508.grc.hp.com>
MIME-Version: 1.0
Message-Id: <99080400504700.00269@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Tue, 03 Aug 1999 schrieb Ingo Matthaes:
> Hi,
> 
> it is not possible to compile the latest CVS-Kernels. I tried 
> various configurations, but I still get unsatisfied symbol __delay.
> Is anybody out there, who compiles the actual sources succesfully ?
> make menuconfig seems to be broken too (since 4 weeks)
> 
>   Ingo

Hi Ingo.

The unsatisfied symbol __delay was caused by the inclusion of pdc_cons.c by the
bootloader. I fixed it some minutes ago in the cvs.
The actual kernel from cvs compiles, links and boots (!!) now cleanly (I just
tried it), if you add the line  
extern pgd_t swapper_pg_dir[1024];
to the file pgtable.h. I didn´t wanted to fix that, since I think, that Philipp
is actually working on that code....

NB: If you want faster screen-output, then remove the delay() in pdc_cons.c.

Ciao,
Helge.
