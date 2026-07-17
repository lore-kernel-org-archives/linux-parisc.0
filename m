Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823002045AD
	for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315184; cv=none; b=RFeTIPdtqgINI7VMvudKf5Garinc8QNvz6f/dq6YcKJzZtwJosTh7jNJ2QgxUQiIcNnE9GjWuX/+HtVFMrUSaho6iMJDTeIqv0oJcHXL7JQp/zn+QeC1yvOQmQW0/xxmYld4KI+Q0yxvXXxLNqfUX3rA3QBYJ93DEwo8m4It3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315184; c=relaxed/simple;
	bh=nWMgcy9zH/zCGg85IYNWf4KjnH9+fNVSaaVmgPl1xDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cIOF9QZ3EuW435x7ShJHwNbxKAO40zidl9zqQ2bKOtoGn9f9xF6FacstpNUB/hTXUw9UVxNVM+Xq8Yh68BQZijMowfNoSI76RhrPrXl/n6GBpJ/aqzTp9RD0eEUYrUfAiPgm/ZlG34T0ztCEqcrlLcfgstTGqlcMOrRtpulwtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkE3hNG2; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkE3hNG2"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ee6912d86dso35606696d6.1
        for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784315182; x=1784919982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ErOSeJ2Za9/1ZgC4ztqnYtsxKhikz8KNOMoALAHDxVY=;
        b=gkE3hNG2ux1nHj9OT+vByI94BA/1KfE4Vmxdqq8u9Eg7ScUJ1MNG8owDvs/Ni2BxP6
         XxvrqYSapwhErJb+afcpCGpyjPI0kEUYu8QsJ5JDbElAgQaLAHBS2kFdDwzgw0BtFOnT
         VP/bIiMJ8Viq4UUyZhGq7iEIRWj5h6v/JmQYLZUw6MMnnfHfUnkw9l7AeppjszGOfiUb
         A34kDASA9mz3FHPU1xVcjYBm3izAhB/utLYg5yGW10hGXhed/2lD9BSAwGM4Kw1ltawp
         cPMlsSkifgh+yV+fKi5Z1EnnjY96hyDBYGnVgNIpi4sukB7AYHkaAKWcoXp7Z6okvjbo
         LDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784315182; x=1784919982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ErOSeJ2Za9/1ZgC4ztqnYtsxKhikz8KNOMoALAHDxVY=;
        b=CQazWMFngCiXUDYoo9o+iVlM6yAParKrLzUV8E9rQ2e1PoeNjOhWThBEyaAifDeQnJ
         4s+GO+RZovP2PSHyBP1L8GY08lMt81WjpRal1u9qmFXDTfLHjpoweKc67s7/xfoe8IYg
         8UHhf/AhRqzHU0b/NQK/nxS2QrB1zSYOx9zplQ97JLtLSuo02TJGiDN9iltq9MDDiXJx
         5lhMEY6IHLM73tS2CE9tmLgA+fsjsXkGAlCwStx1O2EKZ0zul/XRlQ55bHOchVsIxJmU
         UCl3T/VCdfLawdy1QEs4iLTWktVnUH7HoVSMmpYtnR92zNipEragDCOQ2sbNUbSk7Dmh
         9hWw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+4BRSQyKDdXWsKMXmnALYlUDuFbU0IQ7++pVD7TJFdZDFbnnr+tVEqNjESJ78r/JCSPXwnbB6P1GJB/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjV41Dy9WkI6aNg26hhuWpvzJFzNqUKJHh+jE1oyyt8001sF89
	vMiDaVVr+T8GAUgqInXQJyMRa5Ak7hZyvVzgGzphJAmguyDn3KOk7ANT
X-Gm-Gg: AfdE7clMN6gxvsJmLZVF2Pd8xImVKQcKFQA8OD//Xz7+l3222B/FUb71hm915JJwNKP
	J3oGq+Zg5RR+xMOm1MNFjtzHDZbmHZ9b84qxscWStbj0dg9wgVZXfc9TjS+DEJNmY/aKdpiI4rp
	+HlKyuvnkZnpdYDfi28EUNDvDo7zxCVJAmKg04D/1ZX5dMj84sCQmNpbICP4tw4BXca43CaMm/y
	3/WitUc6iWF/xD1h+rSpoFPq+9wRvN52JEwNgnRyuNSmvHBA+3yXM/NAnHCVyvMDt6kXGu52Xf0
	U+GAsVybqkkNfBiaNiUw6xK8kDhDs3fwzYN5xQDHZtTQ5MisiY22YxX4oCfU+AeNRjKJAT/ctTA
	3JtLMRtjgbTAVMljJ7QLTZARg2SrPRHtB2x0fcMNdAqeRZAG9XYew1FItHmVLBn87LUR2hiXmjW
	nnkaPeD+fc
X-Received: by 2002:a05:6214:449e:b0:8fd:6de3:dd8b with SMTP id 6a1803df08f44-9077850ed21mr41084416d6.65.1784315182204;
        Fri, 17 Jul 2026 12:06:22 -0700 (PDT)
Received: from TurinLinux.. ([184.144.109.221])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871d06csm24035606d6.43.2026.07.17.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:06:20 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	deller@gmx.de,
	James.Bottomley@HansenPartnership.com
