Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87DF14834
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 23:39:19 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1B8ZKz-0006iY-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 31 Mar 2004 01:36:33 -0500
Date: Wed, 31 Mar 2004 01:36:32 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040331063632.GB21909@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting remounting and S10checkroot.sh,
	the saga of changes to how mount works...
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


pa's,

So I rebooted to test my signal fixes, and I find that I can't boot my
box anymore. It seems that /etc/rcS.d/S10checkroot.sh was no longer
doing it's job of remounting / (LABEL=ROOT) rw. I mean it wasn't as if
it didn't try, the kernel kept saying that I should specify a file
system type.

It's not fun when this happens, because you have to boot some sort of
rescue disk, and hack /etc/rcS.d/S10checkroot.sh!

The following was required to get my box back up... I don't think it's
necc, but nor do I understand what's going on here. Is this part of
those mount/remount changes I saw? :)

I think I might submit this to 'initscripts' as a "robustifying" patch.

c.

--- checkroot.sh	2004-03-30 05:45:38.716100048 -0500
+++ /etc/init.d/checkroot.sh	2004-03-30 00:40:01.000000000 -0500
@@ -181,10 +181,10 @@
 	#
 	# Ensure that root is quiescent and read-only before fsck'ing.
 	#
-	if ! mount -n -o remount,ro $rootdev /
+	if ! mount -t $roottype -n -o remount,ro $rootdev /
 	then
     		echo -n "*** ERROR!  Cannot fsck root fs because it is "
-		echo    "not mounted read-only!"
+		echo    "not mounted read-only! (rootdev=$rootdev)"
 		echo
 		rootcheck=no
 	fi
@@ -262,7 +262,7 @@
 #	
 if [ "$rootdev" != none ] && [ "$roottype" != none ]
 then
-	mount -n -o remount,$rootopts $rootdev /
+	mount -t $roottype -n -o remount,$rootopts $rootdev /
 fi
 
 #
