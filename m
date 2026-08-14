Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0B934D4C9
	for <linux-parisc@vger.kernel.org>; Fri, 14 Aug 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732666; cv=pass; b=q7PTEFC4Urwta4bCtP9O3gdRJePr6CijAo/puDK62JnlphWPBCdFPw9bWmKje4rEggacIPYD6IksfJHqyzVKuTTsHkVdajcqGKw+FpgR3EujBd8PYTxA6HisH2aWNzX8m4QATie8goWIIz8xLukfPM1n9b+pwF+PXQU7E57V9+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732666; c=relaxed/simple;
	bh=+yTnC3qUCMhYF5izBj08k4AdSicm6irjFGKLdWdw5gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3GrrBW5AQ5hPZ1cJPJvZ4VXw/HEIu24IAPLmXPJiNQCB/LBk6+Ncq+lGYx5jv9fdhOf0O+YasUmEEVruen74YoXeRc5mnGt6trZrRD0de9eUqflO78Zu4Dbk0jeo2ZAEzYxgmF6g953b0/AdYj09f8anE24cmrWN2q39EhC6SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrZu+qdo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjDgTjUq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrZu+qdo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjDgTjUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786732664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
	b=hrZu+qdoz3Xn9mJSNltKFNpdHGMnq6olmPGRf4aELEhsFnGrW7xHZ6rqspnCW9wOyXStXC
	WN/MCTBGnklfTPNI5L02lycGCvPOS//UzyqZGzw22AY8VP6r5IJzqJ+mHVDs894vgxMwhh
	tr+ub+1uuAOWs2b3AH1+JnG2hEDBtPo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-t2HrIui3OTiwYP4k5vzlOA-1; Fri, 14 Aug 2026 14:37:43 -0400
X-MC-Unique: t2HrIui3OTiwYP4k5vzlOA-1
X-Mimecast-MFC-AGG-ID: t2HrIui3OTiwYP4k5vzlOA_1786732662
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1670dd0f5dso101747566b.2
        for <linux-parisc@vger.kernel.org>; Fri, 14 Aug 2026 11:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732662; cv=none;
        d=google.com; s=arc-20260327;
        b=CVTudqONiyFd/qXS6sRVGJrpd35zs4lBkAIAwtpI+v61cwsQ1F/Wzck+dA99MZbxaG
         i9L07vRaT8gyt3PF5YXZoAoqTUGXSb9wfEMxpD11bWLXZ42JWgMbKs+cqNbULrKgl4Ei
         +xoY8V+51LJP6DY3R2C6LJTJKaJ/E4YNybVlSxI5dcetUmRCNVfrjlhPTZSoTE7whCPt
         H46pqqYK2ShhaN7NiJa/NwxLJmCqKxrkxVWfQosDmmFO2Sl4oSaf5ckhfGD4MctcH816
         CvcdpPxXO9NNHNtgNXSFisPcjsb9YzQfti5C2YaBOezy1oxdNTLry4onz1wcjoJie5nZ
         CNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        fh=vHVtiqw9JkCN8i/Acop/q7JTyK2/HyHARGfj0hBC7mA=;
        b=itPIUiKGGEt/MjpwFQbO4ZO+QnHM4h3ZmLkHfr1nsL0dCMmKTM3up5uGzc3zzDxEHk
         kZJ4t6VSl+WjW/gs1ULmCbbX4TiRjNqYYrWzzIkDV7EkLRqLwkp5HEzZIjah2QH97H2n
         fzWhzQO4+X765xcA2Q1xg+5FhrDoIjyItSHKeKOW3S/KiozQOy4sjTA9K/yHQy6jSXzN
         WwXLhXD3T7Cc9SJm+ZXTzOOpih5mcizxoaVhzYvsgV426kN3nPK5Z3FXBIeZDFeqKoSi
         lUPyVJEVj4jcJScWz1vFS87VMq36yrGdrmxymgUQmndnRHp2MiymygM6hu86vkjPt/CS
         2drw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786732662; x=1787337462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        b=QjDgTjUq54fJJAwG80FBXraQTxVL2RXfWsMCmAfjNtywUsf3hLrNJ9IPCLgxVhXQhs
         unUSe6/q5mKfDqWnx6ZRWIDH3jjhDmppMox1aGpfM8z9Vv55QcscyMMwJm9MiZQbPGRB
         10reynRego7fAWekupcKLsSVMWMtkzK5g999XF3GiQENlqzshT8CmL95TFIC4nNNhFov
         s6yM2AZnCLexlgnurb9+9xpl7BHVJfcFEWvS4WHwKnYtdNE7Y71Zi1FB3FXNdI6q8h9v
         3r79+JiJN6/FyQM7ij94ZqGqiM8+C5Qrx4FfoVyLTwhVqdt3IG9Eao3Hwhdbd4bJMUxz
         QeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732662; x=1787337462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        b=AcewVyQ0uTFag3R7Obh0aqYqilFcPcGO7sVT/qwG7gAlcv2UV0zYODKKbyZgICpb/Y
         MJscV7eo+d5kjpQ0YBXPtldYMQTyYyi+MUIJqm1i4Xju0vnovvQrh6Z75KOIEvkhIMmd
         nv88XvzhmHiDZyc3eGejVDt0XsoOLw/BLebrFmLx4JBaQtltGRFzGrdqwQ27zGqBCIs3
         9saOl0klEFYNwwB2QujV9ADuroVA9Kj9G7FUvmO083HEsEZx4N8wg+AI3BGtNQpcD3nK
         3gaElg7P2rnd7gpJRPWdXB+Xgw1K6tuhUDQZ2FGmWhoUohYPgrtj/fpzLDY94IaaVUdg
         q8cA==
