Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E103DA5CE
	for <linux-parisc@vger.kernel.org>; Wed, 18 Mar 2026 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843065; cv=pass; b=GQDr1GPH4WR1r3lt0lDQ3nk6VInS+3fTXUBie/HwpgnNxmeSADNXdr6BrmNgo4bsFKBfXQmUhTwxg0B8snOU+Kx9HsDbK6SHC7Dim2GWay5iZO8rshci8I5UAA9OJTNsMw6ZsBI8/qFk8wH35WwrG951CaidORb5HCZZpEQSIGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843065; c=relaxed/simple;
	bh=r1Tv53bgcF0yQoW1GmCwxqNOei3YJYYA/bpEEFiatPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6UX7Hhw9raQIss63Wab5AYNd+EWs7jwNmZ6eVLc8Oyht4fEbSrNXcOC7S02WxOFrR/Cka2JFJHPemfrM0w8VE9z/KooacA8k2jpG1XmgrlKu4iSTSBMiQt9+L5GM6niddhc6nlHgxZke9d37PTcO5a5nYjqHkWrxwhHk41KSm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=fqG2/ku5; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="fqG2/ku5"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c742723c863so208332a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 18 Mar 2026 07:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773843062; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+gTt2O+h0xK24ABEMNx1wMszLlAi5QGif5XSQ6ho93wSGZxIkFamIbIHOK8/hBLH5
         5Paa4O4z7JJ5uO1NwXlo25K9O59NZAcCfCjo1CBHwcTVLwi7EHKhVbyozidIvOTZXHUS
         O9r754c7s1iiB9awKrlC+xIzb3Es3jCez+bId5xL2ijQAhSXe3ZP3/SvmwaZAekbiSUx
         Z80Sb2Y68O1gD/6ipot+3csHD7BE3BYdEB1zQVYwLxaJMM5Zj8YKBrC4PQzTWGedDS5V
         sFtTS6i9meHxlnJEFFGn2hqLYOnOJam7z0ZrZqDw9XJvBUC+b/1iVGiMm50+o3t9+kRb
         MlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        fh=2JvbuQggEVdv5kSQCHgBzhUxRmLsJh2OLaDJcgv6WIY=;
        b=imEVDYcUqmcvH0Qc1eoxsM4jWZYZpZe6n5LhpmpoOL1kxymvJtFewWNFnEeTQQycOG
         M5mo3VzuLGsRRTmnPpx8YrslHX4JU4v8RBIO4gRRDUjKRXFtXPD1d3SHsNAR0dy/I5ER
         CoFsoB27/BJQWnUNkSTWFs2YC6DE+0annIg+LRdJYf8ikz+QEmtZ2ox//XcrC00dw6uY
         xpxvzzvLE944ExHbe3g76OHnFEolY2GZfDeo7xProHzhaegVk9JMm+0ehri2fKBRNPc0
         EzruHTakBdvw/MAIRFqYdG0THf6tHfiT/GibkfJofq9j5ZhDocq7jgcZ2T3Rgs/roykj
         I5yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1773843062; x=1774447862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        b=fqG2/ku5WZeMiK4M7oVqmnbnqpyErkfuffEbiuQR3bI1IFg/XkerdVSoVwMezs59XZ
         Y0WzY7HNVWX2RzFKjtVKIlk0iCV6KvPTYUBjhvP/vZzM5mWe4DJhojWxb7hPn7madbUw
         T9xgMIZlczd4VAbOltL2NUzUvbLFOlDo/SoAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843062; x=1774447862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnVK97GbDjmBW9z+YmT+CgHjnje3lfRiHrtm0Ff5Slw=;
        b=Ecfi6nhaIRCAOyS8Zwc0mP18pX/likfjTBYBN1aINoGAB8R/bPxLgYYKkBKhqP1IlE
         IRD1toiczQMXTbkj9uomRBZqVPdwsziVohAm8M/hhflzN85m6I6Mb9+/SD249XfLrKSf
         c0ZWvZpxvj9timkaxFbKOBpyfkkayTPgPng9ymBIpZHp8sqw7zmKECbffqcxdtajRhvF
         E5MS6eHShsPj8I0clrtrHGlz1Kd4O3NLNQQHuA6lpgiyZ63Zr+JEH8QJJxfQbegAED9Y
         9OvU7RYwGuyLFlv088CuFxltC4qpV1w9l9MRoeIUnfB7E/iLh+NXKcfx3j/q1xzYrvYK
         pfKg==
X-Forwarded-Encrypted: i=1; AJvYcCUC7Nc0Gz0iut9W3QgzM9P820+kVuFRoh0dMhcvyDda9ZELE9m6p/toun02TdelDI9CtTcGF1sVRdB3i5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UgTdWpaoA/PjXxWZlfKQkGBTNz7aBZIQju9JwaEB8UYYc0dS
	3jf3Yd5SesLIFHUwDdyqdGhA1tdKMVbeGxOqorUfAyRR1384B1+pXTwb97uTTLadSrhQ4iewNy9
	nbFkRjNjEJjbZmW3ABHrDDch81gSRMn0ZhDTSOsqoOg==
