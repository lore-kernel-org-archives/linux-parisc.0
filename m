From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PARISC] parisc-patch for Linux Test Project
Date: Sat, 06 Jan 2007 21:31:18 +0100
Message-ID: <enp0um$dek$1__40125.1241834418$1416624634$gmane$org@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: ltp-list@lists.sourceforge.net
To: parisc-linux@parisc-linux.org
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

Hello * at The Linux Test Project !
CC: PARISC-Linux development mailing list

the trivial patch below is against the current CVS version of LTP and adds
missing pieces and changes which are necessary for LTP on the PARISC/HPPA
architecture.

The read04.c patch part is a real architecture-independend bugfix. The
read04 tests writes TST_SIZE bytes to a file, reads the same amount of
bytes back again and compares the contents. Naturally, it only should
verify if TST_SIZE bytes (the amount of bytes which where written!)
matches. sizeof() returns the number of bytes including the leading
zero-byte which hasn't been read back.

It would be really nice, if someone could apply this patch to the LTP CVS
sources.

Thanks,
Helge


Index: testcases/kernel/syscalls/read/read04.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/syscalls/read/read04.c,v
retrieving revision 1.5
diff -u -p -r1.5 read04.c
--- testcases/kernel/syscalls/read/read04.c     25 Dec 2006 00:32:54 -0000      1.5
+++ testcases/kernel/syscalls/read/read04.c     6 Jan 2007 20:19:12 -0000
@@ -105,7 +105,7 @@ int main(int ac, char **av)
                                         "expected %d", TEST_RETURN, TST_SIZE);
                                continue;
                        }
