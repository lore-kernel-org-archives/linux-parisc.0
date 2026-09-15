Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B3407CCF
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488610; cv=none; b=nnUs/WJVYTUx29IdIJzjQGSDK0Jw+GDxirNzOTCLb6nabksLQTBcfLDdiTr/0F6BaTh9hZgRbhOHSLAmYt445bOxzR3Qmju1WUISLjaMdmmdBC18moEethcfP11NlHUqAIA03Tt67YsLHdvNRTOqu5R2TTBlQWqs6G8exntVT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488610; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbTzgARWlOhTU/Og3fBgUwMMejcq1ZH7LYRZewPTgwGleVewhaYlDbxPAqgK+lfd7lO02BfeAkc+q8F/G+7aocti+XFG5uGOepQNWTn8W1eAYTSjyO53/vl80nMB/Hps+dZK3XpzalHoSWl6rxcLFaqUwrwiidAjSv7nmnl0vuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XL8IvtIW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XL8IvtIW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so5121187a12.2
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488607; x=1790093407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=XL8IvtIWB4/BEoBifQ/mwIhOI7Rnb3IoMH/3IeXAZgBaljj1q3pgMoCgLJaUfQUmd0
         Sob8uv/GcFUpzNDpSc8wcJJNzJ3pzZmW+CY/O9dYpPAGnDikpMYY2aNq6+lgv+AyzMv+
         IboCRzZlrNNkiPEW16J3BF3AeM5SEyPXgRAAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488607; x=1790093407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=medky2inR7kcevjsitu4gQMI3jf6SM8Ub9k8U/coB45WPqu3B/vQRH5by04/2tGbPX
         G3hV+TN1ssAjtQ2m5esJeJ3ulWCB0ntvG0cKGZpqIsU407MS/WSpioPHfG3Xn4O6Eaib
         kAagQyoQM1zsObmhyjMd7s0pjpv9y9PPnN2D/dff8aYq2JgY5tVqTrNBNnJAWpKvmNHX
         tbmQH/B/Kh6GmnWbi03tfzNwFOU6B5MNuVC49O+S8Zwr8KIZ2YZDmJF3zhGK5jvKylo8
         ZRlkOn6HRYGlj+aMMYT+FBmu93PqUJUNjCfArMSIruHqqAXn3cPXaoMnyhHvXiF1t1Vh
         2gWA==
X-Forwarded-Encrypted: i=1; AKwUvBysKi8UKd+/jksCYyUDJK4+dlXpC84fJpgKl33Lf3cuGPlMbzdu/hrdakItBr7pSuwGbombXffheS62e6U=@vger.kernel.org
X-Gm-Message-State: AFuF++lSnj2yS4E9YbMhvKZ2T9X00CRMp7dh8p7JKJneyAoJFwWC7h++
	eDR1Me6GZTQjNzAcFTOREzVQOi74A3DXxLt3KGyf/S3FhNxlL+drckMGLcjBoWuZK8acQdyMu6f
	kr2al/cs=
X-Gm-Gg: AYBFou333RpSjmymT+rYbxDN4MaTgWP4IHSFntJ7I21AgbTKrK6OGtugNzllYSCdw03
	zbK32GRDHFLoBRfcndjAxJp6Yec8nYo6rcX/zC6lg1YvMhLHd1mKUEfazaYMxnfWq1ehOPTwKnK
	qDSv7677qKzDMfTvwP3XgMbhoNa6pQw66ACBWJ0Xl/N847l8AM3TB1tL2nFC2VZrzeoKTKQSefk
	jbnawtEQrEA8tWWJB6eKKReppX+NCyj/MrBpDUWLMHVaw2BpNvESC82/Cm7p7x/GdHDsN90xG5y
	v8K1Y4DfkWXCQmuUelV5zmBcH+8psdmYHRbG+qQ4hI/sXfO4gKjkudukZen48puY5JCj/CDdqN1
	bFhWVBkiDPfkk6riJoQ3dvaa1zZE4nN6M8li8fWX+vPP4bOxHX7LjTHbNhWqDjkvDvV4hIvJZkE
	rYKfEo+qPz8kVzJxEL37Y20P0MKpViq2+z7MNyX96QT+1mRmYhiQeLtXNcqqu3ohXa1T7Nn4pCc
	zHcbcNjWGAyjFKDeXSZyEB1HwEvl+ABnvcFedRsYxcy6XDP9w==
X-Received: by 2002:a05:6402:5019:b0:6a9:98de:6d8d with SMTP id 4fb4d7f45d1cf-6a9f6409323mr5377335a12.45.1789488606495;
        Tue, 15 Sep 2026 09:10:06 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59644f2sm5550465a12.29.2026.09.15.09.10.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:10:06 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so503514966b.3
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 09:10:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybU8uZEFiaoQffZkXJQQuOeIC6DPhUwteAZGr7A2RFBn4WPA2mvQI5Ba0XqHPPAn0xXyPGcl69b7hr4dk=@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
