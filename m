Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750048;
	b=LPCa5sf6f6lWC2OiJjco9vKpN25JhgpNZKyeJwhHfaa94Ukt3j9WWnGQdoeoH7IVdLJC
	 9V84dKHIi3vmpZGEQ4flXwFjNzU/sr1FA7gSYI4sTEAWHg2HYJejEA/eeQ+0AaeefeomR
	 syTmhQSeuGTlnbtfVfR5K8/3mdJ7rdxu1kqBTW2KjzZp45o4LeoNxltKIk00M6cu36jua
	 syxDXHiwXs9+a+bxdfs+NGwYIVmybjypMkpV87dkNz/NdvbfJHMWXf13+f7c8TK96kW7G
	 MQuAjIFYLRKVTuSmKvEMRjqn9sqJx71uS7BrRV0Q5pge6WTqkeWEW+ipuHKvSliWdkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yINKduVTwMLXn44jK+J1RxDRjRtoj9U5w2guzaWqgpc=;
	b=0GVKQ4ezBlEeiwnDK2OSx5bxfQhMFr9bGvRprLjlly5A6ayiBu2PjJFAr7hV/gDMzBQf
	 LfUGaWtWuTuspUNdUjFbHcaMc3Ub12c1acBbN2/PWCeH/UZpeI4AJE7YrdyFL/FkCwzJc
	 t1NP1mbCnJYlceDnvvawG2TIQGjKixst99H0svyLKqTyryRkNDJlVt34oW7sGLuAR2Xik
	 9j2/M8rmAYZ0vGWK6rPm2iKAuduG+8hJWq6gsjin7CCeG0JDBMsyhouNTvNCv6OR/DSzL
	 aH78XRkDemKsUZQCrNeoNb5vqJJq9ALMP++EkwB97rGQZQCHrsFZsw7iCvjwSeja7Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COJpT3c3;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE60606A31E
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COJpT3c3
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b335eeb340so66384377b3.0
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750047; x=1796354847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yINKduVTwMLXn44jK+J1RxDRjRtoj9U5w2guzaWqgpc=;
        b=COJpT3c3RCUOxL2p0994Xfjk7HULSDO/Ubf8PPXLlYPjlMe9mnXT0Oa2hKNujgb+UH
         uLQvydHS4Dk8bTe2M6v+faARRnPgEjN66HYAvMIcjJfhnjsoouFqYPf5ZRtLBpqzl4Zy
         8YvGT9/+KA++AyOA0WMyRzpaBOdNs37P3b/R8yOfK7S4PIjvstQgTn8l6JaSOfPmYwl1
         GWIznrdc7M2zi79t3Vv0AqJviaCwNRx+O+04k5KxYJmhoFWuhJ3IHTCxGIvieON5e3Hr
         moq+MJ2BAlvX9HnE93duTPNl+VkjcHXwiWeg+AErcvbaQaqbyAFNwBRdqFVDpwAsAmzJ
         hy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750047; x=1796354847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yINKduVTwMLXn44jK+J1RxDRjRtoj9U5w2guzaWqgpc=;
        b=CRaN83C75k67XsNSAww/oVY/cgX+2snr+v1f73kfwOpP0dgEddFBddRAJV+XPuPx5e
         FOlRCMJJ517/rtf92cadzpQlV4ymPxG8Z4DLRqvxxlMhun1yJhCrHuoKrfT9LbIqydeq
         fxUeV4blPe6ZGxxXmCJVMySJ/fWWTX6GL+R/fJEseimiXnXOq1nOUggSJJ72QGSRnQml
         lpTwjAtR6HYM9l53mCHKYJwU/x1wxFtUFC8haisSXFGTdQEtdGrW9Ml2dImCc5gAtUmV
         4zUq2WJPzaKl9rpmKe1p5uhXNn5GYv6JE4j2Oh/AB741mJEwhRUeS/ki14WgB5lRDf25
         e1Qw==
X-Gm-Message-State: APuU4Z89t7timuTlrtHYUdT/ytdUQdhWNTpDXoNL4W/boyLeBDlHZ6ip
	1jqVyMJVgm9vJILlCwaIYkSzUTb3p6VdOhrgr4IXrQgnSHyLq6rqY2M4
