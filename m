Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D701482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 16:57:15 -0700 (MST)
Message-ID: <004401c16bd7$33ae82e0$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: <thunder7@xs4all.nl>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <3BEF3746.FB93DC1@beldar.com> <20011112070306.B14600@alpha.of.nowhere>
Subject: Re: [parisc-linux] J2240 - Almost There...
Date: Mon, 12 Nov 2001 19:07:35 -0500
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

Today, I rescued a 700/96 and cable from the trash so I'm going to try to
use it as a serial console to see how far I get.  It's amazing the "junk"
that shows up in the trash when your HP shop gets bought out by an IBM shop.
Anybody need a few K580x4's, 4GB RAM, and a couple of fully loaded AutoRaid
cabinets each?  In the meantime, how do I change the "Command Line" at boot?
Do I have to "interact" with IPL (almost as bad as having to interact with
people :-) ?

----- Original Message -----
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: Craig D. Lansing (root) <lansing@beldar.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Monday, November 12, 2001 1:03 AM
Subject: Re: [parisc-linux] J2240 - Almost There...


> On Sun, Nov 11, 2001 at 09:43:18PM -0500, Craig D. Lansing (root) wrote:
> > After using my CD burner to create several nice coasters, I have been
> > able to create a couple of CD's from which my J2240 will attempt to
> > boot.  I think that I am almost there, but need someone to show me the
> > error of my ways.  Disclaimer: I am not a System Admin by trade.  I have
> > been an HP-UX user since about version 7, but have not had a box of my
> > own to play with until I pulled this J2240 from the trash.  The system
> > is a J2240 2-way, 2.5GB RAM, 2x8GB internal FW-SCSI Disks, DDS-III,
> > internal Toshiba SCSI CD-ROM, 21" graphics console.
>
> We know the story. Now don't mention it again, because we'll go green
> with envy and look elsewhere :-)
>
> > Command Line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA8x16
> > TERM=linux'
> >
> Shouldn't that be ttyS0 for the console?
>
> Good luck,
> Jurriaan
> --
> Go not unto the Usenet for advice, for you will be told both yea and nay
(and
> quite a few things that just have nothing at all to do with the question).
> seen in a .sig somewhere
> GNU/Linux 2.4.13-ac8 on Debian/Alpha 64-bits 990 bogomips load:1.33 1.47
1.20
>
