Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039422;
	b=sEsqmtCW1Irp4XTkw8J9BCzDNxy4Bn1KgJVkxZuF3j9nZfFYi7h6f22q1Xk0cB/B6Vza
	 BZyg2nHlDEBlekq8RJpN8un49MOlntmmmsDtpctjPabRJbgAmwueX1XSd1HDFxe35ADl/
	 zN3+NPX+gxFBn10SCv6JjjmKuMhbL9ywxo2rAll1EFH157BA0GAZLVdn+5nRQAazCPWGI
	 hqaFEbG6sypp8R422IHaGF2OxN7VYzzrQ5Av3rVYWJcoR/3pbBWSwtQBCOaJDJt68GIqx
	 Rr1o5iYyS7FzTviUWaao23tv18WxmF/C9R5PJppoG9dv9CNlxKafxzwxH4lUS0tiJ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039422;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=bWmzruXZEhmEQlIaOGCtQWcVKwSOAmd+ac6gMiLH+uc=;
	b=vtW9wGcvuyyif7Qqa/GNt+/khefrAiaNra+YDwNOXhOIPNJYfoGh+YTIGRpaUVsxv2Xi
	 TSeBRWEGoJKZ2cyBNO9dbF/Es5hfRT2zjruUunivhlcYttZDnzzk3XdxQKSMn0ZILNNd2
	 ydZpOXdV/37MpSSlrggFPxr2baqUeDdNycOHGmWbdYdMdnrbTrYnLlISHmnrMyKiQnPXB
	 tF/zXCmzjF47x8XFiT3CeBWuWcC8aHsu5TXeXdeVmrUTISUZGXIlSpeVqSIsUNzNLRi+1
	 J/e2V1giLGlqVmS+UDuPZ4KtxTji6txNx6d8cpflSiUYlLMpPgMLgQKqBmSCGBK3Khw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MeoY8cd8;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CF0606A320
	for <linux-parisc@vger.kernel.org>; Wed, 18 Nov 2026 22:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MeoY8cd8
DKIM2-Signature:  i=1; m=1; t=1795039419;
 mf=PGRlbGxlckBnbXguZGU+;
 rt=PGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:XvlQouOn5gAgP3JQuj3MtQNW3918
   UZsWDU78U6sYOp2FjWnSGKfYIrfXL6ovmxgghEzvP2aYhWzDUORqhKXAjqAv8MeRh4b4chlSPL9
   PNla2IN5ThXXme9c578wW7aV64j+ysT3mTmEc5i2JHGexm900mQajqDDSQNlImUT2hTQOy3CBRB
   7MRb2ZEEEJPHPmOtPOZGfrvo0m5cePY6T5NPbznwUBqqSfldlZokChqcmxZN1KuzViYBRbXWBsh
   r9gH5848+z1fl7qCVvHn7m/HtPrADT+sVlB3PkUA0bWzw/kQTz3Y9KTPNa3w+gHAGCee8A2yIYb
   wwG32Ysn79dMAw==;
Message-Instance:  m=1;
 h=sha256:
   1nmFcp9qwx3J5op57jnuBrCPNQ66fTy09YrsibJJbnM=:
   xCt/PnXDoExBlPuc0gyE1UfvmRRPFvYHc63AF2PNLBo=,
  sha512:
   CMK8r46ior12brpyxQH9kGD0et4w6/4p3krhr3bsstsogr7tRjnkGMJRjkiGbvpeKi50EY17bJY+YO7/cV82kg==:
   KVJkB9/oziMzACbmlb3Y6PvKm61Ko72inGLsFuB97v+8LFKsEuHRJzsbXfpMAZTgfbI/cHhWKSMgX1KcP0+btQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795039412; x=1795644212; i=deller@gmx.de;
	bh=bWmzruXZEhmEQlIaOGCtQWcVKwSOAmd+ac6gMiLH+uc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MeoY8cd8QtnY/BOAX+uTAcsJ4p3jsxLJTGLg5gs0gRS3wlvnaWtZQcyOwTbunEAy
	 izAv9fhbAldK9aeTxWmAfS7wtUIfEGMrVZwwvWR5vZv6CkTFo2L9sb6s1/Ay19ZrR
	 c7Jgyxr3daG7lSrPjhdd7JXiSmYxlMEShHaOdhSL6XKZpvSaksPO8vRG53GEZTZSY
	 yRU2hrV+/VodqOD46ybZpCDd/aPoPTXjC5EFysfUM2S9S9L1IWEKrpHznX2ab8ENl
	 7QJRTxTlvIEKBHoCBPTlFC6F6uNw7fOVSHkzPFaLfXqBC4E3eC/8C4Y3PDGPGNlv8
	 wFJmn6bEeatoxSp7zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1xU4ri3PVp-007Erz; Wed, 18
 Nov 2026 23:03:31 +0100
Message-ID: <44f73842-22e2-48fb-b487-8d98b91da7bc@gmx.de>
Date: Wed, 18 Nov 2026 23:03:30 +0100
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: irq: Trace hardirq state in do_cpu_irq_mask()
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261108192042.14425-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20261108192042.14425-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1OHM6Pc1lmvdjkDkULRl4Yur/y1Qi5xPjVHbJ44chhbMuRwTWW4
 Tt2zcse7zwUPNHC54ojnvSWITydCTmLxsOCiSkFpmA3TgP0yS8E91EMaGn3cyKAE2+m7rcN
 DTIr5gIpDjJusGzU1UuQgCFk0IqxVmR99UqZbCphXTse3Dzbe0YVe3MGwLR2kFfvc911M+C
 TLBgthP/z7/z2PcHAV+fg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:17dja/JjDR0=;JCuaxe0QZJlsg1+cDWq4jxNAXsU
 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

On 11/8/26 20:20, Karl Mehltretter wrote:
> intr_extint calls do_cpu_irq_mask() with PSW[I] already clear. Since
> commit 044d0d6de9f5 ("lockdep: Only trace IRQ edges"), its
> local_irq_disable() then skips trace_hardirqs_off(), and lockdep
> assertions fail in the timer tick:
>=20
>    WARNING: kernel/rcu/tree.c:2739 at rcu_sched_clock_irq+0x618/0x1f84
>=20
> The return to a context with PSW[I] set has not been annotated since
> TRACE_IRQFLAGS_SUPPORT was enabled. Annotate both transitions.
>=20
> Fixes: 366dd4ea9d5f ("parisc: Fix ftrace function tracer")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Assisted by an LLM.
>=20
> Tested under QEMU hppa (32-bit, -smp 2, PREEMPT, PROVE_LOCKING) on
> mainline d48723711bae: 13 to 18 lockdep warnings per boot before, none
> after (two boots each and one with ftrace=3Dirqsoff). Locking selftests
> pass.
>=20
> The exit annotation assumes intr_return does not call
> preempt_schedule_irq(). It currently never does: intr_do_preempt tests
> PSW_D rather than PSW_I ("bb,<,n %r20, 31 - PSW_SM_I"), and a kprobe
> saw no calls. Fixing that needs the same annotation after
> preempt_schedule_irq().
>=20
>   arch/parisc/kernel/irq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
applied.

Thanks!
Helge
