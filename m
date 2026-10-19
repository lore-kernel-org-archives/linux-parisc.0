Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427291;
	b=nFy3JY6hvxj2ws1AoXK2dhgNomvycoj2a+btj7r76WJEMMenysF6KRxi9lQGlyrFj65g
	 S3OYeD0crDP9pb91Mg/mLRyTJhqXm5WEPcEiV95ttqhrQwhElKYoImHWcLLZDDBeH9F2H
	 xOF41YiQ0sv8BIBRVxNoacjFH5K4+rslDiK+UKDCpVhZTKK3xIUvl03gEh7K46HDxhUMY
	 QDQRtwK6NVcLa09JrPUtwLNewtNyZ/nDwt3oxQ+ppzwsxA8xxg+VR0foxb5so1QRxQ+Ip
	 4GiY3RVVqU4BNSrSjYpspOc/21K9PyilN8fXKv+8BWL4BsWOk0ObjfEJqjRAp7+CgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427291;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=OYAxXAHChzwq19ITazfAmMFxiBIOg+xvz2L0B67usYo=;
	b=23GefTvvL8hOt8vmY0jU6v98L4jwMNBq8nw7+s5Wnu+uFvwBIZITiNofpryX79oZMp7D
	 4BA4F9pxblEH5NPobwCTRGMhvBjSa4RswpqFBD0shrfBX9VTb/3bU6uXdjgnL8pngxWLB
	 cGkGvaCD8tIm2pice6khVeFUgzC0+5bmoUpxA7yeYVWdBBYHB2BKZ4rfXfWvrC4vtkia+
	 YXQSmPrHfR0nKoLVbyKJCpJ44EpBboSE/H+w8XSwmUwl1u/yhP5dgyvjnBum7kP5sHZUM
	 O+Mv/b1L0fipKlqWoYDoBtwEqqmrv1FuI9+SI9UkSDSmgbVUhIN6P1JlBlO1yl//4mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kZPyCDII;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DITrwfJV;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE7606AAEA
	for <linux-parisc@vger.kernel.org>; Mon, 19 Oct 2026 16:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AE7606AAEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kZPyCDII;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DITrwfJV
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DF0ED7A00F9
	for <linux-parisc@vger.kernel.org>; Mon, 19 Oct 2026 12:28:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 12:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792427281;
	 x=1792513681; bh=OYAxXAHChzwq19ITazfAmMFxiBIOg+xvz2L0B67usYo=; b=
	kZPyCDIIdECQML6lFbFipcRH8teV1la78Y/HkjyvFsR0rsg/u7YB1UbKvM4DxWU3
	0XJ9UzVhHE9X68/v8ncGhBBX3LPz1bFC3FvzszZeHkDYW+sh6d2Taa6ZtcHS5Qtp
	FabXHQkjZBKcTpbTn8ul2QkC5Otk5hnIh9XKH1RRAf5DLdk3wd96JqDEPMg9+s6V
	X7iOL00uDt41oEwVYFQJkQVREIJFHMJh74vje/W5wGyfjNrUrSUlvTdN0WyHB1qg
	H7AIp2Po2XvtH7nDl1OK1uHiDYpq6WFdWgcWQDrBRkQ6jvlOTvvIZJFu72kVQbIc
	WBnRuogKGkZ0uCttX5d1xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792427281; x=
	1792513681; bh=OYAxXAHChzwq19ITazfAmMFxiBIOg+xvz2L0B67usYo=; b=D
	ITrwfJVlUayYXzz+Oao+xKiHZsWAWPldpAZd96qV+83WKt0eAJyrBPUMvQNxZfBt
	uaTD5k6sCjTMWAs8OdTcQXoWnja4gAMc8h5Q8tsGpFpR8k5sC4BEQmB98ZSiyjXR
	h3tAcheHyb6gp+F4wyJsudXknilGw/OnabZfAi2m2TAA2YH1fzQrYOjxUk3MOLtW
	CZUCf268LPCk80VGDVbPDVbBQENNjXW1MUmtSTUTyA0OOpzGLVTxO30lvsQFfGAn
	VIamW8wB8lcAcSvlkecIGV9Pg7+rWTVXECgGQltqOtmYQEmdvAi5mM5blSIaAbQI
	w6IHp+pjhomm7ybgK+6AQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792427281; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Anu5NlJ2aEemf5bj6GD8VM9HttxMLogUwwMzdXRYv8UU07y
	pTqbF44OGL0iV35HH0XIKgkCLG0BY3X2M3sMJnP19hy3vQWPoE9ygBXfH45+mPCa
	3HJVcs49GXCkX8viHxHA9V2byPDEmsmvKjeJm6JbQ7ob7OktH51uHjDmfp7cVzI/
	Q+fSlwr06pzPS9YrCCFK2bLQIvDKd/rgT2g9TQ9wCZG4KTo6hJEjGha4h7+lDrqx
	zx+FuinZjkSkEEhxswcetCBFOjOjQi6NP8IA6X06Hv+yPWXXMSDLlF6rSQukksri
	Mnsr0Z3qBYXMYvz/yOKD8a48YtLG6tSkuaePXVA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:34GFDjvLArtfnWADUoaPQgZloLxHcy5Bflv6ev+9YW0=:ERfMJBiyhEUww2VEyu1sCCuWFpBa50FfIjjt/TQZjoA=;
X-ME-Sender: <xms:C0XWapxCjJR7-qkt0O5ia1U_OBEc9uHr5YYgbxGkuDLkdZNPC80gJw>
    <xme:C0XWakFY786LCZdas_dMnEw79LVu9RMLit0Ui09_LLvDXijeXi_nu8WvtcwGROK6B
    B6HVECruX8XkyKjCuQWGX3Lu0-eCKrV0JtsM9L0vFfuHrB1JAtg1rU>
