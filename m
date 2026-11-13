Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605055;
	b=mIzgg+gtthNwWmoFHPv2vYhW3lDZXQuo24iT20s+RMRbOU+CNLNSclBcgs/rRO9iGMul
	 lsEFqPRvimABBhEuG2RIJudeAbGD/7tpj+VOzE0ohUFftOW3ozsiKZRXbiccM/j7Zzivd
	 CbM78StMUVRqqHCUgUStqdKcK2mlmEePEg4yuGYzG6/2WfePLbK8SrZrKZQ3wDz/LJRLL
	 xkuCmU/Zew2pd5DMkWlkZIMAuqqwhm2cA7ESYolClKKZMFK0jtJD82+Bvz9Gtx2Ot9p9g
	 QoySYHoT3LDiPtYbrCpi61PuZDnfAK7xKPyEj6Huj/L4x0VBrpXCDzp4ES2tEqxbe3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
	b=wDn815sK7MocZ4psbKnmF2fhdn1m+VV3xu2BpuCXiZ2TSOikbduJCS4eiSW7O90c4lhU
	 B6CQTh3m1OJ2wjVk5HDqhrPWzsy95lsnXcADxs4BReWN5yQtWbgYxHxdiIoqY/3l9IwB3
	 XppwSSXQoKjGRwEMXkKEaZT+nfhj5p3I2qKEYHZkR39e/LVrUXFYTgoqiY8E9pxwO4exk
	 5P4KvywAgb9JXzznlizQNN+0clzsLZhJybRunI9AdX2vrp8D6K/Ys3JpnzjBTg/F0060w
	 6c3uPvBtgjTjA9XR//yW5juvQ8lcOhUbgE6wx549CNrkhqr7QJrjIeOSU7I0t4uhUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJy5rvJa;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094A606A334
	for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 21:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A094A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJy5rvJa
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b30cbfa628so15009307b3.0
        for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605053; x=1795209853; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
        b=BJy5rvJafPobbIoLVUPKhs/edjpptbPAdPiHxbFipHFNLc6IWl5aVRky/uZQ5Qv7K1
         Yp3cN+17qsLDQQJ2pmqG+twcpw80Od1KARNILW8J/fvaIEnKwYAUSEsD3RMv3bSg73D1
         Tg/cxg3hQ2ZmfbzOMqqcKDHbBAIdBWnrlPuzatSmQEYfbZ3wAChPQYdE4puz9NFhpAvB
         OaSnUxFVw3Nfz8WiIbvTP4uclKOsiYneTmwX4LboB2sd3ZYI2ulaknNAlmMGa6GZQoEH
         d/S6Zxx4I55awJ/ilUwqjdkKoODHB6hHgw14Vz/orE4ynHp2iQEShG1WoT7baWTzpEGh
         NnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605053; x=1795209853;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
        b=U9n6p43AJLbG3if8uWQo+Y6OyfhWSctIkgmLkowQqiG3INSrXsV+A19ltiW9Fb30v+
         tmH+HFMdUAf6OX3vJTkdw4mjppEbS+m7gcFAgY3Ltc7Mj7GZ8/XqELUvYPnb0MoNejqz
         AntJR8hdCWXRlgcSwbZTz0wBQ5Bq3glAldT/SmKcPp7pris5EdinzD4lJJ5pWLwKuwWm
         lh92whqiejX6QzXq3lc+vMRB1/MYAuDZ+Wgx8yVqAPu+HCboMrJf+bmK/UYisXLfei3/
         xFjxC49PG3Hur/4LHWlkC8OmfZd5IeuNUaf3thedH8BCdyp5Lv/v7UUmV4/mc0ZrGs36
         MblA==
X-Forwarded-Encrypted: i=1; AL+hErFglAvVVe5G3ghfbn0VRG4OZnjLeGiqNNBFMGUJPZBpen1nYDqPZ53Y/dVImTnnLjvbWLaZWwmWDaIx6wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mmQiCqe1oBzHkQVSLyHtGKP02bvJaYSLIsWBkEJDBPSUz4dX5
	h82tdZA9Eu0uJ0Skw6TUWz61fprZbuhtTL4PKv0R7zRbpVkxEyXipdG5
