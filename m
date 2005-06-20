From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Kernel panic c3k,
	memset -> journal_add_journal_head
Date: Mon, 20 Jun 2005 11:44:10 -0400 (EDT)
Message-ID: <200506201544.j5KFiAKl006226@hiauly1.hia.nrc.ca>
References: <20050620051542.GA18349@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050620051542.GA18349@systemhalted.org> from "Carlos O'Donell"
	at Jun 20, 2005 01:15:44 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> pa,
> 
> 'make -k check' in the binutils testsuite consistently crashes my box :(

FWIW, I haven't been able to crash 2.6.10-pa11 with the enclosed
change in just under 6 days of running.  Expect sometimes hangs after
the ld test.  There's also an issue with ksoftirqd/0.  It never
seems to sleep, so the load average never drops below 1.  I'm using
the default config.

Except for the alignment change in pacache.S, all the changes are
backports of later patches..

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.15
diff -u -p -u -3 -p -r1.15 pacache.S
--- arch/parisc/kernel/pacache.S	5 Jan 2005 05:54:11 -0000	1.15
+++ arch/parisc/kernel/pacache.S	20 Jun 2005 14:57:06 -0000
@@ -46,7 +46,7 @@
 #include <asm/cache.h>
 
 	.text
-	.align	128
+	.align	512
 
 	.export flush_tlb_all_local,code
 
@@ -354,7 +354,11 @@ copy_user_page_asm:
 	std		%r22, 120(%r26)
 	ldo		128(%r26), %r26
 
-	ADDIB>		-1, %r1, 1b		/* bundle 10 */
+	/* conditional branches nullify on forward taken branch, and on
+	 * non-taken backward branch. Note that .+4 is a backwards branch.
+	 * The ldd should only get executed if the branch is taken.
+	 */
+	ADDIB>,n	-1, %r1, 1b		/* bundle 10 */
 	ldd		0(%r25), %r19		/* start next loads */
 
 #else
@@ -366,10 +370,10 @@ copy_user_page_asm:
 	 * the full 64 bit register values on interrupt, we can't
 	 * use ldd/std on a 32 bit kernel.
 	 */
+	ldw		0(%r25), %r19
 	ldi		64, %r1		/* PAGE_SIZE/64 == 64 */
 
 1:
-	ldw		0(%r25), %r19
 	ldw		4(%r25), %r20
 	ldw		8(%r25), %r21
 	ldw		12(%r25), %r22
@@ -399,11 +403,12 @@ copy_user_page_asm:
 	ldw		60(%r25), %r22
 	stw		%r19, 48(%r26)
 	stw		%r20, 52(%r26)
+	ldo		64(%r25), %r25
 	stw		%r21, 56(%r26)
 	stw		%r22, 60(%r26)
 	ldo		64(%r26), %r26
-	ADDIB>		-1, %r1, 1b
-	ldo		64(%r25), %r25
+	ADDIB>,n	-1, %r1, 1b
+	ldw		0(%r25), %r19
 #endif
 	bv		%r0(%r2)
 	nop
@@ -994,7 +999,7 @@ flush_kernel_icache_range_asm:
 
 	.procend
 
-	.align	128
+	.align	512
 
 	.export disable_sr_hashing_asm,code
 
Index: drivers/usb/input/hid-core.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/usb/input/hid-core.c,v
retrieving revision 1.15
diff -u -p -u -3 -p -r1.15 hid-core.c
--- drivers/usb/input/hid-core.c	4 Dec 2004 07:02:49 -0000	1.15
+++ drivers/usb/input/hid-core.c	20 Jun 2005 14:57:09 -0000
@@ -751,21 +751,31 @@ static __inline__ __u32 s32ton(__s32 val
 }
 
 /*
- * Extract/implement a data field from/to a report.
+ * Extract/implement a data field from/to a little endian report (bit array).
  */
 
 static __inline__ __u32 extract(__u8 *report, unsigned offset, unsigned n)
 {
-	report += (offset >> 5) << 2; offset &= 31;
-	return (le64_to_cpu(get_unaligned((__le64*)report)) >> offset) & ((1 << n) - 1);
+	u32 x;
+
+	report += offset >> 3;  /* adjust byte index */
+	offset &= 8 - 1;
+	x = get_unaligned((u32 *) report);
+	x = le32_to_cpu(x);
+	x = (x >> offset) & ((1 << n) - 1);
+	return x;
 }
 
 static __inline__ void implement(__u8 *report, unsigned offset, unsigned n, __u32 value)
 {
-	report += (offset >> 5) << 2; offset &= 31;
-	put_unaligned((get_unaligned((__le64*)report)
-		& cpu_to_le64(~((((__u64) 1 << n) - 1) << offset)))
-		| cpu_to_le64((__u64)value << offset), (__le64*)report);
+	u32 x;
+
+	report += offset >> 3;
+	offset &= 8 - 1;
+	x = get_unaligned((u32 *)report);
+	x &= cpu_to_le32(~((((__u32) 1 << n) - 1) << offset));
+	x |= cpu_to_le32(value << offset);
+	put_unaligned(x,(u32 *)report);
 }
 
 /*
Index: fs/ioctl.c
===================================================================
RCS file: /var/cvs/linux-2.6/fs/ioctl.c,v
retrieving revision 1.5
diff -u -p -u -3 -p -r1.5 ioctl.c
--- fs/ioctl.c	21 Oct 2004 18:59:38 -0000	1.5
+++ fs/ioctl.c	20 Jun 2005 14:57:11 -0000
@@ -44,7 +44,11 @@ static int file_ioctl(struct file *filp,
 				return -EBADF;
 			return put_user(inode->i_sb->s_blocksize, p);
 		case FIONREAD:
-			return put_user(i_size_read(inode) - filp->f_pos, p);
+		{
+			int sz;
+			sz = i_size_read(inode) - filp->f_pos;
+			return put_user(sz, p);
+		}
 	}
 	if (filp->f_op && filp->f_op->ioctl)
 		return filp->f_op->ioctl(inode, filp, cmd, arg);
Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.17
diff -u -p -u -3 -p -r1.17 uaccess.h
--- include/asm-parisc/uaccess.h	17 Sep 2004 20:58:41 -0000	1.17
+++ include/asm-parisc/uaccess.h	20 Jun 2005 14:57:13 -0000
@@ -142,22 +142,23 @@ struct exception_data {
 #define __put_user(x,ptr)                                       \
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;      	\
+        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
 								\
 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
-	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
-	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
-	    case 8: STD_KERNEL(x,ptr); break;			\
+	    case 1: __put_kernel_asm("stb",__x,ptr); break;     \
+	    case 2: __put_kernel_asm("sth",__x,ptr); break;     \
+	    case 4: __put_kernel_asm("stw",__x,ptr); break;     \
+	    case 8: STD_KERNEL(__x,ptr); break;			\
 	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_user_asm("stb",x,ptr); break;         \
-	    case 2: __put_user_asm("sth",x,ptr); break;         \
-	    case 4: __put_user_asm("stw",x,ptr); break;         \
-	    case 8: STD_USER(x,ptr); break;			\
+	    case 1: __put_user_asm("stb",__x,ptr); break;       \
+	    case 2: __put_user_asm("sth",__x,ptr); break;       \
+	    case 4: __put_user_asm("stw",__x,ptr); break;       \
+	    case 8: STD_USER(__x,ptr); break;			\
 	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
