Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD5369239
	for <linux-parisc@vger.kernel.org>; Sun, 15 Mar 2026 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586783; cv=pass; b=jpfN9q2PXajNF2rDqKW4tF1UsdPQWrrFckxCXldiQ+MgNtE/hX1BVpq5G+oNxVsyaHp2jCXN05qhHNjyNhp6SA4ApyiFOQXZB8OOhz9zkrFVL7THgNd2rHSDBjIg2Bed1Pu1s2bKfSQigC8Sd/CZ6mKKgIwHZpP83vAoda1G+bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586783; c=relaxed/simple;
	bh=cmAzdK8mJM/CEflDkCR6g0diVGaH9lYiVEHzSDqkev8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXNsmzHoatAW3htI3VG57BZD6VznuZ4iVWPui77kv+A3R36lczdiJOZXY/JZYEMW65zcSEi7B0d5Dg57rT1dRkCd5/NHicjKHfqgEVGeU1qj05O1Mxet94a3vRonO72bBF1N2yyuHps4nKs7JYCUq6zdCFDr7Ih7iEoTkQI/+Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=jC8I11ww; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="jC8I11ww"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a871daa98fso28321515ad.1
        for <linux-parisc@vger.kernel.org>; Sun, 15 Mar 2026 07:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773586782; cv=none;
        d=google.com; s=arc-20240605;
        b=M34cB8JgerY6oWqbSeLAmbnHrXyEh+YsiixE1pKSbnliPkKF00R+39kTY7C10ILKCa
         p6wLa3KsdivSzKMoUquBRlqn16mLvl0HI63tsaPuaNAhC614TtPiWssnpphuQrizoHMD
         ifswl49BNnJ0N/5kwISiYV6LAiDkugF+AKvaZH0tbdrlDIFV31gdgzBvhl21FS0l4F0l
         pSvWi8KnJRdcuJccvBExsoCAbs9JhL2w4iJOBh4lrQA2jta3hN62B728Qsrx0cqfoQ+t
         r/wWZ7Dg/G+ae8mFON3+wJXanRQK+qrTEtOqM32Pq+L41114grLKL1DyKEi7ebNy8mGu
         jW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        fh=4eD/bLw5V6QbGumyHJFP+Y3RJFF/tqSU2Q/ROfagolg=;
        b=A6cL3GDIZ48mwLFB2bdXMQih2tohZ0Tq8TUlXCRF62yjoqb1KRNYFBGag2Z0YpQdIP
         MhuyXPulI+tE51l/OE9OuKqWID7FuKJBvUcyMAvditvYRiMkp3SsBS19eFxlO5W30fD1
         FJtB9RFolWIVXPzSJiUU9PtWOyhnreGLT1iRBi12acGZNGY8hyqusMIYhwQah9gBv+B3
         xnJ5CgYd6YpnBEewW9i8k6Rn1jPtzlVzHeVPwg3A6yvtAGSdt6TI/JAAUFPexGnMxImT
         u6rJg5MqJIEsszHtKiRMu2xZ4kdHr/CogN6HDO+BSEEOtAv2NVAt1NiyICAIhnNLSIft
         KCXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773586782; x=1774191582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        b=jC8I11wwdDhXFFLiLxS2yYqWQewdJKEDu3VYBhnMh2Hpo4c8FyogwA5754BQ2ohOMW
         2CviQ6ahUEm9MXjHr3fqZzWAP5HpPakU/RJ52yCK299HU3u6bDwWLcHTOCsCoFB8kfjL
         /1CmhMM+hRg0XMIAL9mAYHW9nlKy1ec+ItMf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586782; x=1774191582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2bgQXdn651hknnodZ1KyTxVyFIgCPV9YrQpZ4c7Bqs=;
        b=azibRvFkeyIKWDfEwQsWNSWwEOedtzWyxjD0qg3qFz25KXlCEra6uNo2rg0jwvMJa7
         xOcpLu6bAbVGoSTthK3YbfVjoa0wwBH9IAFyMFHotzLqHQ3H6Fdobi+LwqRO7+/1u0QE
         73bYHvmRwb0IJoK+u1kXzRzec2lBACw8rwq9JADoIVfMn2sWNsFph091vljIlOdOO4f1
         8TwFiZEgYT8I5nXO3fW1D49OH2dnHfne6nlbY0zWx5yfTFumCWB1n4tulfRDc8IqkVML
         R60qvhNtGJOUCKJIbGKvPu0FSkOHpZSCFztzG+Q8A2hPOKrwrfyaOp5s6BdUan4QL2IO
         FSAA==
X-Forwarded-Encrypted: i=1; AJvYcCVXCC8mTmNA2Gc/Ti+INKZlSIGMfPCznvXkHqjcsuWI+LlFkWvk5c2zJETv/OJ3ROoIWg2MSIQKg7l47C8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5YHdwckne/O4vdMpiIaj5lY7X1QCLh5o9Sak8UnTPws+9eYSx
	01qXqYvzsaIfIbEHZi7vLavP6CYEpaPrGW9f3czN9p4bz23l7KPDOtLSPAYvqd+z+kt5ian/Bmg
	wnvSqEsNrLVFcpVARrzWmVBcW8B/XXdQnJz3QpOZXJw==
