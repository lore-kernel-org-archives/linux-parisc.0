Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755787;
	b=lNFZMNjK3ipVXypA0bRnzN4mqH6X2xNMaL62Ro/nVyZv6/MNqedHQ1VfETnTftW4zlaD
	 qo58MG71tep4E5QLlhqb/YsTPzv1I6ITG2OLj+v1bafjm0245VdrZ8J7tFqoLCgmr0dMa
	 Qb7RCd09bsvjcKIbQdBOK8I6+kVDSqffYLHtcD4vqB9G/r3DXYApO11AttyP8yRvdEjNm
	 d4JcRsLs3cUKjW3g3/BRK/lpIDQ2dU1Wd7aeUWITZyLkJIo2jEA2i0Kns632YjQdEeo1k
	 Ov/ejuZq+pt9H/XzLzxKTSdoItXTzV1Mi4ijYeoNPnonCj2o6KbXVsaYaoqHI4YR6gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
	b=3ZSyEUO0kn6osDf00OAGOjBgZnb7w7C2/DNJnxh7VNnS5E9Xa9ANTWSK1Mr8HUPGfWYc
	 vPQekgzouNui38wiwjUaUqkPB+aLQ+NszPsmqm4rohYzzYXKNdQy24S38NMjahyTHNERX
	 iV32DamobHw1+u+bSaRnVoj9DIZ+aMTk/QUE0EINz1+KyqENaxljaiay3CnrF2fUwTE7x
	 cDKG1VGXADp+SLNFX4IoqGmNXzokm+7wDUHzZAb1mDjH/w36SljzRViUaMSFemdi4ay0L
	 FxEufOdMLuv7o5HN6sGzs7L04IiTaEJ+ZbPudCeHDr5Pdow0VFEoA8HjawB2adQqpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWWHlhEx;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5280A606A32A
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 05:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5280A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWWHlhEx
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4fb5d96b3so117952637b3.1
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 21:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755786; x=1796360586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
        b=eWWHlhExsP4fyPUz5KBx90bIaCqwoHxs819k9PYtd/yWPOpwtwIAyUvj4UTNaTwCyS
         3HFGsvi6JOjFKYbvD/ZXsDsY3vUYLsIq3ACrDbvYXADsxdAK33XLfrrtfnhjSncrZgDO
         yuB3hebmmJimgbBV7TP8p5C0EA9FeZ11aaUE9Dcwz8MNK3obWd7wjy9Mt1t9MCXiTohS
         dDBq54jR4gG7/MsATpQ8bSNWPWLgKHEQ3AZ1OzIdj0GABXg5sjbsrhUnfETvJj98+p6T
         eat0kNkgMHGi30v57ncFvX1U23y33CzWN1JArCeIslIozU8n0ny+pS9bWWCx/K6fgnPg
         gldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755786; x=1796360586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
        b=HpLk/mSfrGA68LEB+olHtPWsWrMH4t9E6WUoh7RXiHmhpeylGhTPKDugqbAxX4Kww+
         eizd5J8l3LO8H+W0HioODYsPOlbDSADsk4W+vwC2/kp006JVef0JNNsPiVpN95nOc6S5
         f4w1l/1/aNJiBYveoCgHFkDuB4+SHwlWL+QZVTLqH1TLWpbCKC92KVkH4wX1MU8PNzMq
         OOFgPG4SO+QNbil0f9X/y7yP5UGgfy/aHIYaHcQJgvwspduPgHWDUDXjFr/ss49fAN7/
         Liqz6rwoEsaplkEE+ZPE8GXszSbqqlXAnRocKtY6KmenEatocWILTruxjRc3RSmVq072
         aDlA==
X-Gm-Message-State: APuU4Z/9pEbxz4LZZvAPRzzjv7v1FABqj2l4ubir7Hr/w/yYFEsCohVG
	shy0Zp+G+boB8eaYKOr2dKLE8ejZaMa0YCfv4T1umcV2nmA2mR+39Luz
