Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA05108
	for <parisc-linux@puffin.external.hp.com>; Mon, 12 Jul 1999 15:19:42 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m113nUG-0027YEC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Mon, 12 Jul 1999 23:19:44 +0200 (MET DST)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Message-ID: <19990712231019.A2039@alpha.franken.de>
Date: Mon, 12 Jul 1999 23:10:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mike Shaver <shaver@netscape.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] serial console
References: <378796B3.5FD7E116@netscape.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <378796B3.5FD7E116@netscape.com>; from Mike Shaver on Sat, Jul 10, 1999 at 02:53:39PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jul 10, 1999 at 02:53:39PM -0400, Mike Shaver wrote:
> I have a serial console cable that came with my A180C, but I can't get
> the silly box to talk to it.

disconnect the web console port. Whenever I have the web console port
connected to the hub, the serial console doesn't work for. As soon
as I unplug the web console the serial console comes up immidiatly. I
haven't notice this behaviour until I got enough cables today:-)

> Also, is there an equivalent to Sun's L1-A or the Indy's
> send-break-over-serial that will get me back to the PROM in the event
> that Linux jumps to east nowhere?  Or do I have to power cycle?

So far everbody denied the existance of that essentiell (at least for
kernel hackers) feature.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