X-Gm-Gg: ATEYQzydoWLOgeVLDxp+YWdPOGWJyjsQiV9a8vYM4ZYCu19Qi+f8k9OF/jWFmeE3FkE
	cA7qHXSMYHJl6ZAbHis9UZRNrCpzyBycgPDMQA9Gyvk0MhWfGI9+lhyrDPnmwUvFtxGFYRmW/mp
	exGUHqpyqY611FulzsJLWs0bV3L4mY4vt8EXbpA/303ZwFh3BTLwPoY2/JWltWx8gNIn6Ty7/xc
	SjuRPaE6k6ZOWwKP1gr9x/Q7LC8uCFKmz2725SsKtlnxDKDLsQ184F5NUF6ykbkphmQgsbLhmuH
	+qwmJlbXNeLDe59dGKztvXNLMHAi+UdsIOZSRwzXnPoYsRoBsNXGygMaqRVHCkrFATJZcdJKBAJ
	nl5y9mQnsG3KdMTA4Gqaq2oSZmEagU6NJ8mkA3rweZVUpTRhsR0eEnG2/Ydd7GOG4kb5WcDqCAR
	jILtlm2WQWvcPOR878Du+tjzd3XGX9DmFb1yzv5WCehIAnsXTDlCNLogA+UHs=
X-Received: by 2002:a17:903:230a:b0:2ae:45b3:b688 with SMTP id
 d9443c01a7336-2aecac5fa42mr109937075ad.45.1773586782009; Sun, 15 Mar 2026
 07:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com>
 <87jywvfkrs.ffs@tglx> <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
 <87ms0zva5i.ffs@tglx>
In-Reply-To: <87ms0zva5i.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 15 Mar 2026 22:59:30 +0800
X-Gm-Features: AaiRm50I31eSF6801si99Y9EY7I9YjebUnwNHs2sMp21MNTfjKnyIHR7axGJPKI
Message-ID: <CAMVG2st0c7zoh-OYom_UwSA7WPDfRuM7f9gmt4pzU=Ap1Bm9Rw@mail.gmail.com>
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

On Mon, 23 Feb 2026 at 21:53, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Sun, Feb 15 2026 at 20:18, Daniel J Blueman wrote:
> > On Mon, 2 Feb 2026 at 19:27, Thomas Gleixner <tglx@kernel.org> wrote:
> > Good step forward! We can also reduce remote cacheline invalidation by
> > putting 'seq' into the cacheline after 'cpu_ts' by reordering:
>
> Good point.
>
> > With that said, with your latest change on the 1920 thread setup,
> > WATCHDOG_READOUT_MAX_US 1000 is still needed to avoid timeouts during
> > the previous adverse workload, however some timeouts are still seen
> > during massive parallel process teardowns.
> >
> > To limit overhead, perhaps it is sufficient to set the timeout to
> > 100us, avoid retries (as the hardware thread may continue to be busy
> > and will be rechecked later anyway), and log timeouts at the debug
> > level if at all.
>
> Something like the below should work even with 50us. I left the print at
> INFO level for now. We can either change it to pr_info_once() or to
> debug as you said.

My apologies for the delays!

Comparing the execution time of the existing mainline
clocksource_watchdog() to the proposed approach, there isn't
significant additional overhead [1], which is excellent.

With that said, on the 16 socket (1920 thread) setup, we see most
remote calls end up timing out with WATCHDOG_READOUT_MAX_US at 50,
leading to excessive logging. pr_info_once() would be a good approach
to avoid the spam, however I still feel we should use a higher
(250-500us?) timeout to keep the mechanism effective.

I also feel if a remote hardware thread is seen to timeout, retrying
has a high likelyhood of timing out also, so it may be cheaper in the
bigger picture to not retry. Sensitivity could be increased by walking
threads in socket order (S0T0 ... S15T0 S0T1 ... S15T1 ...). These two
items are my only concerns.

Thanks and great work,
  Dan

-- [1]

# bpftrace -e 'kprobe:clocksource_watchdog { @start[tid] = nsecs; }
kretprobe:clocksource_watchdog /@start[tid]/ {
  @lat_us = hist((nsecs - @start[tid]) / 1000);
  delete(@start[tid]);}'

Mainline idle:
[16, 32)       2.9% |@                                                   |
[32, 64)      96.0% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[64, 128)      0.8% |                                                    |
[128, 256)     0.4% |                                                    |

Proposed idle:
[32, 64)       0.0% |                                                    |
[64, 128)      0.1% |                                                    |
[128, 256)    99.6% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)     0.2% |                                                    |

Mainline loaded:
[8, 16)        0.2% |                                                    |
[16, 32)      82.7% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[32, 64)      17.0% |@@@@@@@@@@                                          |
[64, 128)      0.1% |                                                    |
[128, 256)     0.0% |                                                    |

Proposed loaded:
[16, 32)       6.2% |@@@                                                 |
[32, 64)      93.8% |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[64, 128)      0.0% |                                                    |
-- 
Daniel J Blueman
