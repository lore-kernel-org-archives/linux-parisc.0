Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31704
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 16:49:53 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 Jan 2001 23:53:10 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA28593;
	Fri, 5 Jan 2001 10:52:54 +1100
Date: Fri, 5 Jan 2001 10:52:54 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: <11763.978629840@upchuck>
Message-ID: <Pine.LNX.4.21.0101051039300.24485-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 4 Jan 2001, Jeffrey A Law wrote:

>   In message <Pine.LNX.4.21.0101041608490.15554-100000@front.linuxcare.com.au>y
> ou write:
>   > On Wed, 3 Jan 2001, Jeffrey A Law wrote:
>   > 
>   > > The easiest (to me) solution is to put the routines into the system C
>   > > library.  You'd drop the special millcode conventions, but that's a
>   > 
>   > How about $$dyncall?  Wouldn't loading r19/r29 break this function?  I'm
>   > thinking of the case where $$dyncall is passed the address of a local
>   > function rather than a plabel.  We wouldn't want to load r19/r29 with the
>   > value for a shared libgcc.
> $$dyncall is only used for PA32 -- what ABI are you using for PA32?  The
> existing ones don't require $dp or $gp to be loaded by the caller -- they're
> handled in the stub between the caller & callee.

The ABI hasn't changed.  r19 is loaded by the stub for a call into a
shared lib function.  That's a problem if we ever wanted to put $$dyncall
into a shared lib and make it available externally, as this particular
call should _not_ load r19.  ie. At least for $$dyncall, we can't use
standard hppa calling conventions.

-- 
Linuxcare.  Support for the Revolution.
