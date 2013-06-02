From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use unshadowed index register for flush instructions in flush_dcache_page_asm and flush_icache_page_asm
Date: Sun, 2 Jun 2013 12:21:48 -0400
Message-ID: <BLU0-SMTP62E4CC425407D88FFC0DF3979C0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-39-1040884686"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-39-1040884686
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The comment at the start of pacache.S states that the base and index  
registers used for
fdc,fic, and pdc instructions should not use shadowed registers.   
Although this is probably
unnecessary for tmpalias flushes, there is also no reason not to  
comply.  The same
index register (%r23) is used as in other routines.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-39-1040884686
Content-Disposition: attachment; filename="pacache-index-reg.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="pacache-index-reg.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 36d7f40..5f98abc 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -860,7 +860,7 @@ ENTRY(flush_dcache_page_asm)
 #endif
 
 	ldil		L%dcache_stride, %r1
-	ldw		R%dcache_stride(%r1), %r1
+	ldw		R%dcache_stride(%r1), r23
 
 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -868,26 +868,26 @@ ENTRY(flush_dcache_page_asm)
 	depwi,z		1, 31-PAGE_SHIFT,1, %r25
 #endif
 	add		%r28, %r25, %r25
-	sub		%r25, %r1, %r25
-
-
-1:      fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
+	sub		%r25, r23, %r25
+
+
+1:      fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
+	fdc,m		r23(%r28)
 	cmpb,COND(<<)		%r28, %r25,1b
-	fdc,m		%r1(%r28)
+	fdc,m		r23(%r28)
 
 	sync
 
@@ -936,7 +936,7 @@ ENTRY(flush_icache_page_asm)
 #endif
 
 	ldil		L%icache_stride, %r1
-	ldw		R%icache_stride(%r1), %r1
+	ldw		R%icache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -944,28 +944,28 @@ ENTRY(flush_icache_page_asm)
 	depwi,z		1, 31-PAGE_SHIFT,1, %r25
 #endif
 	add		%r28, %r25, %r25
-	sub		%r25, %r1, %r25
+	sub		%r25, %r23, %r25
 
 
 	/* fic only has the type 26 form on PA1.1, requiring an
 	 * explicit space specification, so use %sr4 */
-1:      fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
+1:      fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
 	cmpb,COND(<<)	%r28, %r25,1b
-	fic,m		%r1(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
 
 	sync
 

--Apple-Mail-39-1040884686
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-39-1040884686--
