Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422626;
	b=Nlx6poPFJm79YQVXulbWxpiiQxklXOYy2ICAENhYyLv7OP9iCXK1n3QOwIFLmOppt+44
	 6D2v76a3bQhc2PHnIlmkmdZXk/dw45VnRxXODXuUBrA8FACPUm0AR13mB7LDXSm7gGrB5
	 8/qrTx7IxVr00+v38ZPIwUzhuDSsbT7zAsqtnUR30qmx+oqM9KzaSVniH1l5I6CYvJiMj
	 QquO7VkOVROYVXXXb+9HSxMs2GrXRFCh/TvaDCNjVmxGtVIT1xqeBjuK9x3eR/1f4yFvU
	 qXPrpAUeEcXNzLRQMKpcnZvUItlE7Td0gZoga2QEvtkW2sUjkOgm0XhEkJQvOP1cxYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
	b=4jKG83EJwgAnD0FjuCjRZbkJWzLvgAWHLogmiOn0yiH66B/p3yP756Aq1ENk5235eQoe
	 kFJdODHqJZDXxgosgzaNF+LOD2l+aM/1ALwt+RvDM3NJrhn4o9fH/hZcxg0ZWxwIaWdoj
	 BqvXSVJ1DD1dw8qT0gSVNm9d329kwfGErxwBjMH8EP0JTbDlbr8wWseFwLqedtfniL70W
	 YcuFdEsQDzw+HAT4WC0q9p5RAH584WHqg+spwf+EUCrWNwvvQhrn/oGk2AmmGiqo1h9tW
	 GjQRqpKDQxQMuTj4UsXf4iQXxPgn+dEZ8jDxhIsXuiZzak8UfI4l+9z1qAc19Wqlx9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="I/Ln/mJq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733A60882A1
	for <linux-parisc@vger.kernel.org>; Mon, 19 Oct 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B733A60882A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I/Ln/mJq
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db33db4de9so94835ad.0
        for <linux-parisc@vger.kernel.org>; Mon, 19 Oct 2026 08:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792422625; cv=none;
        d=google.com; s=arc-20260327;
        b=o/jOZmzFbqt0aDJ5OCJjr4TMYQU1pO2Bnyg+7q+Kh1H0nNYb/xFKpZgGoAX4BjLTGH
         W10uj45HjDiyStdps/4zUOG5SSdTpHxL1/htjYE+Ot4Ts44shMfH57KEnY8zH6frvdZ8
         v8uBolidQgcDKPsa8RAgxsegCialGoeu77RImcbwz8JDByNlIhDHQwwFODdRT4VHSjij
         Io0IH4SIOWLAfu/QYgRRsCcGa7SgDmzrpvKawnrP4xC4iFaixH6mEUN2HAqME4mWEzpS
         0zJww1Vh8m1QXqZQ9dPuB0b9jHs2Y7UnLi3ggI+tw2bL6Gdj8gmx6uq8dDGlkCWx075R
         ZwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        fh=hUfhg0AQl7Y+fj4SCJvDXfIM4iw/1R5GfCWJgBc8d2w=;
        b=aQo+jn/y/4yx0AIB9mTjcxTLZdxr0Kb5BdiF0x1kIwlJ4yAXMG++o++CT5P0Druqa9
         AAqxV0Cvgi7mFu10+40cOEufXiLmYwT3GuPIhzeQmzIJnfEtfWp9sxDl4c9lhmj/kDYO
         YlwwKQrWdK+Oz4QrIj2abUjGJVjqovMIyatlABnpBIeklWTJTYZa2vMgzqC31yY/NZYk
         28gRVUDQajNibd9vGs46Iy5gLvBwxz/9LsPTlTUfainseGMQY2TiQDtEtCfZqzb/vTiu
         UsVKCsHI+9GdFSYEaTnRQVEdO+yY/dZLfmYTSIOA0YPnhx+dQJcj5IcNJlXWxiuyO4FR
         B35Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792422625; x=1793027425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        b=I/Ln/mJqIEQM42PuxrK4Wb/e3qG7nMS8tS8HiMxsHwFLIL4E+4xVur+yQhObgZRT8A
         JOx/kSn0iORf7hM2B+f/fCdWjjk4FXNyIwTgTn52V63kGDQP7QIeiYKtec+SqzrvGswP
         U+s3ktb1iYpEChe2kUEID8YpWPbEUveDKP77ot/hhfQcBkHzpN/28GUMA+hIVHCRK0Vx
         6Xof3onHzCMFDWb0aRe/Y2OwwSXMD7NE9/ruS4ulyhqFzhcengU14ztdzxswEbi2aCXX
         O8kfqP6DozI2yhoC6mCSr1bvUtzlkrZO6qJw8lVjmMH++px8VGOGr47LZqryWAIqE0Mb
         sZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422625; x=1793027425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEKJZghqVH93r9LYP/6FZEUXgj2QmaA9dtJHvIkBzok=;
        b=lIhNV04caWc1eaO/BxrLxGMqFJlStPG0ZQpXuKLe1tEog3I7H1temiPqqW5YDVJiS0
         F3jzy0MxdG4JCJsrwljNzPzjmAyFHkkxvOEs1mJg27XhrOT0mkmQcqOQqWb1F5Yn1A3Y
         T4vDpctdgTjXfHFY+cxqGZTR4MqeejOC9Po2itkKWdlyf2OrMWFBw+dh/McBKVswGkZc
         iDr3Ttsv1StBLHAo/n+TnXBKupeXjrlY/YDMwJDled0tIYEypRhvZpL0JjOQSrvPKQF1
         gYgRV6o677ueUQ76r0fqh0SqWJMVJEGJT+hCqqCqeGQalp1tUxeR6tIjNYgYUytvo8Hi
         ifew==
