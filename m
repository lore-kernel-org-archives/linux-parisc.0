Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26532
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 10:32:02 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA09793
	for <parisc-linux@thepuffingroup.com>; Thu, 4 Jan 2001 09:35:19 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Thu, 04 Jan 2001 16:20:37 +1100.
             <Pine.LNX.4.21.0101041608490.15554-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Jan 2001 10:37:20 -0700
Message-ID: <11763.978629840@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0101041608490.15554-100000@front.linuxcare.com.au>y
ou write:
  > On Wed, 3 Jan 2001, Jeffrey A Law wrote:
  > 
  > > The easiest (to me) solution is to put the routines into the system C
  > > library.  You'd drop the special millcode conventions, but that's a
  > 
  > How about $$dyncall?  Wouldn't loading r19/r29 break this function?  I'm
  > thinking of the case where $$dyncall is passed the address of a local
  > function rather than a plabel.  We wouldn't want to load r19/r29 with the
  > value for a shared libgcc.
$$dyncall is only used for PA32 -- what ABI are you using for PA32?  The
existing ones don't require $dp or $gp to be loaded by the caller -- they're
handled in the stub between the caller & callee.


jeff
