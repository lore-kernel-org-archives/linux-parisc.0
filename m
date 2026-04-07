Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E833970F;
	Tue,  7 Apr 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582438; cv=none; b=lKHwezUymgNoLkzeBtuVi0haeRCCYA0ztW1FD/CW7fUel1AqKfwdqpbD6Bs0q4GeDk2XdM7xu94d3fEHIsmyn4RwqXI27wBviuZ5xfZ7FrBSvTGLnis8EhBRsTPQ7fUngMhjsoCgeg3zj4NMJhmPc6HCTwSL9fBGpyaiPLcEZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582438; c=relaxed/simple;
	bh=awVGgKQpPeD7627Hhz5QBvJ2XJZAPIIF/IJ1zZuNzh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWERhiBuIUCtuek6/V2jH5lB3+UU+iBms5iJeTavu3IVcw0umoIVl3b9w2IlMpquI3Myj5d90hB2q6v5KD/bF3ICPmvv1VXkQOoUfvMgRhtDDg4de6uf4GSUUz/kY1nc4U9XGN4I23sS31bMtPNdQT/kG62goCI1Aei4VeKx+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=VXg9Y3u4; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="VXg9Y3u4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775582413; x=1776187213; i=deller@gmx.de;
	bh=iPSPtYBgOC5rF7rIe4pz4rF29hA21ATWoQYwB2n5ygY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VXg9Y3u4DLRUMDv9m168Sd7guGX198zuB1xPZi6Lh6gghRxoBGu/Hf3i4M1qFkgs
	 f50nURndWbd3M9MORHv1J7lZxlDVscD6BaC0YcPFq6Jz2yfXTkwT/5QKnHyAVSZ0v
	 GNol2CMbVdAa8pOfrQeZlsKx8jmJf9PhsNbEG0CQtsqzuOzBYI051NTBBJZ9g1Lkm
	 hHwwG9y7jTwMdUi8f7gaAepG7L66dnqfNv1ejaVvPzCR2eCubVfcWFOZUXYOc4B1R
	 IRsZydjM0oFIs2AMN7yDwaa8+/Q0ohN5qngCGpYSMv0QCLLccwV2Tehm5ktq64yAR
	 +puaE8bQ6S+hHpN6jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1wJTln2jlS-00BBtx; Tue, 07
 Apr 2026 19:20:13 +0200
Message-ID: <d43a2894-9f78-4fc2-b228-2c29ef6daa58@gmx.de>
Date: Tue, 7 Apr 2026 19:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] selftests/nolibc: avoid function pointer comparisons
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-2-f70b4509c44a@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260407-nolibc-hppa-v1-2-f70b4509c44a@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KdPup9+t1Azl/A/DXcWcRJcvYFj4Vhu2/ZPGAGNfL3VFgDeO4il
 RhX+ygxCWC+VdWzumvGQqDIZWLeHFO6/7h9fZ4HiAdoIKnL68jWoP1DPtHoQeD0aoJWehva
 AKLkSxHng4ViyGPeSA6GLW/2azoygeqK8b3Jpcn0P1yb5zF07EIbB1PigPY0gqGN6hdswMz
 tq5cE++DbqxUsKxHfzTrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MVZEeJv7oXY=;od97nWAHqJ9uf3VM4WEpAqMnYiW
 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
 8l

On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
> The upcoming parisc support would require libgcc to implement function
> pointer comparisons. As we try to avoid the libgcc dependency rework
> the logic to work without such comparisons.

Instead of working around at this specific code, I think it makes more sen=
se
to simply add the __canonicalize_funcptr_for_compare() symbol somewhere.
Code is in arch/parisc/kernel/real2.S:
 =20
ENTRY_CFI(__canonicalize_funcptr_for_compare)
#ifdef CONFIG_64BIT
         bve (%r2)
#else
         bv %r0(%r2)
#endif
         copy %r26,%r28
ENDPROC_CFI(__canonicalize_funcptr_for_compare)

Or am I missing something?

Btw, since you want to avoid libgcc, I think this is quite hard, since
gcc automatically adds lots of parisc specific millicode functions (see th=
e "$$" symbols
in parisc_ksyms.c) and many of the gcc helper functions (e.g. __muldi3).

So, I'm not sure if it makes sense to try to avoid libgcc....

Helge
 =20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   tools/testing/selftests/nolibc/nolibc-test.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testin=
g/selftests/nolibc/nolibc-test.c
> index d3c4facb54c0..de4e87586d75 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -647,20 +647,25 @@ int expect_str_buf_eq(size_t expr, const char *buf=
, size_t val, int llen, const
>   	return 0;
>   }
>  =20
> +enum strtox_func {
> +	strtox_func_strtol,
> +	strtox_func_strtoul,
> +};
> +
>   #define EXPECT_STRTOX(cond, func, input, base, expected, chars, expect=
ed_errno)				\
> -	do { if (!(cond)) result(llen, SKIPPED); else ret +=3D expect_strtox(l=
len, func, input, base, expected, chars, expected_errno); } while (0)
> +	do { if (!(cond)) result(llen, SKIPPED); else ret +=3D expect_strtox(l=
len, strtox_func_ ## func, input, base, expected, chars, expected_errno); =
} while (0)
>  =20
>   static __attribute__((unused))
> -int expect_strtox(int llen, void *func, const char *input, int base, in=
tmax_t expected, int expected_chars, int expected_errno)
> +int expect_strtox(int llen, enum strtox_func func, const char *input, i=
nt base, intmax_t expected, int expected_chars, int expected_errno)
>   {
>   	char *endptr;
>   	int actual_errno, actual_chars;
>   	intmax_t r;
>  =20
>   	errno =3D 0;
> -	if (func =3D=3D strtol) {
> +	if (func =3D=3D strtox_func_strtol) {
>   		r =3D strtol(input, &endptr, base);
> -	} else if (func =3D=3D strtoul) {
> +	} else if (func =3D=3D strtox_func_strtoul) {
>   		r =3D strtoul(input, &endptr, base);
>   	} else {
>   		result(llen, FAIL);
>=20

