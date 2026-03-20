Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AEE1A682F
	for <linux-parisc@vger.kernel.org>; Fri, 20 Mar 2026 02:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773973323; cv=pass; b=HF72QMeXiGrd4KwYxgpsI37JQ2bw6Nw04U4PvOoi5ybsCIyOiwVpSb6p/ABzinqCRxMqN0hKaAeKYqPCdcgAHjr4SJNCnf9pZ+kdhZO+DBlccc37Fxmw1Bw//coPMJiwe/ZsJwp3TSZILjNr2dtcmEt2bfVo0DXTQNgxX0vd94o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773973323; c=relaxed/simple;
	bh=Xgwoo7xJJ12b4FQCY3ThOCsuhkvI+Io4glEZX877rGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5rEAAkn5bFDzubUxNoxxBMlGZkz/U6NaEj8SLcuq6RLooz/qCFtO80dvqCuoV4IL2XkseDCivy/T9MYoDcM3mPfJ2BgbLA8QoDUDnJc1vzD+ZRRqEYFFh2yYDuR5Puy4jIS4NJkoFahhiFIS/2MKWQAYy52MujNA6MhBvLxKRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=f5//oBDP; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="f5//oBDP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b062069f80so1373015ad.0
        for <linux-parisc@vger.kernel.org>; Thu, 19 Mar 2026 19:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773973321; cv=none;
        d=google.com; s=arc-20240605;
        b=CNcBkUzwQgDzNYnGanBkbWicJf+jaba53Z8YtkCitdqVHm1uDTBnMWSfiEJWtLxBM1
         B39AEX7pGmNotxp48QXCz/SyVz+gSP7Q+lu8tCIJ3qpjvLR+DCBNuXrtlBKhbzDNljd1
         afBTJZ3VcWU4HuWgRpXkzTiA5Zk5G82GK8TUwubLWX85/3kfSeswTtF2HEHlPJe2YdS5
         37/VytkcvMExIUDXoURz4iCpCeR99TKeW8rHF5Z0gOfHBnibEnTtb2CZyifN5pE6YuJA
         32tIN45sdDfHaXeOGeuWo5Gyi8SkuduxkfMCnVz5T0+CObNU+2FJk3geFU0iX209yHMP
         0g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        fh=EP7xDmqx5rxxBLdRUlLGoAgUnIhkZVqJdBJV7/oYiww=;
        b=UMfzmtHODaAe17zXjQxAspu+uyeiTUUY+Jl+3Zguuae5IOp7J/XM9wUtd+LFuXvjHx
         t6pe5bgUk9NV2XCicG+hG/lYgV90gOaKCTD10eGa26+yJVn/fR97SS+v4Jod6foXKSDL
         EvTYsv1rIOL2y/7/WTnBisLgD/6qMRSSRjerxyE3U5DbVWft0sa/H1pqj8vOnhSf8T/q
         FR7XRMgU3FAvDeR30g6KjZ+O0RMDuclDSlH71Kw7VajyU1VnyEp5Q0aaAj4j0hKj45bP
         O65ckZ3UT06QkdWcf1o5uGJ6CvLCiX51KMc12aRda8J7ayxovQIA05LHbIJF7FG/b4/8
         Z7ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773973321; x=1774578121; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        b=f5//oBDPy8PxDeYLPdlX6to3sdoj7BWSmE25gDqrGDnbSMEnkkleyyjZhjKWbhCpcq
         rN8ZUp2p2pQzUes++RZ4LezAN4Of1KsLz7Uzdh9tvw1hOmNzJCnTu0InqyozCe4wJVox
         1tWF8cbY+7dwKO/3Tb7Mxn0ChOYJfRwTvIINc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773973321; x=1774578121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15l/a+mX0jrY2HyrX1uNSgJuYoF2zhV3sIbAZuvV4Sg=;
        b=m+xZSDVnAJFxZXK6uooNlWdYvAs39MhoY3AnJ83ToBkPT+3CuG9SqksJ12ohw2bWNb
         qvcb+b5yfuphwoM3wMkuKR/3btzvefdd0PQH3ykLEmZGzB+nGBGCEf2GZpKPX6+9yd9h
         QdqvnITkUUAz+qt/SU/NuFPxptvTAT4aF10pIAh/uLSL0GMUowSy4/e9m/8R14LtasFT
         4e/1OivRicSn+SqldcMkCHg5GFLh6hGxId/OQdSgWWLCU71y/9+SfBh/oCshrDsKj1vz
         lC7AsaFnUhHno7zJ1eYiauXJtbCLNF31Pb8I9b9ntEbKvOjZi4mb8ANYf3anL/P626b5
         DzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkV17Z/tPZcDSKtL+iU3qvbVc1OFo/vaWruOV2s8D/H1GEXzFjeJGzchalZBVU3RGVYIfyVPDdN+0qNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywly9Vy3Q57TWSGc5WN9i+e19NktRHLIBDDe2LcGBOVZtSzN/Jm
	IgCPR/mdpl5taFL52Z7zycS2lNpcnMQHn/eduXEC1iGQt7bBqWskkueKPIRaOet2lIsARVShC3L
	lJtxYq0QpWkIF56CBaOA0r8fP6A/ZY+YFeqooMcA+xQ==
