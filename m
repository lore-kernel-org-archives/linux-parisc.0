Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA08877
	for <parisc-linux@puffin.external.hp.com>; Sun, 22 Oct 2000 15:20:31 -0600
Date: Sun, 22 Oct 2000 14:21:39 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001022142139.A7587@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [patch] linux/include/asm-parisc/checksum.h
List-ID: <linux-parisc.vger.kernel.org>

After all the assembly questions yesterday, I offer you my first patch
:-)

here's a patch to implement ip_fast_csum in
include/asm-parisc/checksum.h. In my simple tests it's about 4x faster
than the original implementation.

I've also been working on the other checksum routines (csum_partial and
friends) but they are not ready yet.

Any suggestions on how to further optimize this will be much
appreciated.

randolph

Index: checksum.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/checksum.h,v
retrieving revision 1.8
diff -u -r1.8 checksum.h
--- checksum.h	2000/08/04 17:29:12	1.8
+++ checksum.h	2000/10/22 21:16:30
@@ -52,12 +52,46 @@
 }
 
 /*
- *	FIXME: Needs to be optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
+ *	Optimized for IP headers, which always checksum on 4 octet boundaries.
+ *
+ *	Written by Randolph Chung <tausq@debian.org>
  */
 static inline unsigned short ip_fast_csum(unsigned char * iph,
 					  unsigned int ihl) {
-	return ~csum_partial (iph, ihl << 2, 0);
+	unsigned int sum;
+
+
+	__asm__ __volatile__ ("
+	ldws,ma		4(%1), %0
+	addi		-4, %2, %2
+	comib,>=	0, %2, 2f
+	
+	ldws,ma		4(%1), %%r19
+	add		%0, %%r19, %0
+	ldws,ma		4(%1), %%r19
+	addc		%0, %%r19, %0
+	ldws,ma		4(%1), %%r19
+	addc		%0, %%r19, %0
+1:	ldws,ma		4(%1), %%r19
+	addib,<>	-1, %2, 1b
+	addc		%0, %%r19, %0
+	addc		%0, %%r0, %0
+
+	zdepi		-1, 31, 16, %%r19
+	and		%0, %%r19, %%r20
+	extru		%0, 15, 16, %%r21
+	add		%%r20, %%r21, %0
+	and		%0, %%r19, %%r20
+	extru		%0, 15, 16, %%r21
+	add		%%r20, %%r21, %0
+	subi		-1, %0, %0
+2:
+	"
+	: "=r" (sum), "=r" (iph), "=r" (ihl)
+	: "1" (iph), "2" (ihl)
+	: "r19", "r20", "r21" );
+
+	return(sum);
 }
 
 /*

-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
