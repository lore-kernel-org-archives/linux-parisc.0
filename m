Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA29672
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 10:49:35 -0600
Message-Id: <200010111654.JAA06726@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __hp9000s700 predefined 
In-reply-to: Your message of "Wed, 11 Oct 2000 11:31:46 PDT."
             <200010111531.LAA26119@hiauly1.hia.nrc.ca>
Date: Wed, 11 Oct 2000 09:54:56 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" wrote:
...
> These are needed for user apps as well as the kernel.  They allow cpp
> to process files based on the machine features of the version of gcc used
> for the compilation (e.g.: PA 1.0, 1.1, or 2.0; 32 or 64 bit; s700 or s800).

o PA 1.1 vs PA 2.0 can be handled with -D_PA_RISC1_1.
  Since neither HPUX 10.X, HPUX 11.X, nor parisc-linux supports PA1.0,
  I don't know or care that is going to work (apologies to the
  folks who made spectrum happen).

o 32 vs 64-bit can be handled with __LP64__.

o s700 vs s800 is an artifact of HP's workstation vs server divisions.
  ie an artifact of how HP was organized. With HPUX 11, HP no longer ships
  different binaries for workstations vs servers (to many customers
  relief since we now only have one patch stream per release).

o As I noted before, linux enable/disables specific functionality and
  HW support with either CONFIG_XXX or runtime checks.

John, is there something specific you are concerned about which
can't be handled by the above predefined symbols?

BTW, HPUX vs parisc-linux vs osf vs hiux differences can be handled
with hpux, linux, mach, hiux predefines...ugh....looking at
gcc/gcc/config/pa/pa*h makes me want to puke...


> Thus, these or a similar set of defines are needed under parisc-linux.

I don't believe this yet...having worked on HPUX 10.20 and HPUX 11
extensively, I'm going to be hard to convince too...

thanks,
grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
