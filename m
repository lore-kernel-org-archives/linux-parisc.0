From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Update comment regarding implementation of copy_user_page_asm
Date: Tue, 20 Sep 2016 12:59:39 -0400
Message-ID: <7B426EDB-5249-4A32-ACE1-05D9D3B2A940@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-20-14856818
Cc: deller@kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-20-14856818
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The attached patch describes the current implementation of =
copy_user_page_asm.  It is possible to implement
this routine using either the kernel page mappings or equivalent =
aliases.  I tested both and decided the former
was more efficient.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-20-14856818
Content-Disposition: attachment;
	filename=pacache.S.d.txt
Content-Type: text/plain;
	name="pacache.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index b743a80..1250c02 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -573,11 +573,17 @@ ENDPROC(copy_page_asm)
 	.endm
 
 	/*
-	 * We can't do this since copy_user_page is used to bring in
-	 * file data that might have instructions. Since the data would
-	 * then need to be flushed out so the i-fetch can see it, it
-	 * makes more sense to just copy through the kernel translation
-	 * and flush it.
+	 * copy_user_page_asm() performs a page copy using mappings
+	 * equivalent to the user page mappings.  It can be used to
+	 * implement copy_user_page() but unfortunately both the `from'
+	 * and `to' pages need to be flushed through mappings equivalent
+	 * to the user mappings after the copy because the kernel accesses
+	 * the `from' page through the kmap kernel mapping and the `to'
+	 * page needs to be flushed since code can be copied.  As a
+	 * result, this implementation is less efficient than the simpler
+	 * copy using the kernel mapping.  It only needs the `from' page
+	 * to flushed via the user mapping.  The kunmap routines handle
+	 * the flushes needed for the kernel mapping.
 	 *
 	 * I'm still keeping this around because it may be possible to
 	 * use it if more information is passed into copy_user_page().

--Apple-Mail-20-14856818
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-20-14856818--
