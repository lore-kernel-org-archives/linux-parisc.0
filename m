Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07472
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 14:55:40 -0700
Message-Id: <200012042158.NAA03700@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] On the naming of discs 
In-reply-to: Your message of "Mon, 04 Dec 2000 20:06:44 PST."
             <20001204200644.C12414@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 04 Dec 2000 13:58:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> As noted in the install documentation, Linux and HPUX name their
> discs differently.  HPUX follows the spec and numbers from 7 down to 0,
> Linux follows the PC aberration and numbers from 0 up to 7.

The problem is not how disks are enumerated. HPUX does it exactly the
same way - SCSI spec defines how the SCSI bus is to be walked.

The real problem is how devices are "named". Adding or removing devices may
cause existing devices to get new names when the system is rebooted.
And adding/removing devices on one SCSI bus will affect how devices
on other SCSI busses are named.

Even though HPUX's naming convention isn't perfect (eg /dev/rdsk/c1t2d3),
it works well for SCSI devices - regardless of type and when added.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
