Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (unknown [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53D154829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Dec 2002 19:57:35 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 5660A1FFF3D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 03:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id D4A581532D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 02:54:35 +0000 (UTC)
Date: Thu, 26 Dec 2002 02:54:35 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0212260248270.647-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] palo feature request
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

when palo cannot find a given kernel one gets that nice error
message. Can we go into interactive mode at this point after the
ERROR: ... ? ... so that one still has a chance to continue
booting without standing up and walking next room ;-)

--- cut ---
Booting
0x06.C7FF
palo ipl 1.1 root@c3k Tue Aug  6 09:39:51 MDT 2002

Partition Start(MB) End(MB) Id Type
1               1      30   f0 Palo
2              31     156   82 swap
3             157    2046   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3584504 bytes @ 0x48000

Command line for kernel: 'root=/dev/sda3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.53-pa3'
Selected kernel: /boot/vmlinux-2.5.53-pa3 from partition 3
ERROR: open /boot/vmlinux-2.5.53-pa3 from partition 3 failed
--- need to press power button here to continue and boot ipl ? ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
