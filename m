Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947853D8133
	for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663546; cv=pass; b=U4+HUL3KraiaJuLmumTalfgCRz7DqcQaFUd/2gMOCtuWN5VC6mQq6vUkTYUZWUNceGSM0VBjJZLSmyTsU/GSvq5BLxSeMs+74gpFwBMBwctRE5bPgliP/i4/eYBZWOoLoK9mDxWVGZc6SKpn9qfE4LI3efL2kbVWj/Dx/9tyzXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663546; c=relaxed/simple;
	bh=+630pigSMSS7M9ZUHGZahv99vJocnRD12hmvq4Q58Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnBUFiNAJoN3lJTyDx09fUQFBwODPk7i6aCy1mS+g8D58sctgZj/EfMougl/OadgXrs+upBBvJzriTWHNBcj76+2VMCx/YXA0jXK9OzKMaeXLvzA8QYOHSrgxSLGwnF9cikIWZciAz+sEu+yBIZeF4J4zQNJnWA1CyJax2TsWj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ac38Nh8f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hW6tdq8K; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ac38Nh8f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hW6tdq8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
	b=Ac38Nh8f7PO/3QG9demuUPIA6WwGSHz0vdtEu4+uIs9mO85qITzNalWfOXBk7yQ2YWjazP
	IzaK3d5C6Rqwb5CL7PQ6b+X9q6sXs52NSM4TFxj7p+ODA9C4aPQao/v0kkKV5bLuIL+IEh
	N6HrVdg+TrTa5IajZrQifgloieP9R0g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-KpaGDpxtNfSVbHO9sjFxSA-1; Thu, 17 Sep 2026 12:45:41 -0400
X-MC-Unique: KpaGDpxtNfSVbHO9sjFxSA-1
X-Mimecast-MFC-AGG-ID: KpaGDpxtNfSVbHO9sjFxSA_1789663540
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c252634bc4dso121168866b.1
        for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 09:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663540; cv=none;
        d=google.com; s=arc-20260327;
        b=nSr/JXE95H6anVzZ1Rb7OttqP9/OLQyjrBKZHTqAvE6FQY1P+pdgGgl5RSQ/Q+GUKD
         Fch8TTidhyUJOscloNhWpjPDT2xJ/XyizegPy9GXKpBdKsNY8/5c3DOJYtKazL7rvulr
         /wuH/GqTM54tR8ENNNXiZiFWUG0y3zyfJdYRxPJKzsY7/S4A90exA511ELv4sX4PwFyf
         dlezNffZNt57VEep0MzJSSNsT6sTKH5TH4P9P41qm3CrgGCbVx7J2POiWPntJM5gZ9Vq
         JO4kWXjLRYhuC5w4xmNipHlBU9PCrODKEeGwyW4sZU8imdYXescFYJdsH2NzoYcJAJKC
         kHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
        fh=/3G6Uj/dDRKjkLUrcKFuRnHvKksD5w/z2l/xJD1laa8=;
        b=paofv+p8xNVsPDMpiKVxYlTFSYB1wXrcJAvIKQomu2SrMutBXXkwA+RYyLtNJ3nnfr
         J+6FdnzUA99UKs8+r+iwbqb2SWQ/+t/C5CD/X2lnkN936KJ5KRt69dB9sNxWlYa7rrF2
         YgqCcDrgs+43si6vZ+L+eeeYbS+JemG2bxEcnot4g029KfFPLVEL7ELz2wCfQj6WgvyL
         Kk1qogIkJCLNU3NJGZ8iUYKSqm0ixQ+oEI88iCSEu7S9nXkb5kfagbGhzSjwcPElvAlW
         2ksgdGZZfhjA0qE67dURJL1NnBLrN0fq3KEy+xTyXcALwqoCn6cJXiNHyJQzgmV7AfZO
         CL5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663540; x=1790268340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
        b=hW6tdq8KsckOOXFZ3k/E2drQgw5YgyNGNgS9EK0lBLJbU0IruzswftOZOrYLPYFyYn
         rEhqez6IeRramDwS8bPOQbElQjN2wmB1lFDJWfOAqx+Pwn5+GDH+h9JS93nz2T+mdt1K
         7jxwZtYlIFCs+d+gF0pwIPDas4QKLm+DIPS5W++Ww6AtIrGmfmKSlupZO4hfg7EJj+0V
         z0NgL3jWvPbMLn/qXcC0gPNXwTXS+lgxXxEZ2rx8/Mj2Egz9tQRmnI8O22RhEDMZE/Jp
         Qc3nFM1IAQ7K7cD3J3Fb1km/BOGrZkZYVrhYutcn/sturJ+PDV0Dp7fNDdCiBWz1FQsj
         Mtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663540; x=1790268340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
        b=HKQvhO3z+//3QCvWIos12BU0UFrrkhBO3IqTcz6zDVfz90v1AUD9zr2dNU0C2imqVF
         sJYYFr5tJBlLjlKfAKJ59rGIU8kmUTF7c0B3o2aphrSlBgOH9xAVP3ts2V9yoTxVkKmo
         zQYrdwQmwaOJVBvdYJXQdTwqWmiSlQYU9KOobI/lFn45nPEwfO3nKZgNIzyt4CJLgOyw
         U1/a8BytOYPJNmlPcN/ajSU6JHLXT02ICj1xAgk+ORejE1YhTjuS34E6nGKVRJEJpZzp
         p/pIZuUvg85fAxTwukTE7AdjwE5CPozIBl1InKGw+XTUKpcooQqju/8bC5q6d02U3izO
         noiQ==
