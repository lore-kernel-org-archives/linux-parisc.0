Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA20906
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 14:53:44 -0600
Message-Id: <199910272054.OAA28357@scoot.fc.hp.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] B132L console output 
In-reply-to: Your message of Wed, 27 Oct 1999 13:29:53 -0700.
    (Scott, thanks for the additional notes. R Scott Holbrook wrote:...)
             <199910272029.NAA05306@milano.cup.hp.com>
Date: Wed, 27 Oct 1999 14:54:47 -0600
From: R Scott Holbrook (HP-DESK: hp4000/UX) <rsh@scoot.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant,
> thanks for the additional notes.

>> If the system has EISA, it has WAX and therefore has HIL support.
>> However, there is no HIL connector on these systems.  There is a
>> set of jumpers on the system board that connect the HIL signals to
>> 2 unused pins on one of the PS/2 connectors and a special external
>> box that plugs into the PS/2 port and has a place to plug in the
>> HIL connector.

> Just curious. Is this the same "Keyboard Adapter Module" used on
> 715's? (no part number - has HIL, PS/2 Mouse, and PS/2 Keyboard
> "outputs")

I think so.  If you can get the hversion and sversion of the adapter
module on the 715, I can tell you for sure.

Scott
