Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA34359A80
	for <linux-parisc@vger.kernel.org>; Tue,  3 Mar 2026 22:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577380; cv=none; b=jp/XG/A3NXPzf+BtFfLGoI2yNoNud/hywVR88AEWNqoaIUQO2qTA32sGdlCYvctifZ/ebDYUyGCfThGrpIxKG1NSXIh4Fpu8jG/ppFrqdE57+BRXxiN2beKivpvjt4ko6BpeXk64/kmcPpKAiDs4ag9TUp+BIHvInsOhMIrAl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577380; c=relaxed/simple;
	bh=b2QQLtGU6unfmtlUMAp//pLlPQY6GyBtuWJHcLefe54=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmIof6EPED7r3oCXW3GjuXHBzXzB/4EJt/PzF96xn/qbaX3y2Ac/LqVWt6jQ2eXh6HvSXx0lnb6VYxuluhNt3tFXRLv+U8p7rw2ZqKd0n+t6Utz/bs1KoOwXpwssOLca28cmLeyBqp79fdnJxY9xrApJT2wSBB7a9k4pkT7Hc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUGGJZsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUGGJZsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBCEC116C6
	for <linux-parisc@vger.kernel.org>; Tue,  3 Mar 2026 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772577380;
	bh=b2QQLtGU6unfmtlUMAp//pLlPQY6GyBtuWJHcLefe54=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tUGGJZsPvsYEsg1niIF6Ljv8tKkfLdVP0OvzNdfL6jMBOdZR9bDPPT1ILHNKzhMQn
	 QcZIsBnEL3Pen3icPUjhlBYfALh55/TC3mJN+HqseUJwOxWqa1naREp1kYgVxLJ8/W
	 jxG1sVyewr84enupfkHfGCLNH8K3wBQ2Hu2q0+hXY/JyyEyFHrqX2oN3i+IPyYmyvT
	 87P3ztLz9zzNgrlbyfGCMngv9pHGA3OMuuTcTrKcK39ZIvToNSH+OkzE88Ng3VtoFb
	 94EhF3cD1aOCvNx8TTPaMim/P/aKKxD9JP9563RJYJCnFKrSUnJ5rWkd1qVjidWQVK
	 LjRbQnJU/CXcQ==
From: deller@kernel.org
To: linux-parisc@vger.kernel.org
Subject: [PATCH 2/2] parisc: Fix initial kernel mapping sanity check
Date: Tue,  3 Mar 2026 23:36:11 +0100
Message-ID: <20260303223611.207646-2-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303223611.207646-1-deller@kernel.org>
References: <20260303223611.207646-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

The check if the initial mapping is sufficient needs to happen much
earlier during bootup. Move this test directly to the start_parisc()
function and use native PDC iodc functions to print the warning, because
panic() and printk() are not functional yet.

This fixes boot when enabling various options of KALLSYSMS.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/setup.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index ace483b6f19a..d3e17a7a8901 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -120,14 +120,6 @@ void __init setup_arch(char **cmdline_p)
 #endif
 	printk(KERN_CONT ".\n");
 
-	/*
-	 * Check if initial kernel page mappings are sufficient.
-	 * panic early if not, else we may access kernel functions
-	 * and variables which can't be reached.
-	 */
-	if (__pa((unsigned long) &_end) >= KERNEL_INITIAL_SIZE)
-		panic("KERNEL_INITIAL_ORDER too small!");
-
 #ifdef CONFIG_64BIT
 	if(parisc_narrow_firmware) {
 		printk(KERN_INFO "Kernel is using PDC in 32-bit mode.\n");
@@ -279,6 +271,18 @@ void __init start_parisc(void)
 	int ret, cpunum;
 	struct pdc_coproc_cfg coproc_cfg;
 
+	/*
+	 * Check if initial kernel page mapping is sufficient.
+	 * Print warning if not, because we may access kernel functions and
+	 * variables which can't be reached yet through the initial mappings.
+	 * Note that the panic() and printk() functions are not functional
+	 * yet, so we need to use direct iodc() firmware calls instead.
+	 */
+	const char warn1[] = "CRITICAL: Kernel may crash because "
+			     "KERNEL_INITIAL_ORDER is too small.\n";
+	if (__pa((unsigned long) &_end) >= KERNEL_INITIAL_SIZE)
+		pdc_iodc_print(warn1, sizeof(warn1) - 1);
+
 	/* check QEMU/SeaBIOS marker in PAGE0 */
 	running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
 
-- 
2.53.0

