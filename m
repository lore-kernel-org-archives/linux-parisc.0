Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3A51DAE0
	for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663592; cv=pass; b=uT94Ls2M8//V+yj0UspjWciWpRLOQ8rioTAb9de17Lkv25MOvBQ9wrxNcPIE1cign33vXjulfIIKO6Na+n5FAXvQwFLcWhs2+NIFL+ciw3VjXoIXewQMtpmZt9Oh8PcwB5hk+PQAvXNrvMYnwtirUAEbK4UGF5HLe9/VXkgw+rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663592; c=relaxed/simple;
	bh=eYYWM3K0Z9Uro9HwA9hQ8je2naly/JqA+zNhzp9DrpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0wivZxCsFWMjXWgdO+SdNV4cO4ckHm4UTO0B2sjEZ7IAxLLcsP2IoEBoTC523fKi0rI2ZP4vrw/G7k2Ys+vWlXOtsGMBZP1jL8b4RKCc/UU+7JCNmHfpaSXtWzZ7lsNvH7Vy2vOt1dKx2tmVu5jd6Y6pF7FoRKnfnDjJWwv6no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTTX6g4m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H200DWtJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTTX6g4m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H200DWtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
	b=ZTTX6g4mYj0vlRM1lqShOllZvQyzIx2owUz//QT3uX3LDPwvQ13gLfFul3EjOEEnhQRL8+
	IgQ/7XdL20/z2P4kFnyzkp7ERWfZuLKKKkUCSaqJIXTrE/hkbCg/FbDPz+nqS3uMZjRKFl
	rRIN2A0cBVjwRsvMvG/YvP3IE3QaPqs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-33-optpLMdGJc-oDsDxJ6w-1; Thu, 17 Sep 2026 12:46:26 -0400
X-MC-Unique: 33-optpLMdGJc-oDsDxJ6w-1
X-Mimecast-MFC-AGG-ID: 33-optpLMdGJc-oDsDxJ6w_1789663586
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c294442d71dso133060266b.2
        for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 09:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663585; cv=none;
        d=google.com; s=arc-20260327;
        b=a4g4KR5NPITrPVDOb0OQmuLqm9xUU9FVIh7/C2GD4W88MO27XVB02Rx/B7Nj5srglu
         jmmObGHqUPiohxczaB0/gt1Ial/z15sYpHTwYKa/UNSZCzT/7iIVfzEkeQ0D0EHz0qpb
         ko62cbG1z3wXdQ+aaLkBGou/eOBEiGS7BiEaFUrP9JcrWcajzmsORFQ7eYDC6mSfvlsm
         GExvLve1eAjzp0ogYGpy5DxgHLcwZI2cAY5fleCUiMpqzkUaKEVR9kv7LSJLzDyv9top
         qHIxgzIpvgHimhVW9JNqHOSYY2Y2gkod7mTCHosxEYeml6sWSA+e2un8x+W+19SY4jLY
         gKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        fh=cx0f2ZU59+/zGitSkaFZh61QYn8gAtNJoOfarQvIWKo=;
        b=EdCO/uETTU9xp9mvQDc3M4fziITfEA3zwwVDx8If84mv4eNh3V8lgYHF4fuA9dBWYg
         kEX5GLLr1gQCjrS90Pdnu5zbwDDYMo0efCEibIqxkMW3Dt5js0T/zWf5w8GQ1fU3tTHB
         Kjf8Y4vDZFmeLGe4aBqXm621k4p+4gzZ4mxKM490KMbWdmzeJczDgm1+j7dKtlRLDmUS
         XhfrP9LQVf3Y6BCP5kLWTStA3oPjWK1ES2MXOCBD3bAmb7wLM/lS0WsFydoMHEUyDPn1
         QKd8k9whoT94R19F1lH6v8+bZwZldheXlNv2xoLDB7/ge1tQfhWo7YNPOcrQtN6bMDk9
         NZ4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663585; x=1790268385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=H200DWtJICF9QH6JHKN/nmm5tV86eiUouPYi7aafDRycxl6U169OnOUHb3rKCENsez
         +0RXYTDalsgbqK5ghOadRO1Q8ILIs3srTU1f8QjOTFAsX6a0xyq2jTukvLaLDFgK2T3X
         nqWiLKjVhJUi1FY9XS2W+MFSI/Yfh90CWlNqT5+QBG5KUeK+wYo2J2lpSvjs9TNMBe+y
         xQ+ptvfiXIvmOWzzcDpd4BoaAXwTWRZRRuQ6ZGdvEVm7fpOJRHQ6Y+CSZnj1bU6AMMRf
         3uQUC6XuxCuwpCc07yBmfv3xF+IN8gmARl5UVfqxlHr6om+vwq01CYDReMmqjLfntZU/
         SgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663585; x=1790268385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=NeLZYKpACpQb+QYpRCduNC6/Cidro2tDjCwqXBw4ay4l3dR4/b2haIr5aZTkzGYHx6
         oTi8Q8+9cTuMot7+na8ABQi+ZwULULZg1cv6n3vmG+bB/o/ocd02WseKnl5cvio2A5xb
         LRnW+DndqP7/o7U6mVcab474zFJCfR9ZhjCeV4NQzGuGx4uGb3PA/4rQ3hGqAl2Tysak
         RlYChxmW2LdDTOA6zjtd+rexui45fk6uD29/xa+ftqYC+0T9DnV6HjZ107SLFN096gN4
         IX7dlkYMAJUhSbW0eUw5p8ZkfwAuFK1pFAkyaN9vnFRdUCmwnnyI1edIc3+CIvj1Ogeb
         4Jfw==
