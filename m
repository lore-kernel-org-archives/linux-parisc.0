From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] uniline ?
Date: Sun, 06 Jun 2004 19:22:37 +0000
Message-ID: <40C36EFD.6040002@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
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

Hello all,

reading this:
ChangeSet 2004/06/04 16:17:51-07:00, akpm @ osdl.org [diffview]

[PATCH] ia64: uninline find_next_bit on ia64

From: Paul Jackson <pj@sgi.com>

Move the page of code (~700 bytes of instructions) for find_next_bit and
find_next_zero_bit from inline in include/asm-ia64/bitops.h to a real function
in arch/ia64/lib/bitops.c, leaving a declaration and macro wrapper behind.

The other arch's with almost this same code might want to also uninline it:
alpha, parisc, ppc, sh, sparc, sparc64.

These are too big to inline.

Signed-off-by: Paul Jackson <pj@sgi.com>
Signed-off-by: Andrew Morton <akpm@osdl.org>
Signed-off-by: David Mosberger <davidm@hpl.hp.com>

I play to make an equivalent patch for paric:
diff -Naur linux-2.6.a/arch/parisc/lib/bitops.c linux-2.6.b/arch/parisc/lib/bitops.c
--- linux-2.6.a/arch/parisc/lib/bitops.c        2004-06-06 15:16:28.000000000 +0200
+++ linux-2.6.b/arch/parisc/lib/bitops.c        2004-06-06 19:53:09.312540000 +0200
@@ -11,6 +11,7 @@
  #include <linux/spinlock.h>
  #include <asm/system.h>
  #include <asm/atomic.h>
+#include <asm/bitops.h>

  #ifdef CONFIG_SMP
  atomic_lock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
@@ -82,3 +83,126 @@
         atomic_spin_unlock_irqrestore(ATOMIC_HASH(ptr), flags);
         return (unsigned long)prev;
  }
+
+/*
+ * This implementation of find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h.
+ */
+unsigned long __find_next_zero_bit(void * addr, unsigned long size, unsigned long offset)
+{
+       unsigned long * p = ((unsigned long *) addr) + (offset >> SHIFT_PER_LONG);
+       unsigned long result = offset & ~(BITS_PER_LONG-1);
+       unsigned long tmp;
+
+       if (offset >= size)
+               return size;
+       size -= result;
+       offset &= (BITS_PER_LONG-1);
+       if (offset) {
+               tmp = *(p++);
+               tmp |= ~0UL >> (BITS_PER_LONG-offset);
+               if (size < BITS_PER_LONG)
+                       goto found_first;
+               if (~tmp)
+                       goto found_middle;
+               size -= BITS_PER_LONG;
+               result += BITS_PER_LONG;
+       }
+       while (size & ~(BITS_PER_LONG -1)) {
+               if (~(tmp = *(p++)))
+                       goto found_middle;
+               result += BITS_PER_LONG;
+               size -= BITS_PER_LONG;
+       }
+       if (!size)
+               return result;
+       tmp = *p;
+found_first:
+       tmp |= ~0UL << size;
+found_middle:
+       return result + ffz(tmp);
+}
+EXPORT_SYMBOL(__find_next_zero_bit);
+
+
+unsigned long __find_next_bit(unsigned long *addr, unsigned long size, unsigned long offset)
+{
+       unsigned long *p = addr + (offset >> 6);
+       unsigned long result = offset & ~(BITS_PER_LONG-1);
+       unsigned long tmp;
+
+       if (offset >= size)
+               return size;
+       size -= result;
+       offset &= (BITS_PER_LONG-1);
+       if (offset) {
+               tmp = *(p++);
+               tmp &= (~0UL << offset);
+               if (size < BITS_PER_LONG)
+                       goto found_first;
+               if (tmp)
+                       goto found_middle;
+               size -= BITS_PER_LONG;
+               result += BITS_PER_LONG;
+       }
+       while (size & ~(BITS_PER_LONG-1)) {
+               if ((tmp = *(p++)))
+                       goto found_middle;
+               result += BITS_PER_LONG;
+               size -= BITS_PER_LONG;
+       }
+       if (!size)
+               return result;
+       tmp = *p;
+
+found_first:
+       tmp &= (~0UL >> (BITS_PER_LONG - size));
+       if (tmp == 0UL)        /* Are any bits set? */
+               return result + size; /* Nope. */
+found_middle:
+       return result + __ffs(tmp);
+}
+EXPORT_SYMBOL(__find_next_bit);
+
+/*
+ * This implementation of ext2_find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h and modified for a big-endian machine.
+ */
+
+extern unsigned long __ext2_find_next_zero_bit(void *addr,
+               unsigned long size, unsigned long offset)
+{
+       unsigned int *p = ((unsigned int *) addr) + (offset >> 5);
+       unsigned int result = offset & ~31UL;
+       unsigned int tmp;
+
+       if (offset >= size)
+               return size;
+       size -= result;
+       offset &= 31UL;
+       if (offset) {
+               tmp = cpu_to_le32p(p++);
+               tmp |= ~0UL >> (32-offset);
+               if (size < 32)
+                       goto found_first;
+               if (tmp != ~0U)
+                       goto found_middle;
+               size -= 32;
+               result += 32;
+       }
+       while (size >= 32) {
+               if ((tmp = cpu_to_le32p(p++)) != ~0U)
+                       goto found_middle;
+               result += 32;
+               size -= 32;
+       }
+       if (!size)
+               return result;
+       tmp = cpu_to_le32p(p);
+found_first:
+       tmp |= ~0U << size;
+found_middle:
+       return result + ffz(tmp);
+}
+EXPORT_SYMBOL(__ext2_find_next_zero_bit);
+
diff -Naur linux-2.6.a/include/asm-parisc/bitops.h linux-2.6.b/include/asm-parisc/bitops.h
--- linux-2.6.a/include/asm-parisc/bitops.h     2004-06-06 15:17:31.000000000 +0200
+++ linux-2.6.b/include/asm-parisc/bitops.h     2004-06-06 19:53:20.232540000 +0200
@@ -354,78 +354,15 @@
  #define find_first_zero_bit(addr, size) \
         find_next_zero_bit((addr), (size), 0)