X-Forwarded-Encrypted: i=1; AKwUvByWL3FaR7eUoUhjMC8gbsFUKIoWkEI8DHApVt7Pb6b2lIEtuVQ9/zFhA7Jb4ZMxEXrQR4waR3IU/0sX6+E=@vger.kernel.org
X-Gm-Message-State: AFuF++mkAe6dUJv55scnnLCH5rXZjy+34QS/u94pcsjJux8BBcD9vqKd
	lALN1UkUmWdrPrlY7HWYE2GaIKmNm6bE/PASUHgepZUpN889pVRGpdNlCH7vqNarDzNa4mpN0vu
	KGTr3hGmDkP0r8khV95BfrUBMtsmdF9F8zC08/N3Ow1YJjinfQkEdPb4NLwfRBkCJoAZidyKGk/
	B4mweiEuJhI4hWgYnMNMikARq+0wOFob4vznd8VNKG
X-Gm-Gg: AYBFou0jaXDtu96FvUaR5XAWbYpyuSrDlUTiPUPT3CXGRm4p/h/3WzFtiz6vHDNkyXV
	Yb5tQAmUaZ0/sOtfV9IBHlNM6WIpks3sCO4khM1IprUUGXiESIoYoKp+EUGSUaiuba4AZkyeKxr
	zQ2rsXGZMqwqfTQeelf2iQ1g0H1V86ff8pwt/qKu0zhMfu1BpJ0JMUBMLFpX2KK36AjRsNiNLOv
	fOaKI35vEfj4Td8g/ECshXqkKECT9fhsBDIC1cgX6no3rcnXOGWemo6E5W8sEVAgid1CXWdxd/k
	vcY=
X-Received: by 2002:a17:907:9603:b0:c29:f5d5:5a9b with SMTP id a640c23a62f3a-c29f5d56177mr278873366b.37.1789663539846;
        Thu, 17 Sep 2026 09:45:39 -0700 (PDT)
X-Received: by 2002:a17:907:9603:b0:c29:f5d5:5a9b with SMTP id
 a640c23a62f3a-c29f5d56177mr278866966b.37.1789663539386; Thu, 17 Sep 2026
 09:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b30076994d49fa393251c836b5a57a725f218572.1788351089.git.rrobaina@redhat.com>
 <apkuGoWQwLJ7AcUC@willie-the-truck>
