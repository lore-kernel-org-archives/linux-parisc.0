Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D850483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 12:12:31 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp.fc.hp.com [15.11.136.119])
	by atlrel6.hp.com (Postfix) with ESMTP id E2D1D1C00B59
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Sep 2003 14:12:30 -0400 (EDT)
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 24 Sep 2003 12:11:04 -0600 (MDT)
Cc: khalid@hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-Id: <E1A2E6S-0005X1-00@lyra.fc.hp.com>
From: Khalid Aziz <khalid@fc.hp.com>
Subject: [parisc-linux] [PATCH] do_gettimeofday() fails to compensate for lost ticks
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

I saw this problem on ia64 and when I checked parisc code, it also seems
to have the same problem. 

do_gettimeofday() needs to account for lost ticks before returning
current time and it fails to do that. do_gettimeofday() on other 
architectures compensate for lost ticks correctly. Due to this bug, if
you repeatedly do clock_settime() immediately followed by clock_gettime() 
and compare the time returned by clock_gettime() to the time set by
clock_settime(), you will eventually see clock going backwards. I am
attaching a test program from POSIX testsuite at the end that exposes
this bug. Run this test in a continuous loop that stops when test fails.

Following patch should address this issue.

--
Khalid


=============================
--- linux-2.4.22/arch/parisc/kernel/time.c	Thu Nov 28 16:53:10 2002
+++ linux-2.4.22-clock_fix/arch/parisc/kernel/time.c	Wed Sep 24 11:25:34 2003
@@ -166,6 +166,7 @@
 	
 		sec = xtime.tv_sec;
 		usec += xtime.tv_usec;
+		usec += (jiffies - wall_jiffies) * (1000000 / HZ);
 	}
 	read_unlock_irqrestore(&xtime_lock, flags);
 

==============================
/*   
 * Copyright (c) 2002, Intel Corporation. All rights reserved.
 * Created by:  julie.n.fleischer REMOVE-THIS AT intel DOT com
 * This file is licensed under the GPL license.  For the full content
 * of this license, see the COPYING file at the top level of this 
 * source tree.

 * Test that clock_settime() sets clock_id to tp.
 *
 * The clock_id chosen for this test is CLOCK_REALTIME.
 * The date chosen is Nov 12, 2002 ~11:13am (date when test was first
 * written).
 */
#include <stdio.h>
#include <time.h>
/*#include "posixtest.h"
#include "helpers.h"*/

#define TESTTIME 1037128358
#define ACCEPTABLEDELTA 1
#define PTS_UNRESOLVED 2
#define PTS_PASS 0
#define PTS_FAIL 1

int getBeforeTime(struct timespec *tpget)
{
	if (clock_gettime(CLOCK_REALTIME, tpget) != 0) {
		perror("clock_gettime() did not return success\n");
		perror("clock may not be reset properly\n");
		return PTS_UNRESOLVED;
	}
	return PTS_PASS;
}

int setBackTime(struct timespec tpset)
{
	if (clock_settime(CLOCK_REALTIME, &tpset) != 0) {
		perror("clock_settime() did not return success\n");
		perror("clock may not be reset properly\n");
		return PTS_UNRESOLVED;
	}
	return PTS_PASS;
}

int main(int argc, char *argv[])
{
	struct timespec tpset, tpget, tpreset;
	int delta;

	getBeforeTime(&tpreset);

	tpset.tv_sec = TESTTIME;
	tpset.tv_nsec = 0;
	if (clock_settime(CLOCK_REALTIME, &tpset) == 0) {
		if (clock_gettime(CLOCK_REALTIME, &tpget) == -1) {
			perror("Error in clock_gettime()");
			return 2;
		}
		delta = tpget.tv_sec-tpset.tv_sec;
		if ( (delta <= ACCEPTABLEDELTA) && (delta >= 0) ) {
			printf("Test PASSED\n");
			setBackTime(tpreset);
			return 0;
		} else {
			printf("delta = %d, tpget=%d,%d, tpset=%d,%d\n", delta, tpget.tv_sec, tpget.tv_nsec, tpset.tv_sec, tpset.tv_nsec);
			printf("clock does not appear to be set\n");
			setBackTime(tpreset);
			return 1;
		}
	} else {
		printf("clock_settime() failed\n");
		return 2;
	}

	printf("This code should not be executed.\n");
	return 2;
}
