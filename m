Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA12910
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 18:06:15 -0700
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by atlrel1.hp.com (Postfix) with ESMTP id 9FC51F861
	for <parisc-linux@thepuffingroup.com>; Wed,  8 Dec 1999 20:08:24 -0500 (EST)
To: Paul Bame <bame@debian.fc.hp.com>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com, lamont@security.hp.com
Subject: Re: [parisc-linux] a pretty big change 
In-reply-to: Your message of "Tue, 07 Dec 1999 09:53:02 MST."
             <199912071653.JAA18644@debian.fc.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 08 Dec 1999 18:08:20 -0700
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19991209010821.87E9318708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> That happens pretty frequently to me but I've not tracked down why
> it happens.  Did you try holding the TOC button in for several seconds?
> On some workstations I've been told that generates a hard reset.

TOC results in (providing that the checksum passes) transfer of control
to a routine pointed at from page 0.  If something is trashing that, and
the checksum'ed length is set to 0, then you'll branch off into the ozone.

If the checksum fails, then you get the PDC default of rebooting.

Don't know if that's your problem, but it's probably worth checking into
whether something is trashing physical address 8 (TOC vector - 0xc is the
length of the checksum.)

lamont
