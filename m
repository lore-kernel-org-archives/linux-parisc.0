Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA04023
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 17:25:28 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 9DDDFF44
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 16:27:00 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id QAA22881
	for parisc-linux@thepuffingroup.com; Thu, 26 Oct 2000 16:31:44 -0700 (PDT)
Date: Thu, 26 Oct 2000 16:31:44 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010262331.QAA22881@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] boot c3k from local scsi
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I managed to setup/boot my c3k via NFS Root.
I'm using an add-on serial card as console since built-in serial
isn't working (yet).

Partitioning an 18GB disk was a problem. Both PALO and IODC have
limitations on where the PALO and boot filesystem partitions can reside.
Read the PALO docs at
	http://puffin.external.hp.com/cgi-bin/cvsview/palo/README.html
for details. It's a good, short, document.

Here's my resulting fdisk output:
Disk /dev/sda: 64 heads, 32 sectors, 17366 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1        11     11248   f0  Unknown
/dev/sda2            12        32     21504   83  Linux
/dev/sda3            33       545    525312   82  Linux swap
/dev/sda4           546      4642   4195328   83  Linux


and /etc/fstab contents:
# <file system> <mount> <type>  <options>                       <dump> <pass>
/dev/sda4       /       ext2    defaults,errors=remount-ro      0       0
/dev/sda3       none    swap    sw                              0       0
/dev/sda2       /boot   ext2    defaults,errors=remount-ro      0       0
proc            /proc   proc    defaults                        0       0


Oh - the palo command I used to get this work might be good
to pass on too:
	# palo -I -k /tmp/vmlinux -b /boot/iplboot \
		-c '2/vmlinux TERM=linux HOME=/ root=/dev/sda4' \
		/dev/sda

(I had copied a more current vmlinux to my NFS root's /tmp dir)

enjoy!
grant
