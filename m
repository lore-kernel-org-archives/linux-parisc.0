Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BB40F75D
	for <linux-parisc@vger.kernel.org>; Wed, 14 Oct 2026 03:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950361; cv=none; b=YJQ9YxAJBUdvJHjRNAoCzaXyQd0DO/7B49Sp/Az1CRNqcn/u6pCpyyXwwns3vUpAM53J2lxwi8MR1jbCXF+hLTGFsYWovy/3B/WCraSIBwQ/9ty66WJq73oxz9fKmsbpSX3/xGY14MKPhud7Tyoelbozxtsg3+D/NdEPOHnzp70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950361; c=relaxed/simple;
	bh=eo2KS1rD2mthJFfkPWGzxyjARkBBzJ1ObzuNrYesD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpCEgyDNpo5JroxPiOd8zOo8cKtoKEm+0+7+0i0Skw2kpC3XKRP64MMn+zapZWLoI14moKy0HRQ/x7x4Djm5FU2G2Oi6GwJ/Nolm0UlLCloQbpvNUPglo80YQv6IPshkPMhKQ+Kshc0vGeyA2HHJQTywrATcHK0N1A8zB6XanTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ajkvbjk3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ajkvbjk3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2634747a91.2
        for <linux-parisc@vger.kernel.org>; Tue, 13 Oct 2026 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950358; x=1792555158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=ajkvbjk3kTPfvCqcZGv4EJqKjl+5/xxRCJuc52x+TJywPi/B9lU7YuQiSJvhgrdZFS
         ZCqGSfrf5efC82Vl+nSlFwfDM8PcreOEcIMxYFLkZrGBQinbjcZFV3cn95wzsuFAKNHu
         c9EXuJyOrgR43wPTICZCiqx5zbn10VaDruDFaTZfhr7STZmLeLqeWpOaTxV+GdLRUa+P
         LGG2A4hNTeO0nvLe6CVn+adZh+nalPuwJGwWWc9+5jMH2ejXNhIY1ByllNNuX1r2oUCu
         DgUfkyOmM15luwL/Gz0oEp/tEOp7ECgdgo6JMC9cruIIn3aGKDIvi7a1+d8e7OmPq/32
         gXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950358; x=1792555158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5STA7RRpF0bZE7yNESPvMRAN/jMwPnFqOs2b9BGo7gc=;
        b=U0yX3kEvUnmGnwh180r+40cwhMltXbCUNtHiCM9ZmdxlH1fseiaVJwQED00usid25k
         JZ/2kvFiRfnGPc/XKY/SfUAFlNbKITXZUzFxKNlxPYGjXkLSbeTiNguZlq5B6nkhEiam
         SBh/pDBWqh8jNKJxMr35uTFSpjzCtPmc3gXwxn0OBrZhnruQAcsupyKuxe8QvMFHVZdP
         8xrtafBwD0Ij4bB1+axUXS9Wm9BHKjFlJKw19824pNPItlBA0qO+vAQ/sAFm6mhLx7XH
         8z2FgohAQzAMMU7uFilFJgmTZSpUwUmANvjVM39pUJUGkXnVxdItfrsKHo2nNM8yGuwA
         vvQQ==
X-Forwarded-Encrypted: i=1; AKwUvBylatm4V7FPApNowqcfgx4z0mT1S9u9KSYjTMIHxZhifaSsAyqfPDhshpNCbu0g2tQRLhP4zGm0louddjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGO6ZzeRUERg+YNNRwPl7l8IxdKd644YUH4jgNhR+Bb6Fp4bFf
	DR54Opog487U6sotMvrV4RutdkQYxOXqdVmH8sD1wT5nO7q96OEhhLPnsug8cXHpHnU=
X-Gm-Gg: AYBFou3E1TGHB1UeI1+x5f1YV7rzr3coVhBJjO9IEmFCCGeN6g7jO6wJJMJDZ1zFeCL
	m/yX9Nt8pxrPAn9UIBegS0S5FKFfzV0LgDroorH7z9a9Bow+NmC2t7v//Izk+KtGAhdFQQeDaP/
	HXDBOYOssNnxbxphMUlD3HcBZWymknvN92p64go6Hv99luh+spsek9jrlr6Rvpuf2Jmrx4STdYn
	x4gEzlSj4T/maFRiKMRmDC9AZbKKEOI+10bLKOhfoK/Gui6qUSzjNMMP1OMNqBakCl8sIXLNvjD
	sRmYyiqjwxyUFIOrjxd7VvtUs/szOdj1UMAPl5K2nhS06Z3mZBQPqUT19QxlZJEOhs+eC9wnmeq
	ZobAMHLlM/T88OB47G0obTYLjIGQnzHuuBDh1PrTxyCC3UDYrAHpLhUt/cMtcChN/dN3EHsmSET
	QFTGQ/a1MaKkBhUIuNbJvEMGgyAE1ojTHhCykBQJuAZOe6B95vg+BnumL9U5Dc9nIqMVDU5nqSZ
	oc/aCvgKa6hn5f8TVOP
X-Received: by 2002:a17:90b:4c8a:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ac63bfe81amr1395913a91.41.1791950357376;
        Tue, 13 Oct 2026 20:59:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:16 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mm: Generalize page table allocation helpers
Date: Wed, 14 Oct 2026 11:59:07 +0800
Message-ID: <20261014035910.687847-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subsequent series will switch runtime vmemmap population to the
generic page-table allocators. Since vmemmap tables belong to init_mm,
the allocators must select GFP_PGTABLE_KERNEL and mark the ptdesc as a
kernel page table.

Some architecture-specific allocators do not preserve both semantics.
LoongArch and MIPS choose PMD/PUD GFP flags without checking the mm,
which can charge kernel PMD tables to a memcg and leave user PUD tables
unaccounted. The private PMD/PUD allocators also omit kernel ptdesc
marking.

Rather than duplicate this handling in each architecture, extend the
generic PTE, PMD and PUD allocators to support architecture
initialization hooks and non-zero table orders. LoongArch, MIPS and
parisc can then drop their private allocators and inherit the generic
GFP selection and ptdesc handling.

This series only prepares the allocation interfaces; the runtime
vmemmap conversion will be submitted separately.

Muchun Song (3):
  mm: generalize kernel PTE table allocation
  mm: generalize PMD page table allocation
  mm: generalize PUD page table allocation

 arch/loongarch/include/asm/pgalloc.h | 48 ----------------------------
 arch/mips/include/asm/pgalloc.h      | 40 -----------------------
 arch/parisc/include/asm/pgalloc.h    | 17 ----------
 include/asm-generic/pgalloc.h        | 29 ++++++++++++++---
 4 files changed, 24 insertions(+), 110 deletions(-)


base-commit: ad9f2d463666c64e94b04be5263c9bf8f9f96fb7
-- 
2.54.0

