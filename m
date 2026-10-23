Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792228;
	b=TGQ6nmiyp9ZiEgSV94dN5EcSkEqrn4FkOTl8AhHY288qi4+Az/YT5j4nAfvcTYmITHrr
	 2rGQeUsWJyhFlrkf9CXJ5MzzebnclOZLCBna/tbtqaMppIORMFPg7G6Mhp4L3yT03sFb4
	 YHI91zH7QS4q6i1R1h6gaVn7nZceQf7pctuxZKI5vD1fMgPqDSny8Ao5c0PBzuYDa7uhx
	 +PxNwVdSO+2soLrFm++UUkJhU2SArGu92yhJh6Ve46ivKrjzpPem5uqWcASlknXcjTVwH
	 raiF796lRa/xfJc6u59SdVhaBeNMYjhIzDhC2rJQApksovTPhDhxU6eUAszs3OD7o8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792228;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mpde1rLGMQgUzb8zFhH/P24RpIoetpMZZyCwdEOlscQ=;
	b=eg7QNwhQDrnGhT9vJtPy0NthKRZI3GVdsbaYV8QzuoaH5sEcIoqRsJER3bn9816V6ht8
	 zi4PXlFx0d0EC6MS00N2PDGWUBO+r4R9F9a/vmu9RiZRFziELF4xIDJKhG92xhnANN4Vm
	 mIN9qHJ/92+Ar8rkMhoxdfA3eQCZvJHoWIckeBGpX6Cekt6Keeg5/2dvvRMCFwGY66Yj5
	 GGJLokEgbLDK76qjMX7fDWIal0bDrZhRclAIm9eBvQn9OGNhtD7ZDzJBh4c5qRUYsP5zB
	 8z5CUnn7aLvaX7WqlUye/NObfhTYRTYFnHKvpsnhvwFZ+FR56jlW+Ml5n3ABDO3+Naw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=U0zsK8S0;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KQn+krQg;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA952606A31B
	for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2026 21:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA952606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=U0zsK8S0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KQn+krQg
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 00C7E7A016A
	for <linux-parisc@vger.kernel.org>; Fri, 23 Oct 2026 17:50:26 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 23 Oct 2026 17:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792792218;
	 x=1792878618; bh=mpde1rLGMQgUzb8zFhH/P24RpIoetpMZZyCwdEOlscQ=; b=
	U0zsK8S04F28rT912kmU05r6OgQ+auw3PW43w+9a3y9/oPTc2B80Lwz+CHC+3rKo
	7oQ1YKFm50N4PiFVYTRectDLFpzx+SHpAjKq0tFXUt38xF2vstN73PFOR4oS2eTu
	OMD8hP8iWdSMe5mPozdJTj9dNhRG4FaYMEVYy4IxMgdjX37UwyvcjKr0KiN2gF6h
	uBsWk9JxkicWOwP+SyDb88qcoyeqFUdW8QWzmvSEY0cdXaZIPSZXcgLAnsg7SRU9
	1imYmvpZOm/a6lUHLBxAZJSExKzcQaZnqcbz301ioJtJVoq6fzs7MjkTsGzhMJNm
	US+Ou64sxkRjfaa3XcHHgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792792218; x=
	1792878618; bh=mpde1rLGMQgUzb8zFhH/P24RpIoetpMZZyCwdEOlscQ=; b=K
	Qn+krQgYv2sb58FxHlAvbu8fZKF6ZOc4LRvWbIxihjeMGGR5X1qLuaZuyBM6+v9T
	HoECfqBmWyvMpQpCDPfl5eezFTI7vFzO2nWofiGwfw6s8Jw5vdUNEoSC08/mwwAH
	0elvOX509tTqtEDEevc4fuvpHOCYY0qidBC1RMI5hqecbK7kq+MB0sPHLB+8alQ+
	U68IQSEQEdN04Zl6L/dxC0/L8kj/dLUPdbzPsyE+9p3bGE2cZ1m+TGM4s7nQiJnR
	wp3HmHfTk77ufhjBwIUCBbHK4ucz2ZV5pRJe2XMXQ9S1T8nAW7Q+KBd/Dv70+5C0
	JQdj0qiyTm6SOFT8tIFIw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792792218; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:bvHgGMYAmqr+mbF6EIpnC6AinvlLhsZQ1O6W8f1FDcwojx4
	Q574ZBOwixkQUxcx69naG7Tq8+4iuKMh1zXomlB6QnIw1aktMZMVciL2Jq2mTtg1
	M9EJJgYwW++7/bq9OIkVtjxoZ8xWtQ1RHWmUdReE7smIqLJXRZQjFt60HxzIOlug
	8COwU2Rroo61Nz1VaYCMZxQPPRq6Kj0d0cBcSTm80HAM0hB6Dv78smiSfVjd7ODC
	9iZ0i2BeUrfc63U0J8baSWXOia9VPx154P6c01RndL+9TgkABuyGSi9l6v4EZbB1
	FzWoKo0RXw5OvzdqrtxZEdLBoR6EATAQhrmwetw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/cFY846JUqjBxd4KMKHCSs9S/vdupyhytYGPQmLb9LE=:QPEQeJrcPCUDsbf9lPV72AtJMMWdmXHie20cC1fZvGs=;
