Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165655;
	b=rZ3URZGUrhbywexMKXL04C+VPFluRS/ynolkCxt/RWZWySFr1DVqFDTbukOF6XW9QJXv
	 ig0wguhDzAiPdgZw9M9myAjCW25WWmW4BepzjMSHcnUty1GxO5l0I/iOA3HjgJgbdzRSe
	 y9APmPHDjKTTeeohAZNSWVUT3VXZivKvgkkrd9vXk1gGY15MHGLlQiAai5Z6bxOc8V0Qj
	 F8QY8RnH+mlXYku2ZfQZFJDVpRaKWPuKKQUo1xIOmBgLPQMjfU+NkBinTlsQ35jRYz/cl
	 pok3G3aHKXW1TwmPwAERdE+YJCOjYcsJu6qQv+kSyH7WIQKBPgmGykM0TqCM87WoWKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
	b=FPlX9/cymAkWDPQewi5VTO8EQW0CLe6pGAUKiQ8JuCiCfOw/t9/V4KQuQ/4uJSF8ZPKz
	 Jl+RpqH2WKIFZCMZ1jchnFSAKCvGVb9nOI1LLxyytRuUkB/A9AxHDXkifupc5S30LIoHc
	 2y/gaLE1xjj0cUfl4k0N6dCMVd0dyUKYt1jbt8QZIyoXqz4xwoz/0S9BZuVO655tEV4RN
	 M4Zzm5VkaIjNeMHtj/GlYWiOxPUeYmVG0LL7JpwFL/1UDo4t5nyVGJcRaBJ3wfU8Y7dtH
	 +n0RxSYtWDrsygOUiBW+9mBwvSWbsfxmnjaZkBukiW9kcdu2VXQRq6JaagKZ4UFQHPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="no/4CrUJ";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E4606A322
	for <linux-parisc@vger.kernel.org>; Sun,  8 Nov 2026 19:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1E4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=no/4CrUJ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so162615f8f.0
        for <linux-parisc@vger.kernel.org>; Sun, 08 Nov 2026 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165654; x=1794770454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
        b=no/4CrUJwSv/ZObw8Fvp8ImnvcHzO0eqwwqjjqLegaeGZohS4Tqgs9NC5SrAgiwGxc
         TQv4F8lvRKx5uN5G15rNPdQ/6ILpHl+d7CPJ/Az8TS7KATaQJtIiPLznarMwJuu1M8vI
         5utFUU5FuMszJEJXYkOV8Ev54UZ6k+YtSxiYMtpuwPJjgT5u6lDIUzijITv9G6LuvlFV
         Vc+0ID7IX98MXs5NNU/rodtzbabZxqBIcOiMB3QVFP2KQav7x5qHdMvtaW3W7x63yrKt
         g1HF3GLjdpOebBCC1/mObhOZ7CrR/yMfUZ1buaOAGIpouZqrtwPIO0RbDXcwY+3pR00o
         PDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165654; x=1794770454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
        b=hNdnWuOwQ99hxDsIHpl1gpedyJLCeOGvuLyUvLxRupKGS9kxpndV7aq6l6SYBvPegG
         vo3pWc+t5ZQdCf0zRskJ+MI08O3glgdayICUVzRduQn1hUZkcGJh61fNQaoS16c07nK6
         w1ETuI/yjCZ0aCA9v5hr6ldJ8iOl0P7vFm/lRxw13JenIEtCz6a1/0RZggQ91DSFYWeL
         f8nI3ghe2FtlvILBt1yO5bpjn4NdP9Dvk1TOluWa9Ztbi9CAmK+0wFK4r3TdOWZXiuGx
         oZH+EC5BgS3ZsUTHGcBr49EGgB5EWSeEWr6a2m/hoCbbfbfSrzZ4tYQR5nbPfDeUjatP
         0VtA==
X-Forwarded-Encrypted: i=1; AL+hErGVocRjZVeQZOfVKJoJgiW/WVGi0Onpm+qbhfGPbU22tEExPjykDerb7a/ZFkW16WDhQyOgshEjyD0ipkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sleIzMNa8XpxfdGOX6tDj6cTEQj2qS/dMu/3cRjHXS3Q22eZ3
	zRJRCfaeW2/sk839JgftOlF+1Z70+1B+4nD/7ZSqKI1Q9B0xigaMv1+E
