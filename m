Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799782;
	b=FMGhMx2hsj5tK5ndwWpAVMwV5DnW7UX7GV5cjXrsC7W8FrF16IH97H7ogGDCpfubqznz
	 3xqL5uEgRoRcHDA/h8D4eKNgtR7aE+2/Wwz30vkEDFYGsdKT6lEgMGEzcTu3GAYOHznb7
	 wRrXfI8TUycr1mhbP2+Zu0OyijV82W58tHI9uCqZPhvaTK9CHmdOBOcdmEAgIGT5SlsAL
	 tkejRUsYY6hoqXyh8K15WoRqWILPlZe1jc0eelmL1hlFbzPHjWZ4IZfMkP1IsFQZ6quFv
	 bOKA9jsfiJdXGIFnuJfi6cWBAD1EZzUHeBYDVfva6HnF4fZmbh4RSLt3RTJdRnjjPjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799782;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=11hAVBFl/NIynyPLJw76TmrcfGYQhV1iYrE5mnN9s5iOjNL68atBAAX9nfLQ0E088Hks
	 2JfOkNrZCGgnOxTDgrYLmyqYraZuaXJjnO4f9i1kAZjiDEckU7nq/tx+pGCbvFI7fAqZf
	 U3mjt+s/3MHgHJTZ/v6ozKJgTmDaGOP/VLrbSBqYhZYmzuaSdGY0CndApVl1CRTJcdFlH
	 wJiG+Dh+RfLKj535feXY3eVRCA8kV48fSx0RfV/dxMQODdfcfsW6rsEHqC24/DjROOj6X
	 p4nZunng7P3DrJJSy8YX7rRRCmhyhBaryOTA4VkQi7A3PFACxFOvhqacxwTL+AtMy6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660D606A335
	for <linux-parisc@vger.kernel.org>; Wed,  4 Nov 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9660D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apDpBAmV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Mouu1XSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793799780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
	b=apDpBAmVyHsE8c3Flsxy9Ca82GUT6I+55gzpzWCTdUXVsJI9n3ccEwuf4/Obnn4yWBkAem
	HqBD5dLRmJdJxj8R2GQC20jDlFRwYnvfSKyGcVECq60ENLzqVljorLRXl3T1yOpIX/xvrC
	d+bSQqkg0EFxXymI/5arWzTYgt9yAJo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-bc0iXoXNOGGkOEAGMcvppQ-1; Wed, 04 Nov 2026 08:42:59 -0500
X-MC-Unique: bc0iXoXNOGGkOEAGMcvppQ-1
X-Mimecast-MFC-AGG-ID: bc0iXoXNOGGkOEAGMcvppQ_1793799778
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c42394d1e41so85416666b.3
        for <linux-parisc@vger.kernel.org>; Wed, 04 Nov 2026 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799778; cv=none;
        d=google.com; s=arc-20260327;
        b=m+njdNyFmzBRk0ok7yAqmxZ0hWM5afh4kP09NTprfxoFEBS4IZIqThhoGEdo6ebnX2
         3X7GBlgDRq2rBX+AkFv19kA0pLbyWpAvUtkN6abs0piznQ8xVYgKX1YOpW6eKse4iuW+
         ydEm/PsoxJEUXlIco3cYXfMkAnsbsOKXQH6DVDNnJhYa9rzWAWA4oHB6/HMuInId/Xgs
         aAjNWPzjs1EchV0zcSn2h4+hevE8G5u7I/pGD+X9zNkmz1HEvcNvyVwgvUG8D1bBcRro
         8pFPy454y36uSmShJdLEUPw3wKP2+G/DZP+5Dk5xkKN3CN3ftOh/qc0GKrKhytZhn3GL
         kKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        fh=HV02Yrg2K2GgDlvIu5KUUE7Aa0uCJkSc3Q1KCGYv/PM=;
        b=F0lok7DNY2YeBy8DpTUj7fE9FOOF2acVBvnEExPuuDw90b8nPfyugPLcKYXhOUy4Hz
         8lUYeyqGrInwXzeQ2j/sYZk8W485qi79aqP1LDu9NcXkcvne+ZpbHuQ9g4k3JWeGbyM0
         3t2bhst87Jm+PCvtWn5cnVvfrlRqWlfOw53npgS3MaZWYG41Dil0Z29IduECX2gxj3h8
         xJCCiW1/GMiFQupOMqgzqye6MeuYv/kl9+iD2DCkHOGi6ws4jejUlwO2AEnAsZJ3x4Xi
         6SQp5f9rzxnlj1atVu4uF7fWrM7iDv2jxP2TOa/iDP3UWNa4numMy0fwKhPlHmedN6Pd
         7N7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793799778; x=1794404578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=Mouu1XSquusTnpfBvStFzeTN87Vx2zKs0FoEY5SevuYiOSnWt13aiH+f4QP1nefFjN
         bwfvfwVDenTxSc8Ohnkem1H17b4LundNCijbYaIAUcQNAY3l9xb5ksqEC4f6Z0cL5fRA
         xNQeCDtNJvCH87SLQgARz7InVVv6L0tlELNSUxXik0wyk4894QFXRxG6ccRAtEW0LHKe
         THJnGdreJEIFTFpGet+lyfmvPE85xw5pgU74TXo42+1aVRehgiL3n4FUvqXowAs6156M
         o0mbE4QPzv8Fl1z8PH+X5bYTvPRcqdU8Fdi8z+HRncDyBsgEgiGZAnMawcFzMWiu0GGR
         D9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799778; x=1794404578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLATmvImDg/5VrDBag7NLO/Ra27QQfElNkmu7cHAdiY=;
        b=FAruDclHt37iYijMXXbDzixL5Sr1VXMIDeEN3ev1v6YRdylZwi5RqzqAX8mzM3Ua6g
         Jkkxx7Nvp6R8bSFu90LSDylIBhfmHNwW//E3snyEg0+qDQ5KzTXhK+VPApEqsNzGLQb1
         Q3L02gvcQv05x0xPOCXWsORWFL648F/vRc6RAr/dZXjVHvBrTbCOKPESIk6ZNc+ARXO5
         saWTN5pJJXk4rzKt5Z70W70nZZjDbaYPSh8g07bR2+kW6IdP69GpYLghpsgbBWMRbB56
         bMzuvkTSHg3GhmtfPV5LN5YmAO63xLMSJCCVKhqszLwnkYm7xD3krfrPXLsu+zo5H3p8
         mlfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwek0MpI+fofa0xSBK6XcHiu3+ofBHycPA0MWxb3v6a8k8aHyTms2MnC8zj0oTOcjIYzKKJRjazld6rfo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EjhdmUsFPIPue/Cg+rFkWfR8Nq3R0RqrjHA6wez3QA7fAgOhB
	acskZxiWu2cVQIrzSRHf1imHxwqxH5Tciy0IIQkMLm1ySAP9mbuxyqQKOScfh9L53ya6YF+GBTR
	a1SvzNt/hk7bVYEKTiun7VDmhdzjzsEtL2i2B1f5WjFJHw+5v7dB1x7iOLoVPl25sg0AYsljU83
	1+VRlbuBs6tp10zQzb+oh8T3UI7PUQzgHo6skjpF+dC4fwdL+4UzM=
