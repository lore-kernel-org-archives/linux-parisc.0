From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop CONFIG_64BIT usage in userspace exported headers
Date: Mon, 10 Nov 2014 22:04:47 +0100
Message-ID: <20141110210447.GA3451@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The gcc compiler provide the predefined __LP64__ macro. Use that
instead. 

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/bitsperlong.h b/arch/parisc/include/uapi/asm/bitsperlong.h
index 75196b4..ebde3830 100644
--- a/arch/parisc/include/uapi/asm/bitsperlong.h
+++ b/arch/parisc/include/uapi/asm/bitsperlong.h
@@ -1,13 +1,7 @@
 #ifndef __ASM_PARISC_BITSPERLONG_H
 #define __ASM_PARISC_BITSPERLONG_H
 
-/*
- * using CONFIG_* outside of __KERNEL__ is wrong,
- * __LP64__ was also removed from headers, so what
- * is the right approach on parisc?
- *	-arnd
- */
-#if (defined(__KERNEL__) && defined(CONFIG_64BIT)) || defined (__LP64__)
+#if defined (__LP64__)
 #define __BITS_PER_LONG 64
 #define SHIFT_PER_LONG 6
 #else
diff --git a/arch/parisc/include/uapi/asm/msgbuf.h b/arch/parisc/include/uapi/asm/msgbuf.h
index fe88f26..3421389 100644
--- a/arch/parisc/include/uapi/asm/msgbuf.h
+++ b/arch/parisc/include/uapi/asm/msgbuf.h
@@ -1,6 +1,8 @@
 #ifndef _PARISC_MSGBUF_H
 #define _PARISC_MSGBUF_H
 
+#include <asm/bitsperlong.h>
+
 /* 
  * The msqid64_ds structure for parisc architecture, copied from sparc.
  * Note extra padding because this structure is passed back and forth
@@ -13,15 +15,15 @@
 
 struct msqid64_ds {
 	struct ipc64_perm msg_perm;
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int   __pad1;
 #endif
 	__kernel_time_t msg_stime;	/* last msgsnd time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int   __pad2;
 #endif
 	__kernel_time_t msg_rtime;	/* last msgrcv time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int   __pad3;
 #endif
 	__kernel_time_t msg_ctime;	/* last change time */
diff --git a/arch/parisc/include/uapi/asm/sembuf.h b/arch/parisc/include/uapi/asm/sembuf.h
index 1e59ffd..f01d89e 100644
--- a/arch/parisc/include/uapi/asm/sembuf.h
+++ b/arch/parisc/include/uapi/asm/sembuf.h
@@ -1,6 +1,8 @@
 #ifndef _PARISC_SEMBUF_H
 #define _PARISC_SEMBUF_H
 
+#include <asm/bitsperlong.h>
+
 /* 
  * The semid64_ds structure for parisc architecture.
  * Note extra padding because this structure is passed back and forth
@@ -13,11 +15,11 @@
 
 struct semid64_ds {
 	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int	__pad1;
 #endif
 	__kernel_time_t	sem_otime;		/* last semop time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int	__pad2;
 #endif
 	__kernel_time_t	sem_ctime;		/* last change time */
diff --git a/arch/parisc/include/uapi/asm/shmbuf.h b/arch/parisc/include/uapi/asm/shmbuf.h
index 0a3eada..8496c38 100644
--- a/arch/parisc/include/uapi/asm/shmbuf.h
+++ b/arch/parisc/include/uapi/asm/shmbuf.h
@@ -1,6 +1,8 @@
 #ifndef _PARISC_SHMBUF_H
 #define _PARISC_SHMBUF_H
 
+#include <asm/bitsperlong.h>
+
 /* 
  * The shmid64_ds structure for parisc architecture.
  * Note extra padding because this structure is passed back and forth
@@ -13,19 +15,19 @@
 
 struct shmid64_ds {
 	struct ipc64_perm	shm_perm;	/* operation perms */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int		__pad1;
 #endif
 	__kernel_time_t		shm_atime;	/* last attach time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int		__pad2;
 #endif
 	__kernel_time_t		shm_dtime;	/* last detach time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int		__pad3;
 #endif
 	__kernel_time_t		shm_ctime;	/* last change time */
-#ifndef CONFIG_64BIT
+#if __BITS_PER_LONG != 64
 	unsigned int		__pad4;
 #endif
 	size_t			shm_segsz;	/* size of segment (bytes) */
diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index 10df707..e26043b 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -85,7 +85,7 @@
 struct siginfo;
 
 /* Type of a signal handler.  */
-#ifdef CONFIG_64BIT
+#if defined(__LP64__)
 /* function pointers on 64-bit parisc are pointers to little structs and the
  * compiler doesn't support code which changes or tests the address of
  * the function in the little struct.  This is really ugly -PB
