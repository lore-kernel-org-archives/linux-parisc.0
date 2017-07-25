From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Extend disabled preemption in copy_user_page
Date: Tue, 25 Jul 2017 17:23:35 -0400
Message-ID: <79E317F6-20E4-4ACE-BB0D-72D628BD3467@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-45-872089055
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-45-872089055
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

It's always bothered me that we only disable preemption in =
copy_user_page around the
call to flush_dcache_page_asm.  This patch extends this to after the =
copy.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-45-872089055
Content-Disposition: attachment;
	filename=cache-preempt.d.txt
Content-Type: text/plain;
	name="cache-preempt.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c32a09095216..85a92db70afc 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -453,8 +453,8 @@ void copy_user_page(void *vto, void *vfrom, unsigned =
long vaddr,
 	  before it can be accessed through the kernel mapping. */
 	preempt_disable();
 	flush_dcache_page_asm(__pa(vfrom), vaddr);
-	preempt_enable();
 	copy_page_asm(vto, vfrom);
+	preempt_enable();
 }
 EXPORT_SYMBOL(copy_user_page);
=20

--Apple-Mail-45-872089055
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-45-872089055--
