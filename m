Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 762B44829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 00:59:05 -0600 (MDT)
Date: Tue, 15 Oct 2002 00:03:36 -0700
From: Randolph Chung <tausq@debian.org>
To: debian-gcc@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021015070336.GJ24881@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] possible gcc-3.2 bug?
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

The following piece of code compiles with gcc-3.0 but not with
gcc-3.2... is this a gcc bug? or is the code broken?

tausq@a500:~$ gcc-3.2 -c t.c
t.c: In function `foo':
t.c:12: initializer element is not constant

(it's a simplified example of some code from the parisc-linux kernel)

---------------------8<-----------------------
/* compile with gcc -c foo.c */

typedef struct {
        volatile unsigned int lock;
} spinlock_t;

typedef struct {
        spinlock_t lock;
        volatile int counter;
} rwlock_t;

void foo(void)
{
        static rwlock_t x = (rwlock_t) { (spinlock_t) { 1 }, 0 };
}
---------------------8<-----------------------

removing the (rwlock_t) cast allows the initializer construct to
compile, but the kernel also uses the construct to assign values
post-initialization to some variables, in which case the cast 
seems to be required.

e.g. kernel/fork.c has something like this:

    struct *fs = /* allocate memory for fs */;
    fs->lock = (rwlock_t) { ... };

thanks,
randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
