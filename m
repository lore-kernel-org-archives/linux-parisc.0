Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29593482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 06:48:39 -0700 (MST)
Received: from r6.petescaff.com ([192.168.0.3])
	by smtp.petescaff.com with esmtp (Exim 3.33 #1)
	id 16SIKp-0002yz-00
	for parisc-linux@lists.parisc-linux.org; Sun, 20 Jan 2002 14:48:35 +0100
Date: Sun, 20 Jan 2002 14:48:34 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <DLEJJFGDAJICFFBHFNCDAEAPCEAA.bjorn.bylander@telia.com>
Message-ID: <Pine.LNX.4.42.0201201438560.9287-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] partitioned md to enable root on raid
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

In order to use md on root devices with parisc there must be kernel
support for partitioned md (due to F0 partition). This is of course not a
requirement for i386 & the patch to enable this (which needs a new major
number) has not been accepted.

Is there any chance of adding this patch into parisc? Maybe due to the
special requirements of parisc then Linus might eventually accept the
requirement for this extra major number?

The current patch uses major 60 which is currently used by PDCONS. I am no
kernel hacker and am uncomfortable simply adding this patch with a
different major number.

Can anyone see any reason to not simply change the major to 61? Does the
patch look OK as it is for addition to parisc? (ignoring line numbers of
course)

PeteM

the patch is from:
http://cgi.cse.unsw.edu.au/~neilb/patches/linux/2.4.14/patch-J-MdpMajor

and is:

--- ./init/main.c       2001/11/06 04:43:07     1.1
+++ ./init/main.c       2001/11/06 04:43:12     1.2
@@ -188,6 +188,24 @@
        { "add",     0x1c30 },
        { "ade",     0x1c40 },
        { "fd",      0x0200 },
+#ifdef MDP_MAJOR
+       { "mda",     (MDP_MAJOR<<8) | 0},
+       { "mdb",     (MDP_MAJOR<<8) | 1},
+       { "mdc",     (MDP_MAJOR<<8) | 2},
+       { "mdd",     (MDP_MAJOR<<8) | 3},
+       { "mde",     (MDP_MAJOR<<8) | 4},
+       { "mdf",     (MDP_MAJOR<<8) | 5},
+       { "mdg",     (MDP_MAJOR<<8) | 6},
+       { "mdh",     (MDP_MAJOR<<8) | 7},
+       { "mdi",     (MDP_MAJOR<<8) | 8},
+       { "mdj",     (MDP_MAJOR<<8) | 9},
+       { "mdk",     (MDP_MAJOR<<8) | 10},
+       { "mdl",     (MDP_MAJOR<<8) | 11},
+       { "mdm",     (MDP_MAJOR<<8) | 12},
+       { "mdn",     (MDP_MAJOR<<8) | 13},
+       { "mdo",     (MDP_MAJOR<<8) | 14},
+       { "mdp",     (MDP_MAJOR<<8) | 15},
+#endif
        { "md",      0x0900 },
        { "xda",     0x0d00 },
        { "xdb",     0x0d40 },
--- ./include/linux/major.h     2001/11/06 04:43:07     1.1
+++ ./include/linux/major.h     2001/11/06 04:43:13     1.2
@@ -87,6 +87,8 @@

 #define LVM_BLK_MAJOR  58      /* Logical Volume Manager */

+#define MDP_MAJOR      60      /* MD with partitions */
+
 #define SCSI_DISK1_MAJOR       65
 #define SCSI_DISK2_MAJOR       66
 #define SCSI_DISK3_MAJOR       67
