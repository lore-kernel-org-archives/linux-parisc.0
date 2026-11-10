Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304784;
	b=fx2ZnpQXjA/h1wpFPllUJslz9TD417ZYmRjriWgMwH532K2s6QNFq/t23H7rrEIM5Rt8
	 nYuiLckg/pRCw0op4xFDzWZKAcMURv2iiEX+uD6x9QsvHGjVc1gDgsvIeb1heGuMQZczN
	 3EI68M2xDAuxYqNZHZYpcBwRTBa1mlgVKq6vQ3PlnYe+X5fu+WWqTh20ztlhS4Y/BID11
	 zW+rxVIfiqSYqrBIwyGybrgkqKQ0rbNBpPS5hanKTR6mXVL+w3InWaBnY5ugSggbZ9qkK
	 Mcb83WAQPMIJTnNM62RTbOKzvfiglLEoOy/KlX5+ma0jUsovFGau0q+6uEjC7+l54kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304784;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=PkVMpwwhzaCsmGhHyvk9U788HyWphMwS+NA591hr+jbSR/kzaR2nI/bmErH1owz94PHZ
	 B56Cnkhlif5uSDlDt3UCjfvtXbEFfLXYHP1HPU+kcBn9GmfQkOqOKdWGy2Kdolm36PcAW
	 qH3gKA3vw1golF3T1euk2VO/+T1CJPgLKhacvEPmiLA0u5ZEsa1DDMmBjcbwZ5q3XBxAD
	 iqyXjtr0l2Hz33Xx+wxJ+BlukwSwlpyOx+BgSgjNx1FqE8MusCKTA2ZMPMz2nb2TKpp8v
	 m4gfgK3hREURfqi6XQEjwJVPPOo1SSjhoKMCH7rAFMcHGsXyuVOCCG3QuzZngPo91Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sPqnSeoi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313AF606A333
	for <linux-parisc@vger.kernel.org>; Tue, 10 Nov 2026 09:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313AF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sr8AcXcQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sPqnSeoi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794304782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
	b=Sr8AcXcQs/idA572AS4kHK5mkBfqbzDUhsVXooXETEkLQUhNdhAjrrhn1qTbuC+1RLV99Y
	3t9yLwAtfBq1GB52cSdNh84FMArl5mXWzx0Qsvx8gDze9t56Fu08T5o0AUqJnET7cvToqF
	KOJIb4WneTE/JXNiB/eY8Nt9kDXrIBo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-Wd5pOMdgOOWOLLDWIuvVqQ-1; Tue, 10 Nov 2026 04:59:40 -0500
X-MC-Unique: Wd5pOMdgOOWOLLDWIuvVqQ-1
X-Mimecast-MFC-AGG-ID: Wd5pOMdgOOWOLLDWIuvVqQ_1794304780
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1041710f8f.1
        for <linux-parisc@vger.kernel.org>; Tue, 10 Nov 2026 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794304780; x=1794909580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=sPqnSeoi4vhi9k/Qk8upVc9av02O7XT2MLDS0rt0xhyMHyAOJTROqdLihjJ+H2zx6n
         frm0rtCZ2oIBy/C6ZHHpV2ob4KNI+PdWmcdWFh82/mVEmIN3CPH8Q+HhXpLubBaC4oBt
         oGJ0Ur1aYmxQqQpLEJGwhdWDUj/iJ0tP6tYm0BglzC+ZKE5E3qnCOP5O6zxLAIRdmmkG
         HN75xD4GDthIjKj6G45ZFnBSqwTeabEWIumblhGmjUKx8YhN7a73AxdkDrxW2XrP/ZZ3
         fGc6IR5e8EIgEe+03M1/3pUnLm2t/25VcRxYCteAYP1w1vIESf+zMfBEeEOHgzMLAp6v
         3gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304780; x=1794909580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJOySXG09dMXLqdSSIWuOhORrXWnSA3N/YtRXqebW2s=;
        b=Swr1C/P1TqA1kcMaKtTbHFgIJY7/xXQbNRcvqNGnbkwOH4E9xlviqz8eUxf1smayKq
         GMHT+xRMPFN1XYUK1KZ4oF9wZxBAkqikkJwDv8wPOTXWSiNkf6/LQQbH3IuPQaJMQI1J
         y+z4+k+MN2N1lfCUsjFpFyqeQ6KJwqYtM4xzaBaEtcWeyBDMoQZISCu/wRoUtLnys6zG
         OsemAAuh+WSoGlSRCI6tHkMRKkjHA2LZBCNPepXsUsvjC6+pX4BbgoQsnZMAOo8LTJRX
         lnHfTrgF0A455ZbXL8XpVpVocDAY1y5jfRf19+XlNqFNs4sbzPN4cwlJfdnEblJRyJds
         z+PQ==
