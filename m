Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C87376A0C
	for <linux-parisc@vger.kernel.org>; Tue,  8 Sep 2026 05:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845192; cv=none; b=Atu6bhvESlV6Qbors/z3lxwDAZJ0VagWk4j0HSFbQ8Nq5BhI7LEyIUhg+OqDwMrXfwLPV8URV8c+jaHQH+BK7oUGWV7tSlRgmkTGmmkkmGJwk2J/M6+WnB/umVbIruveNhRTJndneuV+FwS7tc5yJcXU9k8ljEjvuTb28yClx70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845192; c=relaxed/simple;
	bh=RMRnGzO8/TbwuDMSTIK1s6BTAtz1u1sEH9VEB/wNKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjyYtHnZvM0339loLpDXE+z4PMzExFb8i7wnvpbpskEMZj1wDiUrLWMFg47xYO9x3hcW5NSHGcHwosnVICXtexoGv5R0mcSM9oc1vJEWtm0XuWU6h7QxLKLPF75h6j2Y3ScaBZ7g0Oz5Xsk1k1679IprOlKdCjM4XJq7jWQjCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOSS58Aw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOSS58Aw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d9201076b3so46725705ad.0
        for <linux-parisc@vger.kernel.org>; Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845190; x=1789449990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=lOSS58AwI1LKQ6Sw3eqZ/J9QQ9aJt0if1zwTvRu3waclLSBNfq3qLlZL+WrqItKevT
         sUrErOTfWWVXDYZzjOBGf+KTRSqoy9dQM0YGnW//+hSsZ6QMT8yDe5gFEcM9DF9LihFt
         FnLqLHpjTOB0OGr9HHQniikaBCXAh9Kbme91cwcID63aXQ3J3nXNwbdbKJFshDxafuI9
         FjQJEREOkv3oui3rRq5dqYXpqJ8q6IcudoKj3XyxY04vEz7xc0SxfBcuuyjuSnity7at
         jvLH30SAHGTgNe3VHVEI6SazPuwAUk6qiZ9C5RI5ccJ9NVu3yPF/rYxPYAEWesBWKng2
         j99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845190; x=1789449990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=tUss6ApJ7Ir7xgyAo9Vo8HtooSE/2itjyDdZPWKbZG7r1p1mZhPWy7KshpZe2cIQxa
         2E0JUKQry7HB+JTh62Q3+U9m6QGjxxM0nd03p4OUjRGwY5idNdgZ9k5nXTIs5jOgKIxo
         Gv9VVBQzBOxcElN70FflQENRtARxVi2F7WxCCkEC7YlaSFlYZP+TjZjG/uzgkizy14n+
         F0PvZZQTY99ZYJJ3+IaGhKDQuitHf/1NJaRa4qtxEskqYNAT4bRo9LH2Hma2gQH5roOc
         59iFiRV2WyNTmRyCuJ9qa3xWeV2eM5UTWF7V5t7LPNfZWw0OyYSNvA47vq6S8+gR+3mO
         RJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUMoEIy9p/j/bprcrwLtX67ETnp6bzFKojpkCSOFFQv9x9obs2Eeb2CFD1u1Qa4G3iQRn8JY2eNwTFRTc=@vger.kernel.org
X-Gm-Message-State: AFuF++mZsund/xMznA2A/bAKuKgmTSigab7yR9fr59US4fpfdKLxI37L
	t0Gk5N5gyQth00i4KQiYAySCpMjGI7fq6mYaIokN45h0g9KcZrdyLEvp
X-Gm-Gg: AYBFou2S8rrMEbxIrHyWUdRhTjAiYoCIuXBbjoNJBWkn4wCV58t+T4ESY3cC+T+jICu
	63/oa+IfFD+teekRpE86xv4NEO5GK76FwZ6EzMwYpC7DFmr0wEP3jQbsgM6aWCPHPAyzDY1Ti/u
	/BgALrGIyWRQtquZ/i2RiI48gxIlI1Q14HlwNn51D7y7uF3OsjDSUZwsJqW5TGrSVNO7KY7Xqej
	POcGG5GIa4mjhYXIHWOVYc4OcQihMmUlyIVGWErkM0A27o0VDR9rBL6gu8szraaHQ00b6DDezcQ
	S6JtC1iGBfBj1DCjgwWX/XlEDa/qa1bsGDjJ7MgjYScp5xd8p6D0DWkJMVYOYNGMrbtNOszGR7b
	jknNQYucSgykq+lkwn3i6Zx89EGB06HBo87ij9EAJAojSPsbGMkFGTLPUteEQCDOezZYH+hTnYy
	p1i8OikTXJLfYSncARqYmBZnC7IjJsMd3jHJkf+mOFniTgOQodmcb2IVEgRA1GIIA1dLs100ZNp
	xnrllegwdlxsg==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr40136940a91.25.1788845190456;
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 02/10] selftests: net: fix repeated word 'use' in comment
Date: Tue,  8 Sep 2026 10:55:54 +0530
Message-ID: <20260908052602.27497-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'use', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 tools/testing/selftests/net/xfrm_policy.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/xfrm_policy.sh b/tools/testing/selftests/net/xfrm_policy.sh
index 3eeeeffb4005..6294e49a46e0 100755
--- a/tools/testing/selftests/net/xfrm_policy.sh
+++ b/tools/testing/selftests/net/xfrm_policy.sh
@@ -242,7 +242,7 @@ check_exceptions()
 		echo "PASS: ping to .254 bypassed ipsec tunnel ($logpostfix)"
 	fi
 
-	# ping to .253 should use use ipsec due to direct policy exception.
+	# ping to .253 should use ipsec due to direct policy exception.
 	check_xfrm 1 253
 	if [ $? -ne 0 ]; then
 		echo "FAIL: expected ping to .253 to use ipsec tunnel ($logpostfix)"
-- 
2.48.1

