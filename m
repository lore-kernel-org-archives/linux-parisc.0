Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA08541
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Mar 2000 12:22:06 -0700
Date: Sat, 11 Mar 2000 19:22:26 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: blacky@xanaxis.dyndns.org
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] undefined reference in libgcc.a
Message-ID: <20000311192226.D5281@abacus.local>
References: <MDAEMON80008200003111913.AA1339046@xanaxis.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <MDAEMON80008200003111913.AA1339046@xanaxis.dyndns.org>; from blacky@xanaxis.dyndns.org on Sat, Mar 11, 2000 at 07:13:39PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> I've been trying to make a parisc-linux crosscompiler from a
> i586-linux-gnu platform, the binutils build with no problems, but
> at the final stage of building gcc it stops at the libgcc-test
> with the following error :
> 
> libgcc1-test.o: In function `main_without__main':
> /home/blacky/cvs/build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$global$'
> 
> it seems to reference to the integer-divide function in libgcc.
> 
> How can I get around this problem ?

The Easy Way:  remove the rule to build libgcc1-test out of the gcc Makefile.

AIUI, the right way would be to supply a crt1.o (or similar) that defines
$global$, _start aso.

	Philipp Rumpf
