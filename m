Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51E223DE7
	for <linux-parisc@vger.kernel.org>; Sun, 15 Feb 2026 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771157928; cv=pass; b=IQYgqcL1eDJ00Nd4Kp+Tc9g2NXQQlk1iApd3L01YPUUuvwKVKs85UHupnYB2Mxrn1DlzRU2/UThifELvKTgsX+IcPjERHrpI1lC4cbodEZ7GYkPYZB75ifbn0ErPM9dxiwFmBDW65CspwiFnm2+s/j1NnxBUcx7XoGFA43uJEGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771157928; c=relaxed/simple;
	bh=fmPgLwEbHTQWL0mymkVyx43se3jeqRMBQgj0gxScimQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6KiryPc9idtZyPZFsF5cFNO1NbN4qxYtQYvGrN+JJeGgPzFt/Z1jfhvUKprITBtJVwqZIpo9M00HDGolSAd0g7bL83Wq/x4u+y+FDSM2eW6UPWUVx+5a05m85Yg3jhQsc3Noz7mEA7IoYoEe9mmIoFuZssYeXcz1zn3c1/5ShE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=nZ1+6L6h; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="nZ1+6L6h"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3562258142fso1286078a91.3
        for <linux-parisc@vger.kernel.org>; Sun, 15 Feb 2026 04:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771157926; cv=none;
        d=google.com; s=arc-20240605;
        b=Kl+X3UqDIjR6gnLtuhoCRKY+DxpEyahioBSjhHPmcQirNFQaUi6YB1SNG6BLMykVeW
         oRqeO89Cjxv4QEwmzvVVy7d534sMLOn+HnixzKaD0UHuVlck+3qlycp7h1dTx1TiT4Nf
         lEFgXfRAPcBmsYxtmW6Zz/DA3nSNP2cETMhfDdvemaO8z8RSmRV9Dfo3bw2Jcj9rP/IX
         x9CalL14WbiYtlnOi96lgKQQBmXvhutyFHzAB+Q9ASIfh50s05PhPLT9Z0ATHVwA7IHB
         t1ROM4wLCAi8iRKGFvUkXaWxS5yXLXusdOqDa3K4i09TOLywC619ozZJSm1k73Pk/bpp
         flqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        fh=MWRwE8Jd9IZesMreyENzVyEf1cDOwgP0gjgYYjRL0UU=;
        b=ZD/11LqUl6Lwha0vXb9Q3RpAUIBIDg2wL0n/nopqDMn5Eyh8haHiADzETwQhZSi8Ew
         qNs17nj2LiWQMLWxQgx16XOVgzPq012eplVrzgmjXFTReWk6FRdvBGoLVnPIqirerAWG
         qdHtcHrBGeIAx6VyVHzJvN/6qKKY0R5i0iVxwWn3JBFG2S7RsGX/GdvKf67gf6uyxEcD
         9dvMRrgaLp/DExbmnt8ZpxFY8szTGTHD1adHSt9VDmoXjChnu71R8WwVMX//JUjvDQjS
         PcBOOrgfG4bwjH7LNOzC2b52aMF3nkcN6LazmRqmRH+cXShkzVy6zNGDIJGdjis113Fp
         c+Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771157926; x=1771762726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        b=nZ1+6L6h/tO0grsWaLZ3on2rXhCLLi6ua9rPqCNUN2ORZwSscinQ1LSpkLMAKq3due
         zbTiWQF+aIPVlt/ABJXEq26PemJLtYv4bldNOVgZLmlr3H2cI2DCaSatvKXN5HrINIr5
         JnvViocylfqPAuEGFH3G35nU3U8gGqPFRuEYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771157926; x=1771762726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvJM/myYoGRZXx3gFIucEsRFfTWcy4DBPC1OXwlubIc=;
        b=ibyS6iMg+avMdSTvX1rgbFzgRf+F+kpCZswRVA20DM3RpK2Bgn2SXb1jqWNgo4c7tT
         IdgnXwY3KQy7Wwa4NBN3FuLYF1C3jUYw4KMhG4O3C7DthBkZSo5dA5i5UTcPa5zkoll/
         3vQUvMMl38dOFqMpXJb9mp3cEhg5Mz1jzY2q8m9VQzypmisIJlv0BSN668BkjihvqZ31
         fgdLnwgIFMZFXNEFzDNZILfJVx2LI8NwfHmQwNSNubCeoqlBZ3RBOxNfWNvbTagE8gRr
         opBc1xVPznwpxtqBPIkJ9DnoGN99K6So08c6WXLN8IycWnKgzi/lDqek+AB0Av/TWDDa
         DbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfadWkcp4L9N4/EJAAh01XX+KM/LpTDVixz8fjL/YzJOOUZgRh1LfcAgUSN4qToc+esMi/Sb23Bf2VK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyloxIUTQVxMYo28bEWUrarMNRpHsKpCnQkTJ6IkErkkKFTTDM3
	VkzeqZfYbuhZAfp+zQ1FV9Cz/2egv5HHD9zCsTk3bXRm/7MRN+wc6sj+qU6odW6VOIyw/sejvGE
	Ub8RZiSiXRZBxWRIZJrWXOn5lDj/lfaoiY0C00bjZhw==
