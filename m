Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20F5208A1
	for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663663; cv=pass; b=sVYJkxjrzSH0Uempjx31qTe9FHWiQN8UHD4XMDVqdDbCQuxCLYyWbB5IJV5Nh8hGGmV4Ao1fURMnQd4sq5GFpbBFYVTW58eIUqLqJQhOA+PDTZgcBS2SYTr7RJyn3WiBX6UNuWGXAypaop3SwUT/tz3DBEk4UW7vsmxTU0a49zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663663; c=relaxed/simple;
	bh=OXoyJpegabl0ocESy43SWOAVnutZsDrl9ix8aJurgKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AI20Y/J0u1DxIAIZxAFMZs7yRrNGctio/5cF2hWIDi/37c1tXpTkH0CRJrR/l6kBwB7ySjuKnOJAb9zXbwPQCqSwxqqeSKje8vFgh29JeoHOdgoSiMBEzphxOW69Qq/Gc06H8KiSBFySwM2gUk8JwRsnGG+Q5JD39jvWo6e82jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/C9mgWL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKGKnJD3; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/C9mgWL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKGKnJD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
	b=h/C9mgWLVKUE3XGeurN8VBjS/UsjoM5ZJ9tPSlsW3dzKSEAFnd4gOI4xE4ErfI2eOvIN4S
	1xiJOWqAUg3ahtdZBoIQpTeKpK7kQL5ctrbOz1AE33GVCC/fChAbPFI/5ecAUhXRVRV1+g
	akJs722ULOhvBfgMe2Kgrdhy6k8idRY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-ZjZUaRbkP_S_5OIGNAeheg-1; Thu, 17 Sep 2026 12:47:38 -0400
X-MC-Unique: ZjZUaRbkP_S_5OIGNAeheg-1
X-Mimecast-MFC-AGG-ID: ZjZUaRbkP_S_5OIGNAeheg_1789663658
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c293a65b577so117390866b.2
        for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 09:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663658; cv=none;
        d=google.com; s=arc-20260327;
        b=avV4zY2bSBE6EEJva83ERB7TR2PFDEMx2VSoiNeu3gL3afZxpmcZLZivs0zUm17IT3
         ABJ6e7QIMabWE1vgBzJYyHBMjNTJ3NbYnkGsTd2OZHIgovRNrKCSb/Uudne51EONfAxj
         1kuLjX9f1tH6ItdrY8zA6b6miOXBRzV83iVZ8hDh9XkxIoOAJxqxsvsZD/lwCzcY92G5
         NIgre/iFj1rakYvHYZNa6IM9ufbjk0J/dbBNzHA2NSue2Yuj2GWuut8xwQVFWPNyw15d
         2yDchYovVVC7BGmiI6LQ1JReXKsXB4hag1D2tpXFiAiATvBYv/yhtN2tTBea3UF2Tr3y
         IlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        fh=Lol+pIAF5EFwXYVk7y6YD2tyzTMr73R77iqckF6s8Ik=;
        b=r0rGaSdbRPYfgxFeGip5mw6mHVJyBvLfBLrUOlpVmIezgVzexYGZAO6qPL6q6ABcJZ
         CqwPcjJ07y3ruEyXKvOmWaquWfPvUoz2onuQYg5XvtIJ7ZpNEglSKGlcgxx7M7Rjq0Qa
         5micqSVvyMecv4Fuw6D3hcVMOPAKoI+cDnARRFFJ3fVcDQxd1y50ADGd/zJ7bZDVJI/V
         nbn70DuZR05cxnq2GfCHvtCIfIWT/rfBkI9r8IO++a9EIq/5Ee67oAOTj4ezyChApJGq
         ILszpMgJRvRKn0EZymaXAq7hKb6MxfW2xrP5YpPpuFDgnHEaqRpw+o57S5H4Vw9aOCkt
         f9rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663658; x=1790268458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=dKGKnJD38WiZGeDo9G7w61tJE8iA6+vSv3+VhV/+0BSAMznrhvPVqnGGKYQ4PLBA6I
         0x6n1uxTHhGhrERHIq4n2fwx7oBAGeJ0UH2xKBLCAHlcgYVJbSGdqkRY1bIrFojj6Vu2
         1xzNeV3ObTyMCYkO5MWwX8CYgFeVi4bWCgXmC4n+onP+bI4+jZOOu0utxMpLFY4bJHAr
         EnjiwLBgjs87fs6PxCZOmw1IRvyMdPyrIn9tJRRP/SWbFlBMtaD4DAF8BTLubz0gyLzg
         wVbhbv7VzQr/+jzG98EbBOOsFR5Vdnw7E8gs5KXES7CruX20+ZZXuAPdluYPVbk+dg7Y
         c55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663658; x=1790268458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghsNMjszr/YVVrzwI9L3VChkEhVa9VAV3CWSeRoOujg=;
        b=VMVI6TwofNgAEzV/RTmA0LboqY9KeDWYDfOH7ezN2hYi1QKBjcJSNPkMmn3g9EdGCa
         Jazs+s767A/4sNLTrXIVugC4vjSPxYRrSGEEcRO+rcHjY21HGok/endYSjCaef7bNtYa
         mgp6bPq3EfIW0ettniUxY/+DUqpW0pIgaItYfF03WdckMCDQgxTFGibM1PSARSyrK8NU
         BicyCjXg8z4aJFSYyA4AkxTbITiiTS17GSwg0r8cTa16ywc3eea6YzyM4GhCqS+bMEzl
         28U1a5N/e1MUUHvqIk2xM+Hv2glNOE0uM4CMP1maZwCPLHbtpcC8lo9N8le+y5bW6Z2l
         6Sjw==
