Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958EA37C10F;
	Wed,  8 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672371; cv=none; b=qClm+8NR5KYqE/4G4TQal0a+CLDfJHD3GFH5cuXamfNyW992SrGaTMlUBFs/oNp3VWYA+ideBFv8CgoF56qYMf25nw8/2OQeTIB1uy4YYMO+5ZF3upJHZ6I+uZt8o6+RkhRoMehriTxvrVN4PX8Ix6L8JV1yca2sRycJQ92XQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672371; c=relaxed/simple;
	bh=s06XBLpSL+rwqqwyam/A1r1e1Ie5R+UfLtgkng9N8Ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PNGH6nVVTOmVmjNPCcE0f0iThXeCLmBM5ulbtJA0L+T02vZkd68lceNUObzJc+H55lleNN2UngeE0HlXHSnz64pLrQU+/o5YrT/1ppNchPFRCmVTkaodAnFXArrrCd7Ud+8IwZEHyhb3lVOLbuZtlrPkvLF14nGo4OW6v8hy5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GtXW4HZh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GtXW4HZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775672361;
	bh=s06XBLpSL+rwqqwyam/A1r1e1Ie5R+UfLtgkng9N8Ck=;
	h=From:Subject:Date:To:Cc:From;
	b=GtXW4HZhSWnxyhIBN7Ko75v58D2XBMbCTk5pEaCgk/lEl/tyMTZ4+93hsyYmTNZ6h
	 CjGC+VE3mi9swjOtYXjvdwbX0oWX0k+fHilKTArzV5sdYJnSNCP7C1i/2BGCnJTY03
	 VjKh7d8mV42+vEOZocfd618Wffkr4zPW2ATTykhM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] tools/nolibc: add support for 32-bit parisc
Date: Wed, 08 Apr 2026 20:18:40 +0200
Message-Id: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMQQ6CMBCF4auQWVsz1GKRlfcwLKAOdhLTkg6ih
 nB3CzuX/0vet4BQYhJoigUSzSwcQw59KMD5LjxI8T03aNQV1mhUiE/unfLj2KnalSfbI5IbNOT
 HmGjgz67d2tyeZYrpu+Nzua2bc0aD9s+ZS4VqsNibCi/OmO76JhYR51/+GGiCdl3XH0L7aj6rA
 AAA
X-Change-ID: 20250804-nolibc-hppa-8c137b00ecf2
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775672360; l=1269;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=s06XBLpSL+rwqqwyam/A1r1e1Ie5R+UfLtgkng9N8Ck=;
 b=s5cq7mBoVV2CxCJ6m0C2IbxhD1BCTSIWHm2YZel6oEDXb25/TK56EX/y0Rv4oxdRwtYgYKui/
 9KgsaZoEFunCgyvZL5gKxg8CnTxy1hoLxuPxeb7Re1cC9a2pdNuCl7V
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Fix CROSS32CC fallback when not using CROSS_COMPILE
- Link to v1: https://patch.msgid.link/20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net

---
Thomas Weißschuh (4):
      parisc: Makefile: move CROSS_COMPILE detection before CROSS32CC one
      parisc: Makefile: use the regular compiler to build a native 32-bit vDSO
      selftests/nolibc: avoid function pointer comparisons
      tools/nolibc: add support for 32-bit parisc

 arch/parisc/Makefile                           |  24 ++--
 tools/include/nolibc/Makefile                  |   2 +-
 tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c   |  13 +-
 tools/testing/selftests/nolibc/run-tests.sh    |   4 +-
 7 files changed, 213 insertions(+), 16 deletions(-)
---
base-commit: 65191c9bf8fdd00f8fe90e2caab330418eefb786
change-id: 20250804-nolibc-hppa-8c137b00ecf2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