X-Forwarded-Encrypted: i=1; AKwUvBybH9YFZjOFr/NOPZoiD8HYdC12o0SxSZR1SOc1UWTZhMoApa5QEMLVu1q7lSqdJiBMWxkRzuo8wUT6R1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjavllHaTxzmvdtVbUVssFN/WGd0+uwiPjqchl5ZKphQDq5agK
	O3Kc1rSEYnjl0W3XR7FbY5B4Os7NfvdGvdsbdUM8twXiv935Cc3ctTXUW5itAcKtWIgVAcQrDlt
	DW2nA9pQl+57RsN3WJmFZ86WujC4ySQFUUSrIx2ax
X-Gm-Gg: AYBFou3YJa+nbbB3i1J0ZfGhVm3bds6QgETD8J+3OmAZwG48Gs5dgNbdx5vviP9mnqm
	cFJTF8F2vM5dXRqjMnMqm6S2E4/r+aQ2Pvw7V3s5q5VZJXFFl6GVuNT2c6DD6bB7VXAMzZ4aJ95
	QTck8lvt4kR5X4eMoE7PW3goL7qeo80BgtXKY/4HNNu68QIcoAFTFWQ2j5M+QfkK9wf9m0XADsY
	f9YQCbU+IdAIdr2KN69xzE8/jxfqK2l4RXSQ4/INv8BUBhfTQw6bns+bGXoRwFhuT9vWq9oYmAL
	7zhyMdgOYDYyOqqPhRIlXxtJh97qZQQ6Jnuh4RBaCp6HbRNvriYoCWnpREpLlMQfE9fTbMFYf3z
	ilfjruKXUvR0=
X-Received: by 2002:a17:902:d590:b0:2e6:344:7bc4 with SMTP id
 d9443c01a7336-2e9b3282e7bmr8097645ad.15.1792422624252; Mon, 19 Oct 2026
 08:10:24 -0700 (PDT)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
In-Reply-To: <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 08:10:11 -0700
X-Gm-Features: AclHuK_o-N-kLXCI0lLEF59ENPkLHYZOeNWe0US5TrjT-e2m6RlJOiYKtkm8cxg
Message-ID: <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 10.10.2026 08:04:42, Ian Rogers wrote:
> [...]
> > So completely fwiw, I speak to the compiler folks within Google and
> > there has always been unanimous support for code using memcpy over
> > type punning. I'm not sure where the inlining decisions would be
> > impacted, as to my understanding those are made later in the compiler
> > pipeline and things like __unqual_scalar_typeof are almost at the
> > stage of the preprocessor. If -Os is not inlining small fixed size
> > memcpys, this sounds like another compiler bug. It would also be
> > completely valid for the compiler to lower packed struct accesses to
> > memcpys.
> >
> > I was trying to reach an implementation that avoided undefined
> > behavior and benefited both user and kernel code. Performance
> > regressions aren't a benefit and fixing compilers can be tricky, so
> > work remains. I'd prefer to avoid undefined behavior at least in user
> > land. I'd also prefer to avoid config values, so using packed structs
> > for __KERNEL__ code is a possibility. It seems a little sad that we've
> > lived with a strict-aliasing-compliant implementation for a year, and
> > we could regress that for the sake of ARMv5. I don't feel strongly
> > enough to argue for kernel land; hopefully, Thomas can say what
> > motivated moving the patch series forward as I'm pretty certain it
> > wouldn't be undefined behavior in the perf tool :-)
>
> Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
> from packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
> only, so the perf header will be unaffected. Or is there an automagic
> copying to "tools/include/vdso/unaligned.h" happening?

It is a little more manual than automagic :-) When perf builds there
is a script that complains if the tools' version of files is
out-of-sync with the kernel's:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/perf/check-headers.sh#n28
It doesn't break the perf build, it just adds noise to it.

My understanding, biased by my opinions, is that the preferred option
is to add a config variable controlling whether to use memcpy or a
packed struct. My preference, to avoid undefined behavior, is to
default to memcpy but set it to use packed structs for ARMv5. I will
vibe code this up, and apologize in advance for any offense such a
patch series may cause (ie I'm sure someone on LKML will want to
complain at me for using memcpy at all and give me a lecture about
strict aliasing being nonsense, etc.). Arnd or someone else may have a
different preferred solution, to which I'm more than happy to defer.

Thanks and apologies again for your ongoing problems,
Ian

> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
