Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA05170
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Mar 2000 08:57:57 -0700
Date: Tue, 14 Mar 2000 15:58:18 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Sam Creasey <sammy@sammy.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly Language Changes
Message-ID: <20000314155818.Q5281@abacus.local>
References: <20000312152353.E5281@abacus.local> <Pine.LNX.4.21.0003140951150.1905-100000@sammyville.sammy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0003140951150.1905-100000@sammyville.sammy.net>; from sammy@sammy.net on Tue, Mar 14, 2000 at 09:54:43AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> > over the last few days or so, I have been trying to get glibc to build and
> > work for a Linux/PA-RISC target.  I came to believe it would be simpler to
> > change certain aspects of the assembly language used than to keep working
> > around them:
> 
> At least in the ELF toolchain (which, I think we did change the kernel
> over to, didn't we?)  I've already begun freely banging the assembler
> syntax into a more gas-like format...   

nod.  I've got binutils, gcc, glibc, linux moved to the new assembly language
here, just waiting for everyone to have a chance to comment before committing.

> > The disadvantage, obviously, is that we would need to keep separate
> > binaries around to compile HP/UX assembly source;  also, the assembly
> > files used by the kernel would need to be converted (and probably get
> > readable to more people in the process).
> 
> Hmph...  I'm not sure how many people working on the port hold a deep
> value in the ability to recompile HP/UX apps (or, in this case,
> reassemble).  Just run the damn HP assembler if you feel a deep need to
> run HP programs under the linux kernel (imho).

it's a 10-line perl script to convert, so I tend to agree with dropping the
HP syntax completely.

	Philipp
