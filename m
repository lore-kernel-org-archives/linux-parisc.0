Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DED30B514;
	Sun,  1 Mar 2026 01:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330042; cv=none; b=CLwIMrVtyV7L6T76b/OV88jatCmB8oUvWnZPwidqI0Q5refqlMOcbRuSMGMilCzIXgq8fhW0bxOwqaEYC/u0B7fYMWiBpjqs0XXEug8JfNe7qyokXr3Y2ZFcX2KeVkXU9Oe7ROl8b3nzzdn1PGOFs7fXy1/PKwyrAVTQzlDZpp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330042; c=relaxed/simple;
	bh=Eqlh5XZILYmEfF31pZ7euyGMJtcuPfM9/j4OUurLkq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMC1SZH2i9joZElFXlZS/hk71y0Y4S9FTEdd8hhbmdqz9NvJbUioh7ps7j4QUw9PTnDtIlR4dxLUm8HbG2AIEbS3IyvY1RjZ8gELA2rvBvHLBsxhAJkaWNR91fMz2fvgow3jdHni7qSausfFAOS27GzPP/PBhLESCQ8k/+vmuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTqZFmJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTqZFmJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BF0C19421;
	Sun,  1 Mar 2026 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330042;
	bh=Eqlh5XZILYmEfF31pZ7euyGMJtcuPfM9/j4OUurLkq0=;
	h=From:To:Cc:Subject:Date:From;
	b=oTqZFmJZbXXHdHjtOkkRFx1oD5YuuFo6wInJcF/V4qGw3nZyFk9WgqBDiUd7HKP53
	 nR/9qB7CN0r2CFb4I1MnWwuGyQe4XL+AwCNpj2BZeh0UhzQALRaN//SXRAkzxl6nud
	 HQCUgx1osH2b5bqBuWJFckk5EBpWOmPivKJvYrwhHwxlCG6FFX/aEjyCjnKqLEKBQq
	 CkDaxWxAmIptlgrZWDrrPgZDnGHVfMVD3wwx3RIHKp1n1JX2MnUAo1Q9FDVd5E0xZv
	 A2zXqz0LE2AhfRNgjNSONsionBViQHzo7YhC8mptAT8v5k9q073ub2zjARVyFOFfa2
	 b4uVWNR3XuU0w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
Subject: FAILED: Patch "parisc: kernel: replace kfree() with put_device() in create_tree_node()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:00 -0500
Message-ID: <20260301015400.1720903-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From dcf69599c47f29ce0a99117eb3f9ddcd2c4e78b6 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Fri, 19 Dec 2025 21:19:26 +0800
Subject: [PATCH] parisc: kernel: replace kfree() with put_device() in
 create_tree_node()

If device_register() fails, put_device() is the correct way to
drop the device reference.

Found by code review.

Fixes: 1070c9655b90 ("[PA-RISC] Fix must_check warnings in drivers.c")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/drivers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index 8d23fe42b0cee..809e3c171ad54 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -435,7 +435,7 @@ static struct parisc_device * __init create_tree_node(char id,
 	dev->dev.dma_mask = &dev->dma_mask;
 	dev->dev.coherent_dma_mask = dev->dma_mask;
 	if (device_register(&dev->dev)) {
-		kfree(dev);
+		put_device(&dev->dev);
 		return NULL;
 	}
 
-- 
2.51.0




