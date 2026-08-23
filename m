Received: from mail.sf-mail.de (mail.sf-mail.de [116.202.16.50])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D56A633BBCF
	for <linux-parisc@vger.kernel.org>; Sun, 23 Aug 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.16.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787513198; cv=none; b=q0ouWDfxY7oAf8/Gxm800Sl4Zb+oYibwudvvRadcGp+KTLpoIN392eFtD2EhIdXEjZQqrr2L5kNwtht6eU2j7yqu/iWUvGPFbdUN7kOize35E3B+tVVd0jfHcO/8fQlSfmNO54Zv9jQ17Nb9khPim7mOILOGlMKm0uuyw2Sopi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787513198; c=relaxed/simple;
	bh=fMRw3CQJ9l52xhDE5RHO408Q39jKXKPaOUv0E+x8Sxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxc3AmbbEhahWrdCIxCqogU9UHxoLEzBTQR6H3pWCOSwoDHQ5Mg5HxmfIOtlrbpWADl2FhRaqpsZbCQthkVGf11boOZK0BMnZLHiIy0lXbSFEj3xl4UFhJnuTVGXrsd4Gmrsos05svNqt1CHwRAiKNz4XtvYSS1DQtypfHjx0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de; spf=pass smtp.mailfrom=sf-tec.de; arc=none smtp.client-ip=116.202.16.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sf-tec.de
Received: (qmail 158803 invoked from network); 23 Aug 2026 19:19:57 -0000
Received: from unknown ([2001:9e8:6dec:6400:1c7a:74ff:feab:3a03]:47792 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.39dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
	for <linux@weissschuh.net>; Sun, 23 Aug 2026 21:19:57 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Date: Sun, 23 Aug 2026 21:19:53 +0200
Message-ID: <3058613.47OiXYuuEM@eto.sf-tec.de>
In-Reply-To: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
References: <20260820-nolibc-parisc64-v1-1-067ebe7c8efb@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3414319.b51fjYFSSB";
 micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart3414319.b51fjYFSSB
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Subject: Re: [PATCH] tools/nolibc: add 64-bit parisc support
Date: Sun, 23 Aug 2026 21:19:53 +0200
Message-ID: <3058613.47OiXYuuEM@eto.sf-tec.de>
MIME-Version: 1.0

> +#ifdef __LP64__
> +/*
> + * This override is normally only meant for 32-bit architectures.
> + * Put parisc 64-bit has __NR_ftruncate64, so this path is taken.

"But"?

Greetings,

Eike
--nextPart3414319.b51fjYFSSB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCaotH2QAKCRBcpIk+abn8
TqHbAJ46R3nN0MLXkScXx6/ZoDM3wcA1NgCdEDQ6WKZnJnBZs7BqP856QD3TduM=
=Ut5K
-----END PGP SIGNATURE-----

--nextPart3414319.b51fjYFSSB--



