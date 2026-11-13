Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605058;
	b=JNNP0Nf+N7CUZHBwi5MOkogauNFyoPREEcOXf0MtlMRRv5x5GE4qBTNs7jPgh8qCIKqF
	 4elDY46Sps2+DZf55WiCHPcViynPmud46PM8ouGS/gARq2shNaSiNB1z4ZJ7pVDJKRLFV
	 8DAhMqCCqzSPIUQGKM2yFYoizstFJRZbKtOnHxrHFztzbvc5GuOUYQdybbqQWhk19yY+g
	 dyeuYt2KZAoJK8tKGjn2P3aNWodXGGMTwLDpbpTuUZtMTjKHvh/9QreCsR6HyRLkoe3HS
	 snOtbJS8W11Qo9HK79aFEuRg8CzRI8k38OGZTWWK5L5CsuWa0026kYQyz3+b2/n+9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
	b=ujvZwBDiHrDF45s7gCDLOJEmoozptO3b782Vh3IsOY72yysoPD3isrTwT82zSEkF7r8E
	 JWK/ijPDbjrsqDZNbwVSiLNexR1TlXsalLsqfl88yQR2URCRlQ/i4RmoS8BoWdMX8mgu3
	 zu1yW3YGPyvZoK94eDRZNTfH59HtV6XDnLgoZ+BSqS/XC+Ju4WlZFgc0q5kb+7/d1+Iha
	 DSeu8z+iDLGMv2HIBoHW++N2JKe90iYU2cAKY7PLDpIFzDsqowj33htWY0wxq6XNZIiQD
	 sittswnVffCPctBGU/wPBszaekGsrvjyCT1cTPuliI5R8d4D8WJDoo7KpEZHNWnUV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqgpZ+Vg;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE6A606A885
	for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 21:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE6A606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqgpZ+Vg
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4a15c84c5so14580067b3.1
        for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605055; x=1795209855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
        b=DqgpZ+VghOv6kiKlYlBTomZzfu+hcG4BBrcq+hovu8GS1vBD3yjqxcs/91Mc8EiYut
         2myKqC1quAOzq43Y+sDNwh/fwLkCPXw+Sww2BiGA8npqcphk5YXIEKODAqa8Jv9Mst1D
         MK88pNxeAMNkZfU4Xvv0jU0qvW9plGeWVVv14SmK0gDFwtQKtUk1LBVzupOAYBOjexw0
         a+6U8nkbJ05qH2J2fzGT/qcRtTx7P5b8bcr3bdeHJk2kJjwCghYqnwjBKh4gFiCgO7SX
         ahR2txV/ZpVc3VVkEXLD3nAtC+9eNZgClLtGmTXBuij0JPH+qfJP6Wbw3MYQF2mq1MAX
         fUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605055; x=1795209855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
        b=jRxRTehR5V65K93ESP5bsmU3r/5AB/8k0StP9SUQMdBPcC57dBEpevS1pL0qTtrL5/
         h32NGQnzCLZTi5rBI7rwU1nsWYDj/W9Z8RGTZN5WEk0IOZAOYC1qvffaXJU7kclE/uBh
         L8qZfGxxb46qmgspXBDwrhBFVbsEYR/lIHZk6BN9mTmprHTMSC7LZJ3sSTlSzz78zbTy
         WICB/Y1xEKfIgkywRZd9uAaQtvyPYuqiIFQOHxhpvgF7//ro8Ey6KtaivfBTIDHErewu
         VweuxQq4/tTCA9z60+/Gc1yhyVAeeJFPklaYATIEfR/bnGQGkXMGpyExfXJVGVBdlgFZ
         OaIw==
X-Forwarded-Encrypted: i=1; AL+hErG1yPOsSWrjGAy9zY6UduVMt0l/5hPl2cdZNV9vYE8gj4EddSwxVbmDKbWA10rGdJAiRUW1cDd27UjpJ5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qhttqWmp2+XlaLFyQGuqwVhRhwGILALrjF210mKxry/An0Vdr
	0iZCJ3fX7HL86WoFSQrDrZfgLju3hRgY67Y3OlrKsUUTnhovH0ho4//R
