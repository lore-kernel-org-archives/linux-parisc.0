Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04943
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Mar 2000 08:49:26 -0700
Date: Tue, 14 Mar 2000 09:54:43 -0500 (EST)
From: Sam Creasey <sammy@sammy.net>
To: Philipp Rumpf <prumpf@inwestnet.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly Language Changes
In-Reply-To: <20000312152353.E5281@abacus.local>
Message-ID: <Pine.LNX.4.21.0003140951150.1905-100000@sammyville.sammy.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Sun, 12 Mar 2000, Philipp Rumpf wrote:

> Hello,
> over the last few days or so, I have been trying to get glibc to build and
> work for a Linux/PA-RISC target.  I came to believe it would be simpler to
> change certain aspects of the assembly language used than to keep working
> around them:

At least in the ELF toolchain (which, I think we did change the kernel
over to, didn't we?)  I've already begun freely banging the assembler
syntax into a more gas-like format...   

> The advantages to changing the assembly dialect we use are that using cpp
> to pre-process assembly instructions becomes a lot simpler (glibc makes
> heavy use of this);  the assembly language looks more similar to those
> used for other architectures that run Linux;  there is no difference
> between the pa1.1 and pa2.0 versions.

Agreed.  The original workarounds in the kernel were rather hideous, and
prevented us fron doing quite a few useful things.  (initcalls, anybody?)

Maximum software build support good.

> The disadvantage, obviously, is that we would need to keep separate
> binaries around to compile HP/UX assembly source;  also, the assembly
> files used by the kernel would need to be converted (and probably get
> readable to more people in the process).

Hmph...  I'm not sure how many people working on the port hold a deep
value in the ability to recompile HP/UX apps (or, in this case,
reassemble).  Just run the damn HP assembler if you feel a deep need to
run HP programs under the linux kernel (imho).

-- Sam