-static __inline__ unsigned long find_next_zero_bit(void * addr, unsigned long size, unsigned long offset)
-{
-       unsigned long * p = ((unsigned long *) addr) + (offset >> SHIFT_PER_LONG);
-       unsigned long result = offset & ~(BITS_PER_LONG-1);
-
-       if (offset >= size)
-               return size;
-       size -= result;
-       offset &= (BITS_PER_LONG-1);
-       if (offset) {
-               tmp = *(p++);
-               tmp |= ~0UL >> (BITS_PER_LONG-offset);
-               if (size < BITS_PER_LONG)
-                       goto found_first;
-               if (~tmp)
-                       goto found_middle;
-               size -= BITS_PER_LONG;
-               result += BITS_PER_LONG;
-       }
-       while (size & ~(BITS_PER_LONG -1)) {
-               if (~(tmp = *(p++)))
-                       goto found_middle;
-               result += BITS_PER_LONG;
-               size -= BITS_PER_LONG;
-       }
-       if (!size)
-               return result;
-       tmp = *p;
-found_first:
-       tmp |= ~0UL << size;
-found_middle:
-       return result + ffz(tmp);
-}
+#define find_next_zero_bit(addr, size, offset) \
+               __find_next_zero_bit((addr), (size), (offset))

-static __inline__ unsigned long find_next_bit(unsigned long *addr, unsigned long size, unsigned long offset)
-{
-       unsigned long *p = addr + (offset >> 6);
-       unsigned long result = offset & ~(BITS_PER_LONG-1);
-       unsigned long tmp;
-
-       if (offset >= size)
-               return size;
-       size -= result;
-       offset &= (BITS_PER_LONG-1);
-       if (offset) {
-               tmp = *(p++);
-               tmp &= (~0UL << offset);
-               if (size < BITS_PER_LONG)
-                       goto found_first;
-               if (tmp)
-                       goto found_middle;
-               size -= BITS_PER_LONG;
-               result += BITS_PER_LONG;
-       }
-       while (size & ~(BITS_PER_LONG-1)) {
-               if ((tmp = *(p++)))
-                       goto found_middle;
-               result += BITS_PER_LONG;
-               size -= BITS_PER_LONG;
-       }
-       if (!size)
-               return result;
-       tmp = *p;
-
-found_first:
-       tmp &= (~0UL >> (BITS_PER_LONG - size));
-       if (tmp == 0UL)        /* Are any bits set? */
-               return result + size; /* Nope. */
-found_middle:
-       return result + __ffs(tmp);
-}
+extern unsigned long __find_next_zero_bit(void * addr, unsigned long size, unsigned long offset);
+
+#define find_next_bit(addr, size, offset) \
+               __find_next_bit((addr), (size), (offset))
+
+extern unsigned long __find_next_bit(unsigned long *addr, unsigned long size, unsigned long offset);

  /**
   * find_first_bit - find the first set bit in a memory region
@@ -474,41 +411,10 @@
  #define ext2_find_first_zero_bit(addr, size) \
          ext2_find_next_zero_bit((addr), (size), 0)

-extern __inline__ unsigned long ext2_find_next_zero_bit(void *addr,
-       unsigned long size, unsigned long offset)
-{
-       unsigned int *p = ((unsigned int *) addr) + (offset >> 5);
-       unsigned int result = offset & ~31UL;
-       unsigned int tmp;
-
-       if (offset >= size)
-               return size;
-       size -= result;
-       offset &= 31UL;
-       if (offset) {
-               tmp = cpu_to_le32p(p++);
-               tmp |= ~0UL >> (32-offset);
-               if (size < 32)
-                       goto found_first;
-               if (tmp != ~0U)
-                       goto found_middle;
-               size -= 32;
-               result += 32;
-       }
-       while (size >= 32) {
-               if ((tmp = cpu_to_le32p(p++)) != ~0U)
-                       goto found_middle;
-               result += 32;
-               size -= 32;
-       }
-       if (!size)
-               return result;
-       tmp = cpu_to_le32p(p);
-found_first:
-       tmp |= ~0U << size;
-found_middle:
-       return result + ffz(tmp);
-}
+#define ext2_find_next_zero_bit(addr, size, offset) \
+               __ext2_find_next_zero_bit((addr), (size), (offset))
+
+extern unsigned long __ext2_find_next_zero_bit(void *addr, unsigned long size, unsigned long offset);

  /* Bitmap functions for the minix filesystem.  */
  #define minix_test_and_set_bit(nr,addr) ext2_set_bit(nr,addr)
========><======

What's your opinion about its relievence for parisc?

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
