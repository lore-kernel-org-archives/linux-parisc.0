Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from 2p.hu (fehercapa.kektintahal.pirospolip.hu [195.70.35.189])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EE8C484B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Feb 2003 18:40:17 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by 2p.hu (Postfix) with ESMTP id 4731A97384
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 02:45:33 +0100 (CET)
Received: from 2p.hu ([127.0.0.1])
 by localhost (fehercapa [127.0.0.1:10024]) (amavisd-new) with ESMTP
 id 31351-05 for <parisc-linux@lists.parisc-linux.org>;
 Mon,  3 Feb 2003 02:45:32 +0100 (CET)
Received: from fehercapa (fehercapa [195.70.35.189])
	by 2p.hu (Postfix) with ESMTP id 05192972B3
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 02:45:32 +0100 (CET)
Date: Mon, 3 Feb 2003 02:45:32 +0100 (CET)
From: Zoltan HERPAI <wigyori@2p.hu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.50.0302030230530.31341-100000@fehercapa.kektintahal.pirospolip.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 712/60 won't boot, strange arp addresses
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

hi all,

sorry if someone saw this email already on debian/hppa list, but i didn't
get any usable information there, and still stuck with the box.
additions are that i tried the AUI port too (after acquiring a transceiver
:) ) with the same results described lower, and tomorrow i'll get a scsi
cdrom to install a debian on it, just to see if the ethernet ports work at
all now.
thanks in advance if anybody has any idea.

-w-

---------- Original message ----------
Date: Tue, 28 Jan 2003 03:39:09 +0100 (CET)
From: Zoltan HERPAI <wigyori@2p.hu>
To: debian-hppa@lists.debian.org
Subject: 712/60 won't boot, strange arp addresses

hi,

i recently acquired a 712/60 workstation, trying to boot it from lan.
tcpdump looks like this (10.1.1.254 is the bootp server, 10.1.1.253 would
be the IP of the hp box):

03:29:20.253733 0.0.0.0.68 > 255.255.255.255.67:  xid:0xc1f968d1 ether
8:0:9:91:ed:a0 [|bootp]
03:29:20.259366 10.1.1.254.67 > 10.1.1.253.68:  xid:0xc1f968d1
Y:10.1.1.253 S:10.1.1.254 ether 8:0:9:91:ed:a0 sname "ironcurtai"[|bootp]
(DF)
03:29:22.253780 0.0.0.0.68 > 255.255.255.255.67:  xid:0xc1f968d1 secs:2
ether 8:0:9:91:ed:a0 [|bootp]
03:29:22.258825 10.1.1.254.67 > 10.1.1.253.68:  xid:0xc1f968d1 secs:2
Y:10.1.1.253 S:10.1.1.254 ether 8:0:9:91:ed:a0 sname "ironcurtai"[|bootp]
(DF)
03:29:26.253525 0.0.0.0.68 > 255.255.255.255.67:  xid:0xc1f968d1 secs:6
ether 8:0:9:91:ed:a0 [|bootp]
03:29:26.258648 10.1.1.254.67 > 10.1.1.253.68:  xid:0xc1f968d1 secs:6
Y:10.1.1.253 S:10.1.1.254 ether 8:0:9:91:ed:a0 sname "ironcurtai"[|bootp]
(DF)

after this, some strange arp lookups appear in the tcpdump output, like
this:
03:28:48.961476 arp who-has 10.1.1.253 (0:0:0:0:0:70) tell 10.1.1.254
03:28:49.961465 arp who-has 10.1.1.253 (0:0:0:0:0:70) tell 10.1.1.254

the arp address sometimes change, to 0:0:0:0:0:66, or :64. don't know what
this is, bootpd replies to the requests, but they never reach the 712. i
use the rj45 port, which worked when i bought it from a company. any
ideas? i can send the bootptab config on request (hoping the reply will
get to the recipient ;) )

tia,
-w-
