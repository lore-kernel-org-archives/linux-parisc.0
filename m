Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1BB3D3326;
	Thu, 30 Jul 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404733; cv=none; b=gvHBnblZFsidCDjPTE+6IeDwVplIXN65+f4c3HJ/+mgrhaLupHZbCT6oIDZUOdrA9JnuVa3ks3d9zgSvxakK7NYMDSnYH6DLn/PgW4Smsfmif9IPy4J0Q/FBHGZOER99dJz9+MlX2M6ZeLOmw33yslTXDHbRmBTOWXzRzSgud64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404733; c=relaxed/simple;
	bh=LSIdtHTCisLn+5yAWw3TzzyRYDq3lUr949psgtaeMq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buhtNUt3V4+4nmBvIkGhUL+ZOJD6wpwEIrimvLhQZmd0c9TELl0BlUT4RcXqs0rBvf8mJJJ/CrtHZhq+U6C/fQ7P4l1bDtVuT7qKlZHn0/wdSC+7FSnKcLEqgPLDXFD7AbFjkIY8LjB55RXime03s71tiP1Ql+T3YKF105+4w5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uyhx6yMb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uyhx6yMb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 769021684;
	Thu, 30 Jul 2026 02:45:25 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABF683F763;
	Thu, 30 Jul 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785404729; bh=LSIdtHTCisLn+5yAWw3TzzyRYDq3lUr949psgtaeMq8=;
	h=From:To:Cc:Subject:Date:From;
	b=uyhx6yMbGK4jULkEU5ipqBRkWMMCVoCor5HtxoAzpSWmG5F0jhmtjVEAd5813RVt3
	 BcAV94v71Oc8js3DHo0yA7lUiU1W8N5eK1Ds3wJSD/VRuLzl+H0Zw/c5GQRsKkZZ/h
	 CdSB/mADMD21j/sXUJfyhkbyXBbJS5s+2gdLANdQ=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: sba_iommu: Remove dead DEBUG_DMB_TRAP code
Date: Thu, 30 Jul 2026 10:45:00 +0100
Message-ID: <20260730094501.3002718-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEBUG_DMB_TRAP is unconditionally undefined, so the guarded
declarations and calls can never be built. The declared iterate_pages()
and set_data_memory_break() functions also have no definitions in the
tree; removing the #undef would therefore leave unresolved references.

Remove the unused option and its guarded code.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 drivers/parisc/sba_iommu.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index d9339dd508262..e0a148ab5876c 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -66,7 +66,6 @@
 #undef DEBUG_SBA_RESOURCE
 #undef ASSERT_PDIR_SANITY
 #undef DEBUG_LARGE_SG_ENTRIES
-#undef DEBUG_DMB_TRAP
 
 #ifdef DEBUG_SBA_INIT
 #define DBG_INIT(x...)	printk(x)
@@ -1695,12 +1694,6 @@ sba_common_init(struct sba_device *sba_dev)
 
 	for(i=0; i< sba_dev->num_ioc; i++) {
 		int res_size;
-#ifdef DEBUG_DMB_TRAP
-		extern void iterate_pages(unsigned long , unsigned long ,
-					  void (*)(pte_t * , unsigned long),
-					  unsigned long );
-		void set_data_memory_break(pte_t * , unsigned long);
-#endif
 		/* resource map size dictated by pdir_size */
 		res_size = sba_dev->ioc[i].pdir_size/sizeof(u64); /* entries */
 
@@ -1715,12 +1708,6 @@ sba_common_init(struct sba_device *sba_dev)
 
 		sba_dev->ioc[i].res_size = res_size;
 		sba_dev->ioc[i].res_map = (char *) __get_free_pages(GFP_KERNEL, get_order(res_size));
-
-#ifdef DEBUG_DMB_TRAP
-		iterate_pages( sba_dev->ioc[i].res_map, res_size,
-				set_data_memory_break, 0);
-#endif
-
 		if (NULL == sba_dev->ioc[i].res_map)
 		{
 			panic("%s:%s() could not allocate resource map\n",
@@ -1752,14 +1739,6 @@ sba_common_init(struct sba_device *sba_dev)
 				*p_start++ = -1;
 				
 		}
-
-#ifdef DEBUG_DMB_TRAP
-		iterate_pages( sba_dev->ioc[i].res_map, res_size,
-				set_data_memory_break, 0);
-		iterate_pages( sba_dev->ioc[i].pdir_base, sba_dev->ioc[i].pdir_size,
-				set_data_memory_break, 0);
-#endif
-
 		DBG_INIT("%s() %d res_map %x %p\n",
 			__func__, i, res_size, sba_dev->ioc[i].res_map);
 	}
-- 
2.47.3

