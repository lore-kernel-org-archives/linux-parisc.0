Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA30710
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 11:10:55 -0700
To: "Thomas Marteau" <marteaut@esiee.fr>
cc: "Kailashnath V Rampure" <kailasr@webcash.com>,
        parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Boot command 
In-Reply-To: Your message of "Wed, 15 Nov 2000 19:10:56 +0100."
             <007c01c04f2f$6679f620$a832d793@esiee.fr>
References: <Your message of "Fri, 03 Nov 2000 11:46:39 PST." <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com><Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com><5.0.0.25.0.20001103114401.00a46150@mail.webcash.com><5.0.0.25.0.20001114142101.00a69910@mail.webcash.com> <5.0.0.25.0.20001115095344.01f15cb0@mail.webcash.com>  <007c01c04f2f$6679f620$a832d793@esiee.fr> 
Date: Wed, 15 Nov 2000 11:12:57 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13w73J-0006Vp-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

=     You put the swap partition before the f0 partition and here it is the f0
= partition in first position.

The partition order doesn't matter so long as the f0 partition and
the partition containing your kernel (an ext2 partition) *end* within
the first 2Gb of the disk.  See the PALO README.html.

=     Also, your hard disk is ida instead of sda, what's that ?

PALO lists the devices as 'ida' instead of 'sda' or 'hda' since it
is using the firmware 'IODC' interface to talk to the boot device,
and it has no idea what type of boot device IODC is providing.

	-P
