Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E1B34843
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 13:01:53 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp.fc.hp.com [15.11.136.119])
	by atlrel7.hp.com (Postfix) with ESMTP id CFD051C0061B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 15:01:52 -0400 (EDT)
In-Reply-To: <E1A2E6S-0005X1-00@lyra.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 24 Sep 2003 13:01:51 -0600 (MDT)
Cc: khalid@hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-Id: <E1A2Etc-0005pD-00@lyra.fc.hp.com>
From: Khalid Aziz <khalid@fc.hp.com>
Subject: [parisc-linux] Re: [PATCH] do_gettimeofday() fails to compensate for lost ticks
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

Turns out the problem is not do_gettimeofday() not accounting for lost
ticks, rather it is do_settimeofday() double compensating for lost
ticks. Here is a patch to fix this problem.

---
Khalid

=========================
--- linux-2.4.22/arch/parisc/kernel/time.c	Thu Nov 28 16:53:10 2002
+++ linux-2.4.22-clock_fix/arch/parisc/kernel/time.c	Wed Sep 24 12:58:36 2003
@@ -191,7 +191,6 @@
 		 * done, and then undo it!
 		 */
 		tv->tv_usec -= gettimeoffset();
-		tv->tv_usec -= (jiffies - wall_jiffies) * (1000000 / HZ);
 
 		while (tv->tv_usec < 0) {
 			tv->tv_usec += 1000000;





> I saw this problem on ia64 and when I checked parisc code, it also seems
> to have the same problem. 
> 
> do_gettimeofday() needs to account for lost ticks before returning
> current time and it fails to do that. do_gettimeofday() on other 
> architectures compensate for lost ticks correctly. Due to this bug, if
> you repeatedly do clock_settime() immediately followed by clock_gettime() 
> and compare the time returned by clock_gettime() to the time set by
> clock_settime(), you will eventually see clock going backwards. I am
> attaching a test program from POSIX testsuite at the end that exposes
> this bug. Run this test in a continuous loop that stops when test fails.
> 
> Following patch should address this issue.
> 
> --
> Khalid
> 
