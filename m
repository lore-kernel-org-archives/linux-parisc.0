Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D144EDCD0
	for <linux-parisc@vger.kernel.org>; Tue, 13 Oct 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894965; cv=pass; b=LkPo4ejTW/lz2Bz5ZnajfSwwk56pGtRO9u+neblB4OkHtkxb5uQQj41/dxUv1Qhy6iQMAHrShw5dRMlqe6KhN4tfDZQxOUuJolINyVHCrOJ3z4b2JXFCYVETGhs2QQsV6eVqrSpdJynXNwMnpvE799F81XdvKogsNIbt4UZPs00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894965; c=relaxed/simple;
	bh=KJz0ljhpxQV0dxuLmyAZzCH6KN1a+1DHS+L2+lDvs9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/LrdKWcmYgwxxMg7VnLubfe4Uyjte0jM3xy5q8xWd6qLTQyMwJ8ruitBe/K41FZ45MEbA5Ht/P4OMJaRV/RbqLjx36vrhlfOs+ZKA5iht8PalNfhdm1KjW/Yv+EMp/AXqj++C+FyqwqeHGG/YkLGAN0vHf4WsFof4hq/IMrtyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfwSn7zu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgoLMzzU; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfwSn7zu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgoLMzzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791894962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
	b=dfwSn7zuZu81ewqBOOFI/l9xBxfYJhLUcFdAPbnSmoghiBOkFiERe/7H8aC8j/8PUFnFxh
	hUEDo/0FrspbXA/QllExBFUWPEDUX14/KIH1NCYfGCUalH8BbQhjiAXAvmcIhVnRttbg9R
	J1fIDjF29+kS3QGm0E5Cg8ZicDZJ6dY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-ZuVepdobM0C4nbeXhnYfiA-1; Tue, 13 Oct 2026 12:36:01 +0000
X-MC-Unique: ZuVepdobM0C4nbeXhnYfiA-1
X-Mimecast-MFC-AGG-ID: ZuVepdobM0C4nbeXhnYfiA_1791894960
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e71425f87so321546166b.2
        for <linux-parisc@vger.kernel.org>; Tue, 13 Oct 2026 05:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894960; cv=none;
        d=google.com; s=arc-20260327;
        b=WedA3DNd7AorgIYLLVqf4pW3er4kqsix7NanZS2J3LNz5N8uZsxRQnTXYeV4V1HGSB
         cXvjaRWnj1/9lu/ek+IRyV9uK0rrHziRavgiJ96iHW2BLlUWTsY004EQy3v/8Mia/ODc
         lAz5ZdPF7eAFbaHmgEMXDGmiTqk1oZ/EGHS+SjkRub+dgZRWdegLnT57Dj1h49tGvZQb
         WUqN69l4xmMH2D0qAzRlWhlr5o/AtfhO5boy5ai4zYEg+raOZlWrxXjVgmCAIvFjGdK0
         EXQyODAkmxH8JzwnHawThKnV0JcmYh08sqxfUSrWQnqwdthSr14xNCi4MuzMcX7iUT6K
         /4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        fh=T29pnwIW0oxw7b2GwcbFFe8nNoPuC+EGhaXEbmS7tfE=;
        b=JtWE3Wd2WCvn/kP4DU/PpbbnSou/RTUVgA1KIMgbDqHGlxqNVN6nQ1CQEacaoIGHoK
         QbrxHhWbCKDeCNI6OhD+KCYEXivAGUkxzM7lZatD9elbs63S55KYg25lvi89kU4VJnZT
         FOgu0W1VQE14bz7ayQCAazdqkPmdQXILqkDyU0PBxNv51V4muUosBMuuCgSunxFqBAYg
         MDoiOORTFxYsawowIn1ZwwZo1EFiKv3MawGtaP0HkJSiJgv3togmDLlZUGUUNwKTBxC7
         IAxhzdDV0okqFLAZ6DzlJHLcu1px6OPho/VxooLULBTQu6jCW36aRJ/fQ6O4LCeADoRB
         3IPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791894960; x=1792499760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=YgoLMzzUztWzAtGp2BsnHbg4p+kiT33FbX6LqK9gQMrWA1L2iCBRfHGuRar0q6PPvi
         Z+/pKSPqH9ljzJkup8+HBSxiFoZhhYF+EG9czbqjtvxPdNGONXNP8VzJrWWyK8wt1XJI
         WJmkye6UFTuSDnGTG+lWNQekyg9JvV578yJFbnZ+CB30MZKnFvJ/g2FG55n0ZYrYQOeT
         JopL6l+aVJkFYLJz1V3QLGr7MSW03SSWSdAIoUOmHauJXBNbtpwoVRzcLPZouXiBgWiG
         hACkPXzW6b5ieD1bEV21hIW1mcG/rZHsSqaWAw7jG0dKXVWwMufD+Bh/ffF5JBE9k6bi
         o6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894960; x=1792499760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooKLa1R3KGvywNv1R+3CFpG+InkWtGBVvbQRUtpRSf4=;
        b=h2Xy7N8U3lygmYr5IXxT2tr6CeNxTTq12AKvzhrcI0upcDD07Qdog7zWfwTTCGm+xq
         IQxSKI6FI6H4NCm9qEMpRRJUtogl4qPyZCx2M7AJl3fQ89Xl267LKcBd8y5pc7/wqUtA
         HQtlKyLHLZf9mJacJDrMkXLzFGRjZFDTXH6np/VLqnYrdQA2KIlqc1FEe0v7jqlvNL4e
         y3IRHvSFWruq0M7oDB2qWiKy2CEKPcLFfR3SLQ/rcGWKFJMK0Ry9ioDCzXo/QBXRjYke
         4aYWMN7i4PVZDckg1kvdnLmzaMRW3isl+cQtQitIk7zOiFoWR7PkCR3stVFC2suz1rCK
         Zfbw==