Cc: bpf@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next 2/2] bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc32 JIT
Date: Fri, 17 Jul 2026 15:05:44 -0400
Message-Id: <20260717190544.257306-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717190544.257306-1-main.kalliope@gmail.com>
References: <20260717190544.257306-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emit_alu_r32() and emit_alu_r64() call the unsigned millicode
($$divU/$$remU) and libgcc-style (hppa_div64()/hppa_div64_rem())
divide/remainder helpers for BPF_DIV and BPF_MOD regardless of the
BPF instruction's signedness, so the parisc32 JIT does not implement
signed BPF_SDIV and BPF_SMOD (off == 1). Signed ALU32 and ALU64
div/mod get an unsigned quotient and remainder rather than the
verifier's and the interpreter's signed result for negative operands.

Thread is_signed = (insn->off == 1) through emit_alu_r32()/
emit_alu_r64(), and on the signed path use the $$divI/$$remI signed
millicode routines (32-bit) or the hppa_sdiv64()/hppa_sdiv64_rem()
helpers added in patch 1 (64-bit) instead of their unsigned
counterparts. $$divI and $$remI are extern-declared and exported next
to $$divU/$$remU in arch/parisc/kernel/parisc_ksyms.c.
bpf_do_misc_fixups() rewrites the zero-divisor and INT_MIN/-1 cases out
of the instruction stream before the JIT runs.

Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 arch/parisc/net/bpf_jit_comp32.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index 5ff0cf925fe9..eea0a34a3bfe 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -321,6 +321,8 @@ static void bpf_put_reg32(const s8 *reg, const s8 *src,
 extern void $$mulI(void);
 extern void $$divU(void);
 extern void $$remU(void);
+extern void $$divI(void);
+extern void $$remI(void);
 
 static void emit_call_millicode(void *func, const s8 arg0,
 		const s8 arg1, u8 opcode, struct hppa_jit_context *ctx)
@@ -562,12 +564,14 @@ static void emit_alu_i32(const s8 *dst, s32 imm,
 }
 
 static void emit_alu_r64(const s8 *dst, const s8 *src,
-			 struct hppa_jit_context *ctx, const u8 op)
+			 struct hppa_jit_context *ctx, const u8 op,
+			 bool is_signed)
 {
 	const s8 *tmp1 = regmap[TMP_REG_1];
 	const s8 *tmp2 = regmap[TMP_REG_2];
 	const s8 *rd;
 	const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
+	void *func;
 
 	if (op == BPF_MOV)
 		rd = bpf_get_reg64_ref(dst, tmp1, false, ctx);
@@ -604,10 +608,12 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 		emit_call_libgcc_ll(__muldi3, rd, rs, op, ctx);
 		break;
 	case BPF_DIV:
-		emit_call_libgcc_ll(&hppa_div64, rd, rs, op, ctx);
+		func = is_signed ? &hppa_sdiv64 : &hppa_div64;
+		emit_call_libgcc_ll(func, rd, rs, op, ctx);
 		break;
 	case BPF_MOD:
-		emit_call_libgcc_ll(&hppa_div64_rem, rd, rs, op, ctx);
+		func = is_signed ? &hppa_sdiv64_rem : &hppa_div64_rem;
+		emit_call_libgcc_ll(func, rd, rs, op, ctx);
 		break;
 	case BPF_LSH:
 		emit_call_libgcc_ll(__ashldi3, rd, rs, op, ctx);
@@ -630,7 +636,8 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 }
 
 static void emit_alu_r32(const s8 *dst, const s8 *src,
-			 struct hppa_jit_context *ctx, const u8 op)
+			 struct hppa_jit_context *ctx, const u8 op,
+			 bool is_signed)
 {
 	const s8 *tmp1 = regmap[TMP_REG_1];
 	const s8 *tmp2 = regmap[TMP_REG_2];
@@ -666,10 +673,12 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 		emit_call_millicode($$mulI, lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_DIV:
-		emit_call_millicode($$divU, lo(rd), lo(rs), op, ctx);
+		emit_call_millicode(is_signed ? $$divI : $$divU,
+				    lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_MOD:
-		emit_call_millicode($$remU, lo(rd), lo(rs), op, ctx);
+		emit_call_millicode(is_signed ? $$remI : $$remU,
+				    lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_LSH:
 		emit(hppa_subi(0x1f, lo(rs), HPPA_REG_T0), ctx);
@@ -1163,12 +1172,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r64(dst, src, ctx, BPF_OP(code));
+		emit_alu_r64(dst, src, ctx, BPF_OP(code), off == 1);
 		break;
 
 	/* dst = -dst */
 	case BPF_ALU64 | BPF_NEG:
-		emit_alu_r64(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r64(dst, tmp2, ctx, BPF_OP(code), false);
 		break;
 
 	case BPF_ALU64 | BPF_MOV | BPF_K:
@@ -1211,7 +1220,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r32(dst, src, ctx, BPF_OP(code));
+		emit_alu_r32(dst, src, ctx, BPF_OP(code), off == 1);
 		break;
 
 	/* dst = dst OP imm */
@@ -1236,7 +1245,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 		 * src is ignored---choose tmp2 as a dummy register since it
 		 * is not on the stack.
 		 */
-		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code), false);
 		break;
 
 	/* dst = BSWAP##imm(dst) */
-- 
2.34.1

