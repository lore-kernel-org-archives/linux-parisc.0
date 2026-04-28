Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EA3B6C08;
	Tue, 28 Apr 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390730; cv=none; b=I1SqKvEZicCG4MlwQKkvRYy/RxiGYBXtdlZGxmsSlsgcVezmQVZqMjb0D1FYP/h3mPjIbOttocr4iZmAHUH0gtpnUFiRikhj5wMW5VsgV2qe+sj4XDEJpR2PY6tjYQPdyVOn0KZMoJihL5TCD7rK22/ojDA/TS2sbrlwTjpXBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390730; c=relaxed/simple;
	bh=uVoVF2tV01dWPb42R0kcZ/Bylx24JPlETzLgOfFj1jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0m3bgQq5/aGoWs3rM14mM9DnKP+S0cKqu60SpC0T4JEfngxOk4qjKpptzhMFbsoDICrTjwt9ZKAcDMM3kwD8J43zhWt9H8GzfRu57oi6qeWqpW7ahCgb2ZrUSMYZtCfr8tt/O6jJX52382LoJ5n7EQ8V8GxFQ+PuvLtuJITs2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eH+3I9wT; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eH+3I9wT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777390723;
	bh=uVoVF2tV01dWPb42R0kcZ/Bylx24JPlETzLgOfFj1jc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eH+3I9wTGj115DOBnLccn3Tnjxvi29RQpT5A3JzJHo7uErQZqURx0nNp/VZC/3nEz
	 0LrkBOjTpkawaICAm3Qkb48f4Lb2SEcxM+hXI4Fr6GSiCqiCY1bhX9f7x/PHxA9sdB
	 yF5OHdJ8YzOaQOkNS0PjFDjL1wk7V/yCz+PlO6wA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 28 Apr 2026 17:38:29 +0200
Subject: [PATCH v5 1/2] selftests/nolibc: avoid function pointer
 comparisons
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-nolibc-hppa-v5-1-d843d573111a@weissschuh.net>
References: <20260428-nolibc-hppa-v5-0-d843d573111a@weissschuh.net>
In-Reply-To: <20260428-nolibc-hppa-v5-0-d843d573111a@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777390721; l=1903;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=uVoVF2tV01dWPb42R0kcZ/Bylx24JPlETzLgOfFj1jc=;
 b=8C5w2/tYrRXAhpRy5hkWFAkW+RRQRI8O6pXLLJSnHKaR+L2iERIW2oFOVS5tmX1crrwawJss9
 GmyNItUHEVFCIlOinfXapmMFJnM6XH5T5HE1gi+nqGMTmp9MDbX1RNs
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The upcoming parisc support would require libgcc to implement function
pointer comparisons. As we try to avoid the libgcc dependency rework
the logic to work without such comparisons.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Willy Tarreau <w@1wt.eu>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 08610cacf030..1db6e8d55c16 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -649,20 +649,25 @@ int expect_str_buf_eq(size_t expr, const char *buf, size_t val, int llen, const
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
2.54.0

