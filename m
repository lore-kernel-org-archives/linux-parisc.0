Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA20405
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 13:28:30 -0600
Message-Id: <199910271929.NAA27977@scoot.fc.hp.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] B132L console output 
In-reply-to: Your message of Tue, 26 Oct 1999 17:01:48 -0700.
    (Alex deVries wrote: > > On Tue, 26 Oct 1999, Grant Grundler wro...)
             <199910270001.RAA04300@milano.cup.hp.com>
Date: Wed, 27 Oct 1999 13:29:33 -0600
From: R Scott Holbrook (HP-DESK: hp4000/UX) <rsh@scoot.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant and Alex,

>>> 6. Merlin 132 Core RS-232 (10) at 0xffd05000, versions 0x3c, 0x0, 0x8c, 0x0, 0x0
>>> 16. Merlin+ Wax RS-232 (10) at 0xffe02000, versions 0x3a, 0x0, 0x8c, 0x0, 0x0
>> 
>> Which of those is actually connected?

> I would think both.
> But I was wrong about dino exporting it's RS-232 on this box.
> The B180 does export Dino's RS-232 from 8/0/63.
> But I was right in that Lasi only exports one of them.

The firmware will report only the serial ports that are actually
connected.  Thus, this box does have both of the serial ports.
On these types of boxes (B132, B132+ B160, B180), LASI always
provides the first serial port.  The second port, however, can
come from different chips depending on whether or not WAX is
present.  Some of these boxes had an EISA bus as an option.
If WAX is present, it provides the 2nd serial port.  Otherwise,
DINO provides the 2nd serial port.

>> > 15. Merlin+ Wax HIL (10) at 0xffe01000, versions 0x3a, 0x0, 0x73, 0x0, 0x0

> 15 is most likely off the WAX chip (EISA bus adapter.)
> I don't know if B132L has EISA slots (haven't looked inside one in
> a long time), but HP-UX reports "EISA Bus Adapter" at 8/20/5.
> So I would assume it does.
> Note that the B180 does NOT. And thus doubt the A180 would either.

This box has a WAX chip, which means that the system has an EISA slot.
EISA was an optional feature on some of these platforms.  Some B180
systems have EISA, others do not.

If the system has EISA, it has WAX and therefore has HIL support.
However, there is no HIL connector on these systems.  There is a
set of jumpers on the system board that connect the HIL signals to
2 unused pins on one of the PS/2 connectors and a special external
box that plugs into the PS/2 port and has a place to plug in the
HIL connector.  This is used by an OEM that uses the B132/B160/B180
platform but requires HIL (for some special keyboards).

Scott Holbrook / rsh@fc.hp.com
Unix Development Lab
