Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D0270ED7;
	Tue,  7 Apr 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579875; cv=none; b=gqSWQManrrbidHW5pKIoVX2IGzi/NTrrUnFuiiSegJ5b7T2QnDhL0Cmt9eATlh9FrqH1jKjiw8Al14pXzKAqAWgIh6Jk+v2cdEjmURkMlgtfvVF/okqVk7RpqPf7R4lE0gLUZ2pXDeORKBhsXjcxVjDnbBZKTzoYmNpAmRdz6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579875; c=relaxed/simple;
	bh=iG6na8aZq5RLQ3vuDQQG1NF+C09g0jNg0x61in/nF4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=srO2EuotwrNnTljExyVyZUf4+Z/VL9JxfHufGQwotTztJbicjsncp9yyEtBJbQwC3FBask6bRbrrVtS1kARONWc2y1lwA2aCfDTzhiAQ3jXLlgTUB3NzI1xWVT2iJW5H3vm39KdGKMZYqnGPO082I5WnBuIkk1pAggFRqkwQJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=p6Z34v8q; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="p6Z34v8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775579865;
	bh=iG6na8aZq5RLQ3vuDQQG1NF+C09g0jNg0x61in/nF4k=;
	h=From:Subject:Date:To:Cc:From;
	b=p6Z34v8qRI9N4mF0yGBJNOowrMqccik7pnCTGRtQr8Yu+iOK7W/vnJylFc6pDCzcG
	 tDXukt+kX7Jqf+d2eEWlxDy6bsYXcOPOInDfSy9FndDLH3U9SK4wd6t1CzlrmRztbZ
	 dL3xiXDeKqDxUeJgkMd8V35d7i7NwnVO0CfFQH0E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] tools/nolibc: add support for 32-bit parisc
Date: Tue, 07 Apr 2026 18:37:42 +0200
Message-Id: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3bz8nMykZN2MgoJEXYtkQ2PzJAOD1OQ0IyWgjoKi1LTMCrBp0bG
 1tQBsH8RZXQAAAA==
X-Change-ID: 20250804-nolibc-hppa-8c137b00ecf2
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775579864; l=1018;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iG6na8aZq5RLQ3vuDQQG1NF+C09g0jNg0x61in/nF4k=;
 b=Lx7/DpDxuPDuDku1zxf1/qYzMHZmHsetf5g1hUi3GfN3RcQKD8nG7XCqkxc+lXMRdXiT8v83O
 pzabB6bhJCaB22s4WPDR4SHwmZHtDsnN3Bh8jQvV8ybp/BBG70VK5M8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend nolibc to target the 32-bit parisc architecture.
64-bit is not yet supported.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      parisc: Makefile: use the regular compiler to build a native 32-bit vDSO
      selftests/nolibc: avoid function pointer comparisons
      tools/nolibc: add support for 32-bit parisc

 arch/parisc/Makefile                           |   4 +
 tools/include/nolibc/Makefile                  |   2 +-
 tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++++++++++
 tools/include/nolibc/arch.h                    |   2 +
 tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c   |  13 +-
 tools/testing/selftests/nolibc/run-tests.sh    |   4 +-
 7 files changed, 203 insertions(+), 6 deletions(-)
---
base-commit: 65191c9bf8fdd00f8fe90e2caab330418eefb786
change-id: 20250804-nolibc-hppa-8c137b00ecf2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

