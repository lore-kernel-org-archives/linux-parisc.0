Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA13039
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 11:26:44 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 17:26:30 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008190020150.9244-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Aug 2000 13:25:53 -0400
In-Reply-To: Alan Modra's message of "Sat, 19 Aug 2000 00:29:01 +1000 (EST)"
Message-ID: <8766oy1nxa.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> On Fri, 18 Aug 2000, Alan Modra wrote:
> 
> > One way to keep out current ABI is to generate a .plt and import stubs
> > when statically linking PIC code.  That should be relatively easy to do in
> > the linker.
> 
> A bit of head-scratching, a couple of added functions, and the linker now
> detects PIC functions and handles them appropriately.

Sorry to burst your bubble but this doesn't work in the real world,
where "real world" is defined as 'hppa-linux-gcc -o hello hello.c'

In fact this new linker ends up marking basically everything as
potentially PIC, creating unnecessary import stubs for most functions
in libc.a, and *not* actually switching the relocations to point to
import stubs in the case where I am actually calling PIC in libgcc.a.

Oh and it segfaults on undefined weak symbols though that's easily
fixed.

I'm not even sure where to start fixing this.  I guess I'll try to
find something else to do today :(

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