X-Gm-Gg: ATEYQzydhJu8yRhIXnDEYNn+69HQe0uRPw/nKRg3x1D8l2xAVKFhNKMluUe+9XEWwGD
	GJX0Vj7P2KRbVr3LpkBASKyulChkjCGVpb5AkxWjpga/4pv9d0vUl2nisBK46uNztbeNkThXnI1
	X1r5UsfuPe3E2m5Ph3pTBF5REdU/c8j1TXa01gZ5hcot2QnJTfWiH6QnLWopziGSSurBEAOTdU7
	ZakJ2yeeV4qtLLT+go3xYK70JYkjtdzBEoBb9cSr3Exc+/Zk67/qKOE3gheVoyGM/2lvXNUSC5j
	4kTDubF+rkc2eivUOoP1FQ8ehqpIPwOd1J6Y2rapsAv9R+Rp16SPFBsZEXQf0y+8MhsOYn/EI/6
	mV6O4iaDVSeHao8bf6CFmZvuK4QEa44apuAIpqUn41PAJw366Q0jW+jc/k/O6j64a1iMm312V/W
	oLPA8PVCmcnWZS+eKSJTm7M9uLzoNcats8Ggjz0g6wB9OFGiw=
X-Received: by 2002:a17:903:244b:b0:2b0:68d1:2537 with SMTP id
 d9443c01a7336-2b0827e3487mr11974105ad.42.1773973321142; Thu, 19 Mar 2026
 19:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx> <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx> <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
 <87h5qeomm5.ffs@tglx> <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
 <877br7muhg.ffs@tglx>
In-Reply-To: <877br7muhg.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Fri, 20 Mar 2026 10:21:49 +0800
X-Gm-Features: AaiRm53JvLQ1u0bQvPb7I_V5ZTWXhWJZTDukmq120HSb8ZVoBYjkq1f6a1uKhJg
Message-ID: <CAMVG2suiGVveCbg=0w2c2FnP4QuA97=Za70XuKQAXotsyYfkSQ@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, Scott Hamilton <scott.hamilton@bull.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Mar 2026 at 04:31, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Wed, Mar 18 2026 at 22:10, Daniel J. Blueman wrote:
> > On Tue, 17 Mar 2026 at 17:01, Thomas Gleixner <tglx@kernel.org> wrote:
> >> V2: Make it more cache line friendly and tweak it further for insane big
> >>     machines - Daniel

Reviewed-by: Daniel J Blueman <daniel@quora.org>
Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,

  Dan
--
Daniel J Blueman
