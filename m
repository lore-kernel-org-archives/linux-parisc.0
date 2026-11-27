Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750051;
	b=SKOm0J2mYwIg7F0zhrYMRFwRxLjL2q0dW62Rz1CoksLJOediJAorJf1zRtRITUbjjzfS
	 E2skFVmlCNRl9pHvVJA55PAxGGriv1MHAdINtNpCJzmHQHDF4nkzqdH2cK6tObjGVLaqm
	 Dc2o1jkuWNvUmjo5A3cSZb9D2Hz6oZSLj4n03yZo+V25cEI5zwRlz0Ii1ppLn6r/un8Jl
	 GyQbfehllK8vlXpi43PIFSTsS+/bShVriEJHSxoJqftTm7hAN+MX39ij5nX6QCuZ66Uki
	 rU/UZTV2cAzJ4STwrvdxQCmgbiZcCyFtdV0AjRHlDNpTc4n7Uj4F1xsD+1P6sG6ZqMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W65spxSOE/XnrHWe3HBeNHLHIzDrbeo2CGVaGDSIOlo=;
	b=EMiM3vsXopLwujGAmoKQ/nv64eIBw4sw6MqiKox2JbDhkuLlMn9ZS2DdTMZv9AR7Vxzc
	 lWNRkRHOvdvEX+p+PtIidRzW4uXihowcronoiPPdWkc3P2NJNjM8CglesWX1xKJJlmEq2
	 eULNQ6Mm0vhM2gvSAQsGXVbAS/gLw9jxPWWcNeXDrWksU5AvUwivcvnQI3aDmrAenFH3D
	 f+6Adyu5ez+/MPAFdRJ9BuRgalLO5EdfW4kS1B/dvedW6zK8h3c6/IRpfzthoi+xeLd6h
	 sfgKdEd7U1zE75Z2rEpRvTEhlLaQSvIoeZ27Uq41/SJ+CHF8BfIxy0tCE2k+aE4Bekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RC9FR+kx;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE0606A31C
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RC9FR+kx
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67bee1f693bso5961162d50.1
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750050; x=1796354850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W65spxSOE/XnrHWe3HBeNHLHIzDrbeo2CGVaGDSIOlo=;
        b=RC9FR+kxnESOiFo8m4INKTa4zuh7I/AlHSfvfpdivIBO+eaZ2U1vNEH9hilaBJYHiq
         SVegEQr+xwV9P2eq/2NGwyL0TS9Zj16S77YEtrEWjN0PJuxF4PQH8U7hCsKWZjARXeUp
         t6dwdcfOVd+tkcJojIfTdfuSHTDQ5JJU/ZuDULWBngIiYftcP+RvE9KacGIu5YC0tXaz
         F2HdrajO08zuy1g0kBbnK8/W1ss+iPbl8ZYUkFJBW433jw1LwSssn4HhfQ6YsIex5nUq
         HGx2qHdcT6u1a0Sci3EDm6seR9KuMxg7bOV1+tcoKcTzVDYNMZs739M0bZN2vVI0OA5h
         IMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750050; x=1796354850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W65spxSOE/XnrHWe3HBeNHLHIzDrbeo2CGVaGDSIOlo=;
        b=bYTi9FrcnQ2OfEFUfl1Ol0qqcWH2kr9k/sTpKoshJrtXNtvw85Qx8uvVdi083CgkIk
         ty61uAG6KbPB7jMAcAEpqsB2dh/jS2Y0MoxpLrAtPsV1uOfiGTOVzDVdRMgCm3jEQieO
         2G0+BOm18Ug38ezwWmKZ6N7GdTTVxAJ6a88nJ1CvJUDrlglG4+b9BwfXSud6WcJreqml
         nAq4JX3YtnPYrIsnfsKrrgswa6BZWrbR5TR3t8VCc3GmaovDgekx8d2Ase6WFCqPueMn
         NVkba5mgGb/se5Ph0W4fD7YsLUqyh7PiLjeHjjkijlciF9ILcqpbUzDG1aNWM/bUZEJP
         wnIQ==
X-Gm-Message-State: APuU4Z/I5+mqv6SqYS2Rfdlig7e1Bp0AKXINF3mbDVMFlqR84hzdEOzg
	C3rh68saWUKf70dnrgHpKaw7V84PzxW7LHtyo0X8EuaojLy9bqr7r1yl
