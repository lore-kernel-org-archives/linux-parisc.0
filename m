From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext3 perf patch#4
Date: Sat, 26 Mar 2005 18:18:49 -0700
Message-ID: <20050327011849.GD9287@colo.lackof.org>
References: <20050326103540.GA31557@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050326103540.GA31557@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 26, 2005 at 03:35:40AM -0700, Grant Grundler wrote:
> James Bottomley in a private conversation suggested our
> ext2_test_bit() and ext2_find_next_zero_bit() might not
> be counting bits the same way in the bitmap.

James, kudos and thank you.

With appended patch, I'm getting reasonable ext3 performance.
Can someone please test this patch in a 32-bit kernel?

I'm comfortable this patch works for 64-bit since I've been building
kernels and running rsync across 3 disks with no problems.
I *think* the code is 32-bit clean as well, but haven't tested it.


Some minor additional, interesting things folks can do:
o Should this function should really be "static inline"?
  sparc64 puts it into arch/sparc64/lib :
  grundler <502>fgrep find_next_zero_le arch/sparc64/lib/find_bit.c 
  unsigned long find_next_zero_le_bit(unsigned long *addr, unsigned long size, unsigned long offset)

  How often is it called? More than three/four times would make
  it candidate for lib.

o ffz() is expanded inline. Restructure code so we don't
  need find_middle_swap() label. Ie do endian swap inside
  the conditional...but then the loop gets uglier and
  parisc can't use a conditional branch.
  Making this a normal function might make this item irrelevant.

o drop or optimize "if (tmp == ~0UL)" right before found_middle label.
  ffz() isn't that expensive compared to a mis-predicted branch.
  Figure out how many cycles ffz() costs, how many cycles a
  mispredicted branch costs, and then what the right tradeoff
  is in this case (including reduced code size).

Simple test results follow and then the patch.

riot:/mnt3# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdk3             16146848   1649084  13677540  11% /
/dev/sdk1               189387     97070     82539  55% /boot
/dev/sdb              17504036  14616368   1998508  88% /mnt3
/dev/sdu              17504036  14616368   1998508  88% /mnt2
/dev/sdv              17504036   5128996  11485880  31% /mnt

grundler@riot:/$ lsscsi
[0:0:0:0]    disk    SEAGATE  ST318203LC       HP02  /dev/sda
[0:0:1:0]    disk    SEAGATE  ST318203LC       HP02  /dev/sdb
...
[5:0:12:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sdu
[5:0:13:0]   disk    SEAGATE  ST318451LC       HP01  /dev/sdv


riot:/mnt# time tar xjf linux-2.6.12-rc1-pa3.tar.bz2 

real    0m51.988s
user    0m44.175s
sys     0m7.912s

riot:/mnt# cd ../mnt2
riot:/mnt2# time tar xjf /mnt/linux-2.6.12-rc1-pa3.tar.bz2 

real    0m52.338s
user    0m44.232s
sys     0m7.912s
riot:/mnt2# cd /mnt3  
riot:/mnt3# time tar xjf /mnt/linux-2.6.12-rc1-pa3.tar.bz2 

real    0m54.755s
user    0m44.181s
sys     0m7.998s


iostat 10 second sample while running tar:

avg-cpu:  %user   %nice    %sys %iowait   %idle
          43.73    0.00   11.14    9.95   35.18

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sdb               0.00         0.00         0.00          0          0
sdu               0.00         0.00         0.00          0          0
sdv             130.87         2.40     11723.48         24     117352


thanks,
grant


Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


Index: include/asm-parisc/bitops.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/bitops.h,v
retrieving revision 1.15
diff -u -p -r1.15 bitops.h
--- include/asm-parisc/bitops.h	24 Mar 2005 15:26:29 -0000	1.15
+++ include/asm-parisc/bitops.h	27 Mar 2005 01:09:41 -0000
@@ -466,52 +466,67 @@ static __inline__ int ext2_test_bit(int 
 	return (ADDR[nr >> 3] >> (nr & 7)) & 1;
 }
 
-/*
- * This implementation of ext2_find_{first,next}_zero_bit was stolen from
- * Linus' asm-alpha/bitops.h and modified for a big-endian machine.
- */
+/* include/linux/byteorder does not support "unsigned long" type */
+static inline unsigned long ext2_swabp(unsigned long * x)
+{
+#ifdef CONFIG_64BIT
+	return (unsigned long) __swab64p((u64 *) x);
+#else
+	return (unsigned long) __swab32p((u32 *) x);
+#endif
+}
 
-#define ext2_find_first_zero_bit(addr, size) \
-        ext2_find_next_zero_bit((addr), (size), 0)
+/* include/linux/byteorder doesn't support "unsigned long" type */
+static inline unsigned long ext2_swab(unsigned long y)
+{
+#ifdef CONFIG_64BIT
+	return (unsigned long) __swab64((u64) y);
+#else
+	return (unsigned long) __swab32((u32) y);
+#endif
+}
 
-extern __inline__ unsigned long ext2_find_next_zero_bit(void *addr,
-	unsigned long size, unsigned long offset)
+static __inline__ unsigned long ext2_find_next_zero_bit(unsigned long *addr, unsigned long size, unsigned long offset)
 {
-	unsigned int *p = ((unsigned int *) addr) + (offset >> 5);
-	unsigned int result = offset & ~31UL;
-	unsigned int tmp;
+	unsigned long *p = addr + (offset >> SHIFT_PER_LONG);
+	unsigned long result = offset & ~(BITS_PER_LONG - 1);
+	unsigned long tmp;
 
 	if (offset >= size)
 		return size;
 	size -= result;
-	offset &= 31UL;
-	if (offset) {
-		tmp = cpu_to_le32p(p++);
-		tmp |= ~0UL >> (32-offset);
-		if (size < 32)
+	offset &= (BITS_PER_LONG - 1UL);
+	if(offset) {
+		tmp = ext2_swabp(p++);
+		tmp |= (~0UL >> (BITS_PER_LONG - offset));
+		if(size < BITS_PER_LONG)
 			goto found_first;
-		if (tmp != ~0U)
+		if(~tmp)
 			goto found_middle;
-		size -= 32;
-		result += 32;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
 	}
-	while (size >= 32) {
-		if ((tmp = *p++) != ~0U)
+
+	while(size & ~(BITS_PER_LONG - 1)) {
+		if(~(tmp = *(p++)))
 			goto found_middle_swap;
-		result += 32;
-		size -= 32;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
 	}
-	if (!size)
+	if(!size)
 		return result;
-	tmp = cpu_to_le32p(p);
+	tmp = ext2_swabp(p);
 found_first:
-	tmp |= ~0U << size;
+	tmp |= ~0UL << size;
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size; /* Nope. Skip ffz */
 found_middle:
 	return result + ffz(tmp);
+
 found_middle_swap:
-	tmp = cpu_to_le32(tmp);
-	return result + ffz(tmp);
+	return result + ffz(ext2_swab(tmp));
 }
+
 
 /* Bitmap functions for the minix filesystem.  */
 #define minix_test_and_set_bit(nr,addr) ext2_set_bit(nr,addr)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
