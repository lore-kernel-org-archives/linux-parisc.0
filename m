Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA31513
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Dec 1999 21:22:56 -0700
Message-ID: <BBAFD7A26E78D311834400805FEA1177011285C8@BHIHAWISS04>
From: "Soto,  Gene G." <Gene.Soto@bakeroiltools.com>
To: "'Jan Bergman'" <jb@sapin.irfu.se>
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] cd-rom
Date: Tue, 28 Dec 1999 22:15:28 -0600
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-parisc.vger.kernel.org>

	> I need to load 10.02 and am having problems mounting a NEC
cdr-1410a cd-rom
	> on my system (9000/712).  Any advice on where to go for help would
be
	> appreciated.  (SAM sees the device but I can't mount it).
	> 
	> thanks

	Maybe a stupid question, but I have had similar problems with a
floppy drive. 
	Have you tried to mount it "by hand"? I.e. not using SAM, "mount
/dev/dsk/c0tXd0 /cdrom" 
	where X is the SCSI ID. There might (but probably not) also be a
conflict 
	with the SCSI ID. Does "ioscan" see the device? Try to boot from the
CD,
	if that doesn't work then I don't know.

	/Jan Bergman
	jb@irfu.se <mailto:jb@irfu.se> 



	correction: it is a NEC MultiSpin 2Xe (CDR-74-1)

	i have set the ID to 4.  I also tried it on 3 and it would not
detect it.

	it has 4 switches on the back and i have 1 & 2 set opposite of what
is recommended
	on the NEC webpage for installation on IBM or compatibles (that's
the only way SAM
	detected the device):
	switch 1 is Factory Use Only(Normal OFF) (I have it ON)
	switch 2 is Termination ON/OFF (I have it OFF)
	switch 3 is SCSI2/ON SCSI1/OFF (I have it OFF)
	switch 4 is Factory Use Only(Normal OFF) (I have it ON)

	I am running 9.01 (and don't have the 'n' option in ioscan).
	This is ioscan -f:

	Class    H/W Path  Driver   H/W Status    S/W Status 
	=====================================================
	graphics 1.0.0     graph3   ok(0x577)     ok         
	scsi     2.0.1     c700     ok(0x7071)    ok         
	disk     2.0.1.0.0 scsi     ok(0x202)     ok         
	disk     2.0.1.1.0 scsi     ok(0x202)     ok         
	disk     2.0.1.4.0 scsi     ok(0x5800100) ok         
	disk     2.0.1.5.0 scsi     ok(0x202)     ok         
	disk     2.0.1.6.0 scsi     ok(0x202)     ok         
	lan      2.0.2     lan01    ok(0x7072)    ok         
	hil      2.0.3     hil      ok(0x7073)    ok         
	serial   2.0.4     asio0    ok(0x7075)    ok         
	serial   2.0.5     asio0    ok(0x7075)    ok         
	parallel 2.0.6     parallel ok(0x7074)    ok         


	I get the following note from SAM when I try to add the disk:
	SAM was unable to determine the disk model of one of the disk drives
on your system,
	and is assuming that disk drive is used.  This may happen if the
disk drive is a
	disk array or if the disk is not listed in
/usr/sam/lib/C/pd_devinfo.tx.

	this is the only cd-rom info listed in pd_devinfo.tx:
	DISK:::scsi::::TOSHIBA CD-ROM XM-3301TA:::SCSI CD-ROM
drive::::::::::::::::CDROM_SCSI,
	DISK:::scsi::::TOSHIBA CD-ROM DRIVE:::::::SCSI CD-ROM
drive::::::::::::::::CDROM_SCSI,

	is it possible to add something to pd_devinfo.tx that would allow it
to mount?

	these are the device files:
	/dev/dsk/4s0
	/dev/dsk/c201d4s0
	/dev/rdsk/4s0
	/dev/rdsk/c201d4s0

	when I try adding the following entry to /etc/checklist:
	/dev/dsk/c201d4s0 /cdrom cdfs defaults

	i get the following message when i try to mount it:
	/dev/dsk/c201d4s0: Device busy
