Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4A44C482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 17:47:16 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Thu, 8 Nov 2001 01:46:52 +0100
MIME-Version: 1.0
Message-Id: <20011108004716.4A44C482C@dsl2.external.hp.com>
Subject: [parisc-linux] EISA stuff now in CVS
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

Hi all,
I've just committed Daniel Engstrom's <5116@telia.com> EISA patches
to CVS head. Get yourself 2.4.9-pa79 and try yourself :-)

I don't have any EISA cards, so I tested it here with an
old ISA NE2000 NIC clone in my 715/64:

dmesg:
ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
Last modified Nov 1, 2000 by Paul Gortmaker
NE*000 ethercard probe at 0x340: 08 00 00 50 11 13
eth0: NE2000 found at 0x340, using IRQ 10.

pa64:~# ping www.kde.org
PING www.kde.org (213.203.58.36): 56 data bytes
64 bytes from 213.203.58.36: icmp_seq=0 ttl=237 time=149.7 ms
64 bytes from 213.203.58.36: icmp_seq=1 ttl=237 time=108.7 ms

--- www.kde.org ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 108.7/129.2/149.7 ms

pa64:~# cat /proc/interrupts
 IRQ      count         Region    ISR
  2:          0            EISA  cascade
 10:       1645            EISA  NE2000
 32:      93357       PA-CPU-00  timer
 33:       8865       PA-CPU-00  lasi
 39:       1647       PA-CPU-00  wax
 69:          1            Lasi  keyboard, psaux
 86:       7852            Lasi  lasi710
 88:          0            Lasi  parport0
 90:       1008            Lasi  serial
117:       1645             Wax  EISA
125:          0             Wax  wax_hil_nmi
126:          2             Wax  hil

Greetings,
Helge
