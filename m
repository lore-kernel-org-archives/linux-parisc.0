Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750062;
	b=Y1Zl5M/ezddHJy6lzdiUyMiqOMShwoK4wateuJD8Qqk8lmMublFZcvC9xVMuYi1C+dAO
	 d4J0/Vd4QYzJXMGCPYx18GXjZ/+GLYQJ/jld7fogRpx29uF+Xyg6pQaq1fBQ7Vr7LT/2b
	 yt69n4c950v8BnLXr9b97BH9JAbnHHgXldUUoNwzDLroVqKWFKxS9SV8P+6gRzHELyPgz
	 e6o4yzYVlqsXqc4sDxb/Xwlc5xol0Y+9OgImDqrX6E0wnD9Vz09i7T+IHCHyvYcJKEW43
	 GIXPREcY+viBhZ/oWP+2/EY6wrjdvcgP5FkFGJGHEBpSCKi/C2X5KMObB/5j1FROzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wqSrNO+JQc9uQTzjyyG5c1yC7bTUnN/gvCvW9r5anO4=;
	b=LuZYrsSw5XkzSMHIi3GgCXQEcq5i55IsU11VUEtwSnAbBL/df0wg1Dm6NwOszZtkVA0z
	 tIsXAMwz0f0Cp8/s1UBnO4+KFxmpR4JlMZlBsHFasSqLfLR5j6pNbYb5DmEV8Nzff8Vy6
	 /Y/WtWd521vAqKeTD9vUbPhF647lGTOJSjNeiHO2hlsZq7I8CkjqUcFH/EmVXXiS4eqI8
	 XoG69Xheza7Bci6k4Q//krdJKYKPBDoJao48J3voMcLBDNh1KzmsU2um4YvL1NHwrJtey
	 k4zoJTlBk9UMO39ZCVmKzmqDj6aSqB4i1pF8gCKXnTNSV6YMNkH0bolGAvCK3cq2FuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BL19T/dl";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687B606A31C
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B687B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BL19T/dl
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4cd576f2aso55826687b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750061; x=1796354861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqSrNO+JQc9uQTzjyyG5c1yC7bTUnN/gvCvW9r5anO4=;
        b=BL19T/dlHxP2gFLFmB1YeyZ+YrHiRJqGZRkCUFY0PAiVl8UH4iRgY6NaHhgD0aO+CV
         cMWVmUdiH60djPjPdsiljX0ultTH0RNk/+/f9bSwVoglmMp25KCr062O3cPZTf+RkyxY
         2Wqk8nSJ7n6SA1dLoIxzyJI6rkep5TMl3qq0v7c5wdgs22ho8RRDy9/ojmpG+FGX4XGu
         RexRaMtLIwYiP85pvCx2brq0JyzRwQppxw5MqlE1bP/GqyuQ8uZl/btdP79E/FpbhCy+
         MGQF4OUmfe8pWEEJRJiSyOd+V3cQK2eXy1bRZ4iDiIX/Fl7MAxZ+5JA9DBHOjPcKBEyn
         jQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750061; x=1796354861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqSrNO+JQc9uQTzjyyG5c1yC7bTUnN/gvCvW9r5anO4=;
        b=xKJhaBKy425F7y7od6t2Fg0vbjVEWuKMItdete9ZHpVHBG0OLgfP/dKT3+UGYb9bjn
         0ISHNhdIffPu81YgWqBKaQH4+9tjv/Sw3yEVBt4uFCA7oV050GlNsQNla4yP8zQG2BgM
         fznttyhg5OTqWkDYax3MhqlP51/H3OATEYOCIKCdz1zJaFqF1ww6oFVt293AglUdJ0NU
         GhA9pxoaQ/G/IpGUKtJ3zVlaCCRNBVYpAseD4ZLv7eG8y1I+kADEkTViYXxB5bOY1zV3
         /HZo8MNwRRxlyJlKBxzmYGtcstWWpmuWlnE2ARbGNIipOt0h25iAd9563Jhjn06/Kx+G
         nhSw==