X-Gm-Gg: AZFdTZcyuu66OGxSaoONbUPgJDuWAkKOHGLDlNlhLlcl/+LP7xvkv7XFTWXzhPbzOAX
	aUwjY2uXQ+BoeIpbWHqdSWTXXrEHKv4o+PLdAbDG01yLeZXKpJODWQj9xYzGasS5wfbCNslofDX
	4DQ5UgtmoEmA3ShQxrplnYuHeqE2qqG0pJD3W1qSYmGY4P/MgRYVP+pEBv358vecAXhMPANvTuy
	PtHn8KbYzRR7A2ck2rf/27QzkUoPRIp6yHmgVr8xCZJlQPbn7xneUQiXp06eweBY9yCCrwTeKBJ
	h6/LvKeBaflXH+NmeKXxjWorz1HSZTaIdrWkhvxsL67FpF+wXCAgS5amVm6KooiPCanHugNFF/O
	9RkQiZXPHwdRnwr6v/k/ot38PrUTRxvJOHW8J+iO30EcsAJS+h+gQOWVgxurLLeCoQQ4NG7ahYz
	gSMaDrPsN+bUf+G4JELakNpAPzHEGPruEvOb01DHTjx1jmH8QGE1PswxprjivP8JHPyEkHk62a1
	jY0xft/pl1zgATa5aaEEHkb5e3aQFfpNAnZ05XCy5QGuOc4/g0AXfW+LhLY38kzLqnCwjAWfXNj
	GegOSC3VqliY8ySfF366xv8YZFeJvt5yY3gH0cGMNI+H6TjFUNLdZI05UoiQ/Y/dIYLYtwS2Wt6
	+PJvc7B1717B0BwojRIIlg1nAqvZH+8KtZekpHhlFVA==
X-Received: by 2002:a05:690c:4d81:b0:8b4:cc58:7901 with SMTP id 00721157ae682-8b52031bd6dmr81735937b3.8.1795750046641;
        Thu, 26 Nov 2026 19:27:26 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520c5b6f7sm90701157b3.9.2026.11.26.19.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:24 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:19 -0500
Subject: [PATCH 1/6] parisc: Load the CPU number with ldw in the TOC
 handler
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
Message-Id: <20261126-parisc-hpmc-fixes-v1-1-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, stable@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=zWWfEbrOWE9jyNVO6R+Q9o8IY8fifsE1PJwlyNdsTIU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkwvl3yh9W3/5Ym/1S4Wfa/ek7fYcGGI99d6fsNn8
 bfKV9w37vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrYoQYGfb8u+Nybp
 3Xv8uL06xe/UxmqT3sFPSqytDhSEDEjw1fd95kZNi4k5s3olw6uspldZbAjdiJk79csy+duMFkW
 ua6mwx7+pkB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

toc_handler finds this CPU's toc_stack by loading thread_info.cpu and
indexing __per_cpu_offset with it, but it loads the field with LDREG,
which is ldd on 64-bit kernels. thread_info.cpu is an unsigned int at
offset 12, so the ldd is misaligned and takes an unaligned data
reference trap inside the TOC handler, on every CPU.

Load the field with ldw.

Fixes: bc294838cc34 ("parisc: add support for TOC (transfer of control)")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/toc_asm.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/toc_asm.S b/arch/parisc/kernel/toc_asm.S
index 570f5cef526e..3e19bd24132b 100644
--- a/arch/parisc/kernel/toc_asm.S
+++ b/arch/parisc/kernel/toc_asm.S
@@ -19,7 +19,7 @@ ENTRY_CFI(toc_handler)
 	/* get per-cpu toc_stack address. */
 	mfctl   %cr30, %r1
 	tophys  %r1,%r2			/* task_struct */
-	LDREG   TASK_TI_CPU(%r2),%r4	/* cpu */
+	ldw     TASK_TI_CPU(%r2),%r4	/* cpu */
 	load32	PA(__per_cpu_offset),%r1
 	LDREGX  %r4(%r1),%r4
 	add	%r4,%sp,%sp

-- 
2.56.1