X-Gm-Gg: ATEYQzxk5MuggLCpnZJVGIv1uMYURHoiPjRatZSm/UJJpy0uVG0Q57gWbbtcE0sBkGl
	SQSXZpH3BYJwZnYnEGKxFwOm5w3lZXmX4UUZecxJ0cxH6RVqS/UC/FT7jTTdFtvX539E5tAe6/i
	opf7pGSMZzwYwasOvj+a5SF17WZTQBTv/GSz2XOf38Egkz4BPkG+lAXlLM7WQfmH1ZH5YKUXKlq
	pEF2FFtcyoalE+Hoo5xqSUfJHKiPkyiWl3rdMkD54XN5fqZpwf1QtwVDDBsAU9BOPreHVi94Vht
	NcSdpSE8O3PymuF/BtwR6OYm60NdboCpqsTh3SdkJMp9pCu91sdienR8Sc6aOT38qYKOsUPkuL8
	qQFlj0vVbSJ6sr+W1yaPUE+dbcwOkr2bMVO4G94o9o5VLmYSPKFPE2mgzeQsIoHHs+7y6iHpQkN
	qkHyeEftlQCVqsbqNP+vZ/EjpWjvCtxKIOV1fn/mW3Hew+aGB2
X-Received: by 2002:a05:6a20:9e4d:b0:398:71e4:6287 with SMTP id
 adf61e73a8af0-39b99ca5836mr3522080637.10.1773843062426; Wed, 18 Mar 2026
 07:11:02 -0700 (PDT)
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
 <87h5qeomm5.ffs@tglx>
In-Reply-To: <87h5qeomm5.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 18 Mar 2026 22:10:51 +0800
X-Gm-Features: AaiRm53qCcKmSZ75mDD2sq2Ae3VTV6FcRA7OAu2j0qsr1TYY0QthhUFhNLiKS7U
Message-ID: <CAMVG2stkXYJqrcaYpiPu0No=rTo8W+MxZZNZp6wjBE3sEphR8A@mail.gmail.com>
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

On Tue, 17 Mar 2026 at 17:01, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Sun, Mar 15 2026 at 22:59, Daniel J. Blueman wrote:
> > On Mon, 23 Feb 2026 at 21:53, Thomas Gleixner <tglx@kernel.org> wrote:
> > With that said, on the 16 socket (1920 thread) setup, we see most
> > remote calls end up timing out with WATCHDOG_READOUT_MAX_US at 50,
> > leading to excessive logging. pr_info_once() would be a good approach
> > to avoid the spam, however I still feel we should use a higher
> > (250-500us?) timeout to keep the mechanism effective.
> >
> > I also feel if a remote hardware thread is seen to timeout, retrying
> > has a high likelyhood of timing out also, so it may be cheaper in the
> > bigger picture to not retry. Sensitivity could be increased by walking
> > threads in socket order (S0T0 ... S15T0 S0T1 ... S15T1 ...). These two
> > items are my only concerns.
>
> Right. So I ditched the immediate retry and replaced the hard coded
> timeout with a runtime calculated one when NUMA is enabled. It's a
> reasonable assumption that insanely big systems have properly
> initialized SLIT/SRAT tables. So we can just [ab]use the node distance
> to determine the timeout for a remote CPU.

The node distance matches well: changing "if (wd_seq >
WATCHDOG_READOUT_MAX_NS) {" to use WATCHDOG_NUMA_MAX_TIMEOUT_NS, this
presented no regressions on 16 sockets/1920 threads during idle and a
"stress-ng --msyncmany 0" all thread adverse workload for 2h.

> ---
> From: Thomas Gleixner <tglx@kernel.org>
> Subject: clocksource: Rewrite watchdog code completely
> Date: Sat, 24 Jan 2026 00:18:01 +0100
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> The clocksource watchdog code has over time reached the state of an
> unpenetrable maze of duct tape and staples. The original design, which was
> made in the context of systems far smaller than today, is based on the
> assumption that the to be monitored clocksource (TSC) can be trivially
> compared against a known to be stable clocksource (HPET/ACPI-PM timer).
>
> Over the years it turned out that this approach has major flaws:
>
>   - Long delays between watchdog invocations can result in wrap arounds
>     of the reference clocksource
>
>   - Scalability of the reference clocksource readout can degrade on large
>     multi-socket systems due to interconnect congestion
>
> This was addressed with various heuristics which degraded the accurracy of
> the watchdog to the point that it fails to detect actual TSC problems on
> older hardware which exposes slow inter CPU drifts due to firmware
> manipulating the TSC to hide SMI time.
>
> To address this and bring back sanity to the watchdog, rewrite the code
> completely with a different approach:
>
>   1) Restrict the validation against a reference clocksource to the boot
>      CPU, which is usually the CPU/Socket closest to the legacy block which
>      contains the reference source (HPET/ACPI-PM timer). Validate that the
>      reference readout is within a bound latency so that the actual
>      comparison against the TSC stays within 500ppm as long as the clocks
>      are stable.
>
>   2) Compare the TSCs of the other CPUs in a round robin fashion against
>      the boot CPU in the same way the TSC synchronization on CPU hotplug
>      works. This still can suffer from delayed reaction of the remote CPU
>      to the SMP function call and the latency of the control variable cache
>      line. But this latency is not affecting correctness. It only affects
>      the accuracy. With low contention the readout latency is in the low
>      nanoseconds range, which detects even slight skews between CPUs. Under
>      high contention this becomes obviously less accurate, but still
>      detects slow skews reliably as it solely relies on subsequent readouts
>      being monotonically increasing. It just can take slightly longer to
>      detect the issue.
>
>   3) Rewrite the watchdog test so it tests the various mechanisms one by
>      one and validating the result against the expectation.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
> Reviewed-by: Jiri Wiesner <jwiesner@suse.de>
> Link: https://patch.msgid.link/20260123231521.926490888@kernel.org
> ---
> V2: Make it more cache line friendly and tweak it further for insane big
>     machines - Daniel

Signed-off-by: Daniel J Blueman <daniel@quora.org>

Thanks and great work Thomas!
  Dan
--
Daniel J Blueman
