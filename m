Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867A36B912
	for <linux-parisc@vger.kernel.org>; Tue,  8 Sep 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845184; cv=none; b=XwTf6/op3uzZXP6yqew0ekgLpzyKimYPRQZ1jZvYaW4aqWiaAP2KKCUCA+g4ZXDLAUXH6ppT7aETf4vsZc+mTkmh7XEhiqazkai/SaGjYXGrXiSmfDs7JC2D+Riy2Qgmmw1LGOO5/5uhNNcEk7QIOW1QzCmgD4fPTrpncoY/Mu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845184; c=relaxed/simple;
	bh=Wu4MFNvM9+B3qaLFMlJBJ7B2feraxxXczXPfqfNWxOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su0iU+i8S0OpKYqIc12C7lgNX5BsQ3g250/XueTFN3+RulCi73tGp048EJof9pi8zETw2ayLT36ndADx70KeLuLNEU4ehcy73Xj1hw8dgcEmBXQJr/uacMi8bKzQB0H7oQgVRVMbPo/gP/zDRrRbAz1Qa7pETk8a2xZRC5TlkuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z44fveco; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z44fveco"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso3351712a12.1
        for <linux-parisc@vger.kernel.org>; Mon, 07 Sep 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845182; x=1789449982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=Z44fveco7Kmdjwu0kZEnjeyJqOkjZYgYaveyyw4PqXJhWpJIPJXxtKz7Prbfj+ggRo
         PBET7I1d9lJjsEVsOCxT5st7fhG5bQJ6kCGWU6iSP+3Qw4aZFtvXhofyJgv4xho4p+KL
         LMJsEexbhI03F6syK8xbNXVW//4zr69QcPZ7UQ/lqOpBC4ue/m2DaDdXIlBm6r8qBUjk
         AwsAwyysVubByEEbIw1mT7NSZhGkFw0ZEbJ87DY1F4u5834Tvli+EoNPDiTuVl+GlFO8
         UsGF7Z4oJMrdmzX+mU9ntdt8EV5wwBcCjPjJ4Is+SImHfoU2h4ZEhI1O/Lx9vJ3+P/FT
         le1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845182; x=1789449982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=JxSfqH4KCPmdUwWlFc5CLOra2gvE3Uj+ch1ppNx3Ln2lv2M0J6fzkqGXZ0wmEvzr73
         Mq/LcN5CjMdg2S7biw5D5aJg9M4lHnv0TAGBM1yLIbJg4aOkzBV+a2vnxv8aDrW71Oyj
         Ge4xDI/mx1bToCc7YGc9BJ9BbtvnmpqtyeYq79ZbotNn42IQawlOeOI4IhXfCBf4UcAM
         IpJcutNmFHllpD2FACITW6nalMNMFwSvXVL0wol9e73DdHB37ljF4cb6uWg4dxGAnXmG
         lRM9PWJFcWs1x6FZxAh7zgsfrdHisIiU8dnZUy1UVQX8jezRXygt2G5pDOzs2w3Dy4eO
         1CVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqYu0Yn3LSH0imdOHHM27//zjfvEwCgfWQU8En3PxbC+GXZnBZ5vAaQSsnxgwQvjMh+I4woUyM+HRVpg8=@vger.kernel.org
X-Gm-Message-State: AFuF++lW5yi18Pdtl6nyP0TtfH7uO1O9PEaKiQ30VemM7eU4zml/+vPM
	EhGuPjZSGJbJh6ljF6i6IlC3jojXJmdx1++TKZUIdYZvowtZEKunaRbJ
X-Gm-Gg: AYBFou17KGFhTSOQdPT0z2T5u8666VnzCaSK39QRZU2OH1sshP4+Xb7C4fswe+y5zsT
	CmMWujgMFY0B4T5AayA4BeiBLJ3OqxOJYXH9o7Tg38+Ym588bmkV2lhsjROX1dh7UihITiQBwBL
	xghd3DfnW/Lhhe2nkdEJ7qIfUPwAU4Gh2C2hAYPGD3Xlqx9hTyHSj2TrBywO8he3MXnYyopPZZw
	5hPJirZjjii68wFzlbqBrluStB3EWdqS/giCI0FaSRZa3tsRiN31f6CMbCnYRKEkouZNIusHHSg
	5U1jMv8Qi1GB+kyIstalpOQewSgK2xip3dENb1C7tyBhJi/FWoIM4MKeilh75xM6U6ow0aZ43RJ
	w+cbURObp7RBsiGLjFUJgsdp5BWKSRb8maqSH43eo4cFR36Bl34GeXzchK19K4frNe9EF4vDj/n
	xoPv3rbY0i5zirh/JfY9tZN5xpHJkDTMfeHzovkHz/zUJjMh0sqwvA+kj0CF+D8TDQhsmk4irBV
	ECdxXjZaRP9xk2QW60ccMo/
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr36864640a91.32.1788845181942;
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
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
Subject: [PATCH net-next v3 01/10] net: llc: fix repeated word 'all' in comment
Date: Tue,  8 Sep 2026 10:55:53 +0530
Message-ID: <20260908052602.27497-2-hemanth.selam@gmail.com>
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

Drop the second 'all', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 net/llc/llc_conn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50f54..4b6fe9a473cb 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -193,7 +193,7 @@ void llc_conn_rtn_pdu(struct sock *sk, struct sk_buff *skb)
 }
 
 /**
- *	llc_conn_resend_i_pdu_as_cmd - resend all all unacknowledged I PDUs
+ *	llc_conn_resend_i_pdu_as_cmd - resend all unacknowledged I PDUs
  *	@sk: active connection
  *	@nr: NR
  *	@first_p_bit: p_bit value of first pdu
-- 
2.48.1