X-Gm-Gg: AZFdTZcsDH6IeIIszOFY2gNq7ukbc3YXwzw8nE0s7LKuH1sjAuVk+QRTWV+xJQ7IH8E
	SPkhFeWB8BeVw9Eohbq4OyRErLV23s7/EyL9n092SlwoSe8zBrAgZwlu3/k/QLeJo8A9aTbqSrJ
	dbdQ4JLP4QeKng00Wg+wlmv4DF00NO5kghaJDWmQuLZ7oTuvY4NOAYVkPIDy5Nuwaz24VoYVwwh
	FUnjbMoe6/k2/ZEqQAsyNc55XTVGf3ThOeh46t3fmKOltNsJD4wTV/FC/w++fvNbN7nYekD9k7z
	crb0p47KRL2jALyugB0pi45W9ktdvwZ2Q6LFaxhZFTq4tcwI8bJ/pKCxeXsUcGX6yR15zPh9Nh6
	YN3sosm5g8Y/FT6rJXxxDPFdDAplXwAEEecAEKCNWjtRmW+HQtkqsKilAe/Bk7aZG+dKrIpmoQx
	RrT/MeJ4NVdBVDxAI/2VzY25JtfKSMSQRlUd+XlD/1gvPTxOeKLqUlK6U85PX+mujPrtsyosH1m
	Qp35VYHGjwUYlyU+Xu/5Zb1O+ofPcoiRWIn2yn3uMjFp7UESXxpPE40XXrpkh4rBBHrl071le3N
	3TDIO1GCZ/Sy3IMDMePqlebCUXAuxh4jaIQDGb1IzMqvE6o2vkXvcW+6Xa33NBVKgQc6ZCr4sm9
	/73H2rFFI3Sza3l2ThJS53UsLJ3bCDZQ/8zHfGfjI3w==
X-Received: by 2002:a05:690c:300d:b0:8a7:ef2a:ff9c with SMTP id 00721157ae682-8b5203207f5mr95882887b3.2.1795755786143;
        Thu, 26 Nov 2026 21:03:06 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033f617sm90308187b3.39.2026.11.26.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:03:05 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 27 Nov 2026 00:02:56 -0500
Subject: [PATCH 3/7] parisc: perf: add PA-8800/PA-8900 RDR and DR2 access
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
Message-Id: <20261127-parisc-perf-pa8800-v1-3-4f3f077010ce@gmail.com>
References: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
In-Reply-To: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5153; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=9WDbQFCFxqYajhAixGr/2e39yh0jySm3MlMhHLbplHQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5+f4b/lya612hUOYWtyD5hr26wo5HX6JrPGKvWroob
 FOuO/eh4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5Rn83IcIcnY8n/vm
 8s3cvOyWwpnW34+9LRNqGL0/gjGjoP1Yu+/szIML+Tmbn0VklpZoh1xqsj8n/dXN7PvDrxzY1yn
 8jEa7FqPAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The PA-8800 and PA-8900 (Mako) performance counters are in RDR15 on the
second of two RDR chains, which perf_asm.S cannot reach: its STDIAG and
SFDIAG forms only address chain 0. Chain 1 is shared by the two cores
of a processor, and a core must request it through diagnose register 2
before shifting it.

Add perf_get_dr2() and perf_set_dr2(), and perf_mako_rdr_read() and
perf_mako_rdr_write(), which shift 64 bits out of or into any RDR on
either chain. The access sequences, including which RDRs take a leading
sync and that RDR10 and RDR11 are written together with RDR26 and RDR27,
are the ones the C8000 PDC 2.13 firmware uses (tables at 0x1d6fc0 and
0x1d8000 in the PDC0213 image). Both functions jump into a table of
64-byte entries indexed by rdr + 32 * chain, because the RDR number is
encoded in the DIAG instruction.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/perf_asm.S | 163 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/parisc/kernel/perf_asm.S b/arch/parisc/kernel/perf_asm.S
index 8fceabb1a832..ad240706750e 100644
--- a/arch/parisc/kernel/perf_asm.S
+++ b/arch/parisc/kernel/perf_asm.S
@@ -32,6 +32,169 @@
 ;
 	.text
 
