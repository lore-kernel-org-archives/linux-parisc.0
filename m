Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hottub.hottub.org (hottub.org [66.60.164.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7D0B482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 11:41:01 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by hottub.hottub.org (Postfix) with ESMTP id 36565213C4
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 10:38:37 -0700 (PDT)
Date: Thu, 6 Jun 2002 10:38:37 -0700 (PDT)
From: Matthew Zahorik <matt@hottub.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.GSO.4.40.0206060916010.10618-100000@hottub>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] J6700/ISO 20020526 install results
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

Hello all!

  Thanks to Grant for pointing me to the testing ISOs

  The end result of a fresh install using these ISOs was that my J6700 is
working fine under a 64-bit kernel.

  I used the mini 70MB image.

  I will be re-installing soon as I'm fooling with software RAID mirrored
boot disks and the partitions are not laid out properly.  If the CD
maintainer wishes to try another ISO addressing my notes below I'll be
glad to give it another go.

  Thanks!

- Matt

ps.  This is my first go at PA-RISC/Linux, although I'm very familiar with
both Linux on other platforms and HP hardware.  Please forgive any
foot-in-mouth that may result.

  Notes:

-- Base install --

  It defaults to the 32-bit kernel.  I have 16GB in this machine and
wanted more than 2G swap, therefore I IPL'd palo to boot 0/vmlinux64.
Minor.  Is memory size known at this point?  If so, >4GB machines may want
to default to 64-bit.

  /dev/hda* is missing, therefore it was unable to find the CDROM for base
install.  I spawned a shell and did a MAKEDEV hda.

  LCD reads Linux 24.18-64 with installation kernel and heartbeat is
erratic.  Minor.

-- Install after reboot --

  The apt-get configuration *insisted* on looking for stable packages.  I
had to use the manual option to add these lines:

deb http://http.us.debian.org/debian woody main contrib
deb-src http://http.us.debian.org/debian woody main contrib
deb http://non-us.debian.org/debian-non-US woody/non-US main contrib
deb-src http://non-us.debian.org/debian-non-US woody/non-US main contrib

  Unfortuantely, manual editing of sources.list doesn't allow
specification of a proxy.  I'm behind a proxy.  Setting $http_proxy then
restarting base-config allowed me to finish.

-- After install --

  LCD is fine except heartbeat is extremely slow.  Is the speed dependent
on load? (:

  Haven't tried SMP.  The installed kernel is UP.

  No real stress testing performed as of yet.  No word on stability.

  Is gcc-3.1 worth putting in as default?

maz@pa-risc:/proc$ more cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 750.000000
model           : 9000/785/J6700
model name      : Duet W2
hversion        : 0x00005dd0
sversion        : 0x00000491
I-cache         : 768 KB
D-cache         : 1536 KB (WB)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1497.49