X-Forwarded-Encrypted: i=1; AHgh+RpcvCGH5aciuya9iYv5KGBGnvY7hgqqd66t++bU5MkcGxWgAtFwcgWnfqj/P1I+E+OEfhV94pn5T95kagA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+g30BSZhyPemtZNGcs8W2N+eR6+gNmVY7i4eU3atwDy80BrW
	3QJjFNNqtGwDKb1s4daGiGteHdU9Wpqi3lDabnCT6a6MSKeubKxDJdMDxD3xIVlXTPy+yjAXBzY
	yxKmpd7b5Q8lD3po6ZkoFl0Gt8ZCxM2IbgAWI8Ar9OA4KAaPRzPsC1P0hoUrzhsqzB+WHh3RxkZ
	J8iaakOIlo2nXsX1SbUpuKMmyds8KWXwSbPXb/I2JC
X-Gm-Gg: AR+sD13StScW95KCw8npc2rg+Y5adilCHHO51My/1NCfXjF+RMc+vUQ6LWsB3+SlXEI
	WijdLe9FKQPw1dlXPbI981rXN/85+GfgzF+S5963N7UEr9t3LS5dbZbzrXKrsPZfZmyiNGZhAey
	hHrrVol63ykFyt3gBT5JyQqBkecgC4WAx4Ad6axEdzRDjPWmDW9DUD/uQHxX/Gpm6HuIIrEJEns
	JJndyfzsXX+MxiFSNlg/Y1s585dq4YYTFtj4W+We1Rshw==
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id a640c23a62f3a-c212a23ba41mr343801766b.30.1786732661694;
        Fri, 14 Aug 2026 11:37:41 -0700 (PDT)
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id
 a640c23a62f3a-c212a23ba41mr343797466b.30.1786732661284; Fri, 14 Aug 2026
 11:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786626275.git.rrobaina@redhat.com> <an7Udt-luZfJO71U@willie-the-truck>
In-Reply-To: <an7Udt-luZfJO71U@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 14 Aug 2026 15:37:30 -0300
X-Gm-Features: AUfX_mwn2tCHNr249W_00_JVZBPk2OAqZsqdPsMuBo2JtJrJsV0GhfYgrjHGFrM
Message-ID: <CAABTaaCcyTLV5TdmzZfpP6LMV+5GeCKqotPoJrb0u9n0h-TaHQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] audit: log all six syscall arguments in the SYSCALL record
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

On Fri, Aug 14, 2026 at 5:40=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Aug 13, 2026 at 02:02:50PM -0300, Ricardo Robaina wrote:
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
> >
> > The audit testsuite runs successfully:
> >
> >  # make test
> >  make -C tests test
> >  chmod +x */test
> >  Running as   user    root
> >         with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1=
023
> >         on   system  Fedora
> >
> >  amcast_joinpart/test ................. ok
> >  backlog_wait_time_actual_reset/test .. ok
> >  bpf/test ............................. ok
> >  coredump/test ........................ ok
> >  exec_execve/test ..................... ok
> >  exec_name/test ....................... ok
> >  fanotify/test ........................ ok
> >  field_compare/test ................... ok
> >  file_create/test ..................... ok
> >  file_delete/test ..................... ok
> >  file_permission/test ................. ok
> >  file_rename/test ..................... ok
> >  filter_device/test ................... ok
> >  filter_exclude/test .................. ok
> >  filter_exit/test ..................... ok
> >  filter_inode/test .................... ok
> >  filter_saddr_fam/test ................ ok
> >  filter_sessionid/test ................ ok
> >  io_uring/test ........................ ok
> >  login_tty/test ....................... ok
> >  lost_reset/test ...................... ok
> >  netfilter_pkt/test ................... ok
> >  signal/test .......................... ok
> >  syscalls_file/test ................... ok
> >  syscall_module/test .................. ok
> >  syscall_socketcall/test .............. ok
> >  time_change/test ..................... ok
> >  user_msg/test ........................ ok
> >  All tests successful.
> >  Result: PASS
> >
> > Ricardo Robaina (13):
> >   audit: log all six syscall arguments in the SYSCALL record
> >   alpha: pass all six syscall args to audit_syscall_entry()
> >   arm: pass all six syscall args to audit_syscall_entry()
> >   arm64: pass all six syscall args to audit_syscall_entry()
> >   csky: pass all six syscall args to audit_syscall_entry()
> >   microblaze: pass all six syscall args to audit_syscall_entry()
> >   mips: pass all six syscall args to audit_syscall_entry()
> >   openrisc: pass all six syscall args to audit_syscall_entry()
> >   parisc: pass all six syscall args to audit_syscall_entry()
> >   sh: pass all six syscall args to audit_syscall_entry()
> >   sparc64: pass all six syscall args to audit_syscall_entry()
> >   um: pass all six syscall args to audit_syscall_entry()
> >   xtensa: pass all six syscall args to audit_syscall_entry()
>
> Could audit make use of syscall_get_arguments() instead?
>
> Will
>

Hi Will,

Thanks for reviewing this patch. Yes, I think so. I'll fix that in the v2.

Thanks,
-Ricardo