X-Gm-Gg: AYBFou3ha9AeO2g74Xb+RNK993+WdVXeWlCaGq3c55QbTqikZm6i+mxX1Tz7r1pxYhS
	UxUAsXcXkYZf48n9WlPFJtTb5uEOq53f7MoNsl2BG1x78vwfRrPPzrU4S/dtM26EULNjPsxuFFh
	JhjkOp0ynQ8kL/lf7oJYep+eiygMisg4MJAW2mfMlf9nhW+WDQUJXMMEPkMMitVS8GDPSp3IbVJ
	4X4l4ZPa62DgVB2k1UzS7OayOscwXkbmyS0oc67a2vvueF8wp6pR+njzdMKanCwrJX7xunBWQYZ
	FEEFHqtkPdWizxmPOKJCvBC/0GEVKTNgGgprODUV9eKlaxIOuJKZdoX19s2FOoSuAmsCswrKOpy
	3F8cjTpVE0SuCAhKYL5A/t/5q0JUEjXR9yJXPkYypVVgZI55I8qh8Vj/smIPQtvKtgtAGiexy9E
	3Tt24bqtpqowyRRL+he1V9NnEmM3rwW7M3ZEpysoCxI/jYhRyh1fPqxp0tUaro7U5Y2JQ5Q7aJr
	CHrsEu5z2Z7Vxeanqjokh6SMncgqg1s9Vo8fyOxjy9N0ch/kD4UdfhjEn6q+j4ixkIYD70VmHYH
	R/pH9LzfnZetBl00qUSQ2IGqNRl9rTljiQ==
X-Received: by 2002:a05:690c:289:b0:8b3:5969:f245 with SMTP id 00721157ae682-8b4aa0cf2a7mr23640207b3.4.1794605053410;
        Fri, 13 Nov 2026 13:24:13 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:12 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Subject: [PATCH bpf-next 0/2] bpf, parisc: Add support for BPF_MOVSX in the
 JITs
Date: Fri, 13 Nov 2026 16:24:09 -0500
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWM2wqDMBBEf0X2uaHG0ov9FSkhl7WuYJRsKgHx3
 5v08jgzZ84GjIGQ4V5tEHAlptnnIA8V2EH7JwpyOUNTNxcp5UksOhBbZZZejRTVNK+c1G9thGn
 duXX17SqdhOxYAvaUPv4O8kd4TBEe34VfZkQbi76wRjMKE7S3Q6n+9HHSHDHAvr8BZCBbXa0AA
 AA=
X-Change-ID: 20261113-parisc_bpf_jit_movsx_20261112-b9d59d0871d1
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

Both PA-RISC JITs compile BPF_MOV | BPF_X without looking at the
offset, so a sign-extending move (offset 8, 16 or 32) is emitted as a
plain move. This series adds the sign extension to the 64-bit and the
32-bit JIT, one patch each. It follows the signed DIV/MOD series [1];
the parisc32 gap was pointed out by Sashiko in review of that series
[2].

Tested under QEMU on a 32-bit and a 64-bit kernel, with test_progs
built as a static 32-bit binary with jit_insns only. jit_insns/movsx
fails without and passes with the patch for the respective JIT, and no
other jit_insns subtest changes. jit_insns/helper_calls is left out on
the 64-bit kernel, where it does not complete with or without the
series. Not tested on physical hardware. The commands and output are in
the patches.

Claude Mythos 5.2 assisted with this patch series.

[1] https://lore.kernel.org/bpf/20260915022905.1535566-1-main.kalliope@gmail.com/
[2] https://lore.kernel.org/r/20260717192714.25C241F000E9@smtp.kernel.org

---
Nicholas Dudar (2):
      bpf, parisc: Add support for BPF_MOVSX in the parisc64 JIT
      bpf, parisc: Add support for BPF_MOVSX in the parisc32 JIT

 arch/parisc/net/bpf_jit_comp32.c | 41 +++++++++++++++++++++++++++++++++++++++-
 arch/parisc/net/bpf_jit_comp64.c | 11 +++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
---
base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
change-id: 20261113-parisc_bpf_jit_movsx_20261112-b9d59d0871d1

Best regards,
--  
Nicholas Dudar <main.kalliope@gmail.com>

