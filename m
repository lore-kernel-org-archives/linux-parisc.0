Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11466
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 17:17:52 -0700
Message-Id: <200002292320.PAA08557@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: Andrew Shugg <andrew@neep.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Value of an old K-class server? 
In-reply-to: Your message of "Tue, 29 Feb 2000 12:24:39 PST."
             <20000229122439.F9944@thepuffingroup.com>
Date: Tue, 29 Feb 2000 15:20:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com wrote:
> On Wed, Mar 01, 2000 at 01:06:47AM +0800, Andrew Shugg wrote:
> > The lowest-numbered K class machine I can find on HP's website is a K220.
> > I'm fairly sure the machine I've looked at is a K200, but if this model
> > never existed then it's probably a 220.  =)
> 
> I've just been going through The List of hardware, bashing the hw database
> into something more sane.  The K200 did exist, codenamed `Kittyhawk' with
> a 100MHz PA7200 CPU in it.  It has an NIO bus in it which is something
> we don't have documentation on yet (also known as HP-PB, I think).
> The K-class machines probably wont work very soon, but I suspect someone
> will eventually get them working.

Think of the K-class as a C-class (eg. C100) with HP-PB instead of EISA.
But forget the HP-PB.  Very few cards are made for it and most are HP
proprietary.  At least all the HP-PB SCSI boards are. The problem is not
getting the cards - getting a device driver will be difficult unless
someone in HP is a masochist and wants to write one. Not me.

Kittyhawks also have GSC "slots". The core I/O board has one "slot" and
the Harrier board has room for 4 more GSC cards.  IIRC, TPG has a dozen
or so gigabit ethernet cards which would fit nicely on a harrier.  I suspect
Andrew was refering to a Harrier board.

I have no clue what the actual value of a K200 is. One should be able to
upgrade the system to something faster than 100Mhz and add CPU's. I'm
just not sure it's worth it. Compare to a C3000 or B1000 before going
that route.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