X-Gm-Message-State: APuU4Z/S18teTSIgOevx3FjmWXJi9/Sv0Z4tgFEI1IG1WzlULtHJ5yZM
	UaNvnR4UFIMNMnZgM8BqyoN4pJblr0gEvOKmejd7shWhcT9BXebgJoqa
X-Gm-Gg: AZFdTZekNxU+4XLATo5mCU7NcF/x1LiTQmPKiDgCMHr+Wu4dEU+foJHT2568CAclPE/
	HP34mo9lv+jc07r2S7GUv4xEZt60/JW90IBcWjDmZph4FRG4SQmjkkmAzXK/D5BA/lQ/u7f4GVj
	+R1pCH8YMd/YtPZeSS6CvEuSQsGAF5lUHqdOX9zwwUTEXOP7rYXDMTGBPXgwqEA39mU1K1mv8YX
	dWJJidEVH548Va1xNyWzWIUIZLHUMVweVrJKAbINKmpCRMpwnefWi285RaATWokN8sXyy25FJOs
	rrhUU+qgKhQaIXxS8+4qitIsZKeDV/0p/AKKrKg42CmbxPMChOFnkltmb3DlRjzTjCfee00f6Jt
	Rjgqnw/0onNilQDe1nKUhbROMl/u1GYqx7WETX2GpXB5uS0Z5D1QHBNS9sqyNMfZe0YSaK5Spqw
	vW0rSOQBud0u3IHAPF386NKJrwGyCZTxbAOuypXKlzaVv7hyJcPIjqsk+7fYAEJ/hRXiCjMxEiV
	ht52e2PkdnkdYsgOnYVJN/7S5KkXRIMfs7R0S/N47aU2Gb0qCs6EqwunXSE2x9fAy2WGg1goVp0
	roSwGFV0hiztq0pmRYluuuZdRRqXrPix+x5NENWoHqyXbVqEltqtKCCwVrGdsnVrTtgigT1obkz
	BniTiYP6C8CLxTUt/n6h1DJlvJQratm2ulnO9uRT26g==
X-Received: by 2002:a05:690c:4a03:b0:8a8:5c3d:903 with SMTP id 00721157ae682-8b520519690mr82386877b3.62.1795750060644;
        Thu, 26 Nov 2026 19:27:40 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354770sm92613837b3.42.2026.11.26.19.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:39 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:24 -0500
Subject: [PATCH 6/6] parisc: Print the parisc_terminate() report on nbcon
 consoles
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-parisc-hpmc-fixes-v1-6-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=nz0uA+drY8wyL4Z/csN+TfOnjYcwN8dyNFJsvfXjbZE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkzX+y1g/bfk/bJ+B6ZJbIt0b0gK68hJ3jMvCub99
 uuwGt/Ljo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmixUjQ6MXr92vaV
 0ODv1JuV95tHqqc+s6zKUmbejszize/TvsGcMfnsv7dTsbKoubCzPZP4RYJ90WElDzz9/g3WC1Y
 EK3ZRInAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

parisc_terminate() prints a stack trace and the registers, and then
calls panic(). It runs with interrupts disabled, and it never enters
the nbcon emergency state, unlike die_if_kernel(), which calls
oops_enter().

With an nbcon console such as the 8250, a printk() in normal priority
only stores the message and queues irq_work to wake the console
printer thread. With interrupts off that irq_work never runs, so
nothing reaches the console until panic() flushes it. If the machine
dies before then, the report is lost. On a C8000 an HPMC went through
os_hpmc and parisc_terminate() as far as the PDC_SOFT_POWER call
after the register dump, and then took a second HPMC, and nothing at
all was printed.

Call oops_enter() first, as die_if_kernel() does, so the report is
printed as it is generated.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c7c5df80bd0..7c123dc9e9a2 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -422,6 +422,12 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 {
 	static DEFINE_SPINLOCK(terminate_lock);
 
+	/*
+	 * Print synchronously on nbcon consoles. Interrupts are off from
+	 * here on, so the console printer thread would never be woken.
+	 */
+	oops_enter();
+
 	(void)notify_die(DIE_OOPS, msg, regs, 0, code, SIGTRAP);
 	bust_spinlocks(1);
 

-- 
2.56.1

