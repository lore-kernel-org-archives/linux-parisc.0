Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5AFE4840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Nov 2003 16:35:09 -0700 (MST)
Message-ID: <3FC92D2C.5070103@tiscali.be>
Date: Sat, 29 Nov 2003 23:35:08 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better
 with gcc
References: <20031126070714.GN975@tausq.org>
In-Reply-To: <20031126070714.GN975@tausq.org>
Content-Type: multipart/mixed;
 boundary="------------030003000508050808040000"
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

This is a multi-part message in MIME format.
--------------030003000508050808040000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Randolph,

may be this alignement with 2.4 is still relevant:
---------><---------
--- system.h-rc 2003-11-30 00:21:55.000000000 +0100
+++ system.h    2003-11-30 00:26:17.000000000 +0100
@@ -138,12 +138,36 @@
  #define set_wmb(var, value)            do { var = value; wmb(); } 
while (0)


-/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
+/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
+ *
+ * Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
+ * since it only has load-and-zero. Moreover, at least on some PA 
processors,+ * the semaphore address has to be 16-byte aligned.
+ */
+#ifdef CONFIG_PA20
+/*
+> From: "Jim Hull" <jim.hull of hp.com>
+> Delivery-date: Wed, 29 Jan 2003 13:57:05 -0500
+> I've attached a summary of the change, but basically, for PA 2.0, as
+> long as the ",CO" (coherent operation) completer is specified, then the
+> 16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
+> they only require "natural" alignment (4-byte for ldcw, 8-byte for
+> ldcd).
+*/
+
+#define __ldcw(a) ({ \
+       unsigned __ret; \
+       __asm__ __volatile__("ldcw,co 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+       __ret; \
+})
+#else
  #define __ldcw(a) ({ \
         unsigned __ret; \
         __asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
         __ret; \
  })
+#endif
+

  /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
     and GCC only guarantees 8-byte alignment for stack locals, we can't
---------><---------

hth,
	Joel

ps: also join as attachment (in case of bad wraping)

