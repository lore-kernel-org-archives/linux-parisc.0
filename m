From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] oldsemaphore fixup for hppa (4/3?)
Date: Fri, 10 Oct 2003 17:04:38 -0400
Message-ID: <20031010210438.GI6454__14862.2069428258$1416622862$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

libc-alpha,

Wrote up the changelogs, reviewed them, and then forgot I had a small
patch to commit for oldsemaphore. This goes in with the first patch 1/3
that defines the generic libc changes required for linuxthreads to work
on HPPA.

Cheers,
Carlos
===

2003-10-10  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* linuxthreads/oldsemaphore.c:	sem_spinlock in struct old_sem_t 
	is an __atomic_lock_t.

--- libc/linuxthreads/oldsemaphore.c	25 May 2001 07:38:39 -0000	1.11
+++ libc/linuxthreads/oldsemaphore.c	21 Apr 2003 23:53:24 -0000
@@ -31,7 +31,7 @@
 
 typedef struct {
     long int sem_status;
-    int sem_spinlock;
+    __atomic_lock_t sem_spinlock;
 } old_sem_t;
 
 extern int __old_sem_init (old_sem_t *__sem, int __pshared, unsigned int __value);
