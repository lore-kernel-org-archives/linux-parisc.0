Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A52386550;
	Wed,  8 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672372; cv=none; b=GdDZqi9cq4JjnnhWrj39M1Svwt1oG2xfr3oy9B8/ac0DmT5fPZQ71d1N5Xkpo3clRRfnigxz6+4hcSsKIS9tJoIymz/SRAz/KGLO8dYMC1XBvJnzZpmA2U1AiGli7cdoVIXbTbDu3JP6MdXLua+K+BxvyPRNeNSvYd53xc41Arg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672372; c=relaxed/simple;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7UfGMQHqoUIqTIuNxDsdofxCMZZ6+/fy7QKDNiYELD8MgZcJBUeahXNRu7EXBCnnmwdC2YTyaFI5lBLYkUJb8rA6Rrs6wDdLgMb9ANgiZw1hOj3bzZky5ZM5SKILDIXJAzbQzcvSEjjtcvFBK4dCVE9bJTT9xM+me4ikWEM1Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jlDmiUFl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jlDmiUFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775672361;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jlDmiUFlAjfhb3ojLbg52HPPLdZ+Z6+jJi97gfgeNQZEU88CPfp8M1VP0ZZcUzlUb
	 tUBRGWDF2vGuNPdvH5ACyrkopd1bZbsy5LUJfabmN3HnvcGKe7Iv5gjGQQbBAkjxtu
	 lO7riqVZOibep/0Itw+YpGL8lopxRslK/vj5/3xs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 20:18:43 +0200
Subject: [PATCH v2 3/4] selftests/nolibc: avoid function pointer
 comparisons
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-nolibc-hppa-v2-3-7fe404cb61e3@weissschuh.net>
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
In-Reply-To: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775672360; l=1867;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
 b=Cdt3Bu1kA47eqpAuGiioO4c4haCsaxIj7mz5VBPXkgpNzXAH0EkWmJHBkI+fcfXoIt0MrOhbg
 BXyc/ool2vEAhMeAO3ScL8OEaaXZ6m1upngtOGxGcT3r6hvZ5XIOMMB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The upcoming parisc support would require libgcc to implement function
pointer comparisons. As we try to avoid the libgcc dependency rework
the logic to work without such comparisons.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index d3c4facb54c0..de4e87586d75 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -647,20 +647,25 @@ int expect_str_buf_eq(size_t expr, const char *buf, size_t val, int llen, const
 	return 0;
 }
 
+enum strtox_func {
+	strtox_func_strtol,
+	strtox_func_strtoul,
+};
+
 #define EXPECT_STRTOX(cond, func, input, base, expected, chars, expected_errno)				\
-	do { if (!(cond)) result(llen, SKIPPED); else ret += expect_strtox(llen, func, input, base, expected, chars, expected_errno); } while (0)
+	do { if (!(cond)) result(llen, SKIPPED); else ret += expect_strtox(llen, strtox_func_ ## func, input, base, expected, chars, expected_errno); } while (0)
 
 static __attribute__((unused))
-int expect_strtox(int llen, void *func, const char *input, int base, intmax_t expected, int expected_chars, int expected_errno)
+int expect_strtox(int llen, enum strtox_func func, const char *input, int base, intmax_t expected, int expected_chars, int expected_errno)
 {
 	char *endptr;
 	int actual_errno, actual_chars;
 	intmax_t r;
 
 	errno = 0;
-	if (func == strtol) {
+	if (func == strtox_func_strtol) {
 		r = strtol(input, &endptr, base);
-	} else if (func == strtoul) {
+	} else if (func == strtox_func_strtoul) {
 		r = strtoul(input, &endptr, base);
 	} else {
 		result(llen, FAIL);

-- 
2.53.0

