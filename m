Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA04974
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jul 2000 04:38:41 -0600
Message-ID: <20000719103952.18203.qmail@web510.mail.yahoo.com>
Date: Wed, 19 Jul 2000 03:39:52 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] HIL support on 715/old ?
To: parisc-linux@thepuffingroup.com, Matthew Wilcox <matthew@wil.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Matthew Wilcox <matthew@wil.cx> wrote:
> On Tue, Jul 18, 2000 at 03:42:26PM -0400, Chris Snow
> wrote:
> > 
> > Has anyone tested the HIL support on 715/old
> [33,50] ?  We are seeing
> > hangs here and I was wondering if that might be
> the problem ...
> 
> that was what i wrote it on originally (wrote is a
> little strong; it's
> basically philb's hil driver from linux/m68k). 
> however, i haven't tested
> it recently (eg since we moved to 2.3).
> 

As I wrote earlier to this list ( see
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/06-Jun/0018.html
) the linux-2.3-pre8 is not able to boot on a 715/old.
It hangs during the initialization of the ASP chip. So
I guess that HIL (which depends on ASP) is not working
right now either.

Tara Dear had a similiar problem on a 715/50. So I
suspect that this is not a problem related to my
715/33 or my build environment.

Ulrich

__________________________________________________
Do You Yahoo!?
Get Yahoo! Mail – Free email you can access from anywhere!
http://mail.yahoo.com/
