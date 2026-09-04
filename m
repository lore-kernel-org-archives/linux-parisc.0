Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E237A829
	for <linux-parisc@vger.kernel.org>; Fri,  4 Sep 2026 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524020; cv=none; b=ixJCwto8tVLvqaeTjEQeM37gpE/RcpvdqsjbmqNPzcw6GA9V2HtnNZHuXj+czHGJjiTzYCIrJQ2/9zTObllI4zSuEkqpBlzjlXwRUfxJmCeZhVgPoL9QwkFJk87CWarWRThw68c/MPMI4dhWLeizNENFuMFINmJsWkGXwCcqHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524020; c=relaxed/simple;
	bh=1u6/EMRTa8tz41IdzgfjnzF7CkxxXk1pyfZ97JneKMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTjB9xc8IUCVTXGHTXA4IVWP20+VntPnwB2sfcPD6k1E1jyV6LEFS+EKONR6Ij7zZkAYKUoeIBPCy/tczAXXDDXnSeFpGxsjYYokZjOuoy3HaTAR9rC5Xb8rclcbOx9OstjdLHLLhHNKRk+OjHBtlpFRlyJEx4eWFc16O8IfjKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZkrOQVG; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZkrOQVG"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1497f0453so696878eaf.3
        for <linux-parisc@vger.kernel.org>; Fri, 04 Sep 2026 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524018; x=1789128818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIo4bPJ9SfRkauZwwJTkYue9aHFLRcYCEIj23gks7mM=;
        b=DZkrOQVGWI8nXA565rWLFRg+CSoZtUpaHhI06wudEZFuHPb7rsM30t/VYQuCf/ULA5
         2JaIyYxykBHTPH5erw+aD36LKYp0Ye5vyWsQA9TlIIF3yLfGINgWxVQUreb6aT+3gQjc
         LNw5vQCNCJqRf7aoM/Uku2195FENJRIlF0w8dO6GcuGTRqH3kECfNyhEv9kzuBcc4KMb
         FkTPD/L1i4uHh4LRdmoh3yr/yld6Zy9E/T/OkDhw1spw6XjcN7O+5bXYSHM8LKZ3iPEb
         6xNVxx6W7w/XdCcnwE4CLzFnBApg7bh8vhCRC5iG01m8UdzqxLvePqXq4yFfKm/a1oY6
         tXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524018; x=1789128818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIo4bPJ9SfRkauZwwJTkYue9aHFLRcYCEIj23gks7mM=;
        b=qARN7QnNRHw4X/4IQAvJBYCS9Jeq1yW94kgifg1HSIpyUoD5DVi4W5ElAwSxqI9dNa
         AGXHbqp1JFbx8nmdhys3UPAvmE19SjH3hHByLwKmt1A+RnT6q3kguIw68nPyrPijS9vs
         6LP7a8gvi8IbmeUgEeA2I+aJ0UElku+83foE52apWcH0JVLtA4knBI2bLPFh+BlGJU0/
         O6p7/TukrpV+kEZcHXEz8vqvU+BHMhgToDJK33l2cqNIfPwv2dtY4MJLHy/oB6Q5RTMd
         Ty+/CqEpMUMayXNUCOwfsPgC7Fu1WPCOmch1W+Yu9a3i64vl0q/Cu6WaJWd6n7SG3lgA
         M29w==
X-Forwarded-Encrypted: i=1; AKwUvByXlQPbm+wgscgMimjOw8Zi1oR1TvVtiHuDjFq8u6OtzNQdI2uACSjUAt1dVvSCUwMxpVjGQRG7VT99NUI=@vger.kernel.org
X-Gm-Message-State: AFuF++k36lBh/ugmn8357V7VG0KFIbVT3sUsuRrDRmNFsU8CKWSqefiB
	lXfRpj387sslcwVODMW2HdRolyP1n4yEclgzfRsFSz2m7HKeCJF+fF2i
