Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFC4F4043
	for <linux-parisc@vger.kernel.org>; Tue, 29 Sep 2026 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691128; cv=none; b=AR9BZd3xRIhj02Hi1yYcUNK2xezqG6CEc6H8zdqwUZDHrR64PJc88qzyynpD+kqWqPcm2ra4hvxsa1WzcXYrVwQtRK7qQcUQH21Bl8ErB7HhuDMCznXPYAzS7PLU3gIeWZpWjsKixczVu1CqvdZBGwZ1rssWFcd4Qrsv9rw204M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691128; c=relaxed/simple;
	bh=GeatX/mSgt8EYGKrJweaQ6M1vHW/l+J78fDDVRnanZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PpKRf0UlNUym+NkzaE4BKrhkaKWcM+yHhB4eyZ3X15BITqkmfu8u+4fC6lpJ7AscdM0fxYv8I6EG6+kj6LmjM+I9GcHfz+451Bh6mIxQTP6uNw8IPkzXXTA7fKYPyBEQe5XGoZNsxV36BE0Kx/txz+ilVSyIkVJAK60/DVPBRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1EYkwrL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YkfMBEbQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1EYkwrL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YkfMBEbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790691126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
	b=H1EYkwrLh1K64D1ORfCA+jn3QucTk/WRIWynoqwC0W711bpfz95k6C0M0cfd9Iu3qJ1ZuZ
	31z0xwo6bOqTx9Xm4Xl+QufXA24QOqyNRf4DF6EB0w86aQ4CFW+fMROHVygN0BKwrr5u9b
	PJWAgv1073MLfCkBv2ECHlpYUfUlG+4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-N-2bVjM4NfSLMfJ5CWe5Ig-1; Tue, 29 Sep 2026 10:12:05 -0400
X-MC-Unique: N-2bVjM4NfSLMfJ5CWe5Ig-1
X-Mimecast-MFC-AGG-ID: N-2bVjM4NfSLMfJ5CWe5Ig_1790691124
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso46150775e9.0
        for <linux-parisc@vger.kernel.org>; Tue, 29 Sep 2026 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790691124; x=1791295924; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
        b=YkfMBEbQrf6BdVVZ4feI8A8i1jiQcRaDPObyAwKTaohvmnqhJuEGI4l5b6hCIc8kI0
         fSZwUG9pt6ZWozcGsMRzp3miSNlImyiNI+Hr90r2i5+OhZStUw2ZDyw3RFbsjAGknsFn
         08YpOn6FkgE/SVxDbnfMHCNJpvK13LBq0mGx3jK1ZJ8Nm4QeVw4nEa/1QEaIcrfz82kq
         ayPmfulXTMcCEyeLVTx5FY4ubhrIxFFFpivchcIlWf4pAc5dODTppJUq8Kl+THtUNjBb
         hFyLei3EekM/SiWPqZO/SS/eJD3T71TOA7Q2m4fMKY0DezU6XBzImdwOdCDfwaiQUJHJ
         VXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691124; x=1791295924;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
        b=BSaD/RkMyK7LTrWbGJ1ImyTxSm7laxsZKyDakppt8DemBnBqueO2/24zmUJ2F8MhtJ
         oYb1dNoap2NOmgRrQY4EGGB0HavQLAp6Awoq3TFOIEZMB/puPbC4sUkcLUB2D7bHBadv
         6dRt0sALjfOm3U4ufVol2viHzhP4qb6cPfWzYc6sbYNB19NBqA0uwqiSDtsHh0pqJA9b
         z4IWNP+y/vuRSm5tfN7wHy/usXZWuWc+zBv4qDxm/VWsJIfk5urH8DEBgmj4hZNwtIab
         FWy4YS+4Dy1PqgSuwH3u0v58qm7TohSUwMCY7G9l9RO/c++Qr1CrMHuSZ2PGiRpM3S7+
         gTqg==
X-Forwarded-Encrypted: i=1; AKwUvByV0VJZtwTG7F36Y+jB1eklu1BPXM++srV+j/D4JFyBRnTr/mPJsDam3Ld+o4BdK5O9x288VWq2+3WYisY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxehPRJtMXQos/4QnVcmvydPKFYv4ocJjCS+vcePAO3QY/6k0h
	06FGKwDqVDaIfBghatt+z9UjMx5IL100Df2CyrjsiAOZ9jK4RAKJUAU739S7A1pcOpDoEnJgHdB
	v9DPMu4gm4MGs8G+vOT26WrsvKkY8ef1ZphRg24xgcUMcMhBN81JNpVHGsNZFt1I5M4xSb2NJuO
	zco5K2lhvTCmXWjhQKJedXoenjwVW7vVbF7BR0wMrG39540Ecy6oI=
X-Gm-Gg: AYBFou3nO5AdIoM1/Vuzyacljjwef5ovqn8P/jOLBVekevy7hymorAJ1OG1KjtdXdao
	jHU/tejbU23AlYmpwbFXaEBsRUYOTNx4F9Nzn19eYabDZF2GeMB7ENo7u0gQnX0/9drhfjxANM5
	lwK5pnMscPn2J8HuOMhqPsBeESncLvaSMnVed24qC7AqVl8mWisO3MLE1Q8vAHnr9pA+NzZpaU3
	JHvXXpgbfi9LEgQaOJ8GFcEidplXxL0LXG5FjiLT1ULsNtvP20LZKpiVEz8OuZh7Me/hldmLmk9
	TRlMCwMWu3iRUYOY3of6FXxMY4atEgCZkWUCjjlFRt8UL8t7jiSRuKOx/1Eurp9WUy50RlGdhNi
	ArKqWPlwTH99EPt0vvj+nmTDkl4j7/h0=
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578915e9.16.1790691123840;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578175e9.16.1790691123350;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c64fecsm6760665e9.0.2026.09.29.07.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:12:01 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  kernel@xen0n.name,  chenhuacai@kernel.org,  tsbogend@alpha.franken.de,
  deller@gmx.de,  razor@blackwall.org,  idosch@nvidia.com,
  ardb@kernel.org,  tim.bird@sony.com,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: drop unused LLC-related includes
In-Reply-To: <20260928190800.2521749-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Mon, 28 Sep 2026 12:08:00 -0700")
References: <20260928190800.2521749-1-kuba@kernel.org>
	<20260928190800.2521749-4-kuba@kernel.org>
Date: Tue, 29 Sep 2026 10:11:53 -0400
Message-ID: <f7tpkxw405y.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> The bridge and the openvswitch code include <net/llc.h>,
> <net/llc_pdu.h> and <linux/llc.h> without using anything out of them.
> parse_ethertype() is the one exception: it wants LLC_SAP_SNAP, which
> comes from the uAPI header <linux/llc.h> pulls in, so flow.c keeps
> that one. The LLC core has leftovers of its own - slab, string,
> interrupt and net_namespace - which it has not used in a long time.
>
> None of this is new, the type 2 removal has just shrunk the LLC
> headers enough to make it easy to see.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

The openvswitch changes look fine to me.  I guess it's just a minimal
header adjustment so:

Acked-by: Aaron Conole <aconole@redhat.com>

NOTE: I didn't review anything else in the series.

