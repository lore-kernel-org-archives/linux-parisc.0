Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA02344
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 15:21:46 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA28646
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 17:23:16 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA20249 for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 14:22:00 -0700 (PDT)
Message-Id: <199909152122.OAA20249@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Wed, 15 Sep 1999 08:08:01 PDT."
             <199909151508.IAA19696@milano.cup.hp.com>
Date: Wed, 15 Sep 1999 14:21:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] 715/100 bootpd fails
List-ID: <linux-parisc.vger.kernel.org>


Hi again,

Building "Image" but can't boot it via bootpd.
Here's what I've worked through so far...ideas?

My 715/100 (firmware 1.6, 64MB RAM, no disk) complains
	"ERROR: Cannot load IPL, error detected"

from either a 11.00 or 10.20 bootpd host.
"sea lan" at the target "BCH" (aka BOOT_ADMIN) shows both hosts.	
I think bootpd is configured "close enough" and the target
box is finding both bootpd servers and "Image" on each. I did
have a problem with public read permission on one host but
fixed that.

I downloaded Image-19990705 from the puffin.external.hp.com depot
and got the same result. So it's probably not a tools issue.  :^/
Building mkImage with "cc" might make a difference - but I doubt it.
I also doubt the mkImages changes I posted earlier today matter either.

"file Image" tells me Image is a lif file.
But "lifls" says it's not. The contradiction is a bit annoying.
Can someone cook the makefile to use lifinit/lifcp instead of mkImage.c?
I'm not sure it's possible but would be good if we could.

I'll try a different box (712/80) and see what that says.
I have a scratch disk on this box and could try dumping "Image"
to disk to see if it's a problem with how Image is built or
how the bootp server is transmitting data to the target.

Someone locally suggested UDP checksum had to be either on or off.
Anyone know about this (and if so, how to set/clear it appriopriately)?

The rest is just FYI.

grant


grundler <417>make Image
make -C arch/parisc/boot Image
make[1]: Entering directory `/linux/linux/arch/parisc/boot'
make[2]: Entering directory `/linux/linux/arch/parisc/boot/boot_code'
ld -nostdlib -N -H -R0x500000 ipl_s.o ipl_c.o rom_interface.o cache.o  -o ipl
ld: (Warning) Linker features were used that may not be supported in future releases. The +vallcompatwarnings option can be used to display more details, and the ld(1) man page contains additional information. This warning can be suppressed with the +vnocompatwarnings option.
strip ipl
make[2]: Leaving directory `/linux/linux/arch/parisc/boot/boot_code'
./mkImage boot_code/ipl ../../../vmlinux Image
Image 'Image' created.
Added IPL 'boot_code/ipl', 4084 pad bytes, checksum 0x098B99B2.
IPL will be relocated at run-time to 0x00500000.
Added Linux-SOM-Kernel '../../../vmlinux', 1060kB, entry-point at 0xC0010000.
Bootable Linux-Image 'Image' is ready to go !
chmod a+rw Image        # better change that in mkImage.c-source...
make[1]: Leaving directory `/linux/linux/arch/parisc/boot'

grundler <419>file /linux/linux/arch/parisc/boot/Image
/linux/linux/arch/parisc/boot/Image:    lif file
grundler <420>lifls /linux/linux/arch/parisc/boot/Image
lifls: Can't list /linux/linux/arch/parisc/boot/Image; not a LIF volume

[ 11.00 and 10.20 agree on this result - grant ]

grundler <421>tail /etc/bootptab
lego02b:\
        hd=/linux/linux/arch/parisc/boot:\
        bf=Image:\
        ba:bs:\
        vm=auto:\
        ht=ethernet:\
        ha=0800095F7A88:\
        sm=255.255.248.0:\
        ip=15.16.122.147
grundler <422>uname -a
HP-UX rock B.11.00 A 9000/800 2016163551 two-user license
grundler <423>model
9000/800/D390



Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
