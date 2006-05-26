From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Close to mainline for hppa-linux TLS.
Date: Fri, 26 May 2006 10:29:45 -0400
Message-ID: <119aab440605260729m1fad24ccta84a2ada06c82c7a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_27885_23555842.1148653785481"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 randolph <randolph@tausq.org>
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

------=_Part_27885_23555842.1148653785481
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Randolph,

This email documents our current TLS status. It does not document our
NPTL status.

- All gcc changes are in mainline.
- All binutils changes are in mainline.
- The following libc patch is from my local tree.
- The following linuxthreads patch if from my local tree.
- The following libc-ports patch is from my local tree.

To build a TLS enabled linuxhtreads:

1. Use any gcc with TLS patches.
2. Use mainline binutils.
3. Checkout libc, apply libc patch.
4. Checkout linuxthreads, apply linuxthreads patch.
5. Checkout libc-ports, apply libc-ports patch.
6. Move libc-ports to libc/ports/
7. Move linuxthreads to libc/linuxthreads-head/
8. cd libc/; mkdir linuxhtreads; cd linuxthreads;
    lndir ../linuxthreads-head/linuxthreads ".";
    cd ..; mkdir linuxthreads_db; cd linuxthreads_db;
    lndir ../linuxthreads-head/linuxthreads_db ".";
    After this you should have two shadow directories
    for linuxhtreads and linuxthreads_db.
9. Configure libc with:
    --target=3Dhppa-linux
    --host=3Dhppa-linux
    --build=3Dhpp-linux
    --disable-sanity-checks
    --prefix=3D<Your choice>
    --enable-add-ons=3Dports,linuxthreads
10. make.
11. make -k check

Observe failures :)

Cheers,
Carlos.

------=_Part_27885_23555842.1148653785481
Content-Type: text/x-patch; name=patch-libc-ports-2006-05-26.diff;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_enomisum
Content-Disposition: attachment; filename="patch-libc-ports-2006-05-26.diff"

Index: sysdeps/unix/sysv/linux/hppa/Versions
===================================================================
RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/Versions,v
retrieving revision 1.2
diff -u -p -r1.2 Versions
--- sysdeps/unix/sysv/linux/hppa/Versions	28 Aug 2002 23:55:01 -0000	1.2
+++ sysdeps/unix/sysv/linux/hppa/Versions	26 May 2006 14:12:18 -0000
@@ -16,6 +16,9 @@ libc {
     #errlist-compat	254
     _sys_errlist; sys_errlist; _sys_nerr; sys_nerr;
   }
