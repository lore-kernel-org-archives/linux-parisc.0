Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A87C482A
	for <parisc-linux@parisc-linux.org>; Wed,  3 Apr 2002 08:35:51 -0700 (MST)
Received: from ldl.fc.hp.com (linux-bugs.fc.hp.com [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP id 15D96A0092A
	for <parisc-linux@parisc-linux.org>; Wed,  3 Apr 2002 10:35:50 -0500 (EST)
Received: from palinux.fc.hp.com (noam.fc.hp.com [15.1.52.69])
	by ldl.fc.hp.com (Postfix) with ESMTP id C1857453E
	for <parisc-linux@parisc-linux.org>; Wed,  3 Apr 2002 08:35:49 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by palinux.fc.hp.com with esmtp (Exim 3.35 #1 (Debian))
	id 16smnd-0000BK-00
	for <parisc-linux@parisc-linux.org>; Wed, 03 Apr 2002 08:35:49 -0700
To: parisc-linux@parisc-linux.org
In-Reply-To: Your message of "Tue, 02 Apr 2002 19:11:45 +0100."
             <20020402181145.GO18391@sleepie.demon.co.uk>
References: <E16q3vH-000828-00.2002-03-27-03-16-27@mail4.svr.pol.co.uk> <20020402171039.GM18391@sleepie.demon.co.uk> <E16sSNd-0003KJ-00.2002-04-02-18-47-37@mail4.svr.pol.co.uk>  <20020402181145.GO18391@sleepie.demon.co.uk> 
Date: Wed, 03 Apr 2002 08:35:49 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16smnd-0000BK-00@palinux.fc.hp.com>
Subject: [parisc-linux] palo, f0 partition (Re: Network install on 712/80)
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

The f0 partition needs to be able to hold one recovery kernel plus 265k plus
some roundoff -- so minimum size should probably be 8M just to be safe.

f0 is capable of holding both a narrow and a wide kernel plus a ramdisk,
which is how the installer works.  After woody perhaps we can arrange
for the install to put a recovery ramdisk as well as the customary
recovery kernel, into the f0 partition.  For that, 16M is probably
a good size.

	-P
