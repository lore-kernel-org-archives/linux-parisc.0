Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1EE37FF7B;
	Wed,  8 Apr 2026 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678736; cv=none; b=VNxXU/Gqm/xNueKzthcArg9GVWwlHQxbX7KfVXGCXnCni/8FIhwW4R+0hzKK4a5H4xnbYcAf4fd9GjkmeJsGIdZLrLJxdGcMA1q5Crats4YYmDmAOFmD39rQ59486jBkfX6eyj7/Muk/V0vZnrQSFiE0pSBIMDfHuFp9lf3UrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678736; c=relaxed/simple;
	bh=0QDRRWJsUb0HsXYiGCGvycCkeA1YidYQSdLDXPAQ/PE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l2N8bNHCRcf5Lf8ogsL5mR7zkzljtmeJKhotzCYxL5TgzJ66k3PTjc6RXP0VWcyFyhVcf8Fl4A0lPajQ7CtR6SrfILoGnTUOSik6r6NdRph0v0PWjRwn1X76iol6cSrQ1Ae6EqoW87j+ZSPiA1hwVKtH3mU+wmhROikay9YSQEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KHxXbeQK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KHxXbeQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775678731;
	bh=0QDRRWJsUb0HsXYiGCGvycCkeA1YidYQSdLDXPAQ/PE=;
	h=From:Subject:Date:To:Cc:From;
	b=KHxXbeQKPZZSkpNYZ7W53VUjOYyUgw3H6K74gwONOus5aZLTu2lnQYcarn8ms+ZsE
	 JvflHzgFl1aOupGzCtCgm8E/3c1LycqrwKwYSGXPIGkIco8LBwO60JW2HAiKoklsxJ
	 IzMP1RJMBIcHZ8C9XflfC1Bj4VP9KCGp1deejY+I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] tools/nolibc: add support for 32-bit parisc
Date: Wed, 08 Apr 2026 22:05:27 +0200
Message-Id: <20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ7CIBCF4asY1mIGSkt15T2Mi4KDTGJoAxU1T
 e8u7crG5f+S900sYSRM7LSbWMRMifpQotrvmPVduCOnW2kmQdbQguKhf5Cx3A9Dx1srKm0A0Dr
 JymOI6Oi9apdraU9p7ONnxbNY1sVpQIHeOFlw4E6DUTUcrVLd+YWUUrL+6Q8BR7ZgWf4C7RaQB
 dAOFShrGoHVHzDP8xfcCHw27AAAAA==
X-Change-ID: 20250804-nolibc-hppa-8c137b00ecf2
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775678731; l=1241;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0QDRRWJsUb0HsXYiGCGvycCkeA1YidYQSdLDXPAQ/PE=;
 b=a9lit9GsdDF9iJsj2DoK+AhM9gop9jEGBVfnjukMiXJRzXkAfGbYVQ6VEbXqqFDy52yO5xm4n
 n6Q25WhjtMGBnYiDXNm3LxmynU8rhJYAcKyU5MHa+qVOiOgpYvkTjeT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Based on nolibc/for-next.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
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
 tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c   |  13 +-
 tools/testing/selftests/nolibc/run-tests.sh    |   8 +-
 6 files changed, 203 insertions(+), 6 deletions(-)
---
base-commit: 65191c9bf8fdd00f8fe90e2caab330418eefb786
change-id: 20250804-nolibc-hppa-8c137b00ecf2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