X-ME-Sender: <xms:k9bbatU9APt0MmQrK7TDQX0FFhLepF92puhThJMduPOyQ7MTWN_d1w>
    <xme:k9bbaoaFkqi3Pj5MhYl5Mu_a2JpukArbkBj9Tmis4PSTt-jM19h0I5zXJ4n5Prfhi
    nwswaOF7v3v95pOIIRhUclBJ8egBheMr2-Is6EzKdkr0M8I0qm-AsRr>
X-ME-Proxy-Cause: dmFkZTEHVbsrgboS49v09xOKnMFiikLWULW0om/Ar9NDCFfwKosX7hRyFGGqcM0Wute1aR
    xrTrHKRXk8rv6YBzLDTWus9KuI4u+byGSZlrYYPwL9sF//nfP7T7PKgS8D1S2gh0zUQbgw
    5Ea4DfuMYZX+FTbThIwHoKRs1DwDiGaHzPaYlt5RXa5wmLbOOJVe+fwFqc/1zSbjnDLCRq
    JYFazHKnEcWppGnkv/hdHcgJWPC9vLzWAbZ0cZv7IZAUqXc5sKx3mKiOoKSFT9/E5Ahtyc
    Yk3lUtKj++RppUI/7u6AFQn26tuReznL+QWBKzeKWpbXUdfZuGMXrol9bZ4vJbATHVU1eG
    cALQLamx+FDFbnH9lSKgcH1tiXcuZl37LzqLGJ9WYtaLGPOo/JHFoEuH0WLEIqdnjrP0Q3
    IsT3aGvcbeiwSftqGh91rz0+k++jteIJd9iCrSpIGmMJawqZ8D+Ejtjm/mk6/MLvpvLhbf
    /NukTq0cJs/JOc8aKEgKu7+sJFqVL0uY8u12D+NBB9xKmtnyUELTZF4ckvfD3XczmrqjBt
    +dSroaQONyFT983+WQuXHpVZJfN31F3k7pgqjbEjuBSouLJwshYPcmgXupGyj5uFzWKKkE
    JOZoZZfKubTepi9CIqN3ykBuJtx/JGAKeflxq/LmiTm8+YcQ0q2hDs1hwtPg
X-ME-Proxy: <xmx:ltbbavYD_Du2rRBdWc7ReSlVolzaidT41ZPWfH2xufK1Kb0GmO6gFw>
    <xmx:ltbbanz_CsK91E2bZbwV04_KbCwb-qgvRJKSgKitsKUrePFOwrxvyg>
    <xmx:ltbbaqdth16pt5N3xdzJ3IFgfVLRuIGkE7YcygfrGjhE9O89rXKxSw>
    <xmx:ltbbalI4WhDPkHXLUco5bxGIpXIqfBc6u1K2N8HvUW0XGbuF6uFF9A>
    <xmx:mtbbajhmB05vH0k8xFBsgM0v4VA14NW58rln43dEPX3lT_YexjaGjeL9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 60BEA32A0093; Fri, 23 Oct 2026 17:50:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ax4Cw9gIx-EN
Date: Fri, 23 Oct 2026 23:49:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>,
 "Ian Rogers" <irogers@google.com>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Christophe Leroy" <chleroy@kernel.org>, "Helge Deller" <deller@gmx.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Eric Biggers" <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
Message-Id: <9ad54286-4337-4022-8657-65e1ed86b6df@app.fastmail.com>
In-Reply-To: <20261020190718.6cba898b@pumpkin>
References: <20261020163210.742728-1-irogers@google.com>
 <20261020190718.6cba898b@pumpkin>
Subject: Re: [PATCH v2 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2026, at 20:07, David Laight wrote:
> On Tue, 20 Oct 2026 09:32:09 -0700 Ian Rogers <irogers@google.com> wrote:

>>  
>>  #include <linux/compiler_types.h>
>>  
>> +#ifdef CONFIG_VDSO_UNALIGNED_PACKED
>> +
>> +#define __get_unaligned_t(type, ptr) ({							\
>> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
>> +	__get_pptr->x;									\
>> +})
>> +
>> +#define __put_unaligned_t(type, val, ptr) do {						\
>> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
>> +	__put_pptr->x = (val);								\
>> +} while (0)
>
> I'm confused (easily done).
> That code relies on strict alignment being disabled regardless of whether
> misaligned accesses fault or not.
>
> So it is either always valid or always wrong.
>
> Additionally I think the compiler can sometimes track the alignment through
> casts (although it didn't for a quick check I did earlier).

This is the traditional way we have been doing the unaligned access
in the kernel before the change. By annotating the structure as
__packed, we tell the compiler that it cannot rely on alignment here,
so it uses whatever method it knows to access unaligned data depending
on the architecture and flags.

The reason we need the struct here is that you cannot use __packed
as a qualifier on a variable, only on a type or struct member.

> Since having misaligned non-packed structures really doesn't work, the only
> places these functions should be used is on u8[] buffers.
> Pointers into those can (probably) be cast to packed structure types
> without causing issues if strict aliasing is enabled.

strict aliasing is thankfully never enabled in the kernel.

The cast is from a higher alignment to byte alignment, and that
is always allowed unlike the reverse. Technically the only
reason we ever need the get_unaligned() helpers is to work
around pointers to objects that should exist because the
ABI requires them to be aligned but the pointer instead
came out of some byte stream or from taking a (non-__packed)
pointer of a __packed struct member.

     Arnd