X-Gm-Gg: AYBFou2TNUSGmOOWETKYFgYpBNSjblAJm0KPhE+UcR8j59FvkIcKcZOkEYCsXJupVcg
	MqvXOWC4+O6NeXUTm/K1XeJwT5JQLWuLQyjp9Bk7yNBJ4o5No6XQFUEyMKsm5ihQ+I4gZgb5eNa
	7W/zBHR83l4utALYalIyP0nbYvAm41o7/+uCXpWLwgZLJK0id1uSfUOkkOGhaMrafTkmtDBJ8hT
	dtQFRWefhpts89IvgozcgGuIS/MMVVCS+6RJtYME8SH1Q==
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c4ca795d0cemr1327721266b.1.1793799778113;
        Wed, 04 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a17:907:1ca4:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c4ca795d0cemr1327717466b.1.1793799777447; Wed, 04 Nov 2026
 05:42:57 -0800 (PST)
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
 <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
 <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com> <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4U-Z2KkGurfMihJgzGgwD3miWSW4wWAjWvUdDxLpH7Q@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 4 Nov 2026 10:42:46 -0300
X-Gm-Features: AclHuK9fArBl2NqgMDWGc__kMOSMhBxMeP1FQYdilvQJHUxXbryD-TLWb0XsxW4
Message-ID: <CAABTaaAYn1oBwHSkoGm0a98c9YUZKf6ie=yUOtR4FQuSjrusjg@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 9:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 8:45=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
> > > > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina=
@redhat.com> wrote:
> > >
> > > ...
> > >
> > > > > * As pointed out by Sashiko, when you were converting all of the
> > > > > arches, it looks like you missed alpha.  I took a quick look and =
it
> > > > > appears that it should be a pretty straightforward conversion lik=
e
> > > > > most of the others.
> > > >
> > > > I've actually dropped the alpha patch as per Magnus's request [1].
> > > >
> > > > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_p=
hdBKy4BLWOvDTt92t5Eg@mail.gmail.com/
> > >
> > > The problem is that as things stand, this patchset breaks the build o=
n
> > > Alpha.  Perhaps this gets resolved during the current merge window,
> > > but as you know we can't break the kernel build ...
> > >
> > > https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel=
.com
> >
> > Of course, you're absolutely right that we can't break the build. I
> > was afraid that this dependency might cause trouble.
> >
> > I noticed Magnus posted a pull request a few days ago containing the
> > "alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
> > resolved during the current merge window.
>
> ... and it has, or at least it appears to me to be resolved.  I
> rebased the audit/dev-staging branch against v7.4-rc1 and Alpha does
> indeed appear to be using the generic syscall entry/exit code in v7.4.
> I think we should be all set here wrt Alpha, thanks.

I'm happy to hear it.

>
> > For future reference, what's the best way to handle dependencies on
> > other subsystem changes like this?
>
> Generally speaking communication and coordination :)  Talk with the
> subsystem devs/maintainers to understand what they are doing, let them
> know what you want to do, and find the best way to order things so
> that it all lands in Linus' tree without making a mess.  In this
> particular case, with the syscall arg audit patchset not being ready
> (missing maintainer ACKs) and the Alpha changes going into v7.4 it
> turns out to be quite easy, which is an important lesson: sometimes it
> is better to defer a new feature for a release just to ease the
> coordination burden, enable better testing, etc.
>
> --
> paul-moore.com
>

Thanks, Paul!