In-Reply-To: <apkuGoWQwLJ7AcUC@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:45:27 -0300
X-Gm-Features: AcwNN1VE92GuCfaSbB45oDCoyv2ZqeewbUd4A5IjqOoYsq0pANwtPdd_-Sv6Jfw
Message-ID: <CAABTaaA7ZbfLxaQvTegaE9prKUPAu5fbfVt5wiaSZK=ohhjL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] audit: log all six syscall arguments in the
 SYSCALL record
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Sep 02, 2026 at 11:43:34AM -0300, Ricardo Robaina wrote:
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3). The remaining two are captured but silently
> > discarded before reaching the audit context. This leads to the
> > need for auxiliary records when audit-relevant data lands in the
> > 5th or 6th argument of a syscall.
> >
> > Extend the SYSCALL record to log all six arguments, by adding
> > arguments a4 and a5 (5th and 6th syscall arguments respectively)
> > inline within the existing record. Also add the two new args to
> > the audit rules switch case, so audit rules can filter on them.
> >
> > Rather than plumbing two more register arguments through every
> > architecture's syscall entry path, change __audit_syscall_entry()
> > to take a pointer to pt_regs and use syscall_get_arguments() to
> > retrieve all six arguments.
> >
> >  audit-testsuite# make test
> >  audit-testsuite# ausearch -i -m SYSCALL
> >  ...
> >  type=3DSYSCALL ... syscall=3Dsendto success=3Dyes exit=3D1088 a0=3D0x4
> >   a1=3D0x7ffe43518b60 a2=3D0x440 a3=3D0x0 a4=3D7ffe43518b4c a5=3Dc
> >  type=3DSYSCALL ... syscall=3Dopenat2 success=3Dyes exit=3D4 a0=3D0x3
> >   a1=3D0x7fffc74692c8 a2=3D0x7fffc7467390 a3=3D0x18 a4=3D0 a5=3D7fffc74=
674f8
> >  type=3DSYSCALL ... syscall=3Dopenat success=3Dyes exit=3D3 a0=3DAT_FDC=
WD
> >   a1=3D0x557ced4141a2 a2=3DO_RDWR|O_NONBLOCK a3=3D0x0 a4=3D0 a5=3D0
> >  ...
> >
> > Suggested-by: Will Deacon <will@kernel.org>
> > Link: https://lore.kernel.org/audit/CAHC9VhSjEt_-Bsra4AEqWv+Daw5Ff=3Dgq=
y7dX4Ah11RVhdyCBUQ@mail.gmail.com/T/#t
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  include/linux/audit.h         | 13 ++++---------
> >  include/uapi/linux/audit.h    |  2 ++
> >  kernel/audit.h                |  2 +-
> >  kernel/auditfilter.c          |  2 ++
> >  kernel/auditsc.c              | 19 ++++++++-----------
> >  kernel/entry/syscall-common.c |  4 +---
> >  6 files changed, 18 insertions(+), 24 deletions(-)
> >
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 45abb3722d30..9ce5962bc537 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -323,8 +323,7 @@ extern int  audit_alloc(struct task_struct *task);
> >  extern void __audit_free(struct task_struct *task);
> >  extern void __audit_uring_entry(u8 op);
> >  extern void __audit_uring_exit(int success, long code);
> > -extern void __audit_syscall_entry(int major, unsigned long a0, unsigne=
d long a1,
> > -                               unsigned long a2, unsigned long a3);
> > +extern void __audit_syscall_entry(int major, struct pt_regs *regs);
> >  extern void __audit_syscall_exit(int ret_success, long ret_value);
> >  extern void __audit_getname(struct filename *name);
> >  extern void __audit_inode(struct filename *name, const struct dentry *=
dentry,
> > @@ -373,12 +372,10 @@ static inline void audit_uring_exit(int success, =
long code)
> >       if (unlikely(audit_context()))
> >               __audit_uring_exit(success, code);
> >  }
> > -static inline void audit_syscall_entry(int major, unsigned long a0,
> > -                                    unsigned long a1, unsigned long a2=
,
> > -                                    unsigned long a3)
> > +static inline void audit_syscall_entry(int major, struct pt_regs *regs=
)
> >  {
> >       if (unlikely(audit_context()))
> > -             __audit_syscall_entry(major, a0, a1, a2, a3);
> > +             __audit_syscall_entry(major, regs);
> >  }
>
> Won't this (temporarily) break the build? Maybe you need to introduce a
> new helper e.g. audit_syscall_entry_regs(), then convert everybody over
> to that, then rename it to audit_syscall_entry() at the end to keep the
> series bisectable.
>
> Will
>

Yes, you're right Will. Thanks for your suggestion I'll do that in the
next version.

Thanks!
-Ricardo

