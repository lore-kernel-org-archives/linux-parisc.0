Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA20732
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 14:28:47 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id BA5B4A0B
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Oct 1999 13:29:44 -0700 (PDT)
Message-Id: <199910272029.NAA05306@milano.cup.hp.com>
To: R Scott Holbrook (HP-DESK: hp4000/UX) <rsh@scoot.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] B132L console output 
In-reply-to: Your message of "Wed, 27 Oct 1999 13:29:33 PDT."
             <199910271929.NAA27977@scoot.fc.hp.com>
Date: Wed, 27 Oct 1999 13:29:53 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Scott,
thanks for the additional notes.

R Scott Holbrook wrote:
...
> If the system has EISA, it has WAX and therefore has HIL support.
> However, there is no HIL connector on these systems.  There is a
> set of jumpers on the system board that connect the HIL signals to
> 2 unused pins on one of the PS/2 connectors and a special external
> box that plugs into the PS/2 port and has a place to plug in the
> HIL connector.

Just curious. Is this the same "Keyboard Adapter Module" used on 715's?
(no part number - has HIL, PS/2 Mouse, and PS/2 Keyboard "outputs")

thanks,
grant

> This is used by an OEM that uses the B132/B160/B180
> platform but requires HIL (for some special keyboards).
> 
> Scott Holbrook / rsh@fc.hp.com
> Unix Development Lab
