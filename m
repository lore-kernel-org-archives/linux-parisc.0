Return-Path: <arnd@arndb.de>
Received: from natsmtp01.rzone.de (natsmtp01.rzone.de [81.169.145.166])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF0EA4840
	for <parisc-linux@parisc-linux.org>;
	Fri, 23 Jan 2004 08:14:18 -0700 (MST)
Received: from dyn-9-152-210-118.boeblingen.de.ibm.com (blueice1a.de.ibm.com
	[194.196.100.88])
	by post.webmailer.de (8.12.10/8.12.10) with ESMTP id i0NFEGmi022317
	for <parisc-linux@parisc-linux.org>;
	Fri, 23 Jan 2004 16:14:16 +0100 (MET)
From: Arnd Bergmann <arnd@arndb.de>
To: parisc-linux@parisc-linux.org
Date: Fri, 23 Jan 2004 16:09:56 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200401231609.56800.arnd@arndb.de>
Cc: 
Subject: [parisc-linux] missing barrier in _raw_spin_lock?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

We stumbled over a problem on s390 that can cause random memory corruption
under high load on SMP. It turned out to be a missing on :"memory" clobber
on the _raw_spin_lock primitive.

As far as I can see, the same problem is in the parisc spinlock definition
in linux-2.6.1, but none of the other architectures.

The code below demonstrates the problem. With the broken spinlock, the
compiler does not emit code for the second "if" or for the assignment.
Similar code can be found in mempool_free().

	Arnd <><

----
#include <linux/spinlock.h>

static int x;
static spinlock_t lock;

void test(void)
{
        if (x) {
                spin_lock(&lock);
                if (!x)
                        x = 0x1234;
                spin_unlock(&lock);
        }
}
