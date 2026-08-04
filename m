Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B9442B2B;
	Tue,  4 Aug 2026 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857423; cv=none; b=FgEiZQWo7fQwOPIlQNghV3d06dfCz6unOi1mJv3zzE0+3haABRDp7/hEMzqLUHDStzL7hzvmn9LPvrztvg2w/t20Xc8qyQfYO1CamzXDHFqgiWWYDz/MuQJaUAPLvCTa57q65I/JtVR24VIWFSrIzHLoWJhMFFRloBdo9q3+RdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857423; c=relaxed/simple;
	bh=TmqjryNyLrn47s2Kw2pnOI4VrlvNWvgvbPaRFAr1DJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+JrnxmKTfTOk2NxrIKuOtiBtu3vvaRh9vdJwEInf92pX44vJc/rkawfo3DaPMGc/Wr8IUMME6cNEp7Z2dUQay7mblyu3O+VWJhJCimmvpA2VDY3u5dfYDTTzbKf8ZstsJKvuIfrwhuz6xGq08Oc2A4lz+VlNxmRai+cnwbnoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NuPYo72X; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NuPYo72X"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785857416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mp3dJMEnXXRO2Me4Gch5/mhP6/YCvz89fHrUtk+/R/M=;
	b=NuPYo72X60AIgci9V8RGGyjVVIQOIljEu7FQVw93ngRfgzRWKErfTgkeoPKYGlBuDuMWOO
	cZ+mZGir7QkggzejTvlrrrIJU8skGkXuSMiyTe2iihjAzYdN7+sXiJkZOCtEp5M29XWiil
	jZgweYRB9QiOXNVBrDoeBSnetfP3yk4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH v2] parisc: Use asm-generic/serial.h
Date: Tue,  4 Aug 2026 17:29:55 +0200
Message-ID: <20260804152953.136376-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=thorsten.blum@linux.dev; h=from:subject; bh=TmqjryNyLrn47s2Kw2pnOI4VrlvNWvgvbPaRFAr1DJ8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlFrIV7Hp2qnGRYxeB0YuvaD9Kp0m6l7367/VhjxHa+b P1v613sHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRcg2GP5wvtb5P1P+V/2sH u3ZF2ZQluYEHP1wVtf07cVL6u8xbtWcZGW6wvn14co04u9yUqRkFeeozGH1fq0hM5ZYu4J7LdOL OCmYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

asm/serial.h only redefines BASE_BAUD with the same value as
asm-generic/serial.h. Select the generic header from Kbuild and remove
the arch-specific header.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Delete the header and use Kbuild instead as suggested by Helge
- Reword subject and patch description
- v1: https://lore.kernel.org/r/20260804132051.104647-4-thorsten.blum@linux.dev/
---
 arch/parisc/include/asm/Kbuild   | 1 +
 arch/parisc/include/asm/serial.h | 8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 arch/parisc/include/asm/serial.h

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index d48d158f7241..4fc315085914 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -6,3 +6,4 @@ generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += ring_buffer.h
 generic-y += user.h
+generic-y += serial.h
diff --git a/arch/parisc/include/asm/serial.h b/arch/parisc/include/asm/serial.h
deleted file mode 100644
index 77e9b67c87ee..000000000000
--- a/arch/parisc/include/asm/serial.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/*
- * include/asm-parisc/serial.h
- */
-
-/*
- * This is used for 16550-compatible UARTs
- */
-#define BASE_BAUD ( 1843200 / 16 )