Randolph Chung wrote:
> This has been discussed in bits and pieces several times on the list,
> let me summarize:
> 
> - On at least some PA processors, addresses passed to ldcw() must be
> 16-byte aligned
> - gcc doesn't guarantee alignment of automatic variables even if the
> structure is marked with aligned(16). In gcc-3.0.x, this worked most of
> the time because stack alignment was set to 128 bits, but this caused
> various problems so the change was reverted in later revisions of gcc.
> 
> In glibc, Carlos and Dave implemented "auto-aligning" locks by using an
> array of 4 ints and doing ldcw on the 16-byte aligned word inside that
> array. This makes the code work all the time irregardless of how it is
> placed in memory. Here's a patch that implements similar locking
> mechanisms for the kernel. It compiles, but as SMP still doesn't boot
> on 2.6, i haven't really tried to run it. 
> 
> there is some concern this will make structures bigger, but at least 
> in some situations this actually makes them smaller. e.g.
> if you have:
> 
> struct { int x; spinlock_t lock; };
> 
> with the current scheme (using the aligned(16) attribute) the structure
> is 32 bytes. with the new scheme it is only 20 bytes. actually i don't
> think there are any cases where it will make any structures bigger 
> than they are now..... 
> 
> Any comments?
> 
> Index: include/asm-parisc/spinlock.h
> ===================================================================
> RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
> retrieving revision 1.1
> diff -u -p -r1.1 spinlock.h
> --- include/asm-parisc/spinlock.h	29 Jul 2003 17:02:04 -0000	1.1
> +++ include/asm-parisc/spinlock.h	26 Nov 2003 07:00:12 -0000
> @@ -4,35 +4,42 @@
>  #include <asm/system.h>
>  
>  /* Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
> - * since it only has load-and-zero.
> + * since it only has load-and-zero. Moreover, at least on some PA processors,
> + * the semaphore address has to be 16-byte aligned.
>   */
>  
>  #undef SPIN_LOCK_UNLOCKED
> -#define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }
> +#define SPIN_LOCK_UNLOCKED (spinlock_t) { { 1, 1, 1, 1 } }
>  
> -#define spin_lock_init(x)	do { (x)->lock = 1; } while(0)
> +#define spin_lock_init(x)	do { *(x) = SPIN_LOCK_UNLOCKED; } while(0)
>  
> -#define spin_is_locked(x) ((x)->lock == 0)
> -
> -#define spin_unlock_wait(x)	do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)
> -
> -#if 1
> -#define _raw_spin_lock(x) do { \
> -	while (__ldcw (&(x)->lock) == 0) \
> -		while (((x)->lock) == 0) ; } while (0)
> -
> -#else
> -#define _raw_spin_lock(x) \
> -	do { while(__ldcw(&(x)->lock) == 0); } while(0)
> -#endif
> +static inline int spin_is_locked(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	return *a == 0;
> +}
> +
> +#define spin_unlock_wait(x)	do { barrier(); } while(spin_is_locked(x))
> +
> +static inline void _raw_spin_lock(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	while (__ldcw(a) == 0)
> +		while (*a == 0);
> +}
> +
> +static inline void _raw_spin_unlock(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	*a = 1;
> +}
> +
> +static inline int _raw_spin_trylock(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	return __ldcw(a) != 0;
> +}
>  	
> -#define _raw_spin_unlock(x) \
> -	do { (x)->lock = 1; } while(0)
> -
> -#define _raw_spin_trylock(x) (__ldcw(&(x)->lock) != 0)
> -
> -
> -
>  /*
>   * Read-write spinlocks, allowing multiple readers
>   * but only one writer.
> @@ -42,7 +49,7 @@ typedef struct {
>  	volatile int counter;
>  } rwlock_t;
>  
> -#define RW_LOCK_UNLOCKED (rwlock_t) { {1}, 0 }
> +#define RW_LOCK_UNLOCKED (rwlock_t) { { { 1, 1, 1, 1 } }, 0 }
>  
>  #define rwlock_init(lp)	do { *(lp) = RW_LOCK_UNLOCKED; } while (0)
>  
> Index: include/asm-parisc/system.h
> ===================================================================
> RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
> retrieving revision 1.1
> diff -u -p -r1.1 system.h
> --- include/asm-parisc/system.h	29 Jul 2003 17:02:04 -0000	1.1
> +++ include/asm-parisc/system.h	26 Nov 2003 07:00:12 -0000
> @@ -145,6 +145,19 @@ static inline void set_eiem(unsigned lon
>  	__ret; \
>  })
>  
> +/* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
> +   and GCC only guarantees 8-byte alignment for stack locals, we can't
> +   be assured of 16-byte alignment for atomic lock data even if we
> +   specify "__attribute ((aligned(16)))" in the type declaration.  So,
> +   we use a struct containing an array of four ints for the atomic lock
> +   type and dynamically select the 16-byte aligned int from the array
> +   for the semaphore.  */
> +#define __PA_LDCW_ALIGNMENT 16
> +#define __ldcw_align(a) ({ \
> +  unsigned long __ret = (unsigned long) a;                     		\
> +  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT - 1); \
> +  (unsigned int *) __ret;                                               \
> +})
>  
>  #ifdef CONFIG_SMP
>  /*
> @@ -152,7 +165,7 @@ static inline void set_eiem(unsigned lon
>   */
>  
>  typedef struct {
> -	volatile unsigned int __attribute__((aligned(16))) lock;
> +	volatile unsigned int lock[4];
>  } spinlock_t;
>  #endif
> Index: include/asm-parisc/atomic.h
> ===================================================================
> RCS file: /var/cvs/linux-2.6/include/asm-parisc/atomic.h,v
> retrieving revision 1.5
> diff -u -p -r1.5 atomic.h
> --- include/asm-parisc/atomic.h	22 Sep 2003 14:28:12 -0000	1.5
> +++ include/asm-parisc/atomic.h	26 Nov 2003 07:00:12 -0000
> @@ -24,11 +24,18 @@
>  
>  extern spinlock_t __atomic_hash[ATOMIC_HASH_SIZE];
>  /* copied from <asm/spinlock.h> and modified */
> -#  define SPIN_LOCK(x) \
> -	do { while(__ldcw(&(x)->lock) == 0); } while(0)
> -	
> -#  define SPIN_UNLOCK(x) \
> -	do { (x)->lock = 1; } while(0)
> +static inline void SPIN_LOCK(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	while (__ldcw(a) == 0)
> +		while (*a == 0);
> +}
> +
> +static inline void SPIN_UNLOCK(spinlock_t *x)
> +{
> +	volatile unsigned int *a = __ldcw_align(x);
> +	*a = 1;
> +}
>  #else
>  #  define ATOMIC_HASH_SIZE 1
>  #  define ATOMIC_HASH(a)	(0)
> 
> 
> randolph

--------------030003000508050808040000
Content-Type: text/plain;
 name="system.h-align.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="system.h-align.diff"

--- system.h-rc	2003-11-30 00:21:55.000000000 +0100
+++ system.h	2003-11-30 00:26:17.000000000 +0100
@@ -138,12 +138,36 @@
 #define set_wmb(var, value)		do { var = value; wmb(); } while (0)
 
 
-/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
+/* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.
+ *
+ * Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
+ * since it only has load-and-zero. Moreover, at least on some PA processors,
+ * the semaphore address has to be 16-byte aligned.
+ */
+#ifdef CONFIG_PA20
+/* 
+> From: "Jim Hull" <jim.hull of hp.com>
+> Delivery-date: Wed, 29 Jan 2003 13:57:05 -0500
+> I've attached a summary of the change, but basically, for PA 2.0, as
+> long as the ",CO" (coherent operation) completer is specified, then the
+> 16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
+> they only require "natural" alignment (4-byte for ldcw, 8-byte for
+> ldcd).
+*/
+
+#define __ldcw(a) ({ \
+	unsigned __ret; \
+	__asm__ __volatile__("ldcw,co 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+	__ret; \
+})
+#else
 #define __ldcw(a) ({ \
 	unsigned __ret; \
 	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
 	__ret; \
 })
+#endif
+
 
 /* Because kmalloc only guarantees 8-byte alignment for kmalloc'd data,
    and GCC only guarantees 8-byte alignment for stack locals, we can't

--------------030003000508050808040000--
