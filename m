Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pony.its.uwo.ca (pony.its.uwo.ca [129.100.2.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0414482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 12:56:24 -0600 (MDT)
Received: from HCI009 (gl-209.gaul.csd.uwo.ca [129.100.12.209])
	by pony.its.uwo.ca (8.10.2/8.10.2) with SMTP id f6DIudV03246
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Jul 2001 14:56:39 -0400 (EDT)
Message-ID: <001101c10bcc$b3559990$d10c6481@HCI009>
From: "Yan Han" <yhan@uwo.ca>
To: <parisc-linux@lists.parisc-linux.org>
References: <20010630122236.A6437@megatonmonkey.net> <Pine.SOL.4.21.0107041427510.19435-100000@panther.uwo.ca> <20010704155338.E11831@megatonmonkey.net>
Date: Fri, 13 Jul 2001 14:50:35 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Palo not running -- "Installing Pa-risc linux problem"
List-ID: <linux-parisc.vger.kernel.org>

We came across a question of following the instrustuion in "INstalling
pa-risc linux" (www.parisc-linux.org/software/install.html". in
Step 8  "Initialize the boot loader (roughly equivalent to lilo): *** NOTE
*** change both '3's in the following command to use your partition number
		$ palo -k /boot/vmlinux -b /boot/iplboot \
			-c '3/boot/vmlinux TERM=linux HOME=/ root=/dev/sda3' \
			-I /dev/sda

"

Question 1 : After booting up from network, we logged in serial console and
palo is not in HP box.
so we copied palo from the NFS server into the NFS directory so that the HP
box can "see it" . However, it cannot run "palo". ( we think that palo is
compiled under intel chip, and don't like the HP's Risc CPU).
2. We tried to compile "palo" again in HP box, but we cannot compile it?

any idea about this,
