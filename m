Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA06299
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Dec 1999 10:05:12 -0700
Message-Id: <199912291705.MAA20696@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] cd-rom
To: Gene.Soto@bakeroiltools.com (Soto,  Gene G.)
Date: Wed, 29 Dec 1999 12:05:14 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jb@sapin.irfu.se, parisc-linux@thepuffingroup.com
In-Reply-To: <BBAFD7A26E78D311834400805FEA1177011285C8@BHIHAWISS04> from "Soto,  Gene G." at Dec 28, 99 10:15:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 	correction: it is a NEC MultiSpin 2Xe (CDR-74-1)
> 
> 	i have set the ID to 4.  I also tried it on 3 and it would not
> detect it.
> 
> 	it has 4 switches on the back and i have 1 & 2 set opposite of what
> is recommended
> 	on the NEC webpage for installation on IBM or compatibles (that's
> the only way SAM
> 	detected the device):
> 	switch 1 is Factory Use Only(Normal OFF) (I have it ON)
> 	switch 2 is Termination ON/OFF (I have it OFF)
> 	switch 3 is SCSI2/ON SCSI1/OFF (I have it OFF)
> 	switch 4 is Factory Use Only(Normal OFF) (I have it ON)

Strange.  I have a NEC CD-ROM drive on my machine and I am pretty
certain the switch settings are per the drive manual.  In general,
If this is the last drive on the chain, termination should be on.
SCSI2 should be OK.  You should be able to see the drive with
diskinfo if you have the SCSI ID and driver major/minor set correctly.

> 	is it possible to add something to pd_devinfo.tx that would allow it
> to mount?

Yes.  However, this is only for sam.  You should be able to manually
mount/umount the drive.  The busy error indicates that some process is
trying to open device file (possibly, because you have the device listed
in /etc/checklist).

> 
> 	when I try adding the following entry to /etc/checklist:
> 	/dev/dsk/c201d4s0 /cdrom cdfs defaults
> 
> 	i get the following message when i try to mount it:
> 	/dev/dsk/c201d4s0: Device busy

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
