Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC32D7398
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499708; cv=none; b=It8UZvnE3uTsuc5zRqq0oaWBNf+wqebbEaAPEmWS6yHorxrv0x1zYlD2BbmTYLTHBhDT7l6eSKDz1C5R/aovw0OzefHilBHgb75EQ913vQScD9NY874Kb6b/OX3yVPXUxM/5+0hcno3FMX5AX0x1HfGcArxZTB2MlNK29INToiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499708; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWJzPV4b/ZkKM+bHDIyfYi3adPtSy1INA0L58cm3FPr2IJ6JJh7tgQnhw9I472+d51qwbbyYc0xGfXYj0diqMpHYzYdjvSlbf9FH2tm2Y7UNh4penkYWSMUprQnTdSo9zX3IQbWJQfLyuvRyVQOu7/sg0lW/FCWENv6ygOJAclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QUTdUDEC; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QUTdUDEC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso142173e87.0
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499704; x=1790104504; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=QUTdUDEC4QHS9GKM4OCphl9CLC9VWy78EdqI9MVr/ZNhyab8P9vidCjut3gCrTLJBA
         2R3fCgb3ot9ilDZjmroMV3AFYd9PCxxuxbVF5jxjLL0O8HNLUYjS+yOcbbAzZLW3LzYD
         au3+gaHjizklAVzwZjSL3zAqZiGozxvUi3U9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499704; x=1790104504;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=uEJ9cjknWjjLeBF14u36/fHFatoE5H5XTuAaBiuCCrmsNIZQYAzrFQpwK273A0n4JG
         oPh48SA9Kqs68Rcwd5r5pv824R7nBEbQq4WpFgRYi6vLTOJ+eja9d3XAMDbeHULM93yf
         ikBwVHIYTf1hka+uPLELMvHSIzWsEKurzYH81RYomATlnin470M5yt0IA/oVrevUZxZr
         OC9aff2XgdL5xqL1VUHwBlk+RU5p0bCGeaQTIsLwFwy6iizAKdFxs+rIOqLoYU/OEQF0
         mROvz5IzRnR1vPoHqvP67VQu6B6+WycugkHIsUmH8Ypx4rf08AhaXXpX+xz9QcedCmUc
         mb6g==
X-Forwarded-Encrypted: i=1; AKwUvBxFgQetelkJOLhzU3mQqKgVGiSsLqUSKHBP7qBaByt4tflUnmM+uTHoxQwybe0j9GG94BuWewQd2XdXL24=@vger.kernel.org
X-Gm-Message-State: AFuF++lzBzwZ+UD/n8poehpw1B1+CHxjpG0E8gLZrh5kpANNZzqtQJ50
	DS7tpwbfrBUx9D3xlPyzaZl6l/D2MgEsW269JlCHdXhvRghGe3/BSUQkfwstOY2QxIs/49u7Wbn
	vQWDgV3iREK5/
X-Gm-Gg: AYBFou3c8bQfTHjg21m06qleab8Z5thCuWZIBS8xLEKsyDXoG6ktF/oFMmFz+9T8jzK
	sDLFQcxMJEXXgQa7K8tdT9ASyPQwaDirq3zB4dNJq4PZ2cHwYcD1x0/fgjvN+PHtscA5iTHi1i7
	GgJswNJoLMifwt1RysTaJihdh9mElIjWvn4QFQVvxS8PP9aDgefWqh4FGsHKiXlyp1dOfZ8aud9
	rYHTKSm3wt/0GqehlHaOJyqIqN1Jccdjx7Klrv3nVdS1GT8kEiT44TmxjVdnCL+ub7j478bGV+b
	HRAkvRc8zgdsY2Bmc5QCzOt7Xc5MHMuH0xp5I9pz7CPyY6n1TolBtj49oUYLkYwuudCedF1SJ4a
	Sz8XEI0fYmdD4XWii29dLbbQK7cdkAsUgEYGYPjOvLwLSrXm//IsUCUrsGgBdRebc1piH9kAQ6c
	G2wGxYyXhe7Q4DEi/Y+gj0OF8NUxWhH9kHUhbFGmLkQFnyRRCZd4W2gmyVwuuGrFfsS/fslnC3i
	Kpq3tWQY3zHl2ZTegmG9ZoGn4XFOvRdVaaJTBGvmcRJN+Zy903HYuRb/kL7
X-Received: by 2002:ac2:4c4e:0:b0:5b5:e265:5215 with SMTP id 2adb3069b0e04-5b8ae6af066mr4454116e87.22.1789499703544;
        Tue, 15 Sep 2026 12:15:03 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57ee959sm164565e87.84.2026.09.15.12.15.02
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:15:02 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so93272e87.2
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 12:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzMZP3D7zyfB83HKUTqmsvz6RoubTEfDRpNqAHOHolunCegNel2aHLwmVoBfBWwjU4O1Ozx3suHcGhxNQ=@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