-                       if (memcmp(palfa, prbuf, sizeof(palfa)) != 0) {
+                       if (memcmp(palfa, prbuf, TST_SIZE) != 0) {
                                tst_resm(TFAIL, "read buffer not equal "
                                         "to write buffer");
                                continue;
Index: testcases/kernel/mem/shmt/shmt02.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt02.c,v
retrieving revision 1.4
diff -u -p -r1.4 shmt02.c
--- testcases/kernel/mem/shmt/shmt02.c  29 Jul 2003 19:46:14 -0000      1.4
+++ testcases/kernel/mem/shmt/shmt02.c  6 Jan 2007 20:19:12 -0000
@@ -81,7 +81,7 @@ int main()
 
 
                 /* are we doing with ia64 or arm_arch_4t arch */
-#if defined (__ia64__) || defined (__ARM_ARCH_4T__)
+#if defined (__ia64__) || defined (__ARM_ARCH_4T__) || defined(__hppa__)
                 cp = (char *) shmat(shmid, (void *)NULL, 0);
 #else          
                 cp = (char *) shmat(shmid, (void *)0x80000, 0);
Index: testcases/kernel/mem/shmt/shmt04.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt04.c,v
retrieving revision 1.5
diff -u -p -r1.5 shmt04.c
--- testcases/kernel/mem/shmt/shmt04.c  29 Jul 2003 19:46:14 -0000      1.5
+++ testcases/kernel/mem/shmt/shmt04.c  6 Jan 2007 20:19:12 -0000
@@ -107,7 +107,7 @@ if ((shmid = shmget(key, SIZE, IPC_CREAT
 else {
 #ifdef __ia64__
   cp = (char *) shmat(shmid, ADDR1, 0);
-#elif defined(__ARM_ARCH_4T__)
+#elif defined(__ARM_ARCH_4T__) || defined(__hppa__)
   cp = (char *) shmat(shmid, NULL, 0);
 #else
   cp = (char *) shmat(shmid, ADDR, 0);
@@ -185,7 +185,7 @@ else 
 {
 #ifdef __ia64__
   cp = (char *) shmat(shmid, ADDR1, 0);
-#elif defined(__ARM_ARCH_4T__)
+#elif defined(__ARM_ARCH_4T__) || defined(__hppa__)
   cp = (char *) shmat(shmid, NULL, 0);
 #else
   cp = (char *) shmat(shmid, ADDR, 0);
Index: testcases/kernel/mem/shmt/shmt05.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt05.c,v
retrieving revision 1.4
diff -u -p -r1.4 shmt05.c
--- testcases/kernel/mem/shmt/shmt05.c  29 Jul 2003 19:46:14 -0000      1.4
+++ testcases/kernel/mem/shmt/shmt05.c  6 Jan 2007 20:19:12 -0000
@@ -85,7 +85,7 @@ int main()
  } else {
 #ifdef __ia64__ 
   cp = (char *) shmat(shmid, ADDR_IA, 0);
-#elif defined(__ARM_ARCH_4T__)
+#elif defined(__ARM_ARCH_4T__) || defined(__hppa__)
   cp = (char *) shmat(shmid, (void *)NULL, 0);
 #else
   cp = (char *) shmat(shmid, ADDR, 0);
@@ -111,6 +111,8 @@ int main()
    cp1 = (char *) shmat(shmid1, ADDR1_IA, 0);
 #elif defined(__ARM_ARCH_4T__)
    cp1 = (char *) shmat(shmid1, (void *)NULL, 0);
+#elif defined(__hppa__)
+   cp1 = (char *) shmat(shmid1, cp+4096, 0);
 #else
    cp1 = (char *) shmat(shmid1, ADDR1, 0);
 #endif
Index: testcases/kernel/mem/shmt/shmt06.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt06.c,v
retrieving revision 1.6
diff -u -p -r1.6 shmt06.c
--- testcases/kernel/mem/shmt/shmt06.c  14 Jun 2004 19:14:09 -0000      1.6
+++ testcases/kernel/mem/shmt/shmt06.c  6 Jan 2007 20:19:12 -0000
@@ -51,6 +51,8 @@
 #define                ADDR1           (void *)0xA0000
 #define         ADDR_MIPS       (void *)0x80000
 #define         ADDR1_MIPS      (void *)0xC0000
+#define                ADDR_HPPA       (void *)0x10000000
+#define                ADDR1_HPPA      (void *)0x20000000
 #define        ADDR_IA         (void *)0x40000000
 #define        ADDR1_IA        (void *)0x50000000
 #define                SIZE            16*1024
@@ -111,6 +113,8 @@ int main()
                  cp = (char *) shmat(shmid, (void*) NULL, 0);
 #elif defined(__mips__)
                  cp = (char *) shmat(shmid, ADDR_MIPS, 0);
+#elif defined(__hppa__)
+                 cp = (char *) shmat(shmid, ADDR_HPPA, 0);
 #else
                  cp = (char *) shmat(shmid, ADDR, 0);
 #endif 
@@ -187,6 +191,8 @@ int child()
                  cp = (char *) shmat(shmid, (void *) NULL, 0);
 #elif defined(__mips__)        
                  cp = (char *) shmat(shmid, ADDR1_MIPS, 0);
+#elif defined(__hppa__)        
+                 cp = (char *) shmat(shmid, ADDR1_HPPA, 0);
 #else
                  cp = (char *) shmat(shmid, ADDR1, 0);
 #endif
Index: testcases/kernel/mem/shmt/shmt07.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt07.c,v
retrieving revision 1.4
diff -u -p -r1.4 shmt07.c
--- testcases/kernel/mem/shmt/shmt07.c  29 Jul 2003 19:46:14 -0000      1.4
+++ testcases/kernel/mem/shmt/shmt07.c  6 Jan 2007 20:19:12 -0000
@@ -84,7 +84,7 @@ int main()
 
 #ifdef __ia64__        
          cp = (char *) shmat(shmid, ADDR_IA, 0);
-#elif defined(__ARM_ARCH_4T__)
+#elif defined(__ARM_ARCH_4T__) || defined(__hppa__)
          cp = (char *) shmat(shmid, (void *) NULL, 0);
 #else
          cp = (char *) shmat(shmid, ADDR, 0);
Index: testcases/kernel/mem/shmt/shmt09.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/mem/shmt/shmt09.c,v
retrieving revision 1.11
diff -u -p -r1.11 shmt09.c
--- testcases/kernel/mem/shmt/shmt09.c  15 Nov 2006 21:11:43 -0000      1.11
+++ testcases/kernel/mem/shmt/shmt09.c  6 Jan 2007 20:19:12 -0000
@@ -68,7 +68,7 @@ int main()
        char    *c1=NULL, *c2=NULL, *c3=NULL;
        void    *vp;
        int     shmid;
-#if defined(__ia64__) || defined(__mips__)
+#if defined(__ia64__) || defined(__mips__) || defined(__hppa__)
        int     increment;
 #endif
        key_t   key;
@@ -179,7 +179,7 @@ int main()
                        rm_shm(shmid);
                        tst_exit();
        }
-#elif __mips__
+#elif defined(__mips__) || defined(__hppa__)
                increment=262144;        /* 256Kb */
                while ((vp = sbrk(increment)) != (void *)-1);
                if (errno != ENOMEM) {
Index: testcases/kernel/io/direct_io/diotest4.c
===================================================================
RCS file: /cvsroot/ltp/ltp/testcases/kernel/io/direct_io/diotest4.c,v
retrieving revision 1.18
diff -u -p -r1.18 diotest4.c
--- testcases/kernel/io/direct_io/diotest4.c    9 Nov 2006 16:34:11 -0000       1.18
+++ testcases/kernel/io/direct_io/diotest4.c    6 Jan 2007 20:19:12 -0000
@@ -546,6 +546,8 @@ main(int argc, char *argv[])
        else {
 #if defined(__powerpc64__)
                ret = read(fd, (char*)(((ulong *)main)[0] & pagemask), count);
+#elif defined(__hppa__)
+               ret = read(fd, (char*)((ulong)__builtin_return_address(0) & pagemask),
count);
 #else
                ret = read(fd, (char*)((ulong)main & pagemask), count);
 #endif
@@ -563,6 +565,8 @@ main(int argc, char *argv[])
        else {
 #if defined(__powerpc64__)
                ret = write(fd, (char *)(((ulong *)main)[0] & pagemask), count);
+#elif defined(__hppa__)
+               ret = write(fd, (char *)((ulong)__builtin_return_address(0) & pagemask),
count);
 #else
                ret = write(fd, (char *)((ulong)main & pagemask), count);
 #endif
Index: testcases/kernel/include/linux_syscall_numbers.h
===================================================================
RCS
file: /cvsroot/ltp/ltp/testcases/kernel/include/linux_syscall_numbers.h,v
retrieving revision 1.2
diff -u -p -r1.2 linux_syscall_numbers.h
--- testcases/kernel/include/linux_syscall_numbers.h    10 Sep 2006 10:12:01
-0000   1.2
+++ testcases/kernel/include/linux_syscall_numbers.h    6 Jan 2007 20:19:12
-0000
@@ -136,7 +136,7 @@
 #endif
 
 
-#ifdef __parisc__
+#if defined(__hppa__)
 # ifndef __NR_openat
 #  define __NR_openat 275
 # endif
@@ -179,6 +179,15 @@
 # ifndef __NR_faccessat
 #  define __NR_faccessat (__NR_openat + 12)
 # endif
+# ifndef __NR_splice
+#  define __NR_splice 291
+# endif
+# ifndef __NR_tee
+#  define __NR_tee 293
+# endif
+# ifndef __NR_vmsplice
+#  define __NR_vmsplice 294
+# endif
 #endif
 
 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
