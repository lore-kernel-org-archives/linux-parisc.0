Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA28998
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Dec 1999 17:19:34 -0700
Date: Wed, 29 Dec 1999 01:22:09 +0100 (MET)
From: Jan Bergman <jb@sapin.irfu.se>
Message-Id: <199912290022.BAA02135@sapin.irfu.se>
To: parisc-linux@thepuffingroup.com, Gene.Soto@bakeroiltools.com
Subject: Re: [parisc-linux] cd-rom
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



> I need to load 10.02 and am having problems mounting a NEC cdr-1410a cd-rom
> on my system (9000/712).  Any advice on where to go for help would be
> appreciated.  (SAM sees the device but I can't mount it).
> 
> thanks

Maybe a stupid question, but I have had similar problems with a floppy drive. 
Have you tried to mount it "by hand"? I.e. not using SAM, "mount /dev/dsk/c0tXd0 /cdrom" 
where X is the SCSI ID. There might (but probably not) also be a conflict 
with the SCSI ID. Does "ioscan" see the device? Try to boot from the CD,
if that doesn't work then I don't know.

/Jan Bergman
jb@irfu.se