X-Forwarded-Encrypted: i=1; AKwUvBwr1oHpUIHIcWjt/1W99smF6tAG7e3HDdMQKGz7j0aMC9fg4V/qXKe7LSeyvp9CUPDVDfiGgcgQW3WZiHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQNWsmBBEZMbcsIrVSGNgX/xiK0c07EwZ8kZDYQXQPX3LPExx4
	9ZHAz7XvvWruWC2IIL818P/0iMw1oK8h7WFwChXXmW0zDJavOpJGTKGbdWFDqwNPNeSRlj14xPi
	xr490nymlalNXaMK1aCB6utYT5wId5eWhncm23JGjeYEYOZ4kcnrNw0E4Os5iHEZ7pRFowR9SMW
	ZjG/4t6CY+zdd4atiYBCQUVvT6c1VRWT+mSUDW0dNs
X-Gm-Gg: AYBFou1i88UKndkpLp3Zs7+8B1qnznw33oYNDCGZPeiZIBexGKa4EJuhsFReavN5M+a
	X3fu4s1o8F0I8WpQWIsXZZfzD0yXz2Yaw59q4a2/BroY9q4d0I6di3t1zjvKaIdAQY4FFCN8ZBm
	0qDr5zk+hnfx/YAQdLBRU5OhuR79VS21cVqqHQbR+yQiBXVZIOX3J4HALbk43DvFPvvlqbGs1wQ
	5g2KfB/gXiUTqWTPew9MJUSuAH59c+Btw5wgWFJDEzBTJ8RWqWKDSFajhcKsKbh2E8Ew71guQZC
	Zao=
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id a640c23a62f3a-c31a9f6ade4mr1135545866b.30.1791894960281;
        Tue, 13 Oct 2026 05:36:00 -0700 (PDT)
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id
 a640c23a62f3a-c31a9f6ade4mr1135542366b.30.1791894959880; Tue, 13 Oct 2026
 05:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
In-Reply-To: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Tue, 13 Oct 2026 09:35:48 -0300
X-Gm-Features: AclHuK-0QABZ6yrPwALI3VDGc1f2HfQWIB06SZ96BvTfEuUJkskwg4GU5NbIk1c
Message-ID: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
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

On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> >
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
>
> Thanks Ricardo, this looks great!

Thanks, Paul!

>
> There are a few things in some of the individual patches which I reply
> to in a minute, but there are a couple of "global" things that I
> wanted to mention:
>
> * As pointed out by Sashiko, when you were converting all of the
> arches, it looks like you missed alpha.  I took a quick look and it
> appears that it should be a pretty straightforward conversion like
> most of the others.

I've actually dropped the alpha patch as per Magnus's request [1].

[1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BL=
WOvDTt92t5Eg@mail.gmail.com/

>
> * We need to get ACKs from all the various arch maintainers.  Aside
> from the parisc changes all of your arch specific patches are trivial
> (and cleaner than the existing code IMO) so I don't expect anyone to
> complain, but getting ACKs will likely take some time.  Even the
> parisc patches aren't that bad, and arguably they fix a problem for
> seccomp so that should make asking for ACKs easier :)
>
> Since I expect chasing down all the various maintainers for ACKs will
> take a little while, and I'd like to start getting this patchset some
> basic testing, I'm going to merge it into dev-staging now.  While the
> dev-staging branch doesn't feed into linux-next (this isn't likely to
> land in the next merge window) it is one of the branches that gets
> tested automatically and included in my kernel-secnext RPM builds.
> This also means you won't need to worry about keeping this patchset
> up-to-date with rebasing, as I rebase dev-staging as needed (it
> intentionally isn't a stable branch).  Going forward, if there are any
> minor changes to this patchset, e.g. a few line change in one of two
> patches, please just send a fixup patchset based against
> audit/dev-staging and I'll squash it into the relevant patch in the
> series.  However, in the unlikely event that a major rewrite is
> needed, just send a new patchset ... but I'll be very surprised if
> that happens here :)

Sounds good!

>
> --
> paul-moore.com
>

-Ricardo

