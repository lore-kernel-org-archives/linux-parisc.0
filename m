Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16065
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 17:36:13 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 23:35:58 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA28731;
	Sat, 19 Aug 2000 09:35:40 +1000
Date: Sat, 19 Aug 2000 09:35:40 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <87vgwyz5r0.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0008190924370.28329-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 18 Aug 2000, David Huggins-Daines wrote:

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > Alan Modra <alan@linuxcare.com.au> writes:
> > > A bit of head-scratching, a couple of added functions, and the linker now
> > > detects PIC functions and handles them appropriately.
> > 
> > Sorry to burst your bubble but this doesn't work in the real world,
> > where "real world" is defined as 'hppa-linux-gcc -o hello hello.c'

I was thingk about it in the shower this morning, and _knew_ I'd be seeing
some mail from you.  You see, I really missed the whole point:  The
special PIC stubs are really only needed when intermixing calls to dynamic
libraries and statically linked PIC routines - which case we currently
ignore.  The fully statically linked case be solved by changing gcc to
reserve r19, although I think I'll leave the code there to add the stubs
and .plt entries.  With your fixes, of course!

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
