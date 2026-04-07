Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B233A4517;
	Tue,  7 Apr 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579875; cv=none; b=hmipvjeMBunpW8PyjtrSRQf5hpeM+aL6AdhMf5YdpnFXYh0YI+BKqYZEN3PBseVVOdr+8KSV4aoZ0w1bltpPwsJT7hKfryK3gAFQP0O5kgtvfBaaPUUcNuK/tlM3Q4wCLDWGI30EYSTuSXfCGioeqvyPoCI1zfb/odoaZBHmdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579875; c=relaxed/simple;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSrwULrFVRda3Fl8rsWFxiSOGeKe8ElvA8PoHzx/i2hXVrkrdSmUbuJm6M5deKq02TPd9cIH/kgf85dJdmBAIaWfMuFLhaJFkSSKEMjakxDo3Au0AG4fSj+j6KpqqNGzmQ7P/P63vAchBdK6FQLh2B4CaZlKj0J3S5xFnVklK/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=akRGZl9N; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="akRGZl9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775579865;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=akRGZl9NT3AyyOQPE6E9QRJ8y/Fl3ZOyNAmzRr8+HOu1sUk2909XCG+BAUYCpi04D
	 JnHQzgc41dUhGaSM6z/UA5v3dGThaurcu1ImYl6REqrz8HxjhtsOJHXVzyDhrTp2gI
	 ZP6+8DLSLW/qXF/phnJqT8JBYqBAACUvQ80dErvM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Apr 2026 18:37:44 +0200
Subject: [PATCH 2/3] selftests/nolibc: avoid function pointer comparisons
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-nolibc-hppa-v1-2-f70b4509c44a@weissschuh.net>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
In-Reply-To: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775579864; l=1867;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
 b=yGnk9ysO7hzVazWPGsnS25mHlnZQb1H5C5byng/AqJOAKkn73+XFYqRVfpqgunIiLYmuLavEF
 2POKZ7NfI9fDqJyH0Tg5J8JDmBqGvnlFb0PehIYaiZmgvU6z1QOcvNo
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

