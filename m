Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750058;
	b=yifoouZFXzw0uYww9P9xu4Xy9FEe3UWrC23FbjO8s+JGSyKLbrO9ANNjANx7ajd5t7eW
	 W/bEZkUF6MAg397LB6UmB746OdcF5dJY/ZPNgYzexBkfR/XQebJTPxQD9bPHd9HxBqKi4
	 9+NdQYYbLw58PB0sog5TAM6k3PGSAokLShQkVm9/12V7NXaOipA7Uq6WI8AQZUqop831C
	 rNUCJfzhOXFzUd7AWCrakMYXEZW054+Cx9F3ba5SHhOiWn5UaqoLn/c682XPnxu/WWR2y
	 o7BE52YkGeAk+oEnqOlnkM4gkEtpoKsSXasa6piCBhg5QuzkK9YBcNYAOcjU4zhRJQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VZ1z/Eqql0B1yBrusNWkNOIARxGQ2jjz51Edz1bEiP4=;
	b=jB5bVq6zclPYa9YW4dRw2/VqyuduBtGMry3cBfeehkM9N1pbo+efaLPDH2zW2ul11bxY
	 mXWmJUZ3S8NLS29qilpYRT00GDZ/GbBvMF/C1i4d3/lQrliqZYhQyqIN34zMJJR0q5LpO
	 KwLbXkbA/hwTekpqWLQbQZlCOe/DjPT1d/xJDFw/9idJNSA8G5d5DoLCuMiYWHgCUX8XX
	 QHt7pbUe1SLIIibVezOIZFtsDeTEm2BVuwZ4+DBqy+Eeb7xAlh1XnBj4jlMZjEdI0kTHM
	 HmdgIsv0NkRyHmxqJGf+FheizWe3kHkFvz6W+IFaYqEig/Et1Nm0GlagEb+rS0yeAaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZYQA+HH;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEF606A31E
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZYQA+HH
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4f4095a7aso66432117b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750056; x=1796354856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ1z/Eqql0B1yBrusNWkNOIARxGQ2jjz51Edz1bEiP4=;
        b=CZYQA+HHRkGSqjWO/Z7QpcITcGmT6x63yJIczbyD9pJTY+LLrDA61oP3CunZE+2IoV
         XqTtviMFiCMF5BJU2Q50bLVo0d7OU/H186HyZmQ2+X/yUUN/I6yMz0T4JuJfdnjqltOP
         bGNnhLOrXq0rFBOtTms9La17/RUNV1Wkd15f+e/WJu9WemnEHGTFQ2uypZdgNm1/SExI
         bBFDgZbYPufnR78ELHyC+/QWYQYPDvs94GSq8FlGWcfZetfoP3u5YdgYn2PmP5oPIMj2
         Q/iA84HXiOb+dpO/+D3bHchxeU94qOPzKmv3j1ZGG5lx9VqTbTXKunp0y0+bKmyv6vaq
         s6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750056; x=1796354856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ1z/Eqql0B1yBrusNWkNOIARxGQ2jjz51Edz1bEiP4=;
        b=h4APi6XTVP9wXI52Leg0D1k5xXUHNr/abQwHWfayhg7v4zqJDi5lun2d4kABgPU5nq
         As5lHrphxsv6mwT9M85jwI9T3rEScEtIabCSGxaqg14fTFrfUmNO3kM7dEIO0nOb9zIo
         27flexrc+tzO3e3S3svpqiNQf8RzsuwL3UhJPITrBwSUgWTZ/W+TkslqfcCyr776HBb5
         W2K8mCvkoRXDGlYPEUOnKz22mW/atsbBvRR9yIiMOanKq9HHsxZMCKnezggbq9bDfVZN
         Dy1FGljnz67UY4HpryoUcoLszixDdk9102W2aCdU7wQpSA6d2085aG22hDfNC2Sz5n4E
         2iMg==
X-Gm-Message-State: APuU4Z865sVJ0R4yEIm5rdGOeVp5ArEhofz+hLrQjGJQYy5d5Bv6rSK/
	+n6UspBtieFL5DC4rZLCZfXq+MuASG+ubXVTtz5owAPTk/5tVNMDdw1zGRtxvWCl
