From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Fix cache coherency for copy/clear_user_page
 operations
Date: Sun, 02 Jun 2013 11:11:55 -0700
Message-ID: <1370196715.1977.28.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP5D57135C2483B5BA307F2979C0@phx.gbl>
	 <1370196125.1977.26.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1370196125.1977.26.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-06-02 at 11:02 -0700, James Bottomley wrote:
> On Sun, 2013-06-02 at 12:09 -0400, John David Anglin wrote:
> > As noted by James E.J. Bottomley, we need to purge the kernel TLB  
> > entries used when copying/clearing
> > to user pages on PA 2.0 systems that require cache coherency.   
> > Otherwise, we generate inequivalent
> > aliases and incorrect cache operation.
> 
> What I meant was we have to remove the tmpalias tlb entry at the end of
> the tmpalias operation.  This means in the asm of pacache.S.  Like the
> patch below (untested because all my boxes are currently in a shipping
> container on the docks at Seattle).  

Let's try with the patch this time

James

---
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 36d7f40..9f0a377 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -686,6 +686,9 @@ ENTRY(copy_user_page_asm)
 	 */
 	addib,COND(>),n	-1, %r1, 1b		/* bundle 10 */
 	ldd		0(%r29), %r19		/* start next loads */
+	/* move back to the page for the purges below */
+	ldo		-256(%r29), %r29
+	ldo		-256(%r28), %r28
 
 #else
 	ldi		(PAGE_SIZE / 64), %r1
@@ -735,6 +738,19 @@ ENTRY(copy_user_page_asm)
 
 	addib,COND(>)		-1, %r1,1b
 	ldo		64(%r29), %r29
+	/* move back to the page for the purges below */
+	ldo		-128(%r28), %r28
+	ldo		-128(%r29), %r29
+#endif
+
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+	pdtlb,l		0(%r29)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		0(%r28)
+	pdtlb		0(%r29)
+	tlb_unlock	%r20,%r21,%r22
 #endif
 
 	bv		%r0(%r2)
@@ -799,6 +815,7 @@ ENTRY(clear_user_page_asm)
 	std		%r0, 120(%r28)
 	addib,COND(>)		-1, %r1, 1b
 	ldo		128(%r28), %r28
+	ldo		-256(%r28),%r28 /* move back to the same page */
 
 #else	/* ! CONFIG_64BIT */
 	ldi		(PAGE_SIZE / 64), %r1
@@ -821,8 +838,17 @@ ENTRY(clear_user_page_asm)
 	stw		%r0, 60(%r28)
 	addib,COND(>)		-1, %r1, 1b
 	ldo		64(%r28), %r28
+	ldo		-128(%r28),%r28 /* move back to the same page */
 #endif	/* CONFIG_64BIT */
 
+#ifdef CONFIG_PA20
+	pdtlb,l		0(%r28)
+#else
+	tlb_lock	%r20,%r21,%r22
+	pdtlb		0(%r28)
+	tlb_unlock	%r20,%r21,%r22
+#endif
+
 	bv		%r0(%r2)
 	nop
 	.exit


