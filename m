Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6793A759E;
	Tue, 28 Apr 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390729; cv=none; b=l2xavikMffLsR/7M6aLtb5ZMHKtSi48798llsvBFuwY91KSNYIYasecexrbdK6mdrQ6INU5K8BtJAA29crjbqNU6+Io5vZKXXBYdlTfo5RQHj2FfcY7OQsjIQg3EkyJQ3qqxy2MfVxl47/QN4zU1YBkW5rKqLYPoe4KBxY5eAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390729; c=relaxed/simple;
	bh=lx06sFe8fzo+19+xENULk/5hHwybpuAgKDWqflLCQBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OhXTNiRfus7/q5yPx+MmaW9BPDMfk6wB3IGWo9rzNrdDKUbE7sY9yYu1iBnlxdgbr23fGPrYM02PKHUVHdkAjtvWQ3qJVwtcoa+ePHkoKYATGvp8ul+gccnN+cIJMErxaJBuspY8VS+cpcGxXoywmHJiJ9U9uuEApXqGbN8U8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WUGY5N04; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WUGY5N04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777390723;
	bh=lx06sFe8fzo+19+xENULk/5hHwybpuAgKDWqflLCQBc=;
	h=From:Subject:Date:To:Cc:From;
	b=WUGY5N04WcaFbs+Ef0b1X1SVvze06kf/8+GkQc9S/vJ0N17II4VBQwknMdqR66UVA
	 JcNjk1VS2PB3yNtR7y2YMhPqoQPZQHzt1gHM/7gduaQZ9trYeSoF0aZZnePXVDDsN9
	 pc93P6Uh0fnXaEfm6NKVjzWkumfkbELANtZiMAog=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v5 0/2] tools/nolibc: add support for 32-bit parisc
Date: Tue, 28 Apr 2026 17:38:28 +0200
Message-Id: <20260428-nolibc-hppa-v5-0-d843d573111a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OQQ6CMBCF4auYrq2ZtlMKrryHcUHr1DYxQKiix
 nB3CyuIxuX/kvkyb5aoj5TYfvNmPQ0xxbbJobcb5kLdXIjHc24mQWooAXnTXqN1PHRdzUsnlLE
 A5Lxk+aLrycfnrB1PuUNMt7Z/zfggpnVyCkAwK2cQHLg3YFFD5RDrw4NiSsmFe9g1dGMTNsglU
 K4BmQHjCQGdLQSpn4D6A6gMVIXwymi0GoqfAC6Bag1gBiSS9krUINX3B+M4fgDyGfqabgEAAA=
 =
X-Change-ID: 20250804-nolibc-hppa-8c137b00ecf2
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777390721; l=1677;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lx06sFe8fzo+19+xENULk/5hHwybpuAgKDWqflLCQBc=;
 b=2nT0RmUu2haumEB/+K7iIUX5zENvkRmE0XO3v20OdtA6uxdS/Dxmu3BkiDVwdJWk4gOm8r6XJ
 OoMi3tBjyypB/aeCXc/uNqFIyPMBWgSNwOuDHUlJvJpdsaSwYN8943t
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Based on nolibc/for-next.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v5:
- Allow non-constant systemcall numbers
- Mark unused argument registers as clobbered
- Link to v4: https://patch.msgid.link/20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net

Changes in v4:
- Make use of the delay slot in _start
- Reword the delay slot description in the syscall overview
- Specify -M for QEMU
- Link to v3: https://patch.msgid.link/20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net

Changes in v3:
- Drop all changes to the parisc build system
- Link to v2: https://patch.msgid.link/20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net

Changes in v2:
- Fix CROSS32CC fallback when not using CROSS_COMPILE
- Link to v1: https://patch.msgid.link/20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net

---
Thomas Weißschuh (2):
      selftests/nolibc: avoid function pointer comparisons
      tools/nolibc: add support for 32-bit parisc

 tools/include/nolibc/Makefile                  |   2 +-
 tools/include/nolibc/arch-parisc.h             | 185 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c   |  13 +-
 tools/testing/selftests/nolibc/run-tests.sh    |   8 +-
 6 files changed, 210 insertions(+), 6 deletions(-)
---
base-commit: facb4776f65f7fab827733f6e0e3cfc2aaaf434c
change-id: 20250804-nolibc-hppa-8c137b00ecf2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

