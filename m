Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA23742
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 22:36:07 -0700
Message-Id: <200101260542.VAA23212@milano.cup.hp.com>
To: dkennedy <dkennedy@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong 
In-reply-to: Your message of "Fri, 26 Jan 2001 00:07:12 PST."
             <Pine.LNX.4.21.0101260002130.3746-100000@localhost.localdomain>
Date: Thu, 25 Jan 2001 21:42:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

dkennedy wrote:
> Done.  I have committed it.  I don't have a PA box near me.  Can someone
> check my change to:
> 	- ensure it compiles
> 	- it correctly detects all the machines old and new.

Thanks!

It compiles and boots fine on my c3k:
| model   00005bb0 00000481 00000000 00000002 780cd400 100000f0 00000008 000000b2 000000b2
| CPUID   vers 17 rev 4
| model   9000/785/C3000
| led_init: CPU_HVERSION 5bb
...
| 6. AllegroHigh W  (0) at 0xfffa0000, versions 0x5bb, 0x0, 0x4, 0x0, 0x81
...

(I hadn't noticed we were already printing model string...cool.
I guess it time to start cleaning up boot output.)


> I don't mind maintaining this table.  It would be goot to keep this table 
> and the hardware database in sync.

I see. You are right.

The only way to do that is get regular updates from the maintainer
of "Appendix B". hmmm...but there are some issues with this. Updates
*aren't* regular and only "private" versions of the appendix B is
maintained. The appendix is hand filtered for public consumption to
exclude products which haven't released yet. So we'll just have to
keep grinding along like we do now...complain if something shows
up as "unknown" and it's got a IODC data.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
