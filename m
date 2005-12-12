From: Keith Owens <kaos@sgi.com>
Subject: [parisc-linux] generic read_trylock() never tries, it always waits
Date: Mon, 12 Dec 2005 15:55:38 +1100
Message-ID: <9942.1134363338__30511.4151481122$1416623952$gmane$org@kao2.melbourne.sgi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-mips@linux-mips.org,
 linux-sh@m17n.org,
 takata@linux-m32r.org,
 davem@davemloft.net,
 lethal@linux-sh.org,
 rmk@arm.linux.org.uk,
 sparclinux@vger.kernel.org,
 linux-arm-kernel@lists.arm.linux.org.uk,
 parisc-linux@lists.parisc-linux.org
To: linux-kernel@vger.kernel.org
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

Copied to assorted architecture maintainers and mailing lists, please
trim cc: list back to lkml plus arch if you reply.

The generic version of read_trylock() never tests if the lock is in
use, it always spins waiting for the lock to be free.  IOW, it behaves
like read_lock().  Given the different implementations of rwlock_t, it
is hard for generic__raw_read_trylock() to do anything else.

I strongly recommend that the architectures below define their own
version of __raw_read_trylock() that really test the lock first, then
we can ditch generic__raw_read_trylock().  I have already sent an ia64
patch to that mailing list.

include/asm-arm/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-ia64/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-m32r/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-mips/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-parisc/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-sh/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)
include/asm-sparc64/spinlock.h:#define __raw_read_trylock(lock) generic__raw_read_trylock(lock)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
