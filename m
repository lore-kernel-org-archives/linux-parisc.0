Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26148
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 10:24:14 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA09258
	for <parisc-linux@thepuffingroup.com>; Thu, 4 Jan 2001 09:27:34 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@linuxcare.com.au (Alan Modra), bame@fc.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Thu, 04 Jan 2001 01:18:48 EST.
             <200101040618.BAA05609@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Jan 2001 10:29:38 -0700
Message-ID: <11690.978629378@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200101040618.BAA05609@hiauly1.hia.nrc.ca>you write:
  > > How about $$dyncall?  Wouldn't loading r19/r29 break this function?  I'm
  > > thinking of the case where $$dyncall is passed the address of a local
  > > function rather than a plabel.  We wouldn't want to load r19/r29 with the
  > > value for a shared libgcc.
  > 
  > Could this and maybe some of the other short milli routines be compiler
  > "builtins"?  This would allow inlining.
Yes, though it's not clear how much of a win it is for PA32, it might even
be a loss.  Hard to guess.  Someone would have to benchmark it.

For PA64 the indirect calling sequence is significantly simpler and is
emitted inline, hence we don't need/use $$dyncall for PA64.

jeff
