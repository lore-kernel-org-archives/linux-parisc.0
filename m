Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538F53822BA;
	Wed,  8 Apr 2026 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678736; cv=none; b=lg64wZ1kxqUcCXmC71kdkylVnl0erTPayxYs9QB7wdIj5HpFiA7WP8eIvGd0g2v0DyNtYWB9e+JTjPC8mRHFs6m2nrMgFiH++RpzrT3ppzZB6u8NndrDnoLQmEyRs7NfVkiQ52nXBEo7dmawfWzWV+RWF0+4iFjkcalCSg5gI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678736; c=relaxed/simple;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGIBNJC+K0iIvhW9Wpo6wxZbo8wXvcFoVTMyBbXEq5FwiY7wThlSF88fKs4lPz6wGt+7Zs5zuBhFk6AGmQfRF4t6X+Q1NPaex1aaipEFVGFkoHAT+bR3rp5wy0+bIy9+vtXTmSh3oftNIEmmoEiYtUpAVIo0SVetwcF+9qGXjAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=padU8dEe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="padU8dEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775678731;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=padU8dEeIpTlAAlWMoU7ZdAZaB4DHNeiztnUa1aDfwxLuzqzX3GLgCNM6T7ZH25PK
	 lpYUOkKrwFk/VLWGLXr3QHpqzgiX7yKbk2bjqd/EmFbKy+UqOkxt1mp81XnkpFhSr2
	 ISU4G6GCP7ZFeKf54MX5KNtW0mnPLnBtuxxHkj3o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 22:05:28 +0200
Subject: [PATCH v3 1/2] selftests/nolibc: avoid function pointer
 comparisons
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-nolibc-hppa-v3-1-961f3754b506@weissschuh.net>
References: <20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net>
In-Reply-To: <20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775678731; l=1867;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
 b=1/JOP5Weg6OZ0dd8AkDOVAGWLP7stTcleCJzPwksElohWeFj8dpT8Hwi8JJYx9B9Yt52jHY4e
 t/c0BLq9wQpDUXeGxCkaloAE20BAPN/u/+EqUV2QGWSWugSWoWGwOxE
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

