Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792759535;
	b=toqmNvlJjKiQOQQEazZU/NBjQIbwQwBEbo5LXE3nU1B/awZEGi2sh04j8+/HA3d5L5em
	 ltSVzG1ey6IrEJITxzx3ajMl6kDq5k3rKj7bfK0gd4bUU3ojXC/MS+aZzp59jZZ0ZDqlm
	 nJmjKvq/pLrVxZs/nTSy+17BqkTR/LNBWI2wkUi498mrbI/uug18kYMo36A+Mgxs8v0Fd
	 QIYukHd32kb0BCOP87W58LTc3EWz+qvhHyhIahByE5ZHe6X/wbCzy+k35y11WkYwpQM+k
	 iZBbMQ065ZAHrOuZUkjlWp888erYLbQJcKRm8LMYBsx9FWS2I61vG05WafY1lUlWuWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759535;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=CyyeMPOHc3r17rvGFwDtdL/sFSdFV+6eCDL5pfFdhv9ROUMiYkPigu/z2JIKo0fIUa/3
	 B4XOMfFsowo6YPu9IdKSiSyT5aY3uLOC3bbeewlHiKmmFlKAZh8vvFV8BTCTbgmgxiCF/
	 0EkG1waWt/6/fb/BYZd3IOCyXjC/lEj9EN/Ol5x9xvR5cHci2eZ3k+GXnvddW5l5cw2Ff
	 e2zfvftdst/suascXPphAHlCb2TizS+nAZLKJY+NSUtBwRr2IQ/vpBe9J+eYdhweLnnEV
	 6U8yd8tQy20XE/p1jeRjjFD79R1I66IpoDytYbv8Y+OExRtr1vZQ+ZcQSzFUcuCKrsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFCilMtk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13B606A31E
	for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2026 12:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D13B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFCilMtk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=JFCilMtkUblpG0se/OsDP8XQNcS0g5CbxN4al/yDpGmYxsKAuaBflAG9Ot1vUdjN4LK9kx
	6KihEPKO+lHEjYmLhUHLQBXjHW8sH5zxS6puIxjSFzPEXhebnff8clkn5/qJZVNpLCKzd4
	ANALi0his2JyaJHN1lr2Y9JnHEvtemw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-RvzObqQuOaqp7eaarH9jpA-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: RvzObqQuOaqp7eaarH9jpA-1
