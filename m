Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16760
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 07:16:18 -0700
Received: from bhihawcon04.inteq.com (bhihawcon04.bhi.bhi-net.com [147.108.122.236] (may be forged))
	by gateway1.bhi-net.com (8.9.2/8.9.0) with ESMTP id IAA20542
	for <parisc-linux@thepuffingroup.com>; Thu, 30 Dec 1999 08:19:06 -0600 (CST)
Message-ID: <BBAFD7A26E78D311834400805FEA1177011053A0@BHIHAWISS04>
From: "Soto,  Gene G." <Gene.Soto@bakeroiltools.com>
To: parisc-linux@thepuffingroup.com
Subject: FW: [parisc-linux] cd-rom
Date: Thu, 30 Dec 1999 08:16:06 -0600
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>



----------
From:  Soto,  Gene G.
Sent:  Thursday, December 30, 1999 7:32 AM
To:  'John David Anglin'
Subject:  RE: [parisc-linux] cd-rom

Thanks,
I was able to mount it by resetting the switches (although I could swear I
tried them with the current configuration but on scsi id switch 3).

Your information is greatly appreciated.
Gene
	----------
	From:  John David Anglin [SMTP:dave@hiauly1.hia.nrc.ca]
<mailto:[SMTP:dave@hiauly1.hia.nrc.ca]> 
	Sent:  Wednesday, December 29, 1999 11:05 AM
	To:  Gene.Soto@bakeroiltools.com
<mailto:Gene.Soto@bakeroiltools.com> 
	Cc:  jb@sapin.irfu.se; <mailto:jb@sapin.irfu.se;>
parisc-linux@thepuffingroup.com <mailto:parisc-linux@thepuffingroup.com> 
	Subject:  Re: [parisc-linux] cd-rom

	> 	correction: it is a NEC MultiSpin 2Xe (CDR-74-1)
	> 
	> 	i have set the ID to 4.  I also tried it on 3 and it would
not
	> detect it.
	> 
	> 	it has 4 switches on the back and i have 1 & 2 set opposite
of what
	> is recommended
	> 	on the NEC webpage for installation on IBM or compatibles
(that's
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
	diskinfo if you have the SCSI ID and driver major/minor set
correctly.

	> 	is it possible to add something to pd_devinfo.tx that would
allow it
	> to mount?

	Yes.  However, this is only for sam.  You should be able to manually
	mount/umount the drive.  The busy error indicates that some process
is
	trying to open device file (possibly, because you have the device
listed
	in /etc/checklist).

	> 
	> 	when I try adding the following entry to /etc/checklist:
	> 	/dev/dsk/c201d4s0 /cdrom cdfs defaults
	> 
	> 	i get the following message when i try to mount it:
	> 	/dev/dsk/c201d4s0: Device busy

	-- 
	J. David Anglin                                  dave.anglin@nrc.ca
<mailto:dave.anglin@nrc.ca> 
	National Research Council of Canada              (613) 990-0752
(FAX: 952-6605)
