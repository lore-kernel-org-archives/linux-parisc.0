Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from chirp.Stanford.EDU (chirp.Stanford.EDU [171.64.90.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C029482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 14:29:55 -0700 (MST)
Date: Fri, 22 Nov 2002 13:29:40 -0800 (PST)
From: Leif Harcke <lharcke@Stanford.EDU>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0211221116130.28782-100000@chirp.Stanford.EDU>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Tulip driver fails to advertise 100baseTx media capability
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Just got Debian 3.0 (woody) booted on a C240.  When the Tulip driver is
initialized by the kernel, it fails to advertise the 100baseTx media
capability of the DS21143 chip.  I think this is a kernel issue, not a
Debian or Tulip issue.

Setting the PDC/firmware (v. 6.3, latest for the C240) to force the
100/Full duplex rate at boot time doesn't fix the problem, nor does
issuing an "ether=0,0,[11|14],eth0" to the kernel from the PALO kernel
parameters line.

I think the way Tulip is called by the kernel somehow causes only 10baseT
to be advertised.  It's easy enough to correct after the fact with a
simple "mii-tool -A" command, but it would be nicer if the media
advertising was properly set by the kernel at boot time.  See output of
uname, dmesg, and mii-tool below.

A thousand pardons if this is the wrong list for this bug.  I'll re-post
to the debian-hppa or the tulip list if people think those are the proper
places.

- --
Leif Harcke
lharcke@stanford.edu


sar2:~# uname -a
Linux sar2 2.4.18-32 #1 Sat Mar 30 18:26:22 MST 2002 parisc unknown

sar2:~# dmesg | grep ulip
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0xff00, 00:10:83:05:73:95, IRQ 96.

sar2:~# mii-tool -v
eth0: negotiated 10baseT-FD, link ok
  product info: Level One LXT970/971 rev 1
  basic mode:   autonegotiation enabled
  basic status: autonegotiation complete, link ok
  capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  10baseT-FD 10baseT-HD
  link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD

sar2:~# mii-tool -A 100baseTx-FD,100baseTx-HD,10baseT-FD,10baseT-HD
restarting autonegotiation...

sar2:~# mii-tool -v
eth0: negotiated 100baseTx-FD, link ok
  product info: Level One LXT970/971 rev 1
  basic mode:   autonegotiation enabled
  basic status: autonegotiation complete, link ok
  capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE93qHLFW+DB6BX7gwRAkErAJ4rIddaK6G9pczszUoU4ySyGsHvZACfXzWj
J01G1z7IQixy0UaYiAxnfQQ=
=9Ttl
-----END PGP SIGNATURE-----