+  GLIBC_2.4 {
+    #errlist-compat	256
+    sys_errlist;
 }
 librt {
   GLIBC_2.3 {






------=_Part_27885_23555842.1148653785481
Content-Type: text/x-patch; name=patch-libc-2006-05-26.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_enomkgks
Content-Disposition: attachment; filename="patch-libc-2006-05-26.diff"

? linuxthreads
? linuxthreads-head
? linuxthreads_db
? ports
Index: elf/elf.h
===================================================================
RCS file: /cvs/glibc/libc/elf/elf.h,v
retrieving revision 1.154
diff -u -p -r1.154 elf.h
--- elf/elf.h	25 Feb 2006 01:57:44 -0000	1.154
+++ elf/elf.h	26 May 2006 14:12:49 -0000
@@ -1704,6 +1704,8 @@ typedef Elf32_Addr Elf32_Conflict;
 #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
 #define R_PARISC_FPTR64		64	/* 64 bits function address.  */
 #define R_PARISC_PLABEL32	65	/* 32 bits function address.  */
+#define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address */
+#define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address */
 #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
 #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
 #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
@@ -1764,6 +1766,29 @@ typedef Elf32_Addr Elf32_Conflict;
 #define R_PARISC_LTOFF_TP16F	229	/* 16 bits LT-TP-rel. address.  */
 #define R_PARISC_LTOFF_TP16WF	230	/* 16 bits LT-TP-rel. address.  */
 #define R_PARISC_LTOFF_TP16DF	231	/* 16 bits LT-TP-rel. address.  */
+
+#define R_PARISC_GNU_VTENTRY    232
+#define R_PARISC_GNU_VTINHERIT  233
+#define R_PARISC_TLS_GD21L      234	/* GD 21-bit left */
+#define R_PARISC_TLS_GD14R      235	/* GD 14-bit right */
+#define R_PARISC_TLS_GDCALL     236	/* GD call to __t_g_a */
+#define R_PARISC_TLS_LDM21L     237	/* LD module 21-bit left */
+#define R_PARISC_TLS_LDM14R     238	/* LD module 14-bit right */
+#define R_PARISC_TLS_LDMCALL    239	/* LD module call to __t_g_a */
+#define R_PARISC_TLS_LDO21L     240	/* LD offset 21-bit left */
+#define R_PARISC_TLS_LDO14R     241	/* LD offset 14-bit right */
+#define R_PARISC_TLS_DTPMOD32   242	/* DTP module 32-bit */
+#define R_PARISC_TLS_DTPMOD64   243	/* DTP module 64-bit */
+#define R_PARISC_TLS_DTPOFF32   244	/* DTP offset 32-bit */
+#define R_PARISC_TLS_DTPOFF64   245	/* DTP offset 32-bit */
+
+#define R_PARISC_TLS_LE21L      R_PARISC_TPREL21L
+#define R_PARISC_TLS_LE14R      R_PARISC_TPREL14R
+#define R_PARISC_TLS_IE21L      R_PARISC_LTOFF_TP21L
+#define R_PARISC_TLS_IE14R      R_PARISC_LTOFF_TP14R
+#define R_PARISC_TLS_TPREL32    R_PARISC_TPREL32
+#define R_PARISC_TLS_TPREL64    R_PARISC_TPREL64
+
 #define R_PARISC_HIRESERVE	255
 
 /* Legal values for p_type field of Elf32_Phdr/Elf64_Phdr.  */
Index: elf/rtld.c
===================================================================
RCS file: /cvs/glibc/libc/elf/rtld.c,v
retrieving revision 1.362
diff -u -p -r1.362 rtld.c
--- elf/rtld.c	8 Apr 2006 19:50:51 -0000	1.362
+++ elf/rtld.c	26 May 2006 14:12:50 -0000
@@ -380,14 +380,14 @@ _dl_start (void *arg)
      know it is available.  We do not have to clear the memory if we
      do not have to use the temporary bootstrap_map.  Global variables
      are initialized to zero by default.  */
-#ifndef DONT_USE_BOOTSTRAP_MAP
+#if !defined DONT_USE_BOOTSTRAP_MAP
 # ifdef HAVE_BUILTIN_MEMSET
   __builtin_memset (bootstrap_map.l_info, '\0', sizeof (bootstrap_map.l_info));
 # else
-  for (size_t cnt = 0;
-       cnt < sizeof (bootstrap_map.l_info) / sizeof (bootstrap_map.l_info[0]);
-       ++cnt)
-    bootstrap_map.l_info[cnt] = 0;
+  /* Clear the whole bootstrap_map structure */
+  for (char *cnt = (char *)&(bootstrap_map);
+       cnt < ((char *)&(bootstrap_map) + sizeof (bootstrap_map));
+       *cnt++ = '\0');
 # endif
 #endif
 
Index: elf/tst-auditmod1.c
===================================================================
RCS file: /cvs/glibc/libc/elf/tst-auditmod1.c,v
retrieving revision 1.13
diff -u -p -r1.13 tst-auditmod1.c
--- elf/tst-auditmod1.c	5 Oct 2005 18:57:00 -0000	1.13
+++ elf/tst-auditmod1.c	26 May 2006 14:12:50 -0000
@@ -162,6 +162,12 @@ la_symbind64 (Elf64_Sym *sym, unsigned i
 # define La_regs La_ia64_regs
 # define La_retval La_ia64_retval
 # define int_retval lrv_r8
+#elif defined __hppa__
+# define pltenter la_hppa_gnu_pltenter
+# define pltexit la_hppa_gnu_pltexit
+# define La_regs La_hppa_regs
+# define La_retval La_hppa_retval
+# define int_retval lrv_r28
 #elif defined __mips__ && _MIPS_SIM == _ABIO32
 # define pltenter la_mips_o32_gnu_pltenter
 # define pltexit la_mips_o32_gnu_pltexit
Index: nptl/sysdeps/pthread/configure
===================================================================
RCS file: /cvs/glibc/libc/nptl/sysdeps/pthread/configure,v
retrieving revision 1.10
diff -u -p -r1.10 configure
--- nptl/sysdeps/pthread/configure	3 Dec 2003 06:50:01 -0000	1.10
+++ nptl/sysdeps/pthread/configure	26 May 2006 14:12:50 -0000
@@ -56,8 +56,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
   cat conftest.err >&5
   echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
+	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
   (eval $ac_try) 2>&5
   ac_status=$?
@@ -121,8 +120,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
   cat conftest.err >&5
   echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
+	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
   (eval $ac_try) 2>&5
   ac_status=$?
Index: nptl/sysdeps/pthread/pthread.h
===================================================================
RCS file: /cvs/glibc/libc/nptl/sysdeps/pthread/pthread.h,v
retrieving revision 1.41
diff -u -p -r1.41 pthread.h
--- nptl/sysdeps/pthread/pthread.h	5 Apr 2006 20:30:13 -0000	1.41
+++ nptl/sysdeps/pthread/pthread.h	26 May 2006 14:12:50 -0000
@@ -221,7 +221,7 @@ __BEGIN_DECLS
 extern int pthread_create (pthread_t *__restrict __newthread,
 			   __const pthread_attr_t *__restrict __attr,
 			   void *(*__start_routine) (void *),
-			   void *__restrict __arg) __THROW __nonnull ((1, 3));
+			   void *(__restrict __arg) __THROW __nonnull ((1, 3));
 
 /* Terminate calling thread.
 
Index: sysdeps/unix/sysv/linux/getcwd.c
===================================================================
RCS file: /cvs/glibc/libc/sysdeps/unix/sysv/linux/getcwd.c,v
retrieving revision 1.24
diff -u -p -r1.24 getcwd.c
--- sysdeps/unix/sysv/linux/getcwd.c	2 Apr 2006 17:58:28 -0000	1.24
+++ sysdeps/unix/sysv/linux/getcwd.c	26 May 2006 14:12:51 -0000
@@ -31,6 +31,9 @@
 
 #include <kernel-features.h>
 
+#ifndef MAX
+# define MAX(a, b) ((a) < (b) ? (b) : (a))
+#endif
 
 /* If we compile the file for use in ld.so we don't need the feature
    that getcwd() allocates the buffers itself.  */
Index: sysdeps/unix/sysv/linux/posix_fadvise.c
===================================================================
RCS file: /cvs/glibc/libc/sysdeps/unix/sysv/linux/posix_fadvise.c,v
retrieving revision 1.3
diff -u -p -r1.3 posix_fadvise.c
--- sysdeps/unix/sysv/linux/posix_fadvise.c	17 Aug 2003 00:36:22 -0000	1.3
+++ sysdeps/unix/sysv/linux/posix_fadvise.c	26 May 2006 14:12:51 -0000
@@ -35,6 +35,19 @@ posix_fadvise (int fd, off_t offset, off
     return INTERNAL_SYSCALL_ERRNO (ret, err);
   return 0;
 #else
+# ifdef __NR_fadvise64_64
+  INTERNAL_SYSCALL_DECL (err);  
+  int ret = INTERNAL_SYSCALL (fadvise64_64, err, 6, fd,
+			      __LONG_LONG_PAIR ((long) (offset >> 31),
+						(long) offset),
+			      __LONG_LONG_PAIR ((long) (len >> 31),
+						(long) len),
+			      advise);
+  if (INTERNAL_SYSCALL_ERROR_P (ret, err))
+    return INTERNAL_SYSCALL_ERRNO (ret, err);
+  return 0;
+# else
   return ENOSYS;
+# endif
 #endif
 }






------=_Part_27885_23555842.1148653785481
Content-Type: text/x-patch; name=patch-linuxthreads-2006-05-26.diff;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_enomklax
Content-Disposition: attachment; filename="patch-linuxthreads-2006-05-26.diff"

Index: linuxthreads/descr.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/descr.h,v
retrieving revision 1.17
diff -u -p -r1.17 descr.h
--- linuxthreads/descr.h	26 Apr 2006 15:04:12 -0000	1.17
+++ linuxthreads/descr.h	26 May 2006 14:13:31 -0000
@@ -71,7 +71,7 @@ typedef struct _pthread_extricate_struct
 /* Atomic counter made possible by compare_and_swap */
 struct pthread_atomic {
   long p_count;
-  int p_spinlock;
+  __atomic_lock_t p_spinlock;
 };
 
 
Index: linuxthreads/manager.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/manager.c,v
retrieving revision 1.100
diff -u -p -r1.100 manager.c
--- linuxthreads/manager.c	1 May 2006 17:24:15 -0000	1.100
+++ linuxthreads/manager.c	26 May 2006 14:13:31 -0000
@@ -894,10 +894,11 @@ static void pthread_free(pthread_descr t
 #ifdef _STACK_GROWS_UP
 # ifdef USE_TLS
       size_t stacksize = guardaddr - th->p_stackaddr;
+      guardaddr = th->p_stackaddr;
 # else
       size_t stacksize = guardaddr - (char *)th;
-# endif
       guardaddr = (char *)th;
+# endif
 #else
       /* Guardaddr is always set, even if guardsize is 0.  This allows
 	 us to compute everything else.  */
Index: linuxthreads/oldsemaphore.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/oldsemaphore.c,v
retrieving revision 1.12
diff -u -p -r1.12 oldsemaphore.c
--- linuxthreads/oldsemaphore.c	20 Apr 2004 18:53:44 -0000	1.12
+++ linuxthreads/oldsemaphore.c	26 May 2006 14:13:31 -0000
@@ -31,7 +31,7 @@
 
 typedef struct {
     long int sem_status;
-    int sem_spinlock;
+    __atomic_lock_t sem_spinlock;
 } old_sem_t;
 
 extern int __old_sem_init (old_sem_t *__sem, int __pshared, unsigned int __value);
Index: linuxthreads/pt-machine.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/pt-machine.c,v
retrieving revision 1.3
diff -u -p -r1.3 pt-machine.c
--- linuxthreads/pt-machine.c	26 Aug 2002 22:39:45 -0000	1.3
+++ linuxthreads/pt-machine.c	26 May 2006 14:13:31 -0000
@@ -19,7 +19,9 @@
 
 #define PT_EI
 
-extern long int testandset (int *spinlock);
+#include <pthread.h>
+
+extern long int testandset (__atomic_lock_t *spinlock);
 extern int __compare_and_swap (long int *p, long int oldval, long int newval);
 
 #include <pt-machine.h>
Index: linuxthreads/pthread.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/pthread.c,v
retrieving revision 1.139
diff -u -p -r1.139 pthread.c
--- linuxthreads/pthread.c	1 May 2006 17:24:15 -0000	1.139
+++ linuxthreads/pthread.c	26 May 2006 14:13:31 -0000
@@ -301,7 +301,7 @@ __pthread_initialize_minimal(void)
   pthread_descr self;
 
   /* First of all init __pthread_handles[0] and [1] if needed.  */
-# if __LT_SPINLOCK_INIT != 0
+# ifdef __LT_INITIALIZER_NOT_ZERO
   __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
   __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
 # endif
@@ -371,7 +371,7 @@ cannot allocate TLS data structures for 
 # endif
   /* self->p_start_args need not be initialized, it's all zero.  */
   self->p_userstack = 1;
-# if __LT_SPINLOCK_INIT != 0
+# ifdef __LT_INITIALIZER_NOT_ZERO 
   self->p_resume_count = (struct pthread_atomic) __ATOMIC_INITIALIZER;
 # endif
   self->p_alloca_cutoff = __MAX_ALLOCA_CUTOFF;
@@ -385,7 +385,7 @@ cannot allocate TLS data structures for 
 #else  /* USE_TLS */
 
   /* First of all init __pthread_handles[0] and [1].  */
-# if __LT_SPINLOCK_INIT != 0
+# ifdef __LT_INITIALIZER_NOT_ZERO
   __pthread_handles[0].h_lock = __LOCK_INITIALIZER;
   __pthread_handles[1].h_lock = __LOCK_INITIALIZER;
 # endif
@@ -688,8 +688,8 @@ int __pthread_initialize_manager(void)
 # endif
   mgr->p_start_args = (struct pthread_start_args) PTHREAD_START_ARGS_INITIALIZER(__pthread_manager);
   mgr->p_nr = 1;
-# if __LT_SPINLOCK_INIT != 0
-  self->p_resume_count = (struct pthread_atomic) __ATOMIC_INITIALIZER;
+# ifdef __LT_INITIALIZER_NOT_ZERO
+  mgr->p_resume_count = (struct pthread_atomic) __ATOMIC_INITIALIZER;
 # endif
   mgr->p_alloca_cutoff = PTHREAD_STACK_MIN / 4;
 #else
@@ -930,7 +930,7 @@ pthread_descr __pthread_self_stack(void)
 # ifdef USE_TLS
 #  ifdef _STACK_GROWS_UP
   while (h->h_descr == NULL
-	 || ! (sp >= h->h_descr->p_stackaddr && sp < h->h_descr->p_guardaddr))
+	 || ! (sp >= (char *) h->h_descr->p_stackaddr && sp < (char *) h->h_descr->p_guardaddr))
     h++;
 #  else
   while (h->h_descr == NULL
Index: linuxthreads/spinlock.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/spinlock.c,v
retrieving revision 1.39
diff -u -p -r1.39 spinlock.c
--- linuxthreads/spinlock.c	2 Mar 2006 22:23:49 -0000	1.39
+++ linuxthreads/spinlock.c	26 May 2006 14:13:31 -0000
@@ -24,9 +24,9 @@
 #include "spinlock.h"
 #include "restart.h"
 
-static void __pthread_acquire(int * spinlock);
+static void __pthread_acquire(__atomic_lock_t * spinlock);
 
-static inline void __pthread_release(int * spinlock)
+static inline void __pthread_release(__atomic_lock_t * spinlock)
 {
   WRITE_MEMORY_BARRIER();
   *spinlock = __LT_SPINLOCK_INIT;
@@ -56,6 +56,9 @@ static inline void __pthread_release(int
    This is safe because there are no concurrent __pthread_unlock
    operations -- only the thread that locked the mutex can unlock it. */
 
+#if defined HAS_COMPARE_AND_SWAP
+#error hppa does not have CAS available in general for spinlocks.
+#endif
 
 void internal_function __pthread_lock(struct _pthread_fastlock * lock,
 				      pthread_descr self)
@@ -103,9 +106,9 @@ void internal_function __pthread_lock(st
 	  return;
 	}
       }
-#ifdef BUSY_WAIT_NOP
+# ifdef BUSY_WAIT_NOP
       BUSY_WAIT_NOP;
-#endif
+# endif
       __asm __volatile ("" : "=m" (lock->__status) : "m" (lock->__status));
     }
 
@@ -269,11 +272,11 @@ again:
 struct wait_node {
   struct wait_node *next;	/* Next node in null terminated linked list */
   pthread_descr thr;		/* The thread waiting with this node */
-  int abandoned;		/* Atomic flag */
+  __atomic_lock_t abandoned;	/* Atomic flag */
 };
 
 static long wait_node_free_list;
-static int wait_node_free_list_spinlock;
+__pthread_lock_define_initialized(static, wait_node_free_list_spinlock);
 
 /* Allocate a new node from the head of the free list using an atomic
    operation, or else using malloc if that list is empty.  A fundamental
@@ -376,7 +379,7 @@ void __pthread_alt_lock(struct _pthread_
       if (self == NULL)
 	self = thread_self();
 
-      wait_node.abandoned = 0;
+      wait_node.abandoned = __LT_SPINLOCK_INIT;
       wait_node.next = (struct wait_node *) lock->__status;
       wait_node.thr = self;
       lock->__status = (long) &wait_node;
@@ -402,7 +405,7 @@ void __pthread_alt_lock(struct _pthread_
       wait_node.thr = self;
       newstatus = (long) &wait_node;
     }
-    wait_node.abandoned = 0;
+    wait_node.abandoned = __LT_SPINLOCK_INIT;
     wait_node.next = (struct wait_node *) oldstatus;
     /* Make sure the store in wait_node.next completes before performing
        the compare-and-swap */
@@ -451,7 +454,7 @@ int __pthread_alt_timedlock(struct _pthr
       if (self == NULL)
 	self = thread_self();
 
-      p_wait_node->abandoned = 0;
+      p_wait_node->abandoned = __LT_SPINLOCK_INIT;
       p_wait_node->next = (struct wait_node *) lock->__status;
       p_wait_node->thr = self;
       lock->__status = (long) p_wait_node;
@@ -474,7 +477,7 @@ int __pthread_alt_timedlock(struct _pthr
       p_wait_node->thr = self;
       newstatus = (long) p_wait_node;
     }
-    p_wait_node->abandoned = 0;
+    p_wait_node->abandoned = __LT_SPINLOCK_INIT;
     p_wait_node->next = (struct wait_node *) oldstatus;
     /* Make sure the store in wait_node.next completes before performing
        the compare-and-swap */
@@ -574,7 +577,7 @@ void __pthread_alt_unlock(struct _pthrea
     while (p_node != (struct wait_node *) 1) {
       int prio;
 
-      if (p_node->abandoned) {
+      if (lock_held(&p_node->abandoned)) {
 	/* Remove abandoned node. */
 #if defined TEST_FOR_COMPARE_AND_SWAP
 	if (!__pthread_has_cas)
@@ -674,7 +677,7 @@ int __pthread_has_cas = 0;
 #if !defined HAS_COMPARE_AND_SWAP || defined TEST_FOR_COMPARE_AND_SWAP
 
 int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                               int * spinlock)
+                               __atomic_lock_t * spinlock)
 {
   int res;
 
@@ -711,7 +714,7 @@ int __pthread_compare_and_swap(long * pt
    - When nanosleep() returns, we try again, doing MAX_SPIN_COUNT
      sched_yield(), then sleeping again if needed. */
 
-static void __pthread_acquire(int * spinlock)
+static void __pthread_acquire(__atomic_lock_t * spinlock)	
 {
   int cnt = 0;
   struct timespec tm;
Index: linuxthreads/spinlock.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/spinlock.h,v
retrieving revision 1.24
diff -u -p -r1.24 spinlock.h
--- linuxthreads/spinlock.h	31 Jul 2003 19:16:04 -0000	1.24
+++ linuxthreads/spinlock.h	26 May 2006 14:13:31 -0000
@@ -33,14 +33,28 @@
 #endif
 #endif
 
+/* Define lock_held for all arches that don't need a modified copy. */
+#ifndef __LT_INITIALIZER_NOT_ZERO
+# define lock_held(p) *(p)
+#endif
+
+/* Initliazers for possibly complex structures */
+#ifdef __LT_INITIALIZER_NOT_ZERO
+# define __pthread_lock_define_initialized(CLASS,NAME) \
+	CLASS __atomic_lock_t NAME = __LT_SPINLOCK_ALT_INIT
+#else
+# define __pthread_lock_define_initialized(CLASS,NAME) \
+	CLASS __atomic_lock_t NAME
+#endif
+
 #if defined(TEST_FOR_COMPARE_AND_SWAP)
 
 extern int __pthread_has_cas;
 extern int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                                      int * spinlock);
+                                      __atomic_lock_t * spinlock);
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   if (__builtin_expect (__pthread_has_cas, 1))
     return __compare_and_swap(ptr, oldval, newval);
@@ -58,7 +72,7 @@ static inline int compare_and_swap(long 
 
 static inline int
 compare_and_swap_with_release_semantics (long * ptr, long oldval,
-					 long newval, int * spinlock)
+					 long newval, __atomic_lock_t * spinlock)
 {
   return __compare_and_swap_with_release_semantics (ptr, oldval,
 						    newval);
@@ -67,7 +81,7 @@ compare_and_swap_with_release_semantics 
 #endif
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   return __compare_and_swap(ptr, oldval, newval);
 }
@@ -75,10 +89,10 @@ static inline int compare_and_swap(long 
 #else
 
 extern int __pthread_compare_and_swap(long * ptr, long oldval, long newval,
-                                      int * spinlock);
+                                      __atomic_lock_t * spinlock);
 
 static inline int compare_and_swap(long * ptr, long oldval, long newval,
-                                   int * spinlock)
+                                   __atomic_lock_t * spinlock)
 {
   return __pthread_compare_and_swap(ptr, oldval, newval, spinlock);
 }
Index: linuxthreads/tst-clock1.c
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/tst-clock1.c,v
retrieving revision 1.2
diff -u -p -r1.2 tst-clock1.c
--- linuxthreads/tst-clock1.c	10 Dec 2004 00:37:46 -0000	1.2
+++ linuxthreads/tst-clock1.c	26 May 2006 14:13:31 -0000
@@ -53,8 +53,9 @@ tf (void *arg)
 
 
 int
-do_test (void)
+main (void)
 {
+  int err = 1;
 #if defined _POSIX_THREAD_CPUTIME && _POSIX_THREAD_CPUTIME >= 0
 # define N 10
 
@@ -137,10 +138,11 @@ do_test (void)
     }
 
   struct timespec t[N + 1];
+  int ret;
   for (i = 0; i < N + 1; ++i)
-    if (clock_gettime (cl[i], &t[i]) != 0)
+    if ((ret = clock_gettime (cl[i], &t[i])) != 0)
       {
-	printf ("clock_gettime round %d failed\n", i);
+	printf ("clock_gettime round %d failed with %d\n", i, ret);
 	return 1;
       }
 
@@ -152,6 +154,7 @@ do_test (void)
       diff.tv_nsec = t[i].tv_nsec - t[i + 1].tv_nsec;
       if (diff.tv_nsec < 0)
 	{
+	  printf ("Adjusting.\n");
 	  diff.tv_nsec += 1000000000;
 	  --diff.tv_sec;
 	}
@@ -161,7 +164,7 @@ do_test (void)
 	  printf ("\
 difference between thread %d and %d too small (%ld.%09ld)\n",
 		  i, i + 1, (long int) diff.tv_sec, (long int) diff.tv_nsec);
-	  return 1;
+	  err |= 1;
 	}
 
       printf ("diff %d->%d: %ld.%09ld\n",
@@ -194,9 +197,7 @@ difference between thread %d and %d too 
     }
 #endif
 
-  return 0;
+  return err;
 }
 
 
-#define TEST_FUNCTION do_test ()
-#include "../test-skeleton.c"
Index: linuxthreads/sysdeps/pthread/pthread.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/sysdeps/pthread/pthread.h,v
retrieving revision 1.42
diff -u -p -r1.42 pthread.h
--- linuxthreads/sysdeps/pthread/pthread.h	20 Sep 2004 22:12:11 -0000	1.42
+++ linuxthreads/sysdeps/pthread/pthread.h	26 May 2006 14:13:32 -0000
@@ -31,26 +31,26 @@ __BEGIN_DECLS
 /* Initializers.  */
 
 #define PTHREAD_MUTEX_INITIALIZER \
-  {0, 0, 0, PTHREAD_MUTEX_TIMED_NP, __LOCK_INITIALIZER}
+  {0, 0, 0, PTHREAD_MUTEX_TIMED_NP, __LOCK_ALT_INITIALIZER}
 #ifdef __USE_GNU
 # define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
-  {0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __LOCK_INITIALIZER}
+  {0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __LOCK_ALT_INITIALIZER}
 # define PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP \
-  {0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __LOCK_INITIALIZER}
+  {0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __LOCK_ALT_INITIALIZER}
 # define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP \
-  {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
+  {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_ALT_INITIALIZER}
 #endif
 
-#define PTHREAD_COND_INITIALIZER {__LOCK_INITIALIZER, 0, "", 0}
+#define PTHREAD_COND_INITIALIZER {__LOCK_ALT_INITIALIZER, 0, "", 0}
 
 #if defined __USE_UNIX98 || defined __USE_XOPEN2K
 # define PTHREAD_RWLOCK_INITIALIZER \
-  { __LOCK_INITIALIZER, 0, NULL, NULL, NULL,				      \
+  { __LOCK_ALT_INITIALIZER, 0, NULL, NULL, NULL,			      \
     PTHREAD_RWLOCK_DEFAULT_NP, PTHREAD_PROCESS_PRIVATE }
 #endif
 #ifdef __USE_GNU
 # define PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP \
-  { __LOCK_INITIALIZER, 0, NULL, NULL, NULL,				      \
+  { __LOCK_ALT_INITIALIZER, 0, NULL, NULL, NULL,			      \
     PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP, PTHREAD_PROCESS_PRIVATE }
 #endif
 
Index: linuxthreads/sysdeps/pthread/bits/initspin.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/sysdeps/pthread/bits/initspin.h,v
retrieving revision 1.3
diff -u -p -r1.3 initspin.h
--- linuxthreads/sysdeps/pthread/bits/initspin.h	26 Aug 2002 22:39:44 -0000	1.3
+++ linuxthreads/sysdeps/pthread/bits/initspin.h	26 May 2006 14:13:32 -0000
@@ -23,6 +23,7 @@
 #define __LT_SPINLOCK_INIT 0
 
 /* Macros for lock initializers, using the above definition. */
-#define __LOCK_INITIALIZER { 0, __LT_SPINLOCK_INIT }
+#define __LOCK_INITIALIZER ((struct _pthread_fastlock){ 0, __LT_SPINLOCK_INIT })
+#define __LOCK_ALT_INITIALIZER { 0, __LT_SPINLOCK_INIT }
 #define __ALT_LOCK_INITIALIZER { 0, __LT_SPINLOCK_INIT }
 #define __ATOMIC_INITIALIZER { 0, __LT_SPINLOCK_INIT }
Index: linuxthreads/sysdeps/pthread/bits/libc-lock.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/sysdeps/pthread/bits/libc-lock.h,v
retrieving revision 1.33
diff -u -p -r1.33 libc-lock.h
--- linuxthreads/sysdeps/pthread/bits/libc-lock.h	6 Jan 2006 09:55:46 -0000	1.33
+++ linuxthreads/sysdeps/pthread/bits/libc-lock.h	26 May 2006 14:13:32 -0000
@@ -71,12 +71,12 @@ typedef pthread_key_t __libc_key_t;
    initialized locks must be set to one due to the lack of normal
    atomic operations.) */
 
-#if __LT_SPINLOCK_INIT == 0
+#ifdef __LT_INITIALIZER_NOT_ZERO
 #  define __libc_lock_define_initialized(CLASS,NAME) \
-  CLASS __libc_lock_t NAME;
+  CLASS __libc_lock_t NAME = PTHREAD_MUTEX_INITIALIZER;
 #else
 #  define __libc_lock_define_initialized(CLASS,NAME) \
-  CLASS __libc_lock_t NAME = PTHREAD_MUTEX_INITIALIZER;
+  CLASS __libc_lock_t NAME;
 #endif
 
 #define __libc_rwlock_define_initialized(CLASS,NAME) \
Index: linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
===================================================================
RCS file: /cvs/glibc/linuxthreads/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h,v
retrieving revision 1.12
diff -u -p -r1.12 pthreadtypes.h
--- linuxthreads/sysdeps/pthread/bits/pthreadtypes.h	12 Sep 2004 18:44:54 -0000	1.12
+++ linuxthreads/sysdeps/pthread/bits/pthreadtypes.h	26 May 2006 14:13:32 -0000
@@ -22,12 +22,14 @@
 #define __need_schedparam
 #include <bits/sched.h>
 
+typedef int __atomic_lock_t;
+
 /* Fast locks (not abstract because mutexes and conditions aren't abstract). */
 struct _pthread_fastlock
 {
-  long int __status;   /* "Free" or "taken" or head of waiting list */
-  int __spinlock;      /* Used by compare_and_swap emulation. Also,
-			  adaptive SMP lock stores spin count here. */
+  long int __status;		/* "Free" or "taken" or head of waiting list */
+  __atomic_lock_t __spinlock;	/* Used by compare_and_swap emulation. Also,
+				   adaptive SMP lock stores spin count here. */
 };
 
 #ifndef _PTHREAD_DESCR_DEFINED






------=_Part_27885_23555842.1148653785481
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_27885_23555842.1148653785481--