X-Mimecast-MFC-AGG-ID: RvzObqQuOaqp7eaarH9jpA_1792759532
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c40bbd26f74so74060466b.0
        for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2026 05:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759532; cv=none;
        d=google.com; s=arc-20260327;
        b=nBXwYQzO/EkKPoHlNTx7Z0QYmDS/3RH4FmICGC/5jhuE+0dwtfkkyUWsgAQ0ohvtYv
         sly57kP6VyqK9E9QYtZt95K4je0YQ8aqHMCh5HAY7nG+omNnv/nK4Y4t3rR9UgZFmiQW
         +jYu4WDCSSjbAYQNGIsyTxYf4Z6709qIsa9iwS8XIdIUlvIkV7XQgfWg5gKN2xrynGEa
         Ep30tP6dq+S3VfNUmEEfn8h06BD2MXqMs9swsGGsSKNUDWbvI/JlNkT5plL/ChvdYDC9
         LlJv093YivkvLqH5leqmZEfhC50HxZJLBGMBxNYJLJDXYIxulxomPq2o3L/vrNFmAUKn
         7w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        fh=yNg50k6uf2S2izvHhHfspBLYuJPKcr1Lji4IP2Kjk5U=;
        b=Bgp2YtRH/mZaxtEPYARQr4X40Yu5Ha41gyUwFu2OUFWL9WY/YzJdkgQ2dIre+gHvjK
         dzlz7HEISPGnwPZMuZKxi/Eug0ENgKcDSMqq1thZldBTgNc+OeFDnW7STQbGkVUdNQjg
         ThuRDgNnT7995Tue4fMa7rxK/lhAHZP0RtUNQ6ld8KwxxVPFjRq/NXwbz4mCezVZI6vA
         6yhkQIP4GMyg47fXBxdsjRW+lUMrbiAXZcFhmT9d+eqDz/xKE/8CoQPxzwg3k6Qclrv9
         GGzDZdqY827fShZ+aPmH1Dt4Zn3Gg1Z4t7bUZW+K6tRM5dUuKxdmLZuXSptzj3qV4Rcw
         lZpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792759532; x=1793364332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=kvNnk1JJq5fdRFGdNebQGgC7q5Z0qxP3L9LUL3H41Yth6fk3qBq/vZiBoiFYGjpoaa
         n0dKED8PrTcleCQwOwv7EZPUJSb5pjlDuNEjMabYepgzXz7C3LDzgy4bYbztjIZyxLVm
         9Xqzkh+s/Df+49IhCw6cb1qC+ZGFZ4Nq2c4DcUiiFr5dQqfAvw2NN8GjnWhsaGKkKTYY
         KzF7Id+sGWe/yi/p3xtqj3XYUidB030oWuXhAmSpJVfUlD5svLFMDnkRZ4hFBW84cWXH
         J5am/hwQZPE6DkBBvdYxtO+xDbckJ1JouoT4CQ4/tz5aQZvy3bGe6vJgFqQzFd7jFxWj
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=xgnTzX0/vhbaNZuk7SAW+gyYTJ1GUl+R9i4s2aBo3yvnl0VOkiT82XDZAtglYzqO3v
         jWdINTcjVcv2oQbPT5IGg64NBUlE5aMLqZsgi8wsQjDlOKHmQn/PRqrmk9VkL7VlMyTX
         0r3WF2WSTEPBOydkR/uvHZi/knQjAzN1TaedhY2yXwRVq5oH/E0fQdmbgopn6OspLGIs
         hj/H03KP/YB+HrAkHl844Kkdz5pUQ7EwWdxEdqF07fMqe7zSu/9FWRV7S2Pg4rh0CeaD
         ZdaVt+NqDDdswsmM0eVERrc6kK4usZbklbPh0GptzerGgsYtyOVNoKEP+1+evoN+j2/N
         J14w==
X-Forwarded-Encrypted: i=1; AKwUvBx3bIbZdfvC+dFUBltuiEwoWl1KIOuzaDgxanvL+VqHZx3vOKAei/q3dv9mxoA5SDcVvfAPJ7K55ok1AMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7NWSG73QBtEo4K/lEpBMWpk9jhGO1sglp7Vxd74ggKRQhvdvW
	4Yc25TT7kQXvjus8FUD7v3ImKd8XOyR0GqAaeEz8muF8kY8HJ+Ti0Mo2l7pMZl0B8Tgqli7wFds
	x5YtY0IUaZdkMBZHM0F07D/GFbUMN022Mxol0fjGjx2OGLqnqcIDiLbl8bLGGNRuRx+eiMjUWT2
	1Ldsxyn21Uif5/7iatMd2R85w+u4XmixjT6Ej+z/U0
X-Gm-Gg: AYBFou05pyh4CboqcYPmKnVShEjVpqtlswQtTa1IkxnXCBsL/JQa9lCZ0LlMx9n9mXc
	pLrF2u4TuJDe7pvmRRttQ/nBoFNHiun7LyX13R4NKuRvIqsbeUq1AhIL11DgSVbKGlpQdKyB7mA
	lFpk4/RC5OuILmMmlmijuzE6mZNfvjFWHLHLULT0JuJ4G/CON//jfr0XUkjGnzCSCF0ttIjJyIN
	fwJURQ9GloCQBRhN7DA9C/xbu/uNOBxB4g7QHGjtVyTtrU5aqQRnrMHXEJSLh+z/cQhZY/tkrA4
	HG8=
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328359666b.40.1792759531931;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo

