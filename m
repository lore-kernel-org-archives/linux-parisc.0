Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 840394A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Mar 2001 17:39:05 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA32114;
	Wed, 21 Mar 2001 11:37:11 +1100
Date: Wed, 21 Mar 2001 11:37:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: randolph@tausq.org, "Paul J.Y. Lahaie" <plahaie@linuxcare.com>,
	Richard Hirst <rhirst@linuxcare.com>,
	Jane Vinet <jvinet@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103211008160.25567-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103211101200.25567-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: c++ problem
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Mar 2001, Alan Modra wrote:

> I propose we set up dp in the dynamic linker to avoid this problem, as
> it's quite legal to have a mix of static and dynamic libraries, each
> needing to run constructors.

I think this is all we need.  Compiling it all to test it out...

--- glibc/sysdeps/hppa/dl-machine.h~	Mon Feb 19 14:05:42 2001
+++ glibc/sysdeps/hppa/dl-machine.h	Wed Mar 21 10:45:50 2001
@@ -338,6 +338,10 @@
 	/* Save the entry point in %r3. */
 	copy	%ret0,%r3
 
+	/* Set up dp for any static lib constructors that may be called. */
+	addil	LT'$global$,%r19
+	ldw	RT'$global$(%r1),%dp
+
 	/* Remember the lowest stack address. */
 	addil	LT'__libc_stack_end,%r19
 	ldw	RT'__libc_stack_end(%r1),%r20

Alan
-- 
Linuxcare
