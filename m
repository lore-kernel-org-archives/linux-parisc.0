Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23240
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:05:17 -0700
Message-Id: <200011301807.KAA29437@milano.cup.hp.com>
To: "Steve Moret" <smoret@uci.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125 
In-reply-to: Your message of "Thu, 30 Nov 2000 09:39:17 PST."
             <FKEGLIIBOIACJOCCAFIMIEFFCCAA.smoret@uci.edu>
Date: Thu, 30 Nov 2000 10:07:21 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Steve Moret" wrote:
> I will go under the assumption that it could be the disks and their possible
> age and try and find suitable replacements.

Possible - sometimes just jumpers are missing or need to be removed.
Make sure disks spinup on their own first.

I'm not sure Linux SCSI disk driver knows how to deal with
"Not ready" and/or send START_UNIT commands. HPUX definitely does.

> Once I do get disks working is there a "Recepe" on how to get it to boot
> from your local drive.

Yes - the /README.INSTALL on the v0.5 ISO image.
Not sure if that's posted elsewhere on www.parisc-linux.org.

> I would figure just copy over the NFS root, but then where do I put the
> lifimage so that boot manager can find it.

The "palo" step does that for you.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