X-Gm-Gg: AZFdTZdEc2yOukTheEnZy4DS43vgHrsARitUUkOIcGEUSCFA7/OiOLBcpbTjeEHKc3/
	6DTSiBJLxKA3bSsxuI6RU3w/9d3m/9jWmalJIz9g3qHLLNzyktnzZZBHs/q+j8dvOHqF24Z3lui
	BsrZk6uFIXq5IeQnkQkKqlg28hNEu1OVOIWmXUpitXWeODBt+gVP0+HhrdtiwcAvWDiqwIcyf7j
	Mb6cCOFNjfX6dAqHnITrj/WVRwelmdpLmh118V1dtN16pj0YgblQHCRdgbRg9k1ijZJ/RvEuo9e
	e/uB0VFyJKY6SPFRp+mfuA0BX2WNAAGJ8O/KvL9kWJACvA0LZpFi7/gDX6VQFjNRplsph/AKINN
	ua+9N/Laa3K9EYCVvgYUK0KjmXAO6ytQkC1nrAh9FQD4Sn80xiUpKmweN4eGxvozsK9RxIbBBjh
	LOztKer+Sr/2VVyxhlFOmT+BMf6SegMlDKVTV0k3aR59YLVpDyWhcy1l6Q9/f5BQs9Xyy2QSbom
	TIifiaWXccifB33+KT3SjKgcLlR6Bg4hgylFXleU5WT2gUjiwlaE3jWIy86RLh+8ubedKcKL/0J
	ozF3oMcZozogKIqaKzIw+fGJKPCgVAgqk/CqGz2gUtmJ1I0eItS2J91c4voGZcjzjZmJaziyKKj
	yJJSANZKeiAmawP3ryxJfr66Zb/caxDK8SuYiMNEa3g==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id 956f58d0204a3-67df42b4d7dmr11725870d50.10.1795750056522;
        Thu, 26 Nov 2026 19:27:36 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa545sm10827809d50.2.2026.11.26.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:35 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:22 -0500
Subject: [PATCH 4/6] parisc: Pass the fifth PDC argument in a register in
 the HPMC handler
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
Message-Id: <20261126-parisc-hpmc-fixes-v1-4-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Uarh8Z/aMo6oZ8Si+QFLRTVFmJANSN0OjMINz8cEeOg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkzfJ8Befe//6smVApLxGQ1Li7hT4xL4FO5snHRmQ
 e2Ss6v5Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaClmG/znVrTm9Be
 8VWC1SODK9b4Wy9575/bnsm2+gyt2v+ZdFXBn+cEVu+9m+JnHlNmvHyQG3zpud+/RWyI/fcvNRH
 608tcI2BgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

os_hpmc calls PDC_PIM and PDC_IO with five arguments and stores the
fifth only on the stack, as the narrow calling convention requires.
Wide firmware takes it from %r22 instead, which is how real64_call()
passes it. On 64-bit kernels PDC_PIM therefore gets an arbitrary value
as the size of hpmc_pim_data, and could write past the end of it.

Also load the fifth argument into %r22 on 64-bit kernels. The stack
copy stays for narrow firmware.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/hpmc.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index b45604a09b7d..04d01e183474 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -171,6 +171,9 @@ os_hpmc_1:
 	load32	PA(hpmc_pim_data),arg3
 	load32	HPMC_PIM_DATA_SIZE,%r4
 	stw     %r4,-52(sp)
+#ifdef CONFIG_64BIT
+	copy	%r4,%r22			/* arg4 for wide firmware */
+#endif
 
 	ldil    L%PA(os_hpmc_2), rp
 	bv      (r3)                            /* call pdce_proc */
@@ -186,6 +189,9 @@ os_hpmc_2:
 	ldo     0(%r0),arg2                     /* reserved */
 	ldo     0(%r0),arg3                     /* reserved */
 	stw     %r0,-52(sp)                     /* reserved */
+#ifdef CONFIG_64BIT
+	copy	%r0,%r22			/* arg4 for wide firmware */
+#endif
 
 	ldil    L%PA(os_hpmc_3),rp
 	bv      (%r3)                           /* call pdce_proc */

-- 
2.56.1

