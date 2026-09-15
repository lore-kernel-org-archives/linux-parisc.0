Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB53CF217
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439359; cv=none; b=Fego3GhNMG+1Z30MffH35JJRh36CHpS2GtZVxoz+K4b3QluMJF9zqJ7hQIRhNZajG40Bp7yXaftuwcPzOS64a+SSHtL/nuafTr5DIKNdYZxBQ4EUgyHTLFB2nitcXaBlZHNFh+/OVkegLOBvzdDe5j1t+sOx4XEQ/h1aB1OYc6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439359; c=relaxed/simple;
	bh=Qc2w8Bn8jjebsauvnltyZuoDR8Orfa6XZngLN1P+7rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvwB7+qAcvJfSrpTgtPZtrk06oKihBdk74luBANkJZ4rtvVDVtC7JTMRlifOvTiRrNtnyas3TsUDmC5jNAu/dFkvSqSrI0zTAlnJ/pFytnOaQ3dP02stjBUug64qYovlf/o9PsJmx5vJSi0EMyya84sXAbGMcfaaYrqQ1qAzW1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxayK17C; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxayK17C"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530c602630bso29349071cf.3
        for <linux-parisc@vger.kernel.org>; Mon, 14 Sep 2026 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439357; x=1790044157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvdh8OpoPsqhiuVwU1AEGCetGNPdpdBiLFHYCom0W8U=;
        b=oxayK17CAqKQMSVUsx/DyL0yMSPjHDShQJilhkPAMzW/iy+UQVe9ExFuDaCacRp6xS
         raU1dTVE7+BpU7KXrdjrspFl/ISWX4Yqb+FqBwsLuUx5L3wAufYVFazBp/W6cje5gkYV
         TV1rHG/V16meTDPK27XWTWQApYApV03avwQSR+jQLGInx/WgB5DYNtqP4IcSu/rKwRRi
         hQjHXItGkQW1PfPoIkpBDG5ktcmhZdkFqxaaL2bTMp6iOoILyJmQ3nC9sa0LdAppVhmq
         8awV+YAwp7dghbumvnU/XO9tDUEyUEQKzGnrNqZyXo1J5FArzZKy/VDa2qX+iJprIjQe
         YF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439357; x=1790044157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvdh8OpoPsqhiuVwU1AEGCetGNPdpdBiLFHYCom0W8U=;
        b=BTkfzVe9TS6XlVzJbcnkCEPHRNMu9f8NFLgFQpBWbgQ+bM3OGzuIQcogYp/fHIso4H
         HoO67nfnqz3dWarsAWy6QrU6m08ABqAcgDp7LoEVAZNdcGAqTre9mwA2dA8/AmTanGM2
         Vwg4ekPmA9XPfW4J9H/SQI4OXEFZ5PS/r9dwiEpJXAS/vfCfnXRjd0ff2AGOmSqEi6A0
         0t7fetI3mFMZR/ehWEcgL/wQKbmqSYHYRXK7Lq5ewV/ojGJGVE7WC66ekjmBuMpx5xXU
         JszWXSNNyjLKcTJulad8zRIqFV90tLqKFzYRiGYheYS5wPFgFPgKMhoWqoy84j1gCsXm
         tc/A==
X-Forwarded-Encrypted: i=1; AKwUvBz26FFa9+AqBh1jq8xvR3urgyO8IyjqnTF31pWSfA5cBvuSpop0G0+Bw0K3e+yzZgh/R7yzWu8k5mO9q/w=@vger.kernel.org
X-Gm-Message-State: AFuF++mE8DiUGRrOITnJ/L0zI7MkZOaJnUv+Rysj1o51SiVT4IyX0Q5M
	QPBNkzr/nJzTIs8v5qzYFWaEcfBfIB4djogFgBak3gHVhCKDIwDfJ07l
X-Gm-Gg: AYBFou0Mzl9nXTaVb3R/hyYTqRKtpGGRx/ifQyjt/CN7YP9B2iQzve4oh3LBJ0T5ur3
	axEXXQYiY+pCdQhK+l1xPCJWGcWzKsFU6eYUEhmDpSbVXksRIwrFsgJo0F6HvwrSb4gaIJ5R2OT
	RKA53Y8POq0nNDtLG6W2c813+a2DmfPSqZPz1d6NhbFfAiUsBfyfH2bfsMrjWqC+x7chNzqv2gC
	rn8H9G768TW8sfcr7YvQULseURCftcTgWmMj7uElDBLxjSeRkIpKZ9wUEQpo5n3VkcVqOoZUpUJ
	9/3wgA6VdRcCxOtgOwTENNgDRZS9OjTnXohoszr5Y2on6caRfHMq6XqC2FtvzA9ND57PBS8Zv/l
	ErtCBS0P0y3aUollAFXY6Skwhuc46zQxWxep+gc08yl4zjfuZ7wIMn98ZygstlZmTRCFXyLVd4v
	79dYj6SttPUGkp2fsbaXEWsms7P73lJy1cjCs0MJOw3EOJ4Rcjc4TrbAI7c7UYNpoP
X-Received: by 2002:a05:622a:96:b0:530:b2e4:d598 with SMTP id d75a77b69052e-5310d061f0bmr78040911cf.51.1789439356980;
        Mon, 14 Sep 2026 19:29:16 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a4fb3e4sm90358906d6.24.2026.09.14.19.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:29:16 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next v2 2/2] bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc32 JIT
Date: Mon, 14 Sep 2026 22:29:05 -0400
Message-ID: <20260915022905.1535566-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915022905.1535566-1-main.kalliope@gmail.com>
References: <20260915022905.1535566-1-main.kalliope@gmail.com>
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

Acked-by: Helge Deller <deller@gmx.de>
Tested-by: Helge Deller <deller@gmx.de>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp32.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index 5ff0cf925fe95..eea0a34a3bfee 100644
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
