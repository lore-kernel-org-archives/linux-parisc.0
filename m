Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4513C3436;
	Thu,  9 Apr 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735733; cv=none; b=qBP5yJSuilkn7AWwl+pyKlKpPYUfvZloNobn7GyzB21wM7BWbKhpMFSBOuNq1/RwPiRDFCMgBEO5HvNv9unxon3F9UEHGij1kQTbWCaiLD1EynifxXAfdRxIO9DNFD1f107ihNrTkUgobVi+1Z8KZ5ajj41dvF6yRPKM3LS7fes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735733; c=relaxed/simple;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFNqUt8vO58Uwrn0X6Cm8PItX7qGIBozvxqfnrA5e7TJszEcVwb2xqrGxdd4l47CKOvjPuGozko0tSncG5blK8y1p+PBCsYm+xs8Qx9do1npuF9HFXYuE7lC43Trhk/T2fD3pY2jqbWJefntihgVvxt6UFzJTnCj4caqWo3XirI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gvwrr+s8; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gvwrr+s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775735729;
	bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gvwrr+s8FAqCBabz0ASjBGDNvhMOf/DInlwN2ad37IMZzpn2nusK6Mq68/FPenMy/
	 4oGHSxxWaDnzP7RtPEUJEBT/IsrK+svR8MfpttEqiqrN/f8iPpxX1m6QOu3ZWiMM3s
	 GpKZeDVa7wSnXSBQt36vxdmGCRL2utYwCCuWID/o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 09 Apr 2026 13:54:30 +0200
Subject: [PATCH v4 1/2] selftests/nolibc: avoid function pointer
 comparisons
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-nolibc-hppa-v4-1-24e5f31a0233@weissschuh.net>
References: <20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net>
In-Reply-To: <20260409-nolibc-hppa-v4-0-24e5f31a0233@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775735729; l=1867;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfc5QKR8flQStWiZaylgCaabEIAAzzgZUAWfYl+Co6A=;
 b=IDlP9sLJwhxf6GQrxpgiv1PmLbWRwbfc7VOqXPZs/59CL+tydfKSYYC/39Z/u1YVahtAjFe27
 CKUJh0iT1crDsdu7auv2Be0Hx1H9q7JWn8kSvA7QT+5oUSNOJAiz/YK
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

