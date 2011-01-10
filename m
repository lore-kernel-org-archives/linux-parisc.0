From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: WARNING: Out of order unwind entry!
Date: Mon, 10 Jan 2011 09:40:07 -0500 (EST)
Message-ID: <20110110144008.B31784DF2@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1101101019020.27086@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1101101019020.27086@math.ut.ee> from "Meelis Roos" at Jan 10, 2011 10:25:31 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I'm trying the newest kernel (2.6.37+git) on 64-bit parisc after a long 
> pause. The good news is that PCI resource allocatrion problem with tulip 
> (that was biting me at about 2.6.30-31 timeframe) has been fixed.
> 
> Generally it seems to run good but I get a couple of warnings in dmesg. 
> The first is a bunch of warnings about out of order unwind entries:
> 
> [    0.000000] unwind_init: start = 0x4050f000, end = 0x4053cef0, entries = 11759
> [    0.000000] WARNING: Out of order unwind entry! 0000000040510720 and 0000000040510730
> [    0.000000] WARNING: Out of order unwind entry! 0000000040510730 and 0000000040510740
> [    0.000000] WARNING: Out of order unwind entry! 0000000040511330 and 0000000040511340
> [    0.000000] WARNING: Out of order unwind entry! 0000000040511340 and 0000000040511350
> 
> Is this report any good or should I provide vmlinux or some other debug 
> output? Or if it is known anyway then please just ignore my report.

This should be fixed by a combination of kernel and binutils fixes.
Look back in the archives for details.

The binutils version currently in debian unstable isn't new enough.
If you build your own, you have to make sure GCC uses it.  Currently,
debian configures their 64-bit hppa compiler builds with --with-as=...
So, you may also want to rebuild GCC.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