+;
+; Read diagnose register 2
+;
+ENTRY(perf_get_dr2)
+	.proc
+	.callinfo  frame=0,NO_CALLS
+	.entry
+	MFDIAG_2	(28)
+	bve	(%r2)
+	nop
+	.exit
+	.procend
+ENDPROC(perf_get_dr2)
+
+;
+; Write diagnose register 2
+;
+ENTRY(perf_set_dr2)
+	.proc
+	.callinfo  frame=0,NO_CALLS
+	.entry
+	bve	(%r2)
+	MTDIAG_2	(26)
+	.exit
+	.procend
+ENDPROC(perf_set_dr2)
+
+;***********************************************************************
+;*
+;* PA-8800/PA-8900 (Mako) RDR access
+;*
+;* Mako has two RDR chains, selected by bit 0x10000 of the STDIAG and
+;* SFDIAG instructions. Chain 0 is private to each core and chain 1 is
+;* shared by the two cores of a processor. The sequences below are the
+;* ones the C8000 PDC 2.13 firmware uses (tables at 0x1d6fc0 and 0x1d8000
+;* in the PDC0213 image), one 64-byte entry per RDR, indexed by
+;* rdr + 32 * chain. The caller must hold the DR2 chain 1 handshake for
+;* chain 1 accesses.
+;*
+;***********************************************************************
+
+#define MAKO_STDIAG(dr, ch)	.word 0x14000AA0 + (dr)*0x200000 + (ch)*0x10000
+#define MAKO_SFDIAG(dr, ch)	.word 0x14000BA0 + (dr)*0x200000 + (ch)*0x10000
+
+	.macro	mako_sfdiag_ent rdr, ch
+	MAKO_SFDIAG(\rdr, \ch)
+	ssm	0,%r0
+	MFDIAG_1	(28)
+	ssm	0,%r0
+	b,n	perf_mako_rdr_read_leave
+	.rept	11
+	nop
+	.endr
+	.endm
+
+	.macro	mako_stdiag_ent rdr, ch
+	.if (\ch == 0 && (\rdr == 3 || (\rdr >= 7 && \rdr <= 9))) || \
+	    (\ch == 1 && (\rdr == 4 || \rdr == 10 || \rdr == 11))
+	ssm	0,%r0			; no leading sync for these
+	nop
+	nop
+	nop
+	MAKO_STDIAG(\rdr, \ch)
+	.elseif \ch == 0 && (\rdr == 10 || \rdr == 11)
+	sync				; RDR10/11 are written with RDR26/27
+	ssm	0,%r0
+	nop
+	MAKO_STDIAG(\rdr, 0)
+	MAKO_STDIAG(\rdr + 16, 0)
+	.elseif \ch == 0 && (\rdr == 26 || \rdr == 27)
+	sync
+	ssm	0,%r0
+	nop
+	MAKO_STDIAG(\rdr, 0)
+	MAKO_STDIAG(\rdr - 16, 0)
+	.else
+	sync
+	ssm	0,%r0
+	nop
+	nop
+	MAKO_STDIAG(\rdr, \ch)
+	.endif
+	ssm	0,%r0
+	b,n	perf_mako_rdr_write_leave
+	.rept	9
+	nop
+	.endr
+	.endm
+
+;
+; uint64_t perf_mako_rdr_read(unsigned long index)
+;
+; Shift the next 64 bits out of RDR (index & 31) on chain (index >> 5)
+; and return them.
+;
+	.align	64
+ENTRY(perf_mako_rdr_read)
+	.proc
+	.callinfo frame=0,NO_CALLS
+	.entry
+	depdi,z		1,DR2_SLOW_RET,1,%r29
+	MFDIAG_2	(24)
+	or		%r24,%r29,%r29
+	MTDIAG_2	(29)			; set DR2_SLOW_RET
+	extrd,u		arg0,63,6,%r1
+	shladd		%r1,3,%r0,%r1		; 64 bytes per entry
+	.rept	8
+	nop
+	.endr
+	blr		%r1,%r0
+	nop
+
+	; 64-byte aligned here
+	.irp	ch, 0, 1
+	.irp	rdr, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+	mako_sfdiag_ent	\rdr, \ch
+	.endr
+	.endr
+
+perf_mako_rdr_read_leave:
+	bve		(%r2)
+	.exit
+	MTDIAG_2	(24)			; restore DR2
+	.procend
+ENDPROC(perf_mako_rdr_read)
+
+;
+; void perf_mako_rdr_write(unsigned long index, uint64_t value)
+;
+; Shift value into RDR (index & 31) on chain (index >> 5).
+;
+	.align	64
+ENTRY(perf_mako_rdr_write)
+	.proc
+	.callinfo frame=0,NO_CALLS
+	.entry
+	depdi,z		1,DR2_SLOW_RET,1,%r24
+	MFDIAG_2	(23)
+	or		%r24,%r23,%r24
+	MTDIAG_2	(24)			; set DR2_SLOW_RET
+	MTDIAG_1	(25)			; data to the staging register
+	extrd,u		arg0,63,6,%r1
+	shladd		%r1,3,%r0,%r1		; 64 bytes per entry
+	.rept	7
+	nop
+	.endr
+	blr		%r1,%r0
+	nop
+
+	; 64-byte aligned here
+	.irp	ch, 0, 1
+	.irp	rdr, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+	mako_stdiag_ent	\rdr, \ch
+	.endr
+	.endr
+
+perf_mako_rdr_write_leave:
+	bve		(%r2)
+	.exit
+	MTDIAG_2	(23)			; restore DR2
+	.procend
+ENDPROC(perf_mako_rdr_write)
+
 ENTRY(perf_intrigue_enable_perf_counters)
 	.proc
 	.callinfo  frame=0,NO_CALLS

-- 
2.56.1

