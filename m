Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD90545E7.dip.t-dialin.net [217.5.69.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 800F0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 17:25:53 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.11.6/8.11.6) id f9GNPXW08910
	for parisc-linux@lists.parisc-linux.org; Wed, 17 Oct 2001 01:25:33 +0200
Date: Wed, 17 Oct 2001 01:25:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011017012533.A8727@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SysV IPC structure mismatches
List-ID: <linux-parisc.vger.kernel.org>

Hi,

while working a getting X running I already found a mismatch between
kernel and glibc structs for SysV shared memory. I thought, that I fixed
that, but I just fixed the needed part for X. Yesterday I tried to find
out why Mozilla just locks up without showing any sign of life. I've
found, that shared mem struct is still broken and semaphores and msg
queue structs are also broken. The kernel structs are aligned the way
they are, because this allows us to use the same structs for 32 and 64bit
kernels (my change to shmbuf.h already has broken 64bit kernels). But
the glibc headers don't match them. I see two ways to solve this:

1. Change the kernel structs to match the current glibc structs

    Works for 32 bit kernel, but we need ugly code for 64 bit
    kernels (we would need to word swap 64bit values)

2. Change the glibc structs and back out my last commit of shmbuf.h

   Would break binary compatibility for applications using SysV IPC
   shmctl (*_STAT) syscalls. But it would avoid any problems with
   64bit kernels and a maybe comming 64 bit userland. And even 32 bit 
   kernel with 64 bit time_t will find a more sane enviroment

As you might guess going the second way, seems to be the right, because
breaking binary compatibilty now, isn't that big issue, because all the
stuff we have right now, is available in source and easy compilable.
This could change, when there are commercial applications for Linux/Parisc.
But right now, we seem to have a problem building a new glibc (why ?),
so doing it immidiatly isn't that easy.

I've attached a patch, which implements the first way, which breaks 64bit 
kernels. With this patch the nspr testsuite passes all the semaphore tests,
which failed without the change. I could commit that patch, but I believe
it's the wrong way.

Thomas.

Index: include/asm-parisc/msgbuf.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/msgbuf.h,v
retrieving revision 1.3
diff -u -r1.3 msgbuf.h
--- include/asm-parisc/msgbuf.h	2001/02/27 00:48:51	1.3
+++ include/asm-parisc/msgbuf.h	2001/10/16 00:24:05
@@ -13,18 +13,18 @@
 
 struct msqid64_ds {
 	struct ipc64_perm msg_perm;
+	__kernel_time_t msg_stime;	/* last msgsnd time */
 #ifndef __LP64__
 	unsigned int   __pad1;
 #endif
-	__kernel_time_t msg_stime;	/* last msgsnd time */
+	__kernel_time_t msg_rtime;	/* last msgrcv time */
 #ifndef __LP64__
 	unsigned int   __pad2;
 #endif
-	__kernel_time_t msg_rtime;	/* last msgrcv time */
+	__kernel_time_t msg_ctime;	/* last change time */
 #ifndef __LP64__
 	unsigned int   __pad3;
 #endif
-	__kernel_time_t msg_ctime;	/* last change time */
 	unsigned int  msg_cbytes;	/* current number of bytes on queue */
 	unsigned int  msg_qnum;	/* number of messages in queue */
 	unsigned int  msg_qbytes;	/* max number of bytes on queue */
Index: include/asm-parisc/sembuf.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/sembuf.h,v
retrieving revision 1.3
diff -u -r1.3 sembuf.h
--- include/asm-parisc/sembuf.h	2001/02/27 00:48:51	1.3
+++ include/asm-parisc/sembuf.h	2001/10/16 00:23:32
@@ -13,14 +13,14 @@
 
 struct semid64_ds {
 	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
+	__kernel_time_t	sem_otime;		/* last semop time */
 #ifndef __LP64__
 	unsigned int	__pad1;
 #endif
-	__kernel_time_t	sem_otime;		/* last semop time */
+	__kernel_time_t	sem_ctime;		/* last change time */
 #ifndef __LP64__
 	unsigned int	__pad2;
 #endif
-	__kernel_time_t	sem_ctime;		/* last change time */
 	unsigned int	sem_nsems;		/* no. of semaphores in array */
 	unsigned int	__unused1;
 	unsigned int	__unused2;
Index: include/asm-parisc/shmbuf.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/shmbuf.h,v
retrieving revision 1.4
diff -u -r1.4 shmbuf.h
--- include/asm-parisc/shmbuf.h	2001/09/29 16:40:09	1.4
+++ include/asm-parisc/shmbuf.h	2001/10/16 00:23:09
@@ -14,18 +14,18 @@
 struct shmid64_ds {
 	struct ipc64_perm	shm_perm;	/* operation perms */
 	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_time_t		shm_atime;	/* last attach time */
 #ifndef __LP64__
 	unsigned int		__pad1;
 #endif
-	__kernel_time_t		shm_atime;	/* last attach time */
+	__kernel_time_t		shm_dtime;	/* last detach time */
 #ifndef __LP64__
 	unsigned int		__pad2;
 #endif
-	__kernel_time_t		shm_dtime;	/* last detach time */
+	__kernel_time_t		shm_ctime;	/* last change time */
 #ifndef __LP64__
 	unsigned int		__pad3;
 #endif
-	__kernel_time_t		shm_ctime;	/* last change time */
 	__kernel_pid_t		shm_cpid;	/* pid of creator */
 	__kernel_pid_t		shm_lpid;	/* pid of last operator */
 	unsigned int		shm_nattch;	/* no. of current attaches */



-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
