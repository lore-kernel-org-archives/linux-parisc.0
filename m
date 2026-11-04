Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793752869;
	b=OdDabmjTLArfEXIf9c9/eYj/yKpWKY4/c8ycHHnxQNcfKpSLS9YFLV6UXNwZZ6UO3Zfs
	 /Lnx6GyO5sR09N6ZsniSxrJOzEW5Nv4I51U2oSNzzxXyPGU+cN59TZE2axG/nZ91ldMrd
	 +YxRgPitOjB1C9SBZGlwgoPHdZEy4fg5ebKMLD/fKAzNf07xXqWwjEIwv8aUnw8e33FqX
	 11d36QUwSQF4lqWENmEYWXDYC5vIgJL1ENBBh6XuQU9CMxTpAx4qgIhJQmW7bIDtT9/t6
	 3OxZgfgqV1B4Rlnv1IS12KMFLMw0EpTxQARKYIBi7gkZ2gDRzLOcBIOlw7HhzYZccsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
	b=5XWVORR+pNKgAcQOPQ1LCC+V2pXbjUHEdvL08oaVZa7V+iwNmWxtD30uclOv0phc4bHk
	 oL3DecLnfYXH0mh3QBy4o8gfXdRNDiLg7z4aA/+UsuSTHRaSUi4ledZHEFnKM08YjbEft
	 4f7BC0aeIotI/q2IQ501MIpTngbcNPTDAMs6Vmn8OY94+Y59Kso8pNRiOiVgwMLtddvTX
	 9ZfCJdLwzgAqcuyVpP8wAFejwjxvY4iMxIHNEhAD5ceUyvOwLgbySJNZ7eerv2Q2xyBGO
	 zr+PQWbQ/IxqGrneFNUGO8gxJ5+SorgOTZCoBwF3ZHjLti6mXigeeyyDe1fI6ZsKVRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=fail smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627E606A330
	for <linux-parisc@vger.kernel.org>; Wed,  4 Nov 2026 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E627E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070781f63so95409b3a.1
        for <linux-parisc@vger.kernel.org>; Tue, 03 Nov 2026 16:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793752863; cv=none;
        d=google.com; s=arc-20260327;
        b=O4m06V2MGcHbYF3Yjvg89Brc6PL2oMT5q9REnvS91QGC3oezgLEqxGTRKH1sfilbTH
         cp71Byw6QBRTxTqI9T2uAYHruugJovrtoiDWYm5K1RaQPr8ib/+i+WdHeMzNHJXB8usg
         DOi1CeF68I2/GHvm/cBmC47Zdy0zBUX9pfa2HeGzYp7MWaEI+QdYr4ZeAdppRIF6lEe+
         rprWx73/80dqhU+rbq7cl+PZEF3hSVrx/ipXN3uyrLhlMhsmKQkWgv36S/PehvHLTSPw
         L388VFNy5t+HTORVijuCTexgEdiLya+loh2HxgyI1707aJO7Qjk89B12Hgnl+hwL2xfp
         nVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        fh=OnMGUeaZUnmOhdEYbSdDShZHSX+gTbNtsinLB8z7/oI=;
        b=BUxtERDP3bwlgjQqSX+ltSsBeGfnX13Fsy6sy5DKOCGSWkE3hs6YqPmT0NVQ1uOoWy
         XkffSR4327hBTVoFeIp9NPl4jmcraYm/mFcGXHAo6Q1ATSFLL6MYwv9c2Ch3HAyNwhML
         aW8tLHD73PvliT7bZHyah2cg8d8eLCeHSy94oPlE12CFtRpxDCafdbuiDYDMbagzbcoa
         Ng53VxRyHsIzLDvCx+ka/D9SVRUJYyOuPV/ZCxYml11S1i0OY6v5ljBvKOZY/Hkp+EzY
         +XyJprykOFp0/sCnUAUnd//ceepRA4jXHhI05DVeaSIVVyM4QlmeV2u46iceD077xeai
         JTLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793752863; x=1794357663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=PTPniKxw8lSLWSxMbmhmXVodXffwfFqC3M3cDEPYPvY1SsBjNOjXXv95CLFg3rVQFu
         x1tdyRAr0bqYQ6HVqsjHpfPPU10/1FhE3kd/CHXKlKRa2s8Jf9/RWGaRvSd9s3tWp3+h
         Tji6Btj/3XlTUrwGPe+aphN7moDM3Ujmyews2MtwEsOdhWo9d1B27IQnIAXxeCj/AgoF
         TwCZd9YYNW98ENSoBC4GvFAhash4XN0WeHulLfX/snYculqtKEVgWcaAWPf68LjYBfvq
         i5NzGzwAog4kKLckyYK3n2IY4tOHLEWiT5cJSG6dbW9SW1FZ4MjXmEMstZ0yw7BaSVW5
         5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752863; x=1794357663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPNnZyQIDXSKNoVkiNoUdoJZWsQu0g4dBkxCnrIJvKA=;
        b=itFLdIZioY0t1TAR0kPSlTG/lnh3uing5+OiM3ORetRiub9sUjK2Bo7A8DxwiYtqXH
         sDdjG/TvyVEl+D/oWS3d2DyHPjdnwQtXr7ZpUwMWwkAuBzxS9SXWXzpCEE37t4qpqyaB
         hhe1sxtIbcasoTPlwU9r6W4Vcw1vQuDvqJE9Yd5SYQLR3bWb6QX1nukg8Ka9LRI2zNWZ
         zFJbWZsATJw5j6Y1ZPh7wCR5sL5mJCU+zNpeK+WWutopf7vpePBkysPYUOK0F67mLtku
         /Lx5BPvfQPWbGNm7kyn18TjEGyuLVOqAy5bxN78pjaNdtER3A8Upm5LB4/ZLRK9f+jrB
         4KdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2NNucdHxIV4xS5EWchMiyUOZarZ9qkxlowfL54xi9JG38s+TralPbt604jhHtVuDrpuPJf6l0BT7pN6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SVI3TjnmNN8/7bnJeQ5hMxTdvx8GZdjATKOQGkQ65ooL+0zxN
	ZSaD2AIr6hBhMpxQMW3LLVkqkIveEgyWejMb8NO4ZCR5jhDYmnvsp2DCfjzbdebcUv6VVMWkBUk
	fyeJu1an/PlgDK7+KfwlKNst695DuKA8j/LBjR6TJ