X-Gm-Gg: AYBFou3yyRaG1Q3rL3OaJhLjthgkxRbw80pRorfnbcciqzt0ZRvDRbudqHelWvf50yG
	Mm3ofHcagY7HamuwxaL88o+ksJ/LJnjgFtbU0JIyp6vNLSaj8dhMLroJnVXqLORkUy9UUxMavZ2
	pQUwlY1cYiOoJiufso5wQoaKUs+BHrBOo1QzP9FB8vgwCM5i99tYRFkelKy97E8C67H5vvZeenK
	VZ5uBM8kHQRucek1LU7cSoWdg7DfTheiNbZNEcNsVAU4bUGA8Kj3ZilJ01BHbwtv1zJVLR0uSWy
	LbtBNqc5MS8maysgKzfcpzuoSxSmO5MYAdcE2+n07+7xn4xCz1wVbUJaCxZK1G67KPM+RQIwMR3
	gL8kY0poXvZPf/Ro+mD1yVgyg7ZDZy8u3/7l8zGwneEjL4TgCCneTFSmpeh8sm2f0L/0jHajGZ9
	U/n9Ke4fCJY4jJbagIqQN6Qk3h7LeMR8Mq8gEiOG4ATl/DIGc87YHQfwevX6iRdHli/JZ068xWN
	3xaAl2Z1IDJOoPDDdzBE12HezOfVX4Yk3RCQeI9NRHSV5Xl787mx6GKyl343UUDCxspX3QrsC4O
	TPHSTi5+Ma3CnHv7MWDbYx+LTgI4PfgJVG/KeYaP0HpF+16EpSQwzw0nb3RPgj09KZt2Bar4Whz
	koTemF/JceGCDUBfhJLrNhw869Y4P4g2a8AsWh6t+gL1RjSywuAmVOA8hotXbI/K23FIZ+Xtd+k
	gky3hkHnS4jqrV0eTFRXw2HPW0zOol8x6S
X-Received: by 2002:a5d:6f0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4958852d7camr4675476f8f.7.1794165653516;
        Sun, 08 Nov 2026 11:20:53 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a16e-6b01-f478-4cea-a156-2612.310.pool.telefonica.de. [2a02:3100:a16e:6b01:f478:4cea:a156:2612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b2066esm5651250f8f.52.2026.11.08.11.20.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 11:20:53 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: irq: Trace hardirq state in do_cpu_irq_mask()
Date: Sun,  8 Nov 2026 20:20:41 +0100
Message-Id: <20261108192042.14425-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intr_extint calls do_cpu_irq_mask() with PSW[I] already clear. Since
commit 044d0d6de9f5 ("lockdep: Only trace IRQ edges"), its
local_irq_disable() then skips trace_hardirqs_off(), and lockdep
assertions fail in the timer tick:

  WARNING: kernel/rcu/tree.c:2739 at rcu_sched_clock_irq+0x618/0x1f84

The return to a context with PSW[I] set has not been annotated since
TRACE_IRQFLAGS_SUPPORT was enabled. Annotate both transitions.

Fixes: 366dd4ea9d5f ("parisc: Fix ftrace function tracer")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested under QEMU hppa (32-bit, -smp 2, PREEMPT, PROVE_LOCKING) on
mainline d48723711bae: 13 to 18 lockdep warnings per boot before, none
after (two boots each and one with ftrace=irqsoff). Locking selftests
pass.

The exit annotation assumes intr_return does not call
preempt_schedule_irq(). It currently never does: intr_do_preempt tests
PSW_D rather than PSW_I ("bb,<,n %r20, 31 - PSW_SM_I"), and a kprobe
saw no calls. Fixing that needs the same annotation after
preempt_schedule_irq().

 arch/parisc/kernel/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index dff66be65d290..d9f6cb04e4bcf 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -497,7 +497,7 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
 #endif
 
 	old_regs = set_irq_regs(regs);
-	local_irq_disable();
+	trace_hardirqs_off();
 	irq_enter_rcu();
 
 	eirr_val = mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
@@ -535,6 +535,8 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
  out:
 	irq_exit_rcu();
 	set_irq_regs(old_regs);
+	if (!irqs_disabled_flags(regs->gr[0]))
+		trace_hardirqs_on();
 	return;
 
  set_out:
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)

