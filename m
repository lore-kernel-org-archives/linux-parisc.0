Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE9397323
	for <linux-parisc@vger.kernel.org>; Sun, 27 Sep 2026 02:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790476104; cv=none; b=u1lU+/1K9zn2Gx8bhbu4aQSJNjdmIoMfG/c1HthL3NbaySpDiT6+qXF3RNk12pz++0fJhryH1MCYNcjeE7MOCGTM2HsrH/Xpte86oYYYk5Qb54qToDhQLK2BnP8Pbj1aa4FNN6vviM3/MwYZp/UrDg5MXVwWNtQAdvvAhR7D1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790476104; c=relaxed/simple;
	bh=f/VKGA1rNtZOq+tHdf0hD0ZklebEoj1ymBfPRbWedxU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FjP5QXJtiyKvm9+yRcxwEVG2W2l6Icx2fc0v4IxGBhgBCA6xXibUVZmR1I02I7Ktv1yzjIOQrEirqWEEybsF3YZLjacRkbHgutjbzGF4z5ATm0wCpnSs0QRRKL2P+RaDCn7W/M9VKGAW+ilm9hHNwOYKIxV1StbfxPo4GSOtD7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 867F4341EC9
	for <linux-parisc@vger.kernel.org>; Sun, 27 Sep 2026 02:28:17 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linux-parisc@vger.kernel.org
Subject: Re: Clock issues
In-Reply-To: <87pkxz79g6.fsf@gentoo.org>
Organization: Gentoo
References: <87pkxz79g6.fsf@gentoo.org>
User-Agent: mu4e 1.14.3; emacs 32.0.50
Date: Sun, 27 Sep 2026 03:27:45 +0100
Message-ID: <875wzr77j2.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Sam James <sam@gentoo.org> writes:

> Hello,
>
> For some time now, maybe since around linux-6.18 or 6.19, I've had clock
> issues on my C8000:

I found an old patch at
https://lore.kernel.org/linux-parisc/ZpoWGfQMJY19fOyR@p100/ but it
doesn't apply cleanly anymore. Is it still relevant and worth trying?

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmq4fyEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkCOa
AQDWLal1iPu/2JfzykSbjVQRd4v+dhzsNYhIXjnbY9aw9QEA+WfabP6dWY5X6AQ3
hmaYmV+ovLFC8c6eo1/luTN+jgM=
=Y3ov
-----END PGP SIGNATURE-----
--=-=-=--