X-Gm-Gg: AYBFou187Q/HCOYFvsQT94n55ZrKjd93IoKUAcOC3fCEng5MdeYQhY0WBgJKBlvmCVH
	2ATUCRqGyI34IsXmKpNWDbEurAOXxXYdjSl6TgBdfymQtuH0W+irQbp5TsukbG5B8ocQXBNJWlJ
	mEDOgDYb2QA4Hl+YoerGOnoFU+6ITJSuJMxY+sHaVeG5tnnQHDmG2YihRktcE4TgRyK1bz94lv3
	VSJsPzFXaLADyTy4lKdchik9XDLA8tqwmrVDr2EgKK0ohjQvSyPRzgtHkIqMLnZvAnBYKMuOSzC
	c3rJFhTN2bzvW0xbdpRRwasCnhti8W5zC3cwILulVPrZgGzHkvUdcWCJUqZBi6YrPVqZh0mgHzI
	6qEo/FLvXA2updbZzs1uFYWljLjblHtIeugf7UvPW2jmhoo/ZRkcmTlA1RJwjNoMYa8z3GssuCu
	6W4Jz3ez3aCqLBwhYvd/VaPC86BgXiJ1aJi2LkREf9livOo3AOeZ7yavM0pKbLr3dbv18bDUcGB
	xU06rejxSLudME5YKSwrIjI7VmUHYw8c1/OvSwPM0jOlq/T5ZkZWBqe8/LEK+8lpFzAH6dnn13S
	ojgcuGwIHnu+tIglXEDgCqaMe0Jz7Ycp/Q==
X-Received: by 2002:a05:690c:c6c3:b0:890:c0ab:2303 with SMTP id 00721157ae682-8b4aa2331f1mr19962947b3.21.1794605055316;
        Fri, 13 Nov 2026 13:24:15 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:14 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 16:24:10 -0500
Subject: [PATCH bpf-next 1/2] bpf, parisc: Add support for BPF_MOVSX in the
 parisc64 JIT
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
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-1-7ecc33cdf1b2@gmail.com>
References: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
In-Reply-To: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

RFC9669 defines BPF_MOV | BPF_X with an offset of 8, 16 or 32 as a
sign-extending move, dst = (s8,s16,s32)src. The parisc64 JIT does not
look at the offset and emits a plain move, so r0 = (s8)r0 with 0x80
gives 128 instead of -128.

Sign-extend the low 8, 16 or 32 bits of the source with extrd,s for
ALU64, and the low 8 or 16 bits with extrw,s for ALU32. Zero-extend the
ALU32 result unless the verifier inserts the zero extension.

Under QEMU on a 64-bit kernel, with test_progs built as a static 32-bit
binary with jit_insns only:

  # ./test_progs -t jit_insns -d jit_insns/helper_calls -w 0
  [...]
  #201/33  jit_insns/movsx:OK
  [...]
  #202     jit_insns_blinded:OK
  Summary: 1/46 PASSED, 0 SKIPPED, 1/5 FAILED

Without this change jit_insns/movsx fails as well. The five failures
left fail without it too. jit_insns/helper_calls is left out because it
does not complete on the 64-bit kernel with or without this change.

Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/parisc/net/bpf_jit_comp64.c b/arch/parisc/net/bpf_jit_comp64.c
index c326fa737ec8..315ae2a3ead8 100644
--- a/arch/parisc/net/bpf_jit_comp64.c
+++ b/arch/parisc/net/bpf_jit_comp64.c
@@ -619,6 +619,17 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_zext_32(rd, ctx);
 			break;
 		}
+		if (off == 8 || off == 16 || (is64 && off == 32)) {
+			/* Sign-extending mov: dst = (s8,s16,s32)src */
+			if (is64)
+				emit_hppa64_extrd(rs, 63, off, rd, true, ctx);
+			else
+				emit_hppa64_extrw(rs, 31, off, rd, true, ctx);
+
+			if (!is64 && !aux->verifier_zext)
+				emit_hppa64_zext32(rd, rd, ctx);
+			break;
+		}
 		if (!is64 && !aux->verifier_zext)
 			emit_hppa64_zext32(rs, rd, ctx);
 		else

-- 
2.53.0

