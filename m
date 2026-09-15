Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9304339872
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443388; cv=pass; b=FCYhxzaBxeBGvfPZjJff8x2x4qRASY0/asqansHFPBBQL4VYRWZyrL+HG5R2s7NABWzjXtkc/DZg0lc8jwGNYUnIu/9qQD+zt9q0QRGWlr58/4hUf57Sf81fEKgQqJC8pGXuLBfT2IEpJWPQNsnHNaRJDBSAuG7028rkn7T11do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443388; c=relaxed/simple;
	bh=hZYMHGu9n2q61eOftzQIb/1nkREIqMgUQN46A+rGY6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2imCS7YpjmD9etJ8oAPeEe7nLDyTulF6O03O/MtnEhauF0ywCtTpNQc9kLP61ClZh33Yt952nG+pMNUtIDDl65z8kwphz2n59e9OmKhK1rzJ1LfBLzqmslkkpjmOQxzgLouryfzB/ivksjD4mQq5x80hFNMjqucbhSUzoznvjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njoDCbwt; arc=pass smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njoDCbwt"
Received: by mail-qk2-f10.google.com with SMTP id d75a77b69052e-52fbd0f0330so23555381cf.1
        for <linux-parisc@vger.kernel.org>; Mon, 14 Sep 2026 20:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789443385; cv=none;
        d=google.com; s=arc-20260327;
        b=jzl9Qtr7WY8CeANtjYuzq+P6GLLfQzKIIFeBC3AbP2Yg0IGwleM4bUYcw5e03ya3Hc
         b81IWUZuUaBgejwAFukjGrMBwCGeGgANOmI90P8zDAGn7pkKoUADESmKg6jBAaOBr3jS
         0hK/kqDZQ6I/d5OD/BdtgHPLvhMBPiqf/yBg0D0tT5m8SuA2CbBnq3LM0f/fPjk+pb3L
         uj03Crow3E49F2TjWewd4iSYeSO2/jELYQupHDEtceSkFU1Yluiyumo71jJRawI/7HS5
         VYK/8yLtGXtOT4JLk5yY+ICyUj+3Ow0+fDLMWIO62BhgG0iAfL4K5Io8CQRaCwLm6w8P
         PIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hZYMHGu9n2q61eOftzQIb/1nkREIqMgUQN46A+rGY6E=;
        fh=zCzJUu9aDahtTQArHbs4Tha8aaniBi7Fd+X/po8BPq4=;
        b=K8B/JKxwjipFflgf0r2Vr3VGCAX5+A+0QvEqJYvZqik+Cv0eOLSsiVgdeX5BmhZx6G
         tXtEUXdBPX5ZEWaFWiakVyZeGZDzbk8wV6qmoDsaWm7CInClts/jJrCwfVfuLrZ74Zn7
         h+m/2Vw88jhP23yUvOTtSYazRcvucK5omEv5omC1G0LMiQGrBoEsjLsEfRVK1bNm2SAp
         Eb6ppZI2DZpRIDHlEY8Ptd3oYxghxKyt6625JQ8nwTAxdXekJdW7KvNN297xVdLBy3fh
         xZgOMk4IU5jsWo9LlXNLORcp+9Zmmc9M6mrQrBcM+9hxTVJjy4ejBFMB2fx2ciEo+9Pk
         yj0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789443385; x=1790048185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZYMHGu9n2q61eOftzQIb/1nkREIqMgUQN46A+rGY6E=;
        b=njoDCbwtKou8MdvFhjR14Z4/GuXV5OOn+4YpYUO8aj4dQvN20I8DJCLNNdWbNQ85Ay
         rZXmZujSaM/Y7mkIEnoAw3Y1ZKip3ID2ZSFrzq9rskxTPGbJNFG/7Bkz9kqHUmfam30t
         7ohKTgezY64IGiqvpZQ8nP+5IoHfcgSEWVuD5GyyGoVUOP/y4oKSva9zTZspvj0K1JWP
         AzyBxgQULVnOSZAUAq/04Ui4zoj5I8qqEJqpQjSyiifwiiwkPjWuD/5ibRB57sTaVbla
         EzJwwl2TwClsWAoomKzjyg1dieeE002NzaS16roRfyI9cm4NelUe+WRW+fnZCgjLIw0X
         xSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789443385; x=1790048185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZYMHGu9n2q61eOftzQIb/1nkREIqMgUQN46A+rGY6E=;
        b=k3KgmEt7qKCKfqIhlRFPydPmkQBTrgmPAP6618t7+HTZLoRJ14boEQNzVdF18GuWEX
         B9P+NzUe88Rx6lZI4TRtgC8wHmkSHSATVlUeboOfuIIFqIXt1D+ScZhQtwqG4B5cJsDB
         oy/vTHqiCbhB6YOSrh60hqI0/7fx2e3mV16DPfEjU5QzMEz4rcfvnzJfULTIXY14WAZN
         im0RBmFLZprM9kejNo+TlA32PCrSmS5L3Y2HrK4d7rXiuYxzaQafneA4Ey8N7ajJSeoX
         cycOCbM+W/SBQ0KNoCCJFqtuJ6KHgjATg2jwmavGEfH6tJe5qQSuchv86d9hd56Bsspg
         NaXQ==
