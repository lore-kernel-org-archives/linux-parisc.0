From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Thu, 2 Jun 2005 15:35:19 -0600
Message-ID: <20050602213519.GA18164__7667.71121784604$1416624539$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@there.is.no.cabal.ca>,
 parisc-linux@parisc-linux.org
To: linux-usb-devel@lists.sourceforge.net
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

Hi folks,,
extract() and implement() are bit field manipulation routines.
They mangle "n" bits starting at "offset" index into the bit field.
Since this is USB, the byte array is little endian.
Big endian machines (e.g. parisc, mips) should only need to
byte swap the value.

extract() and implement() have brain damaged attempts to handle
32-bit wide "fields".
The problem is the index math in the original code didn't clear all
the relevant bits.  (offset >> 5) only compensated for 32-bit index.
We need (offset >> 6) if we want to use 64-bit loads.

But it was also wrong in that it tried to use quasi-aligned loads.
Ie "report" was only incremented in multiples of 4 bytes and then
the offset was masked off for values greater than 4 bytes.
The right way is to pretend "report" points at a byte array.
And offset is then only minor adjustment for < 8 bits of offset.
"n" (field width) can then be as big as 24 (assuming 32-bit loads)
since "offset" will never be bigger than 7.

If someone needs either function to handle more than 24-bits,
please document why - point at a specification or specific USB
hid device - in comments in the code.

extract/implement() are also an eyesore to read.
Please banish whoever wrote it to read CodingStyle 3 times in a row
to a classroom full of 1st graders armed with rubberbands.
Or just flame them. Whatever. Globbing all the code together
on two lines does NOT make it faster and is Just Wrong.

Patch below fixes the above issues. Please apply.

I've tested this patch on j6000 (dual 750Mhz PA-RISC, 32-bit 2.6.12-rc5).
Kyle McMartin tested on c3000 (up 400Mhz PA-RISC, same kernel).
"p2-mate" (Peter De Schrijver?) tested on sb1250 (dual core Mips,
   broadcom "swarm" eval board).

c3000 and j6000 have (lspci output):
0000:00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 IDE (rev 03)
0000:00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev 01)
0000:00:0e.2 USB Controller: National Semiconductor Corporation USB Controller (rev 02)

(87560 is also known as "SuckyIO" chip in parisc community)



Couple more general comments that belong in seperate patches:
o get_unaligned() and put_unaligned() are more or less obsolete.
  The kernel misaligned trap handler is expected to handle this
  for every arch that uses "asm-generic/unaligned.h".
  See "fgrep generic include/asm*/unaligned.h" output.

  Don't misunderstand, I prefer to see get_unaligned() but just
  want to point out it's not doing what people might assume it does.

  The networking stack has misaligned accesses that davem/jgarzik
  have refused to fixup with get_aligned() despite well documented
  performance reasons for doing so. So USB is not some odd exception. 

o "static inline" is preferred as per Documentation/SubmittingPatches.
  I'd be happy to submit a patch if someone isn't able
  to run "sed -e 's/__inline__/inline/'" over the code.

thanks,
grant

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

Index: drivers/usb/input/hid-core.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/usb/input/hid-core.c,v
retrieving revision 1.21
diff -u -p -r1.21 hid-core.c
--- drivers/usb/input/hid-core.c	22 Apr 2005 00:25:56 -0000	1.21
+++ drivers/usb/input/hid-core.c	2 Jun 2005 06:10:13 -0000
@@ -759,21 +759,31 @@ static __inline__ __u32 s32ton(__s32 val
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
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
