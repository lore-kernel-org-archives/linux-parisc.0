From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] ext3 perf patch#2
Date: Sat, 26 Mar 2005 03:35:40 -0700
Message-ID: <20050326103540.GA31557@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

James Bottomley in a private conversation suggested our
ext2_test_bit() and ext2_find_next_zero_bit() might not
be counting bits the same way in the bitmap.

ext2_test_bit() is quite straight forward looks right to me.
But my brain wasn't grokking ext2_find_next_zero_bit().
Cloning it from sparc64 was easy to try...
Since the first attempted worked, I also applli

The result was rsync was able to clone from one
ext3 (whole disk) to another ext3 using rsync
at 5-10MB/s (both disks on the same SCSI bus).
This is *alot* better than the previous experience
of < 1MB/s. Since my ext3 test filesystems hadn't aged (been used)
very much, bitmap search is not much overhead.

If someone else has a disposable, mature ext3 file system
they can test the following patch on, that would be great.

BTW, this patch assumes a 64-bit kernel and is certainly
not intended to be committed as is. This is just
an experiment so far.

Patch is against 2.6.11-pa2 (NOT 2.6.12 - sorry)

grant


Index: include/asm-parisc/bitops.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/bitops.h,v
retrieving revision 1.14
diff -u -p -r1.14 bitops.h
--- include/asm-parisc/bitops.h	18 Feb 2005 14:22:09 -0000	1.14
+++ include/asm-parisc/bitops.h	26 Mar 2005 09:58:58 -0000
@@ -466,49 +466,47 @@ static __inline__ int ext2_test_bit(int 
 	return (ADDR[nr >> 3] >> (nr & 7)) & 1;
 }
 
-/*
- * This implementation of ext2_find_{first,next}_zero_bit was stolen from
- * Linus' asm-alpha/bitops.h and modified for a big-endian machine.
- */
 
-#define ext2_find_first_zero_bit(addr, size) \
-        ext2_find_next_zero_bit((addr), (size), 0)
-
-extern __inline__ unsigned long ext2_find_next_zero_bit(void *addr,
-	unsigned long size, unsigned long offset)
+static __inline__ unsigned long ext2_find_next_zero_bit(unsigned long *addr, unsigned long size, unsigned long offset)
 {
-	unsigned int *p = ((unsigned int *) addr) + (offset >> 5);
-	unsigned int result = offset & ~31UL;
-	unsigned int tmp;
+	unsigned long *p = addr + (offset >> 6);
+	unsigned long result = offset & ~63UL;
+	unsigned long tmp;
 
 	if (offset >= size)
 		return size;
 	size -= result;
-	offset &= 31UL;
-	if (offset) {
-		tmp = cpu_to_le32p(p++);
-		tmp |= ~0UL >> (32-offset);
-		if (size < 32)
+	offset &= 63UL;
+	if(offset) {
+		tmp = __swab64p((u64 *)p++);
+		tmp |= (~0UL >> (64-offset));
+		if(size < 64)
 			goto found_first;
-		if (tmp != ~0U)
+		if(~tmp)
 			goto found_middle;
-		size -= 32;
-		result += 32;
+		size -= 64;
+		result += 64;
 	}
-	while (size >= 32) {
-		if ((tmp = cpu_to_le32p(p++)) != ~0U)
-			goto found_middle;
-		result += 32;
-		size -= 32;
+	while(size & ~63) {
+		if(~(tmp = *(p++)))
+			goto found_middle_swap;
+		result += 64;
+		size -= 64;
 	}
-	if (!size)
+	if(!size)
 		return result;
-	tmp = cpu_to_le32p(p);
+	tmp = __swab64p((u64 *) p);
 found_first:
-	tmp |= ~0U << size;
+	tmp |= (~0UL << size);
+	if (tmp == ~0UL)        /* Are any bits zero? */
+		return result + size; /* Nope. */
 found_middle:
 	return result + ffz(tmp);
+
+found_middle_swap:
+	return result + ffz(__swab64((u64)tmp));
 }
+
 
 /* Bitmap functions for the minix filesystem.  */
 #define minix_test_and_set_bit(nr,addr) ext2_set_bit(nr,addr)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
