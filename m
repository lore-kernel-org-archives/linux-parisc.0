Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8636482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 19:47:50 -0700 (MST)
Message-ID: <003401c16bef$081c1b20$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: "Ryan Bradetich" <rbradetich@uswest.net>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <3BEF3746.FB93DC1@beldar.com> <20011112070306.B14600@alpha.of.nowhere> <004401c16bd7$33ae82e0$0101a8c0@pogo> <20011112185954.A15743@beavis.ybsoft.com>
Subject: Re: [parisc-linux] K580
Date: Mon, 12 Nov 2001 21:58:10 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

The offer for the K580s was only half-serious.  I have 4 and have found a
home for 1 at another site where it won't have to be seen with any AS-400's
or RS-6000's.  I should be done with the other 3 next Summer if all goes
well.  If the company intends to throw them away I'll rescue them, the
AutoRaids, Jamaicas, etc. and see who wants them.  Since Leibert doesn't
contain the letters H or P, they may stay so you'd have to get your own UPS.
However, these K's may be "good enough" to find another home or get sold on
the used market, not like a lowly J :-(  I figure I'm doing good with a J in
the garage, I'm not sure the other half would be impressed with a K in a
2-meter cabinet, but the electric company might be :-)

BTW, at Jurriaan's suggestion I tried setting the console to ttyS0 and also
tried setting sti=1 and still no luck.  As I mentioned above, the J is in
the garage far away from my other boxes so I have no network option at this
point.  CD is my only hope for a while.  So far, this is almost as much fun
as my first i386 dual-boot install :-)

----- Original Message -----
From: Ryan Bradetich <rbradetich@uswest.net>
To: Craig D. Lansing <lansing@beldar.com>
Sent: Monday, November 12, 2001 8:59 PM
Subject: Re: [parisc-linux] K580


> On Mon, Nov 12, 2001 at 07:07:35PM -0500, Craig D. Lansing wrote:
> > Today, I rescued a 700/96 and cable from the trash so I'm going to try
to
> > use it as a serial console to see how far I get.  It's amazing the
"junk"
> > that shows up in the trash when your HP shop gets bought out by an IBM
shop.
>
> > Anybody need a few K580x4's, 4GB RAM, and a couple of fully loaded
AutoRaid
> > cabinets each?  In the meantime, how do I change the "Command Line" at
boot?
> > Do I have to "interact" with IPL (almost as bad as having to interact
with
>
> Craig,
>
> I am doing the initial port of parisc-linux to the K-series ... I have a
K460,
> but the K570/K580 series have 1 additional feature that I am interested in
as
> maintainer of the ccio driver.... it has the ability to swap out 2
processors
> for an additional U2 chip (ccio driver).  Are you serious about donating a
> K580?  I would gladly pay shipping for one of these machines (the autoraid
> would also be nice since I do not have 1 to play with).   This is coming
out
> of my personal pocket but if you are serious about the offer, I am serious
> about getting the port working on the K-class machines, and maybe we can
> work something out.
>
> Otherwise, I'll just keep working on the K-460 until a good deal for a
K-580
> comes along.
>
> Thanks!   (I'd keep one of those K boxes for yourself, right now the K
works,
> but it is not very pretty at the moment.  I am currently writing a console
> driver for it so it looks more like a normal linux box, but once the box
boots,
> you can ssh into the system (no console driver yet) and use it pretty
happily:))
>
> - Ryan
>