X-Forwarded-Encrypted: i=1; AKwUvBzQxFLTfKVyZSczTr3hzEqtsVIEfrvPGigiYKTJJ4uCJBg+4l00QfbyvcFl/q8fTxOgjOFYY4VPMYP1168=@vger.kernel.org
X-Gm-Message-State: AFuF++lbZY+PtwPgfXTex8E/J0Omyp/2J9u8tMa31+9YGfr5BomoqVRB
	pk9cwK4Z5N7fpNN0HdqVklge+haSLXhVT8NoK6sZF0aYMX/jG1e6QhV0RrKyY6FdbwWsjYagxKK
	BBS710Q8qeiEJ+4ozC9hnt4tZfGHkmTwjwNBKtDyV5Rr45tB4f5AOBFOU5hg4gQKBeZUA4flTZE
	dE46zLZ6i85IkXtNhIYs+i5lCQs4PvpE8pzqljQdDl
X-Gm-Gg: AYBFou2NdlMHPTlHqLW9K5zgT7xYuinwV7n3rNveNo3t9VxXgGBnlhnSb0xBm5xkhfB
	E5RNPFe469YtCdy0XNRK6OkZmGxa3gaU6IrP/h7Ag+6kYtP6ttZDow7ofwPAxW3vXO5M+icCJSZ
	QjfTFVck4matW+hGc9FzWiZTuN1loHNijCroAYqcPadgywYN4udFG8twgOpPc54LM2zIitclqcv
	q+FP2BHEtRkNxugCtIIv6c+SibztMuMxMq+p1ZBndlkCaHKg+j7z1L44V7vIx7x3xth61Q8BwXE
	EDU=
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id a640c23a62f3a-c29e53184f0mr504527366b.42.1789663585490;
        Thu, 17 Sep 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c29e53184f0mr504523266b.42.1789663585091; Thu, 17 Sep 2026
 09:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b4ab47d2551d090520b4fa81a884b5988b9655c7.1788351089.git.rrobaina@redhat.com>
 <apkuNj1paR_GO3x9@willie-the-truck>
In-Reply-To: <apkuNj1paR_GO3x9@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:46:11 -0300
X-Gm-Features: AcwNN1UTQywdGW9xqj12KwNHAYLGfDNNso402GZvP3WcYYwXGdDJ7Oiz7qML_cg
Message-ID: <CAABTaaCoNztwDUA-HPp4LaikxL4dxk-1bvCCpoZEGD4rnds1oA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] arm64: pass pt_regs to audit_syscall_entry()
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
> On Wed, Sep 02, 2026 at 11:43:37AM -0300, Ricardo Robaina wrote:
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/arm64/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1c3a..65532b2a8cd4 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2476,8 +2476,7 @@ int syscall_trace_enter(struct pt_regs *regs)
> >       if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> >               trace_sys_enter(regs, regs->syscallno);
> >
> > -     audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1]=
,
> > -                         regs->regs[2], regs->regs[3]);
> > +     audit_syscall_entry(regs->syscallno, regs);
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Thanks for doing this.
>
> Will
>

Thanks, Will!

-Ricardo