X-ME-Proxy-Cause: dmFkZTEkXql2T2q+abWKOc0+2Ts0d7b576TXuycA4uElhpzutlWZFZdLpqSCxKDDHxNEqG
    V6G7D9WClWGaRl3eMdeQxvIkI2giK1eRSKBN3VBeWjey27rjNtXdOCJMj8mr6Wxllm+Mnt
    21e0tn3osIl8zISpbWHjLTPhM9Me0IRspLYeSU1bSafjUPCLAlAXJ7jjqf3yT00pG9ocBO
    WX9Y7mnaiYUwJ2ZwxBkqzdpXC/vJROPJffutNBlu0u0kuif2kOdUcXJdkwSDI2ao4jDXZL
    GE0Vs8X9yRfoXB91I9n4TEdZwD3IqM4Fy9do6bbog9n1fYzUIhj+83iKvdLS/dgqmbmil2
    ATbjs3l4OWpL4I72rhRbR5uEm2jXedWSIjV45SpIj9fZNcftB7fjdkyp+9Uwu2RGBi+q18
    +oeflP7Q5Q8A9Qv9/5EiZMsqM7AwPzMYVXSGJuIw0/279bYRjGSjHG7pY2I295agU8RTeS
    JtZKWSDT6nQiB0FOQ5DD75OscbI+qLlsCKpKFWuvf/RfKtswQNZjxYc0qQvEpAv/kMVM7x
    iwxSGSYXnYr+6umdFTiNNwzpHk5dDdv9cqyo2eK3MMof9Llfpx65Pivi3UB9cjZwYaO4qf
    Yi8ZelW/zfwXWLIeU4rNcP1CznyvATTAyvrQxUZ4JPAWoMLQmdEtLzBfdGFw
X-ME-Proxy: <xmx:DUXWapqJOlsYMK7afX0ZIiZ7xiFVCq44axjWsavH9ptT1bA66RcXGA>
    <xmx:DUXWajPCFiymPvztQ8qtcmdbCw19D9eqEfFsR39oUg0cVX7gu4vUuQ>
    <xmx:DUXWal2M2ZOXOLknpXeCIrvrVKXaTsTg6SfajUWP5HUC2RvRGkwAKA>
    <xmx:DUXWahqxKyeM58KvWhnAjXkEX6WlF-uP_iEiIATRgWajkPWWm8IQBQ>
    <xmx:EUXWaqYkffSOKslEfP3flvdK3zyCWS33I9Rbm6XyrhQ9ZdsTMPusgady>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 199E532A0098; Mon, 19 Oct 2026 12:27:55 -0400 (EDT)
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
X-ThreadId: AICZ2hJ9SF6o
Date: Mon, 19 Oct 2026 18:27:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>
Cc: "Thomas Gleixner" <tglx@linutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
In-Reply-To: 
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026, at 17:10, Ian Rogers wrote:
> On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengutr=
onix.de> wrote:
>> On 10.10.2026 08:04:42, Ian Rogers wrote:
>
> It is a little more manual than automagic :-) When perf builds there
> is a script that complains if the tools' version of files is
> out-of-sync with the kernel's:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/tools/perf/check-headers.sh#n28
> It doesn't break the perf build, it just adds noise to it.

I see that the include/linux/unaligned.h and tools/include/linux/unalign=
ed.h
headers have not been in sync for a long time, so maybe it's just not
a big deal there.

> My understanding, biased by my opinions, is that the preferred option
> is to add a config variable controlling whether to use memcpy or a
> packed struct. My preference, to avoid undefined behavior, is to
> default to memcpy but set it to use packed structs for ARMv5. I will
> vibe code this up, and apologize in advance for any offense such a
> patch series may cause (ie I'm sure someone on LKML will want to
> complain at me for using memcpy at all and give me a lecture about
> strict aliasing being nonsense, etc.). Arnd or someone else may have a
> different preferred solution, to which I'm more than happy to defer.

As I wrote, we need the packed struct version at least on mips32,
mips64, openrisc, riscv32, riscv64, sh4, sparc32, and sparc64 to avoid
the external library calls the same as on armv5, but I would prefer
to just always use that in the kernel. My guess is that this list
is actually the same as the architectures that lack unaligned word
access instructions in hardware, and armv5 is certainly not
a special case.

For 7.4 (and stable kernels) reverting the in-kernel header seems
best to me, and then we can think about what to use for the tools.

Looking at the uses of get_unaligned() in the tools directory,
I notice that at least some of them should just not exist, e.g.
struct debug_entry in tools/perf/util/jitdump.h is just
needs a __packed attribute to correctly describe what it does,
and tools/testing/cxl/test/mem.c does not need the unaligned
helpers at all because the structs are all packed already.

I'm also a bit suspicious of the usage in=20
tools/testing/selftests/bpf/test_kmods/bpf_testmod.c, which
looks like it may run into a corner case:

__bpf_kfunc int bpf_kfunc_test_uninit_alias(int *out__uninit, const int =
*in)
{
        int value =3D get_unaligned(in);
        put_unaligned(42, out__uninit);
        return value;
}

The current version of get_unaligned() turns into __builtin_memcpy(),
and the function prototype defines both arguments as pointers
to naturally aligned objects. Do you see anything that would
stop the compiler from replacing the __builtin_memcpy() with
 an invalid pointer dereference? This bit is probably fine
because of the way gcc handles __builtin_memcpy() optimization,
but I'm not sure if that's an implementation detail or required
by the C standard, especially if strict aliasing rules say
that the int* argument cannot overlap a misaligned int*.

       Arnd
