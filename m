Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA08543
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 14:26:00 -0700
Message-ID: <20000229202653.2087.qmail@web508.mail.yahoo.com>
Date: Tue, 29 Feb 2000 12:26:53 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] make Image fails
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- willy@thepuffingroup.com wrote:
> On Tue, Feb 29, 2000 at 06:34:16AM -0800, Ulrich
> Strelow wrote:
> > Building the cvs version 20000227 with defconfig
> fails
> > with unsatified symbol __cmpdi2.
> 
> [snip]
> 
> > I did not find any reference in the source code.
> > Grepping through object files as well finds a
> > reference in arch/parisc/hpux/fs.o and hpux.o.
> 
> __cmpdi2 is one of the `help, help, i don't know how
> to compile this
> arithmetic op' symbols that gcc puts into libgcc1. 
> Let me have a look
> and wee what's producing this.  It may vary
> depending on gcc version;
> what version of gcc are you using?

I am using gcc version 2.8.1. I must admit that this
is a bit old, but it was sufficient until now to build
parisc-linux kernels (and SOM executables for HP-UX).

Ulrich
__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
