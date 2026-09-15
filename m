Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485B389E07
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494731; cv=pass; b=FaUoR82u1gK7LqfufWG781YToYboS/WCdWICQwtlz1U3R2crhmugwO4JTlul8TdbjxfcaPH3gpw6/I1zS6+QZi2JDYpkdH0wg4s7PQT8xtXQeMasoJreIUErVuwdZTcTixlm42GzqmjWtj7Wo9ikQ2cCYva8v6TzpoYFZFrxIdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494731; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQjsuqpLuh89DLGq0UIMVPqGWaFF7rDlCTyx+a0nDGp7IqOWW2qfh3YyQ83QxS3k9IvJ3cTdARVbHTU8OOdLNI5Ybjk0JFhGNkFzKC6DSd2iVE/X5F3WLjqsGHnjR4PplrrS6HCXX8jNj9nNST/1Wo426slVDHB+ySEqGQIQXZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so6875ad.1
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=s+VNp6nn639BEkL/mgLVwNcHV4HFIUQhKpJ/eO0Cszy2+ZJ0IJUGPHkO2yyjZU1tn6
         Xk872j+ZvvBfxkZl8li1n0/PbNM4g3xiyuBiZIWdf7J8++9APYBUEiZcfkZg4w/bzKjh
         gJs5RrkuQXPq7mSYZRwF1zcOqX8GrLepyT6Kscz/uQWpCtVQC4M1AXd/t0/QoYioxVs+
         +88t5YnMwVr4aJGTyzgcaGZhRnEpN3kReejriPfVPO/Elr9O7hmKOEE0Rin4IyRynIwJ
         8FZpHaF4KeMwXiQzkFTQMeNin7iJBDUhzj/VVXouy9s0dVCyvDccFYu/5pCPB3cRN0ww
         4VRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=nMdAw4pBeAh1/Dbz/coBcVi3pTU7ZLw4a/jCVwhBXtk=;
        b=Fkc3779foXfzNUuGFwLElPFCi5WGPcDE9JayVI3BY5UxQo/WAthPY+rX+FksOXsfSI
         DpYMIcujGNXXzbhDs3NBjbUc9GXZO1nINsa+P+S6mIkZ0NFiyihPfP3jsgrOLDQhZFhr
         0RQH2vzG6CV3xVm+26Hwk7rLYHiUNmkL9UvNtoHqD/GAPac9E75fU39giV0ZeAhJkfa3
         y6jfUC3t3SP1kBjVUu2y2xFf8+V/9DmNsvTyRH8qHsHTy93TUoIjYLbmRc5Cy1KO3bgw
         YAz0GsGhfEjpOcclqeL09YhAPXybrs/knpqpn6SfEIeOlIJMSpfQrWpWW8/EXTH6kKvK
         fqJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=yc9KmMlrKzTcWwYXviH9R5NENf7m7PPNJ1n2g0eRyKnR4sGye4jB8YgGIS7l114r8n
         lDSHbHxJRTuh6wGyIgu33DTiEcrQlhDs7O/cZByiM1deU/PLG/S5KyYTg/wMwvg86RrX
         qjb4Vh7CU60AeL5b60jcsYCXa73jkX9oKlYN7OvePvMSh268UB1u7M0xrOmUoZIbWQBf
         ak1gcFvs+ZODESOV5+Rik46EzyIoy9yuphKZAkDu5mp1mxCTuWpmZr9KTUeOMCgsxDMl
         juwcS0/gla53KxUN3d+Of8SS7rja5GVnILyE0mwAGlPjC0ZTosgrgT8yrQys9aqlWZvl
         3KlA==
X-Forwarded-Encrypted: i=1; AKwUvBycwEuzourLbbqcaJzfgjESI56iYW30ZKMYhH0VjtBIQAPyDeonIIny6+VJ+V/zT1BK9bDUK/bWOIZfTrE=@vger.kernel.org
X-Gm-Message-State: AFuF++kz5Vylvo9BMmZECI/BWxEFaP4vK+dzdzceET1pTtcfSKOtFrLC
	XuFmccN/XYKbQ7yrLWj988PddDDVhiZfdzu7QFeuKgEy+x2DxcdPuxr6th2asx+uqMEfUYIY7Mg
	nkwOBYnA/YfSSNG0xwEN2WtrcXz9okN1jPtI/okYr
X-Gm-Gg: AYBFou3WSHlOae8GSV0DQG78NiMuhm6pJNQYOnG6b4aL0C217D/fQXcPihYOy2zYsG0
	0rB0pT5Ijz4kouq/HvlbFEmsUT/9HRrgZAkdkFA+UYK+w4EBCn1TxR0ALZHUPN+cdw42n1L7D/r
	yz2nfbkpHBLV3uBQeXyxxdtt5sRko5ppGt7UhDehBUud2YjilyB1PHJXhi8N/NPWPbz2Evmj3kB
	Ox25+hytr4xgEpwyUGdB1KX0I0Z5khPa46XI3YmgIXm4Yw6bXCU0RsfJzF2T98KrgwYW8KRA8Yc
	OltuQYp4RiDdhzYlPIkXxednS6OVGwHjdsVDBVOicnRm5jQVDH7DzRjCymTsk76rh7dGQzWIp/V
	qoAEI/XNFETPXHFRQTw7xUZuAm9bd8Katx58nSpEzgjO+N0oIQ3E=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