X-Forwarded-Encrypted: i=1; AKwUvBxpvHU+4z3R0OcOQ8HnB9dP3UDMeak7rnxRomE0IiZbJA+3RK9ZGYhXjvPYuAgA4i3IR+XDmYHSiozpdnY=@vger.kernel.org
X-Gm-Message-State: AFuF++k49ohozBNp2zC6qfZJgcmRi8PQmFb0olfR8Ob7hnJrXuHLrL/7
	gXINqPGHljt7rU9fdRmscRA/rxTvyfdlZMgABMgePN7Hcl61iuFIeS+PPUoZQEwUCKz+CW0U0Sq
	TFq5MdVl/oirwNEKZ9BgvaKR/QzVytiTPg2gviB9FdH4dikhty6eHeq+W9KJ+dZ5H/Fst0NAqvy
	xy41WGLAyGKH63L6a7CtdoLwk6SG7AiZ6NFIGSkK3W
X-Gm-Gg: AYBFou1OYk15Ao6fdo3Hm9L5iZzdPo8FaJFdyiBk8elD28TnaZq5iaBUwShXTADXRgs
	vVRMaUate9XIgGnskxnGoBvzFYega5s/+o+bDfBfPIOJnfihJtm2WxQXDJzy2zkaJDLg+2VzY8j
	3Yjrc+OpfiVuGOMrlgU2FETsSCLZSG6SqEz3lxUqTQbbsJp9mIIm/xLrbs2A1J7lj8tsKX7+CZb
	ygXifJ6J1hdPXq7cFHDPvADxpbsD3jLaMfohCsNjdlOA9nHYkcp2tF7KG8VbO+YAmIE2qulyKZ1
	vfA=
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr627702166b.10.1789663657736;
        Thu, 17 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id
 a640c23a62f3a-c29e5244c19mr627698766b.10.1789663657315; Thu, 17 Sep 2026
 09:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
 <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
In-Reply-To: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:47:26 -0300
X-Gm-Features: AcwNN1UQ-9H3EW5aAPKYI2mYiHxV9kMvBFdM8jP3WAhZbefwH7qcxYHE69PGYDs
Message-ID: <CAABTaaAUBzp1uaLve2piMhEB1R5po5n5+Sy+U0mbbe70Ak-SUw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
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

On Fri, Sep 4, 2026 at 2:21=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.c=
om> wrote:
> >
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/alpha/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> > index fc8f6cedbb28..8a39c0473297 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
> >         }
> >
> >  #ifdef CONFIG_AUDITSYSCALL
> > -       audit_syscall_entry(syscall_get_nr(current, regs),
> > -               regs->r16, regs->r17, regs->r18, regs->r19);
> > +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
> >  #endif
> >         return syscall_get_nr(current, regs);
> >  }
> > --
> > 2.55.0
> >
> This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series
>
> https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail=
.com/T/#t
>
> That series moves alpha's syscall entry onto the generic entry
> framework and removes syscall_trace_enter() and its direct
> audit_syscall_entry() call entirely - verified with git am against
> GENERIC_ENTRY applied, it fails at exactly this hunk.
> You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
> lands, alpha's syscall entry goes through
> syscall_enter_from_user_mode_randomize_stack(), which already calls
> syscall_enter_audit() as part of the shared entry helpers
> (include/linux/entry-common.h). I applied patch 1/13 alone on top of
> GENERIC_ENTRY and confirmed alpha's entry path already routes through
> the updated __audit_syscall_entry() - no alpha-specific code needed.
> So for alpha, you can drop this patch in the next revision rather
> than rebase it.
>
> Regards
> Magnus
>

Hi Magnus,

Thanks for reviewing this patch! Ok, I'll drop this patch from the series.

Thanks!
-Ricardo

