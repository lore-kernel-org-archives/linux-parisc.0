Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E68448A1
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 15:17:37 -0600 (MDT)
Date: Thu, 25 Sep 2003 17:15:09 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha <libc-alpha@sources.redhat.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030925211509.GY14406@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [RFC] Where to put arch-dependant locking in malloc/thread-m.h
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

libc,

Found the problem with bug-iconv3, it was related to the fact that
hppa's locks can't be initialized to zero (or left unitialized). When
running a non-threaded application and dlopening libpthread the
__libc_maybe_call2's start using the proper strong symbol of those
funcions. At this point malloc on hppa would in certain occassions
fget stuck in a lock that it thought was taken (value of zero).

The following patch fixes the issue, but I'm not content about it's
placement in malloc/thread-m.h. Any comments about where I might put
this in order to make maintenance easier?

Cheers,
Carlos.

diff -u -p -r1.23 thread-m.h
--- glibc/malloc/thread-m.h	1 Jul 2003 08:29:43 -0000	1.23
+++ glibc/malloc/thread-m.h	25 Sep 2003 20:43:55 -0000
@@ -59,6 +59,28 @@ __libc_lock_define (typedef, mutex_t)
 #define mutex_unlock(m)		\
   __libc_maybe_call2 (pthread_mutex_unlock, (m), (*(int *)(m) = 0))
 
+# if(defined __hppa__)
+/* Since our lock structure does not tolerate being initialized to zero, we must
+   modify the standard function calls made by malloc */
+#  undef mutex_init
+#  undef mutex_lock
+#  undef mutex_trylock
+#  undef mutex_unlock
+#  define mutex_init(m)		\
+	__libc_maybe_call (__pthread_mutex_init, (m, NULL), \
+			(((m)->__m_lock.__spinlock = __LT_SPINLOCK_INIT),(*(int *)(m))) )
+#  define mutex_lock(m)		\
+	__libc_maybe_call (__pthread_mutex_lock, (m), \
+			(__load_and_clear(&((m)->__m_lock.__spinlock)), 0))
+#  define mutex_trylock(m)	\
+	__libc_maybe_call (__pthread_mutex_trylock, (m), \
+			(*(int *)(m) ? 1 : (__load_and_clear(&((m)->__m_lock.__spinlock)), 0)))
+#  define mutex_unlock(m)	\
+	__libc_maybe_call (__pthread_mutex_unlock, (m), \
+			(((m)->__m_lock.__spinlock = __LT_SPINLOCK_INIT), (*(int *)(m))) )
+# endif 
+/* if(defined __hppa__) */
+	
 #else
 
 #define mutex_init(m)		\
