Received: from mail-pz2-f14.google.com (mail-pz2-f14.google.com [74.125.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A695326C0
	for <linux-parisc@vger.kernel.org>; Thu,  1 Oct 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888770; cv=pass; b=b7J7VL+twBnSUKg0iJsUDmtcsfoL5DQYYVpn0aIRv5MjEMqwRf4pNnaT/0/NT5cvcCm1jpqudG/vjlDeKAjOlk54qlHecRMyjW+weGz83K613W6xlvz8kXlWyYP5bLYceFIP/J6Fi6dH86sUKv9zAgpH9x9oLJgTYdyAI6GJM2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888770; c=relaxed/simple;
	bh=xN21QYy0yGgz2sHT1nXnC/21nVEwjhkQB04Hg4E+rW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS1vU7pgRkPlQNV8/g8Hmv+5eixlw8nyt6qDEmTV5ldFfn0yYKOT05YGnCzKE9IzeUMTjuHDMo4yDTMPztYzHtdX/eIl663LxKVW2F9vw+xxtqZEyFZNjBEtMt842/uyeW3n4J9t/yZURdnlfZ0LMj4i8HHq83Za9SQnbaNucW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CAwV36pr; arc=pass smtp.client-ip=74.125.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CAwV36pr"
Received: by mail-pz2-f14.google.com with SMTP id d2e1a72fcca58-885f0eca6c4so1421117b3a.1
        for <linux-parisc@vger.kernel.org>; Thu, 01 Oct 2026 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888767; cv=none;
        d=google.com; s=arc-20260327;
        b=mc7V/fd76heDWRoo1jIRfhUYHpp3mOOSLyXrRfphX3cnXg1es4e9gYVvGYEwiFLSss
         q8mhjVjnXfSJwntRuPF4oXb/QItXLL/i/IFnjd2d1CgZKbRrkrMyMiCZi18XFC2SrA8D
         JB2Vu7U/jJMjTyVyxH2OOaYpfKM/afzq5NM4VZbo2kj1xyGRcmyxdRnZqRgvTJlC/a2e
         r85j+pRCx8ZTJ0mIZD0dBHXeJR8RxaAZHWa2Eg4kYe8R84pwd6Bl2ulrFabNjQXr/f9e
         WVV+ORj9hI4fnCnvXO922Qoxb+EWDy05RiCBmKDyMJRIHE6FHEOihZKS3vTE/4vuiMWQ
         fQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        fh=Q9WHuv00UKBI3UCOfp6NadTiGr2SZQ5Df87Yodgz9xY=;
        b=QNV0paG3PkZm6uqbTd3v6cvMx8J+rwZeRnxC8UFrzWwvRF38028a/ZyoN/Ra9zLooH
         jBKMErMlnT+acJXfmCYtVflPrerzh1OE6yqCrRQIgqvtwSHQsI+ZyF552OU2loOAIfNO
         d3i5/iiirpnzKrUWPtz+snuwi/H1kkR/lH1suDAvw/nDDNzTdXH2bcsdRY1e3bjyQKq0
         iSQCfF457b417I7wpL5BMxzhfdXz2UYEtfMHn+esCuhb6iX5YoZjm5UoSAY/gw2wQJCd
         3Id/oNEE9scg8LwL+gGLMfR+M48MRBkCFNhtrAP+9xzW2nmvuIDmXHIEZAyfSaoB6cDS
         CHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790888767; x=1791493567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=CAwV36prXHOZw2NRE+aSACbPdDsBf2SHqbBYA6oNTHRxcIGcOyC/CJqkRH7LJRevOZ
         ClcJMU2t93f7XmqqwruK0c5ZXJiXQfI/+n+w9nHyb4EcEh0EZTu11pUBC9xzrVuOqKBT
         YsV75j7RrnJU55Z+JqH44vXWfdCbI4I+NCB8980IdTgu7vzPMxHvgU+uCw/+FxPpgY0h
         63X1M3w+g/hILuWVI8qWSFmlSwv2NKZwGdJ2DwWfYsxtFTA/lG+C3YADiA4myoIGj7HP
         Z1Ev8yhuTUNqN+BrgGDh8F6GLVD0gbmqkkcnf9FOFy5sLyuxAa1XjcNkIrhbHMfk8YG5
         z0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888767; x=1791493567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=QR3Nxsd8szNoDdSt6MXt0ArqACqsO0JLGlTBlCtTEGMLRK8n5rT+oxh6DY+gWU9Dfc
         B+4r54ytjhaFF/DrVCFjzvrH5r+EREGWPzlyCaH9v561LJtzFGnMkppLRavLtFbxEELb
         iYy4dU7hmX5DmA4spgMWXkC3PCWTPDaegT1Wmz99VQmELx56XBB78sUJX56AeYnA8l9+
         xxCc2R+QFawz7T0ubotufnVL1tWAxKXJZoSmHqRsc6JkA5sbY3pzkQuDDKzer04NeqCk
         xK00buybsycL9tg4lpPeaNo6bChuTPXaRcw7C2ZnRhKTxRkB47KV6kE4IZ5YM8dg+ORl
         BPwg==
X-Forwarded-Encrypted: i=1; AKwUvBwh/h4ZuBWeG1oPQj2CHxZPJve/D25VVyIS+38CXBzSMD6AnKJ1LwhCZt6sIrficfUKA3AHv+/mV8qh5Y4=@vger.kernel.org
X-Gm-Message-State: AFuF++naOPn8g5Ag9ByLqpfhuQXpMX6tQkuN3m4/m738MDyur6H3GQUs
	zcKbcTLP+uVc+VF0TwrFJCpAtqgtzRqQfs6wcS4Jgbr+W4ICm4STjysQPFfUDoligVD+IolSWkF
	+9jofotKxIkHBaGQr1q4HwvedkKPzKEJD+RPG23Qm
X-Gm-Gg: AYBFou3yhULXAmDi647YP6kf7UxChb8JFqnBPSgoUM4ntQpWgXLIEhJOpAXDEWzOIYz
	Ow8V1HFSlql9TuRXcLTY9FCO1VB5TAKT3GtFgYcpxN5x4BmzlbeJdHVzHFUyUKO+Xzh4yu+1LTR
	kET2KYfnq/Dl6+2aQBIlAMGQpZbjbvlfvdpHlPgKnbW79s1Tj4UnMbzk4ID5/StuwtZhFM7iuUG
	50sSqjAWi8aOT+y2kVpFO7N+2wp7oIIUkDk1eWxIsOC7glUfVWM40CVn/Guf4ytAREw7UxaWqUX
	dPharosN/4Floxq2iUJT0Wn6mQyyqxM0jPk2rCGPWLWiMRYA5GFXW9B0KO3tufq0bi6RHJzAQHy
	rjyrHsixbngEv
X-Received: by 2002:a05:6a00:1254:b0:881:5dcb:400e with SMTP id
 d2e1a72fcca58-88af6d24f34mr727169b3a.56.1790888767004; Thu, 01 Oct 2026
 14:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2026 17:05:54 -0400
X-Gm-Features: AclHuK923qNeclwyxHc-N96rTW9f--kU_8IWc_3FVDcJfFTXqnWMr4asd_Mjppw
Message-ID: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
>
> The SYSCALL record currently logs only four of the six syscall
> arguments (a0-a3), silently discarding the remaining two. This
> leads to the need for auxiliary records when audit-relevant
> data lands in the 5th or 6th argument of a syscall.
>
> This series extends the SYSCALL record to log all six arguments,
> by adding arguments a4 and a5 inline within the existing record.

Thanks Ricardo, this looks great!

There are a few things in some of the individual patches which I reply
to in a minute, but there are a couple of "global" things that I
wanted to mention:

* As pointed out by Sashiko, when you were converting all of the
arches, it looks like you missed alpha.  I took a quick look and it
appears that it should be a pretty straightforward conversion like
most of the others.

* We need to get ACKs from all the various arch maintainers.  Aside
from the parisc changes all of your arch specific patches are trivial
(and cleaner than the existing code IMO) so I don't expect anyone to
complain, but getting ACKs will likely take some time.  Even the
parisc patches aren't that bad, and arguably they fix a problem for
seccomp so that should make asking for ACKs easier :)

Since I expect chasing down all the various maintainers for ACKs will
take a little while, and I'd like to start getting this patchset some
basic testing, I'm going to merge it into dev-staging now.  While the
dev-staging branch doesn't feed into linux-next (this isn't likely to
land in the next merge window) it is one of the branches that gets
tested automatically and included in my kernel-secnext RPM builds.
This also means you won't need to worry about keeping this patchset
up-to-date with rebasing, as I rebase dev-staging as needed (it
intentionally isn't a stable branch).  Going forward, if there are any
minor changes to this patchset, e.g. a few line change in one of two
patches, please just send a fixup patchset based against
audit/dev-staging and I'll squash it into the relevant patch in the
series.  However, in the unlikely event that a major rewrite is
needed, just send a new patchset ... but I'll be very surprised if
that happens here :)

--=20
paul-moore.com