X-Gm-Gg: AYBFou3fhzLR71y+lxfjZJIH1vKvnqZ2iSactaan2UFh90KUzT/6Y0g+GxQ+1w0PHO5
	9kJ9cgSeqcPEoRThV6ZRmzkMbWFUyrC/RwmjmPefIzJKrSG5FCvZtLxvEcLF9KGDS6RakN1sRIT
	tv32SXO8Rj41hzFZo8HNDSgedeuPrhQWkdy18BijLQpLDbRhD3YmkWZab7cMEKVRbZFYae8olrU
	2/NP2H5DMq2fNpqivOM6ssWli9VqoMocITsHIy7zZ5LdmWjsLCB1pw+3l3wlgUmop6MJrXxLjCC
	g3ZcMi2dSm8qTmRdPXo7hbDgDEkyei4+Tsc9/KuU1upZoUrplx5E8p5NVdmU0qtfZ8jN/FnUZbk
	g/PfeiDcxu2KLUg2B+rHfM1gYHOyFAIsUGVN7lnysplC9gwKy9ez5CXCLGeJz8kX+hu3OcktD/I
	XmrhSPfM6ZUrA9PcIXsv8jAlXxGNj9lXdilQqL/ZUi10Pl7aLFDdMgy7C2tltY4oFi5uLzja6b2
	E8WrgTfzKQA1dQMy58uqST3XGzeQaiw/YSUsw==
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id 006d021491bc7-6b746fa1a6bmr2188478eaf.55.1788524017796;
        Fri, 04 Sep 2026 05:13:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6241225eec.27.2026.09.04.05.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:13:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: fix typos in comments
Date: Fri,  4 Sep 2026 17:43:28 +0530
Message-ID: <20260904121332.23565-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/parisc/include/asm/pdcpat.h        | 4 ++--
 arch/parisc/include/asm/special_insns.h | 2 +-
 arch/parisc/include/uapi/asm/mman.h     | 2 +-
 arch/parisc/kernel/perf_images.h        | 4 ++--
 arch/parisc/lib/memcpy.c                | 2 +-
 drivers/parisc/ccio-dma.c               | 2 +-
 drivers/parisc/dino.c                   | 2 +-
 drivers/parisc/pdc_stable.c             | 2 +-
 drivers/parisc/sba_iommu.c              | 2 +-
 drivers/parport/parport_gsc.c           | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/parisc/include/asm/pdcpat.h b/arch/parisc/include/asm/pdcpat.h
index ec97eefa4ef6..6014fa004b89 100644
--- a/arch/parisc/include/asm/pdcpat.h
+++ b/arch/parisc/include/asm/pdcpat.h
@@ -54,7 +54,7 @@
 #define PAT_GMMIO           2         /* > 4G MMIO Space */
 #define PAT_NPIOP           3         /* Non Postable I/O Port Space */
 #define PAT_PIOP            4         /* Postable I/O Port Space */
-#define PAT_AHPA            5         /* Addional HPA Space */
+#define PAT_AHPA            5         /* Additional HPA Space */
 #define PAT_UFO             6         /* HPA Space (UFO for Mariposa) */
 #define PAT_GNIP            7         /* GNI Reserved Space */
 
