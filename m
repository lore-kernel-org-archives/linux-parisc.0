Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513939;
	b=z/+ng9VfbCdNRTQiC+UKHOiS5ZFz1UmO0Hy4rJYdnqdPRSPHbFIR1GCIQ8fcpTaFThTK
	 RQKYQfr9Wbp186tqXs72nVRsFZc0FuH3MwFQzAa9RxQHS0Tyj1olDiPEpqmGGpavwWp22
	 bnwsz94B4LRN16qckktSEigFuuIKkQC+BawIJ/9LmFy/DpDx/q1ffFD8V0cXVJmIYq1Kz
	 O51fYQtBbYKJy752OfYjburdkFrI22R3pnjKRPKlQbftUygl3hnxubSTU+HNmFzYlNvWt
	 oWyEEVDtoA1aerplhEbis2efZf9300DroEy4FE/v4FwF6gY9TAxE3/whbYklmtZbVRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
	b=Aoj5QK4Ln85WiWbeETQGtzTybkTkMjo1RwIEkWNQnMb0vXd0491X6BUcvk+YlGF7uuez
	 6KDRFqrNZ5VdYwg/QQQEvPMaf12NbHaJNfTi2C878ChQEDrEb2ETYlrYJtSPmrb6P0WkZ
	 sauvLm6v1Nna1oVdeaIB8BKQVVcNWsM5y/OqpASViTTTEYuEvIEE0yiNwMzqEi2gr827K
	 0bq8yIaJyzU5KXTzqJwd+Wi2xhK/ECvd//gI3PBhMrV80Zn1RBatsxHSsRWA6ajBTz/Ml
	 AbdJhi5lbAMKZe867zkgwrEP8s/NMtNyx1FtXgwISq1wR+Okc+0QF7EOOtLTQihNl7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PUtVTzSL;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18B606A327
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 16:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA18B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PUtVTzSL
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so9639563eec.1
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792513938; x=1793118738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
        b=PUtVTzSL9MWUPbtAhO6NgmREXkSH2KhZpF+wjs9MZdxQz8/ae5NJwFLcy9WWjSyPJM
         JMMUIXHpRs3nrM+6CQ1G9x+wBtNbrxlQ/gmSfMMh6k/8C9SqjsjZ3B+w+YIFLoRZFIyz
         rUhnJgvz0Ad0T/Dfw4KMYciiRyB8byiTge2DYs+YU868OyApHq2qEpnR2UXPmcXmQz2q
         qgMJZ073VXC2zZ0sDRSx1P3qWhuxJp7LZs/sOKhb/ZfSKi2CqYuROoI2j0bQsSDSgIQR
         9XcCbrVJTyu1e5xYJcCvM8f1wLqtmpwKTDPHxzmojl8cGmqE5mJNiSESlUZFz7Cdy/cg
         u07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513938; x=1793118738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
        b=ojrbeTwyU16B0XVfioDvWarrsosYZIxu5QO3amjgpcNSNQeON6ij240S217BHEcA1h
         4E7I7/H5gvDirhPzqL2qipiqzWr5DNsLBslYuGWJYuXLq1e8COT7EQ0XQwNGPgum7GvR
         KG1LOR7aN6YxNOy1aYTXE/v4EcSCFSfcP8wYIw7O8CTtDTJNH2V8/xcBQ8VsUBlsWPz9
         wkss6N/t1KAZp9yqK49E2i7BxeJhp8GTJUunGKYT8UWaseruG6etDVECA0qBcq0WPaKC
         a7tmJVFHySTkTyO1KFPRTO+rypcMbWyzQ4JRCASZD1AGIo5W08OvCAkL+68WT2mFN83S
         fEWw==
X-Forwarded-Encrypted: i=1; AKwUvByvu06SlClJ8v3vxvGrPdd6ybHQgnjICSWWBcpZJnCGNjHQMLsNlcXn3LvSCJIbjWl9+usPUSFzaSsMjxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiXAKNLAcp7/McJAyV9mqzf++VezMciVbHlrG8d1wY8g3Gk1fM
	7Sr5aMRspF0DQNiRbjArlJTG8HbVbASQb9nE5qWPTkiuSqu+yH17MlcvaG3KJPOIkZH0123md+U
	pARAJ8BlNOA==
X-Received: from dybnj35.prod.google.com ([2002:a05:7300:d0a3:b0:35a:a58:bf9e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8641:20b0:351:1f56:3a89
 with SMTP id 5a478bee46e88-361a1e501f0mr17261142eec.23.1792513937516; Tue, 20
 Oct 2026 09:32:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:32:10 -0700
In-Reply-To: <20261020163210.742728-1-irogers@google.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163210.742728-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163210.742728-2-irogers@google.com>
Subject: [PATCH v2 2/2] tools headers: Update the vdso/unaligned.h copy with
 the kernel sources
From: Ian Rogers <irogers@google.com>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <chleroy@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Helge Deller <deller@gmx.de>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

To pick up the changes in:

  vdso: Add VDSO_UNALIGNED_PACKED config option

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/vdso/unaligned.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
index 9076483c9fbb..726fd15efc82 100644
--- a/tools/include/vdso/unaligned.h
+++ b/tools/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
 
 #include <linux/compiler_types.h>
 
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x = (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
 
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
-- 
2.56.0.212.g129ede20d9-goog