X-Forwarded-Encrypted: i=1; AL+hErGEdw3DSK6F+fgLT9fwm7YxESrfSG4GQNj3IuDI9qQq2H9xCFPLlupubBqPWdiyWjO58PcsyRs3LfLfbcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xvPKK/XyJOFPJvCtyYuiI5NkJl7Q6sM40cSFXejC/ZSm1MJoc
	TJk765SV7b9SUWKUxhpKE7CZU6n7alNMGd9ir5azcEO54H7VwjxUkZX7QIF4hWWfBzcJynl4bCG
	atwX+nTGYLn5vulPOVotx4ilxgBe7x13ARACOXj3C7hGxKUn33noGBMOFjYiKIQiR6Q==
X-Gm-Gg: AYBFou1FlbKfaV/TjO6RystFqL4Kks+AOaWw4LBr6XJl1NuHroXxd4Kf+v+s7be5hLM
	fGb077PAy7mjWnglamBxt0x9644ZZbSigBI3ph/cvAoQzoykuej8HM6zsiC5G6jgsJzAu3Vft/w
	gDoxEpd9UIOowqHHVzTENBhKM7QuPpPruAIm0xXV7RsChh7VjJhaSDxs3cXobDzI9h/0/LrvswS
	9gRSUc/yY4RvYVq26hgetaJzfdmOfb7AB5gD8oOEeK1by2SEExvQ1+X4Np4eCP52y7LfRKn5bwj
	ToyVGBj4X9m+xgO+N8GdSOuambpd+giABHE9VXvYp7egOvWlZjHW7e+9wkFlou4p1praBpZ6rIW
	h0FIi322mApvAOPfZoHdp7h8/FDUG9DYmOj6YTQ3BX6K5GqaQwBBnDmc1WYMcah1aAGIgZJevc5
	v09CZu/JKFer19++nZrRmI4JDiIstfVgvXsKm/lt+I5iS6
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932555e9.14.1794304779694;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
X-Received: by 2002:a05:600c:4e0d:b0:4ba:cd:f45a with SMTP id 5b1f17b1804b1-4ba0234ee12mr34932105e9.14.1794304779321;
        Tue, 10 Nov 2026 01:59:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fbf75sm44329265e9.0.2026.11.10.01.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:59:38 -0800 (PST)
Message-ID: <c3e7afde-65ac-48e2-a89b-9fc1ad42aa87@redhat.com>
Date: Tue, 10 Nov 2026 10:59:36 +0100
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
To: Andrew Halaney <andrew@amutable.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
 <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-2-0b4d75dbf35f@amutable.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 00:12, Andrew Halaney wrote:
> diff --git a/net/core/sock.c b/net/core/sock.c
> index e7405be8941f..6b443bd44581 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1586,6 +1586,13 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
>   			ret = -EOPNOTSUPP;
>   		break;
>   
> +	case SO_PASSCRED_THREAD:
> +		if (sk_is_unix(sk))
> +			sk->sk_scm_credentials_thread = valbool;
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;

AF_UNIX supports custom setsockopt since commit
de1c489b57c11fabc766aeb6777ed5b0038fa3bb

I think it would be better to move add the af unix specific ones
into net/unix/af_unix.c.

But that is IMHO more suited for a follow-up; the series LGTM,
thanks.

Paolo

