Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA25945
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 09:34:27 -0600
Message-Id: <200010111531.LAA26119@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] __hp9000s700 predefined
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 11 Oct 2000 11:31:46 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200010110704.AAA05911@milano.cup.hp.com> from "Grant Grundler" at Oct 11, 2000 00:04:01 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> But Randolf also noted that gcc predefines a few other things:
> 	-D__hp9000s700 -D_PA_RISC1_1
> 
> John Marvin suggested we remove the __hp9000s700 from the pa-linux
> config files since it's HPUX crud. I think he's right since parisc-linux
> kernels are intended to run on both 700's and 800's.
> parisc-linux configs functionality in/out based on CONFIG_XXX flags
> or run-time checks (ie register_driver()).
> Can we remove the "-D__hp9000s700" from gcc/gcc/config/pa/pa-linux.h?
> 
> Similarly, gcc/gcc/config/pa/pa-linux64.h has "-D__hp9000s800"
> which could/should be removed at the same time.

These are needed for user apps as well as the kernel.  They allow cpp
to process files based on the machine features of the version of gcc used
for the compilation (e.g.: PA 1.0, 1.1, or 2.0; 32 or 64 bit; s700 or s800).
Thus, these or a similar set of defines are needed under parisc-linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