X-Gm-Gg: AZFdTZdd4klHIKiaITSyt3O72AEay/wiEAqydIrFZTsaFJBckGSYrhq/xM9xkXpLTs7
	ivihVO5CfnfgZnGFFtJ0M8L1ejAHzhdZOKbOMVkT1V4E49kyYEg727C0pakygWM4YZyK+Ne7EeE
	yX9HBQGyra5BvX/hCSQnpPiHPoltmxYh1Ak32nuF+uRP0ebLpQc/RZxkenyOhr0XNQftv4Neq1w
	4/JrGU8/x4Oc36VAhhdZ46+I75Dylo/SihCOnLyM9g6KBRUtGpUNR6iMPZbvIjWDxID9efohRnn
	aW0tbCPvM5Jp3Trdndt35T9n7qvZKoLAzZnY4emVoWHWvPta7TXhyYk8+wkCKixB6gZV9VM/B4+
	0RmDso0U8/qpVuPZedDihlO5FMtRtBb1BQjme5EOFP7krDM/9knWaIYm/maYu4WISP6Lvm9yrZo
	Ekg3+SDktB/643mVwCJYQ0x5NTT9fX7MlO3xrrGVpcxCfZqK+GMnbPPeZX/1FSUhfIdiyK9e0Yx
	gxDVBKNuR7tywCoapJV2cloALtmCGZZB61VgiLEcywWQzYT2RNiMld1+gCdoEWQK+xxLUDNr+C6
	tABIvweEe2S50MezoC8lyZXOkwEjq7JgIoC4ZxU14gTngT5YDOTg/1+XQV9A3WEF5TEJaz0yIg9
	AUPFKc09YWiTc68snH+7vtd4eV1k5ooGrUNR60u03NA==
X-Received: by 2002:a05:690e:12c7:b0:67d:f50b:d848 with SMTP id 956f58d0204a3-67df50bf365mr11533300d50.38.1795750050366;
        Thu, 26 Nov 2026 19:27:30 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm10715654d50.12.2026.11.26.19.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:28 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:20 -0500
Subject: [PATCH 2/6] parisc: Fix the HPMC handler stack on SMP kernels
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
Message-Id: <20261126-parisc-hpmc-fixes-v1-2-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, stable@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jBxkjFgMdQFIcidTaqAmGEWL4M+YGtN8RaJ/psbUenU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkzniPUpnDhx4v2fXqWbVp3h2Hq1J013claLEu8hr
 60fte5ndHxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1bzYyMqxsW9Z+P+
 RHTO9ij9UhXPe8eERWbJux0mCn17snTFMSZHQYGRqXrq4Vjfhl2tQmJ6FcXM8oE3lHPV8vYPpW1
 qJbpq8b2AA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Commit e486288d116a ("parisc: Re-use toc_stack as hpmc_stack") made
os_hpmc use toc_stack, which is a per-cpu variable, but os_hpmc loads
PA(toc_stack) without adding any CPU's per-cpu offset, unlike
toc_handler. On SMP kernels that address is the per-cpu template in
.data..percpu, which vmlinux.lds.S puts between __init_begin and
__init_end, so it is freed by free_initmem() and handed back to the
page allocator after boot.

The HPMC handler then calls PDC_PIM, PDC_IO and PDC_IODC, and IODC
needs about 7 KB of stack, so every HPMC on an SMP kernel scribbles
over memory that now belongs to someone else. On a C8000 the PIM of a
nested HPMC showed PDC running with sp = 0x173a20, inside the freed
range, and the handler never got as far as printing anything.

Add this CPU's per-cpu offset in the same way toc_handler does, loading
the 32-bit thread_info.cpu with ldw.

Fixes: e486288d116a ("parisc: Re-use toc_stack as hpmc_stack")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/hpmc.S | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index eb2e4bd67035..ee39afb9bebc 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -79,6 +79,7 @@ ENTRY(os_hpmc)
 	 *   Using callee saves registers without saving them.  The
 	 *   original values are in the pim dump if we need them.
 	 *
+	 *   r1   scratch
 	 *   r2   (rp)  return pointer
 	 *   r3   address of PDCE_PROC
 	 *   r4   scratch
@@ -114,7 +115,20 @@ ENTRY(os_hpmc)
 	/* Setup stack pointer. */
 
 	load32	PA(hpmc_stack),sp
-	
+
+#ifdef CONFIG_SMP
+	/*
+	 * Use this CPU's toc_stack. PA(toc_stack) by itself is the per-cpu
+	 * template in the init section, which is freed after boot.
+	 */
+	mfctl	%cr30, %r1
+	tophys	%r1,%r4			/* task_struct */
+	ldw	TASK_TI_CPU(%r4),%r4	/* cpu */
+	load32	PA(__per_cpu_offset),%r1
+	LDREGX	%r4(%r1),%r4
+	add	%r4,sp,sp
+#endif
+
 	ldo     128(sp),sp /* leave room for arguments */
 
 	/*

-- 
2.56.1

