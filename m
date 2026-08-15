Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91931A56D
	for <linux-parisc@vger.kernel.org>; Sat, 15 Aug 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787971; cv=none; b=N2LYqzwh1QIX2BCptmydMvT87P3Oc98LvD0kfQCvB2/bJSKdH+/yQ8GQrXpaGUaC3kssSXtFJHDhrqMnxQAoKpGPb53bhRTSZPjxynbZmsXsibg91BnRAbuE/W/RYYuXhAYTG53eqR+ynxkwJKyNnIQQlZBKSZYi5HwBxIkI91M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787971; c=relaxed/simple;
	bh=jhlvutSNqEUs4kZCLmsc+iF5Z9fzHkCBarzlAtnMr5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7B63j2DWvEgffTQsZeQIqC+Zro8JthGNfgFn8S5zSB16NDWxCcPHITOWkmIt0sW8FfOp1VV/uFgeo4Vs1vgimiihSVh0Ok1ttsMD4urwwCf1qp0DV3mpuyt3Dk5YFQZOdNsXgpS3gSgQ6B5pEQJ7f5rnViZDOVdxvPkWqc5oKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyDYurii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyDYurii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8655F1F000E9;
	Sat, 15 Aug 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786787970;
	bh=QMyqE57/HZdV2MSCXQO9qQf5Nr2spRVqHxzP5zzBrl8=;
	h=From:To:Cc:Subject:Date;
	b=cyDYurii2fJvbroffahS5cYUr3Wat5HtnZtqD3LV/VKN4qbaqMIIJgzACu/L3qo1l
	 8HUHxtE6mNQKyBQFm4l9m/EPnZ5GIoHgvs/iWcNtroJgFQF4faeGZF/K3ESjkHe3Iu
	 7JxAJsFKARmry959GkdoSp+7LPHs3HHfj+aJF+C612Mmd2yFkSlkklr/7m83A5/TAd
	 20EC21IIil1ILag6v8mFSnCy/MV1nzrWhxXSTbdwrn7KFjVMW6f8sj9ReCRZxNb69M
	 KvaRXDBvXjODb1S0DReYzBJUNrY7nlYHva8697fIMXDwszHAzvbW6N9QIiSVaOVkAa
	 6xZ8WNdSryvQw==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: deller@gmx.de
Subject: [PATCH] parisc: Ensure proper alignment of assmbler statements in head.S
Date: Sat, 15 Aug 2026 11:59:20 +0200
Message-ID: <20260815095920.19171-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

All assembler statements need to be 4-byte aligned. Prevent a possible
misalignment if someone changes the preceeding string and it's length is
suddenly not any longer a multiple of 4.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
---
 arch/parisc/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 9188c8d87437..e84d7d6e1eb9 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -105,6 +105,7 @@ $iodc_panic:
 	or		%r10,%r10,%r10	/* qemu idle sleep */
 msg1:	.ascii "Can't boot kernel which was built for PA8x00 CPUs on this machine.\r\n"
 msg1_end:
+	.align 4
 
 $cpu_ok:
 #endif
-- 
2.54.0