X-Gm-Gg: AYBFou1FldqZiBcuBwMJK6wS2bJllRkufz9PKmAff4x+p9Xw5EYZy+Jx/LzSWz2+coD
	Xs3LsD0urZeI3X+D91biuSaw2+BwGvaVlb6csSm/eWJXkhrCfLncrZ3U1AqwX1u3FOWpGZKdkIW
	uNKNwFP5+lWCiI5afJO8Oci6b6/275HblQ4U5xDV2ggQz8HaU2bJmU+DSD6Su7w24pWOK8lxgQ7
	+Y7DqwQ57WprhpYr1pBdYpXQcyXmQ9Gwmf9xKd6fIWxeolejduBBkXKcw5/4wQdmzZ0toG4uOkw
	mcDvB1j6gJltGZve7DIMpqkiHH88coHYS8k31Wygbf4AaEeW2Fe+V33DmXqV50tplfIKoKcJ/C5
	7Jc5zsx+0OMtNaXpfDOwCHBAXrfn8YTCj8CrWnzaaTa2YksbpvXWSCGMi7eiSEVBj1+Gh
X-Received: by 2002:a05:6a00:2d96:b0:88d:4b30:1c11 with SMTP id
 d2e1a72fcca58-8a9ba703bc9mr11394030b3a.6.1793752863107; Tue, 03 Nov 2026
 16:41:03 -0800 (PST)
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
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com> <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
In-Reply-To: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Nov 2026 19:40:51 -0500
X-Gm-Features: AclHuK_mzIhdjHPxjnkTYRthyfMgrzjS55JZuNf6mZPYYsQQvO81kKGlvJUv8_0
Message-ID: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
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

On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redha=
t.com> wrote:
> > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@r=
edhat.com> wrote:
> >
> > ...
> >
> > > > * As pointed out by Sashiko, when you were converting all of the
> > > > arches, it looks like you missed alpha.  I took a quick look and it
> > > > appears that it should be a pretty straightforward conversion like
> > > > most of the others.
> > >
> > > I've actually dropped the alpha patch as per Magnus's request [1].
> > >
> > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phd=
BKy4BLWOvDTt92t5Eg@mail.gmail.com/
> >
> > The problem is that as things stand, this patchset breaks the build on
> > Alpha.  Perhaps this gets resolved during the current merge window,
> > but as you know we can't break the kernel build ...
> >
> > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.c=
om
>
> Of course, you're absolutely right that we can't break the build. I
> was afraid that this dependency might cause trouble.
>
> I noticed Magnus posted a pull request a few days ago containing the
> "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> resolved during the current merge window.

... and it has, or at least it appears to me to be resolved.  I
rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
indeed appear to be using the generic syscall entry/exit code in v7.4.
I think we should be all set here wrt Alpha, thanks.

> For future reference, what's the best way to handle dependencies on
> other subsystem changes like this?

Generally speaking communication and coordination :)  Talk with the
subsystem devs/maintainers to understand what they are doing, let them
know what you want to do, and find the best way to order things so
that it all lands in Linus' tree without making a mess.  In this
particular case, with the syscall arg audit patchset not being ready
(missing maintainer ACKs) and the Alpha changes going into v7.4 it
turns out to be quite easy, which is an important lesson: sometimes it
is better to defer a new feature for a release just to ease the
coordination burden, enable better testing, etc.

--=20
paul-moore.com
