Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748AF3C343F;
	Thu,  9 Apr 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735733; cv=none; b=rpSXwWhCVv+uP7f0CpR9oO2zu8yZAJ94VLg1ZFvVy1CfAUP95hQQLuJE0nj9ul+VPSqc0Sw87GdycqfYX9i16LTP8MWqauDU/6CnIpZUhPJKRmfho0uQKV9T+KxZM2PXBZAR4WILOTFgVm01X1VgSoIdAOVp2nKi4SpxZCkrWu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735733; c=relaxed/simple;
	bh=zeViHfjIPs+i4Db3O8OwEV0mX2TQtgm8BTIvwfr7j5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YoHgy7xa+MBFo+rEZShr/BmhFuaqYKS4bX4voSMJt+FU5lFboIN9WMrSArmyC7izXF4ZhVwRhj4M10aXYgbB2BJb8Vb2VvrqKLZFe+nk50xqnJLA2JOI1b9xtPDewNgZU0uklIN0cGzZPRHKKOApViTXxlKQ/U8q/edaqNvw76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bbFcbyXX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bbFcbyXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775735729;
	bh=zeViHfjIPs+i4Db3O8OwEV0mX2TQtgm8BTIvwfr7j5I=;
	h=From:Subject:Date:To:Cc:From;
	b=bbFcbyXXvlJfQT8D0TwTCJIAvXW1+1qVNOhqhXewJEi7CzfhJ7K9Argqf2d5WeMRT
	 lHjgFtxTdrNGSH38t+TxO1GU2shnkvUTHTfBB40IniALK2W3DijjN2tyNgUrvTyTUb
	 ZRkFoA4r3KU1Z51Ysvt2u+EVaNVrNVBMzjZznZYU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v4 0/2] tools/nolibc: add support for 32-bit parisc
Date: Thu, 09 Apr 2026 13:54:29 +0200
Message-Id: <20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33MQQ6CMBCF4auQrq2ZtgMFV97DuKB1apsYIBRRQ
 7i7hZVE4/J/yfsmFqkPFNkhm1hPY4ihbVLgLmPW182VeLikZhJkDiUgb9pbMJb7rqt5aYXSBoC
 skyw9up5ceK7a6Zzahzi0/WvFR7Gsi1MAgt44o+DAnQaDOVQWsT4+KMQYrb/7fUMDW7BRfgLlF
 pAJ0I4Q0JpCkPoJqD+ASkBVCKd0jiaH4guY5/kNGIY7gy0BAAA=
X-Change-ID: 20250804-nolibc-hppa-8c137b00ecf2
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775735729; l=1477;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zeViHfjIPs+i4Db3O8OwEV0mX2TQtgm8BTIvwfr7j5I=;
 b=UPq8NHLPszMQDGgHqK1KeCZ2frnxyWDustMvpWQ06LSwkhhGhSxc5AggflOfOit+l20UNcWb2
 wppwYImNrwXCXjgfaL6ZCw9xhP18QIzEHyBMZreXdomrbJg7VBw+C+r
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Based on nolibc/for-next.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
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
 tools/include/nolibc/arch-parisc.h             | 179 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c   |  13 +-
 tools/testing/selftests/nolibc/run-tests.sh    |   8 +-
 6 files changed, 204 insertions(+), 6 deletions(-)
---
base-commit: 65191c9bf8fdd00f8fe90e2caab330418eefb786
change-id: 20250804-nolibc-hppa-8c137b00ecf2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

