Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA03CD8C9
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439353; cv=none; b=aAj4B1DPH1sh/vf4xRkXjTfCvdsNVmfHuKs4s6flXwDDngQPu2XEXvTlETLLFz3GZ6tWN9xKesArFEAz2dH66Do1F9zrYtpvsV1dU4ZaC7vagFNLJCZyk85ESKiXSDHAtSoTufyzaI5py3AqTMblLUCxwAJemRB1DBHJBsiNoCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439353; c=relaxed/simple;
	bh=9HTDFgh78Fe2GyC0xWcWnW7NoLWn6ZeHtv+E3f+HaN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTF/N0EtwOqE2cHNczEt/OQI5jFT6IS52PnXx1a2gmTYVbu29up3zFywi49usUPsYfHU6kg0NLSXj8rLemGL5e0BbVsFCvCxur3YrnfK3tE24tLf44sXW28btZRcNVljz33BCeiRbScibNXm7Fgz113MQuEhgxc10AyZfS/FWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4lwo2ef; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4lwo2ef"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-910316a2fc9so56590896d6.2
        for <linux-parisc@vger.kernel.org>; Mon, 14 Sep 2026 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439350; x=1790044150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+JbY0VAboTvC1W+pbgoHzATtoYfEqLTAWX+x7DyMb8=;
        b=E4lwo2efrDzfW7p3Amfmlb7ZM7XPdjo+OW9J4ZHNGZEVCuWOZCNSlWptUFVNPgTnPp
         wrM6Y/DCElHTHdqrJOfZOs+2JZIfpUiNZwNzKHZAeEt+cuGOkctkVVbS72dfYRqcCO/m
         oVd9plYMVnwOc0Z4++QJsR8RFGV3tiE7RelFtKlcBhjKGZGjxxIFc/U4SzRO3H6EOXJV
         h38JdwdHhgf+CKx6xaV+AoQzN4L3e0jSnIp7SbOtXj6mWaoFhTu/nbxez0l1pL1CfbiI
         i4amPK6vLaQTb9GtGxjfGV3PlzRHUzwhmNdVhyryu7ko5LeLxVSYX5W1tH2jMDjAOYaE
         a2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439350; x=1790044150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+JbY0VAboTvC1W+pbgoHzATtoYfEqLTAWX+x7DyMb8=;
        b=nNS4byYX4XQvafGOlaVeUmsZPXAn2ucVTIomakXsrt0yDpQTowvz2QxnR2woFwL3mE
         3XcTkzzOrIE/kOF3YLNn65XdJqeZGzWrNcDLdHgqpstsB9KYrhsOUvETnvMN3eW/Qk3I
         ewmB1XPQ1C4PfYrzvjnAI69iswEvXn2bjvjpE7ZyJUww1p4fA8caMOZK4nQCDKNiS88Q
         5001rgPKrjgYNGxdkuXUX/5ptMhiqEO99ntrc/vUhjWNdAzFWxWhsuKRPrB1POd01dQy
         JbxSD8NSZQpM2AOPebVhB4W6LcQ2zYtJN0N1t8kHLozMDfmn5qYwKoDvZmFcEn4u7nZU
         o7Ig==
X-Forwarded-Encrypted: i=1; AKwUvByNaf3ROvqI3gxNz7dDghkcxtuI/X1o+6S6t/J7oa4CNXFTPxFsu0jOqNbvrZ5UmpbUJnFvuygnAPOyIiY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpMX3N1cmkz3LqX3ZUkS74w0h1nVTP0/GLdb6A6iZX6THYT4AC
	m1WPhS1s09FwkBojtx993K3mAmtIMqZxA2lBDex9jm11kC5gKF5yb+Yi
X-Gm-Gg: AYBFou3ESmhvENU7ii2AqpPOYVkajYJ3zI/IEeLu7MTJE13sLyvnI+R8m5oyMvFNtRd
	2rpq0QZ9RCjoV01Gihg2FtZirkXTt33dF9aDBOyY/3P7Vc2aJuo2oVvyH8sXVB/sWzuGM8zF+KQ
	+n4aVNUFV6FkHKF9FYuOLmFqijKbIirO703FSlFnBBkp2v310SgMccQDxF9902On5r6lmsz9kLG
	5ebxwOMMAwY1plx/rVrVbp+B58QiX8/KcgdcVDBuqdpxf16HD2+Rha1AqnUtCK7hoj8F5VCaBwa
	toH06VU0bPt7ILS1mpH1E0BDxNTtxpyYcJOoQZDO0YlwR4MB5maoUWCTcEfiEUuteprkWajmn/P
	kO0z02LHho9NQQhOp4KofcqnpqE8E9a8wz06ptoWn58ARwbvBKY1s3WUik9Wvp+pS5CR7qu1wtw
	b+HKeIEQuQ4uxuF7hW9IBLvo/f1rfj0kEEGCUgMCUN4tc/ro9nrWdREWMsV8+DpFT49A==
X-Received: by 2002:a05:6214:2f10:b0:910:3156:1639 with SMTP id 6a1803df08f44-9122e54f416mr95104606d6.28.1789439350417;
        Mon, 14 Sep 2026 19:29:10 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a4fb3e4sm90358906d6.24.2026.09.14.19.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:29:09 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 0/2] bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc JITs
Date: Mon, 14 Sep 2026 22:29:03 -0400
Message-ID: <20260915022905.1535566-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parisc BPF JITs emit unsigned divide and remainder for signed
BPF_DIV and BPF_MOD (off == 1), so neither implements signed BPF_SDIV
and BPF_SMOD. Negative operands therefore produce unsigned results.

Patch 1 adds signed support to the parisc64 JIT and shared signed
64-bit helpers. Patch 2 adds support to the parisc32 JIT, using those
helpers for ALU64 and the signed millicode routines for ALU32.

The original series was tested with test_bpf under QEMU on both JITs:
the signed division and remainder cases fail before and pass after.
Helge has also tested the series on physical machines and QEMU.
For this rebase, both JITs and test_bpf.o build with W=1. The source
changes are unchanged from v1; no new runtime run is claimed for v2.

Changes in v2:
- Rebase on current bpf-next; no code changes.
- Add Helge's Acked-by and Tested-by to both patches.

v1: https://lore.kernel.org/bpf/20260717190544.257306-1-main.kalliope@gmail.com/

Nicholas Dudar (2):
  bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc64 JIT
  bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc32 JIT

 arch/parisc/net/bpf_jit.h        |  2 ++
 arch/parisc/net/bpf_jit_comp32.c | 29 +++++++++++++++++---------
 arch/parisc/net/bpf_jit_comp64.c | 35 ++++++++++++++++++++++++--------
 arch/parisc/net/bpf_jit_core.c   | 14 +++++++++++++
 4 files changed, 61 insertions(+), 19 deletions(-)


base-commit: 5ef40d69b38a93bc9951dadb1a15c85c597e1a40
