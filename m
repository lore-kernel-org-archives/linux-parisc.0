From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] [PATCH] [HPPA] fix bits/pthreadtypes.h
Date: Tue, 1 May 2007 21:28:27 +0200
Message-ID: <20070501192826.GA4309__36538.2532276728$1416624345$gmane$org@amd64.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
To: parisc-linux@lists.parisc-linux.org,
 libc-ports@sourceware.org
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

Hi all,

On hppa using linuxthreads + TLS, bits/pthreadtypes.h is out of date 
compare to the generic linuxthreads file. This makes pthread.h unusable.

Please find below a patch to fix that.

Bye,
Aurelien

--- libc/ports/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtypes.h	2007-05-01 21:15:38.000000000 +020
+++ libc/ports/sysdeps/unix/sysv/linux/hppa/linuxthreads/bits/pthreadtypes.h	2007-05-01 21:16:03.000000000 +0200
@@ -134,7 +134,7 @@
 } pthread_rwlockattr_t;
 #endif
 
-#ifdef __USE_XOPEN2K
+#if defined __USE_UNIX98 || defined __USE_XOPEN2K
 /* POSIX spinlock data type.  */
 typedef __atomic_lock_t pthread_spinlock_t;
 
-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
