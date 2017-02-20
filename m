From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove flush_user_dcache_range and flush_user_icache_range
Date: Mon, 20 Feb 2017 14:02:46 -0500
Message-ID: <03680F6B-3051-49E9-904E-74AB3B52FFA5@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-8-356541916
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-8-356541916
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The functions flush_user_dcache_range() and flush_user_icache_range() =
are only used by the parisc
signal handling code.  This code only needs to flush a couple of lines, =
so the threshold check is unnecessary
overhead.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-8-356541916
Content-Disposition: attachment;
	filename=flush_user_range.d.txt
Content-Type: text/plain;
	name="flush_user_range.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/cacheflush.h =
b/arch/parisc/include/asm/cacheflush.h
index 7bd69bd43a01..c7e15cc5c668 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -27,8 +27,6 @@ void flush_user_dcache_range_asm(unsigned long, =
unsigned long);
 void flush_kernel_dcache_range_asm(unsigned long, unsigned long);
 void flush_kernel_dcache_page_asm(void *);
 void flush_kernel_icache_page(void *);
-void flush_user_dcache_range(unsigned long, unsigned long);
-void flush_user_icache_range(unsigned long, unsigned long);
=20
 /* Cache flush operations */
=20
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 977f0a4f5ecf..aedadefc149e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -573,24 +573,6 @@ void flush_cache_mm(struct mm_struct *mm)
 	}
 }
=20
-void
-flush_user_dcache_range(unsigned long start, unsigned long end)
-{
-	if ((end - start) < parisc_cache_flush_threshold)
-		flush_user_dcache_range_asm(start,end);
-	else
-		flush_data_cache();
-}
-
-void
-flush_user_icache_range(unsigned long start, unsigned long end)
-{
-	if ((end - start) < parisc_cache_flush_threshold)
-		flush_user_icache_range_asm(start,end);
-	else
-		flush_instruction_cache();
-}
-
 void flush_cache_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
 {
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 2264f68f3c2f..120eefa39de9 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -232,6 +232,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
 	struct rt_sigframe __user *frame;
 	unsigned long rp, usp;
 	unsigned long haddr, sigframe_size;
+	unsigned long start, end;
 	int err =3D 0;
 #ifdef CONFIG_64BIT
 	struct compat_rt_sigframe __user * compat_frame;
@@ -299,10 +300,10 @@ setup_rt_frame(struct ksignal *ksig, sigset_t =
*set, struct pt_regs *regs,
 	}
 #endif
=20
-	flush_user_dcache_range((unsigned long) &frame->tramp[0],
-			   (unsigned long) &frame->tramp[TRAMP_SIZE]);
-	flush_user_icache_range((unsigned long) &frame->tramp[0],
-			   (unsigned long) &frame->tramp[TRAMP_SIZE]);
+	start =3D (unsigned long) &frame->tramp[0];
+	end =3D (unsigned long) &frame->tramp[TRAMP_SIZE];
+	flush_user_dcache_range_asm(start, end);
+	flush_user_icache_range_asm(start, end);
=20
 	/* TRAMP Words 0-4, Length 5 =3D SIGRESTARTBLOCK_TRAMP
 	 * TRAMP Words 5-9, Length 4 =3D SIGRETURN_TRAMP
@@ -548,8 +549,8 @@ insert_restart_trampoline(struct pt_regs *regs)
 		WARN_ON(err);
=20
 		/* flush data/instruction cache for new insns */
-		flush_user_dcache_range(start, end);
-		flush_user_icache_range(start, end);
+		flush_user_dcache_range_asm(start, end);
+		flush_user_icache_range_asm(start, end);
=20
 		regs->gr[31] =3D regs->gr[30] + 8;
 		return;

--Apple-Mail-8-356541916
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-8-356541916--
