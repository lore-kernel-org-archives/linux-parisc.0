Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx1.corp.harris.com (mlbmx1.corp.harris.com [137.237.90.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CE13482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 07:17:01 -0700 (MST)
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921627E4@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Date: Mon, 19 Nov 2001 09:16:34 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
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

I just tried to update to 2.4.14-pa6 and noticed a stackdump during
initialisation of my old NE2000 ISA-Nic which works fine using the last 2.4.9
Kernel. After this stackdump i booted (reset used) 2.4.9 again and the machine
hung without any message druring initialistaion of the NE2000 (right after
"NE*000 ethercard probe at 0x300:"). I had to power-cycle the machine to make it
work again.

Heres the log-message:

Last modified Nov 1, 2000 by Paul Gortmaker
NE*000 ethercard probe at 0x300:WARNING! Stack pointer and cr30 do not
correspond!

Dumping Stack from 100fe000 to 100fe380:
e000 ffca5940 ffca5940 7f7fffff ffffffff 7f7fffff ffffffff 00000000 00000000
e020 00000000 00000000 41800000 00000000 00000010 00000010 00000000 00000000
e040 ffca5940 ffca5940 41000000 00000000 40800000 00000000 ffca5940 ffca5940
e060 41000000 00000000 ffca5940 ffca5940 40800000 00000000 41000000 00000000
e080 40300000 00000000 40200000 00000000 40200000 00000000 41800000 ffca5940
e0a0 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
e0c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e0e0 00000000 00000000 101030b0 10107500 00000000 00000000 00000000 00000000
e100 102bd810 0000001d 4fc83f01 00000010 100fdc80 0000000f 00000002 0000000a
e120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e160 00000000 00000000 00000000 10107500 00000000 00000000 00000000 00000000
e180 100fdc80 102acb94 ffffffff 00000004 08000000 00000000 00000000 00000000
e1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e1c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e1e0 00000000 00000000 00000000 1010307c 00000000 00000000 10220a88 04000000
e200 00000080 00000300 100fdf40 102acb94 ffffffff 00000003 10000000 00000000
e220 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e240 101b6864 00000000 00000000 103a6400 100ff160 00000000 00000000 00000000
e260 00000000 00000000 00000000 10102f94 00000000 00000000 00000000 00000000
e280 102ac810 00000010 0000000c 00000023 00000001 102ac8dc 00000000 00000000
e2a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
e2c0 00000000 00000000 00000000 00000000 101d33b4 00000000 00000000 10291d5c
e2e0 f0821000 00000000 00000000 1010311c 00000000 00000000 00000000 00000000
e300 102bd810 100fdf40 100fdf40 100ff060 00000400 00000015 00000055 00000000
e320 102ac810 100fdec0 102bd810 00000002 10292cc0 00000000 100f8708 102bd810
e340 100fdec0 08000059 f0000694 fc0000a1 0000000e 00000001 00000004 1038e010
e360 0000000a 000000a1 00000001 10102f94 00000057 100fdec0 100fe300 10102f94

Bad Address (null pointer deref?): Code=6 regs=100fe380 (Addr=50412d43)


any hints?
Are there any guys arround here which made their ne2000 work with 2.4.14?

greetings

Wolfgang Pedot