X-Gm-Gg: AZuq6aKr/4K9pQPe5cbI/JF3I8F5Be5cLSV4XsNIQCaISiB1yFeEEBahA96lh0v0fxz
	FKYc6nf4RO3FGVE3TJDQ78ozk9GtwD9janI1HlRjFp7S/7EuCji4fppn4dn/ngvy2JDh8rWelwR
	sUeXdbVdk9jgnRs34E4MgPa7NeKMvgGs0wMWvvoAk39hmzvAs/efyDKlQTrqoY62de1EFmzvi8R
	NxM/FAIaHOQw5mwVyja/TipKAOMDY1HIdHgq0pAwt1rcs8WtqXymCroyfsyDKF1l5NzCg2nNBLo
	hHxAundx094/lytsXOZeY6n59rsuhANs1orP3E0TTIU42LZdj8Dro6KmYY89VfKE8WdON3ivdAQ
	CnZfLdEvOOV8dFDDDe1WLVeY/r9epi5rXmnIp8Wz3YgtoKxg8NotM24QojJwCcpxdHx507IjoLl
	3pFseldiVeFj9N05REztjymZXt72VZzzoRtSjJZoV6x0goQyrv
X-Received: by 2002:a17:90b:3912:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-35844a4e94dmr4937619a91.12.1771157926489; Sun, 15 Feb 2026
 04:18:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123230651.688818373@kernel.org> <20260123231521.926490888@kernel.org>
 <CAMVG2ssXZKmw-YTKB5=CvhEofKeyEfaBCDZbyzfUcm2+P5rQsQ@mail.gmail.com> <87jywvfkrs.ffs@tglx>
In-Reply-To: <87jywvfkrs.ffs@tglx>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 15 Feb 2026 20:18:35 +0800
X-Gm-Features: AZwV_QibZJ9E9YhQcsvR295f2r9bTa2GDpaXK9QqRhlPq-MsVfR97oWCo6vVVEU
Message-ID: <CAMVG2ssvadzUUoZw9xdYdZ4T5Sz+xdcQnXmU2NkR0N_yqieT=w@mail.gmail.com>
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner <jwiesner@suse.de>, 
	Scott Hamilton <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 19:27, Thomas Gleixner <tglx@kernel.org> wrote:
> >> +/* Maximum time between two watchdog readouts */
> >> +#define WATCHDOG_READOUT_MAX_NS                (50 * NSEC_PER_USEC)
>
> > At 1920 threads, the default timeout threshold of 20us triggers
> > continuous warnings at idle, however 1000us causes none under an 8
> > hour adverse workload [1]; no HPET fallback was seen. A 500us
> > threshold causes a low rate of timeouts [2] (overhead amplified due to
> > retries), thus 1000us adds margin and should prevent retries.
>
> Right. Idle is definitely an issue when the remote CPU is in a deep
> C-state.
>
> My concern is that the control CPU might spin there for a millisecond
> with interrupts disabled, which is not really desired especially not on
> RT systems.
>
> Something like the untested below delta patch should work.

Good step forward! We can also reduce remote cacheline invalidation by
putting 'seq' into the cacheline after 'cpu_ts' by reordering:

struct watchdog_cpu_data {
       atomic_t                remote_inprogress;
       struct clocksource      *cs;
       enum wd_result          result;
       u64 cpu_ts[2];
       call_single_data_t      csd;
       atomic_t        seq; /* Keep in second cacheline to elide
unnecessary invalidation */
};

and reordering the inner loop:

        for (int seq = local + 2; seq < WATCHDOG_REMOTE_MAX_SEQ; seq += 2) {
                if (!watchdog_wait_seq(wd, start, seq))
                        return;

               /* Capture local timestamp before possible non-local
coherency overhead */
               now = cs->read(cs);

               /* Store local timestamp before reading remote to limit
coherency stalls */
               wd->cpu_ts[local] = now;
               prev = wd->cpu_ts[remote];
               delta = (now - prev) & cs->mask;

                if (delta > cs->max_raw_delta) {
                        watchdog_set_result(wd, WD_CPU_SKEWED);

With that said, with your latest change on the 1920 thread setup,
WATCHDOG_READOUT_MAX_US 1000 is still needed to avoid timeouts during
the previous adverse workload, however some timeouts are still seen
during massive parallel process teardowns.

To limit overhead, perhaps it is sufficient to set the timeout to
100us, avoid retries (as the hardware thread may continue to be busy
and will be rechecked later anyway), and log timeouts at the debug
level if at all.

Thanks,
  Dan
--
Daniel J Blueman
