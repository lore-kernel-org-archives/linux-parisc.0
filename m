Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA23770
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 15:26:08 -0600
Received: (from tor@localhost)
	by pallas.spacetec.no (8.9.1a/8.9.1) id XAA02287
	for parisc-linux@thepuffingroup.com; Wed, 9 Jun 1999 23:26:10 +0200
Message-Id: <199906092126.XAA02287@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Wed, 9 Jun 1999 23:26:08 +0200
To: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] build success
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries mailed me and said he used the default configs, so I just
pressed return to all make config questions and hey presto it compiled
(except for one thing, coming back to that).

Cross-compiling environment: SGI Octane, irix 6.5, self-built cross compiler
and binutils (from CVS), linux kernel from cvs.

One little thing failed for me (people are obviously cross-compiling on
Linux in general, I guess).  There is no /bin/bash on SGI, it mostly lives
in /usr/freeware/bin.  The following patch fixed it for me (typical Perl
portability hack):

------
Index: arch/parisc/hp//boot/boot_tools/createheader.sh
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hp/boot/boot_tools/createheader.sh,v
retrieving revision 1.1
diff -u -r1.1 createheader.sh
--- createheader.sh	1999/06/09 18:28:04	1.1
+++ createheader.sh	1999/06/09 21:20:20
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # This is a script that creates a header given the 
 # ipl and vmlinux file locations.
------

-Tor