X-Forwarded-Encrypted: i=1; AKwUvByrH1jl9Sz5Yn6oAW7eDIp+BRZY9JIrET/mMSUJA4l3SPR9QXp0ebTJiDSR00DcSF9lO3rejjwqfyypCV8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/eCXq1K8sJd+X+M0S5fZ+yYgTTtXH0MvYhnTmtsRgJEamsIZC
	CInwokwDiCJCaoPoOfFHtJ2hoV4uGxRNAwG1vNOZSOkUYhpDUdevs7L1BGlMYv0M+dsNI6iuX0L
	PASoEZLh67aDNNLPaHVUn61wmmLk3Sug=
X-Gm-Gg: AYBFou2Y0H/T3+oWHXzQT+LninDLelqQi+PuAJKMAPrtGP6vAD8OiwnRRG4KUotuiDt
	wumU1WMzq5sDvpJFc6UrAiSi5lNwNVRHER/VzEQEA4wt9hn7w27L8dBzt23ruP9V56/QS41jAE1
	SdIQwUiO6RQNy5AJaQB0GSXHOyWbrAOVUuzrg/BKhRk/+SZo37iZ+3abOPUzwfSy6wa7s6zJ1Tc
	A2xfAZPmlJVJWltq/W1gh6XIk44HafTHKaMHsdt0VK6FbZgulwyr9K4z6rMEUOCcHjUx5MfWjKg
	A1w/KePloK7O1EINJJ8qeiQi2Zt3lD++mL6NE3WwsrRTCLcwa/nakJI4QRBM6Fx1KsFCgDvzuld
	MG24ebdA+itK7sMoW5E1PwlBmiFRAOVispFJ7GXzo
X-Received: by 2002:a05:622a:d0:b0:530:e7aa:ef50 with SMTP id
 d75a77b69052e-5310cf0df29mr78559941cf.4.1789443385492; Mon, 14 Sep 2026
 20:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915024551.196126-1-enelsonmoore@gmail.com>
In-Reply-To: <20260915024551.196126-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 14 Sep 2026 20:36:14 -0700
X-Gm-Features: AcwNN1WsoDxBDkSxIV_grc7mDaj8ge5NA65R7aljjtw8l1KlfRcbqBeeoekJG-M
Message-ID: <CADkSEUgUuoy4Kh_dp-LJDfEp3+A=YaNDnqgROq25xJHRiAv7rA@mail.gmail.com>
Subject: Re: [PATCH] net: tulip: winbond-840: remove never-true 486 CPU check
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Jijie Shao <shaojijie@huawei.com>, 
	Petr Machata <petrm@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Grzeschik <mgr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:46=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The winbond-840 driver contains a check for boot_cpu_data.x86 <=3D 4.
> This field encodes the x86 generation (3 =3D 386, 4 =3D 486, etc).
> Therefore, since 486 support was removed from the kernel in commit
> 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"), the
> condition is always true. Remove the check.

Oops, never true*. Should I send a v2, or will whoever merges this fix it?
