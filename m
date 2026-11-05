Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911779;
	b=xhxoC6INuIuh+3DApS+pBe3Ob5yi+Qfqnb7NsDZaDMV5ZkjcN72u5SiZ3kMvT+nxQPzP
	 P+7YV0v/DRgZKQIZlAdgm+JkCwraq3oRh4HOCQXv+fW0+LjB7gWJb+Ed/YyD5xN/k4urz
	 2Nj3SRYhKrzazEJWPoW+XjJ3BwYu21loOPeRPWCmKtUtlDpvg26QN761e2P1IRqY+2BZT
	 DocXxrf2IH93fIG7v9v0jf/2gpGykyVuAg7dC1V0JDkq8YWVeByGQhsK6S6FCG3PEHWrZ
	 j4hTHj82II95he8K8PCZxq9fEyq2gchf62dwHdFQXykQqOfLaeSa51jcXTEMgO9ucXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
	b=W5cLvumbbuo+q2Xh6+noOAlqSfZVuCXQOG28iWH5sTAYw0E4mA0YLgR31bb9vBUSgDxq
	 5EMMR+iqZ5ihYWpB2U2ZBUgoEG8wzeZANI7K78MWVdEtY6lwsvuIhhNxFMfhrjb2wFC/z
	 C9vNbvJKTCGpDK/zTcYhe3wzQA3ta0kSIJDNVQUb5WlgUvPqFXM8DXBaYmeIEh6CQHh6e
	 AA1vJ722hxe1pUB/y4PGtqjw6be8LGQbXWlqVZgORRLL9sKsouT81zyBpGON5UXG1XUn2
	 RitO6KN5jykBVlLNcAGXiAm/3Xs7k5irOV+E40eLC1ZFCN7OerxlVCuBeG0RjsdvDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077BA606A32E
	for <linux-parisc@vger.kernel.org>; Thu,  5 Nov 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 077BA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so2042724b3a.1
        for <linux-parisc@vger.kernel.org>; Thu, 05 Nov 2026 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793911777; x=1794516577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=dxBFD7egkald1diEtbXOBXzH+9cQFK2KeCaFgwFJNeVqQ39GNskIoMvqgylgnntMH9
         o6cgkIhz7VeqRWc76fFeuaZBrUrsO0KbXGQDOo8UnmsNxd5DuGBZMTkVsx2LFZXyCFih
         xLmHM8Mx07KTStSbatLB7JBcE69i+TN4sfwyGum4R7QrkX6GMQsP7QDdZp7bkXe4WTSN
         kjH+OioEJh4aowCsawhV76CFmgsNb84NAEAQfXPTtwRjk+/N+4OfpAi+RPh6ypf7I9Ji
         LwRr227XUyaN5rK5df3trhjeaIYVx8XGIDVL5DDAgaeqxIBb9EXYuq3EuqROZW7d5HLq
         L0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911777; x=1794516577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=Erm7ebrbhLVIiTWDLKafKyUZLzprnu9OA/QG5PW5EIq0PhDf5FVdO6SThMGL02lT1O
         NZyQ5C3CmDBZSMKxEJofk/Xa6NnCcKmFIbk9sM/Y6G/gsdTHJx2LlXmNUCofHeYo9B5c
         tmr0OZxroWphTSNTwlLslCvs+/7R0qVRqEQSGSRM2OhbbBqO10qz+RoIV4Z+g5kXRV9Y
         VG0P6EZxrK6VE/cCuQXSXho4yPPjitWFCnEHx6AWLxp7TXaVXqvzFaY6ONLGI/wNx/3/
         8qr3iaaZKSVuXgvWE7TXr/rlcjGDuEfKs9/yE41ufzUMBnqEenhDF0a6DvPGHzKzT5HB
         sWVg==
X-Forwarded-Encrypted: i=1; AKwUvBzuVXhLxPbZqeKhMxLaHBXzdYGPYF/CR4fQP2GtLJE0Omi/T1L2idsLBzwLpW8xIoYiI4nO1jXHkEnyiBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zbafWucbF7ypSdJ/oJsYag02Oe7kEgsJvbjJutak8b8yFPKkS
	gRwnBvYDVODGmMbgKOnnOhlwEMHdb5ILL9mE/Ny/FeQpVsgP5hXySO/kbBgi+ePNKf6fJGwzzkr
	b7deeXA==
X-Received: from pfbkr9.prod.google.com ([2002:a05:6a00:4b49:b0:8a0:70d8:a2ef])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f95:b0:89e:89f5:18eb
 with SMTP id d2e1a72fcca58-8b37aaa87f1mr220362b3a.15.1793911776710; Thu, 05
 Nov 2026 12:49:36 -0800 (PST)
Date: Thu, 5 Nov 2026 20:49:36 +0000
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com> <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
Message-ID: <auzr1F0HNh1mazaS@google.com>
Subject: Re: [PATCH net-next 1/3] selftests/net: pass socket options to the
 scm_pidfd test flows
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Andrew Halaney <andrew@amutable.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 17:12:34 -0600, Andrew Halaney wrote:
> pidfd_flow() and leader_flow() take booleans that pick between
> SO_PASSPIDFD and SO_PASSPIDFD_THREAD. Make them take a zero-terminated
> list of socket options for the receiver to enable instead, so tests for
> further SO_PASS* options can reuse the same flows rather than copying
> them just to muck with options.
> 
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
