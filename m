From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] xfs module in vmlinux-2.6.11-pa2-a500_defconfig
Date: Tue, 8 Mar 2005 10:24:54 +0100
Message-ID: <16941.28518.183984.44335@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

the xfs module in vmlinux-2.6.11-pa2-a500_defconfig doesn't load:

xfs: Global Offset Table overflow (used 1061, allowed 1023
modprobe: FATAL: Error inserting xfs (/lib/modules/2.6.11-pa2/kernel/fs/xfs/xfs.ko): Invalid argument

the reason for the update was a problem with the
vmlinux-2.6.8.1-pa11-a500_defconfig kernel, which I see from time to
time ...

mount: /dev/sdb5
: can't read superblock

running xfs_repair fixes the problem and the filesystem can be
mounted.

	Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