@@ -292,7 +292,7 @@ struct pdc_pat_pd_addr_map_entry {
 * ----------------------------------------------------------
 * Bit  0 to 51 - conf_base_addr
 * Bit 52 to 62 - reserved
-* Bit       63 - endianess bit
+* Bit       63 - endianness bit
 ********************************************************************/
 #define PAT_GET_CBA(value) ((value) & 0xfffffffffffff000UL)
 
diff --git a/arch/parisc/include/asm/special_insns.h b/arch/parisc/include/asm/special_insns.h
index 1013eeba31e5..9a54df5eb4f4 100644
--- a/arch/parisc/include/asm/special_insns.h
+++ b/arch/parisc/include/asm/special_insns.h
@@ -34,7 +34,7 @@
 
 /**
  * prober_user() - Probe user read access
- * @sr:		Space regster.
+ * @sr:		Space register.
  * @va:		Virtual address.
  *
  * Return: Non-zero if address is accessible.
diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index b6a709506987..aca942f1386c 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -55,7 +55,7 @@
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
 #define MADV_NOHUGEPAGE 15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicitly exclude from the core dump,
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
 
diff --git a/arch/parisc/kernel/perf_images.h b/arch/parisc/kernel/perf_images.h
index 7afa2fd550bf..6fd5b3c434f1 100644
--- a/arch/parisc/kernel/perf_images.h
+++ b/arch/parisc/kernel/perf_images.h
@@ -574,7 +574,7 @@ static uint32_t onyx_images[][PCXU_IMAGE_SIZE/sizeof(uint32_t)] __ro_after_init
 0xffffffff,0xffffffff,0xffffffff,0xffffffff,
 0xffffffff,0xffffffff},
 
-/* isnt
+/* isn't
  *
  * ctr0: counts the total number of cycles for which iside_notrans is asserted 
  * ctr1: counts the number of times iside_notrans is asserted for 1-4 cycles 
@@ -2645,7 +2645,7 @@ static uint32_t cuda_images[][PCXW_IMAGE_SIZE/sizeof(uint32_t)] __ro_after_init
    },
 
 
-/* isnt image  (Image 13)
+/* isn't image  (Image 13)
  * 
  * ctr0 : Total number of cycles for which iside_notrans is asserted. 
  * ctr1 : Total number of times iside_notrans is asserted for 1-4 cycles. 
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 03165c82dfdb..93d4e17d7e68 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -47,7 +47,7 @@ unsigned long raw_copy_from_user(void *dst, const void __user *src,
 			break;
 		}
 		start += PAGE_SIZE;
-		/* align to page boundry which may have different permission */
+		/* align to page boundary which may have different permission */
 		start = PAGE_ALIGN_DOWN(start);
 	}
 	return len - newlen + pa_memcpy(dst, (void __force *)src, newlen);
diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index dc1b6d11f9ab..a85efc41ce27 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -415,7 +415,7 @@ ccio_alloc_range(struct ioc *ioc, struct device *dev, size_t size)
  * @pages_mapped: The requested number of pages to be freed from the
  * I/O Pdir.
  *
- * This function frees the resouces allocated for the iova.
+ * This function frees the resources allocated for the iova.
  */
 static void
 ccio_free_range(struct ioc *ioc, dma_addr_t iova, unsigned long pages_mapped)
diff --git a/drivers/parisc/dino.c b/drivers/parisc/dino.c
index 4b96d9fda49a..286f4f75dba7 100644
--- a/drivers/parisc/dino.c
+++ b/drivers/parisc/dino.c
@@ -590,7 +590,7 @@ dino_card_fixup(struct pci_dev *dev)
 	dino_cfg_write(dev->bus, dev->devfn, PCI_INTERRUPT_LINE, 1, dev->irq); 
 }
 
-/* The alignment contraints for PCI bridges under dino */
+/* The alignment constraints for PCI bridges under dino */
 #define DINO_BRIDGE_ALIGN 0x100000
 
 
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 16f4496bca95..6b567a74fc2c 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -586,7 +586,7 @@ static ssize_t pdcs_autosearch_read(struct kobject *kobj,
  * @attr: The kobject attributes.
  * @buf: The output buffer to write to.
  *
- * The value of the timer field correponds to a number of seconds in powers of 2.
+ * The value of the timer field corresponds to a number of seconds in powers of 2.
  */
 static ssize_t pdcs_timer_read(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buf)
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index e0a148ab5876..ecc7bb7a8468 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -599,7 +599,7 @@ sba_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
  * corresponding IO TLB entry. The Ike PCOM (Purge Command Register)
  * is to purge stale entries in the IO TLB when unmapping entries.
  *
- * The PCOM register supports purging of multiple pages, with a minium
+ * The PCOM register supports purging of multiple pages, with a minimum
  * of 1 page and a maximum of 2GB. Hardware requires the address be
  * aligned to the size of the range being purged. The size of the range
  * must be a power of 2. The "Cool perf optimization" in the
diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index e5e8054a1af8..0a9f7fdb25bc 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -348,7 +348,7 @@ static int __init parport_init_chip(struct parisc_device *dev)
 	 */
 	if (boot_cpu_data.cpu_type > pcxt && !pdc_add_valid(port+4)) {
 
-		/* Initialize bidirectional-mode (0x10) & data-tranfer-mode #1 (0x20) */
+		/* Initialize bidirectional-mode (0x10) & data-transfer-mode #1 (0x20) */
 		pr_info("%s: initialize bidirectional-mode\n", __func__);
 		parport_writeb ( (0x10 + 0x20), port + 4);
 
-- 
2.48.1

