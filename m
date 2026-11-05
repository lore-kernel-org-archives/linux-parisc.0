Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.37.111.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852255;
	b=Bm8N+ziePrcHgoePcy3w5rad57BBNJ2kGyCC6eJq5dtMY+TZihFD0kLzI6P0akHAAF5f
	 KjJHsIxCBgVTCtz8QQDtZlirLcvnY63+mBUXNm5Hpqw0LJYVxH3OEpJG9GnSHdd/vfH+7
	 cUsX2wBinDffWBWOP7qTKuKvVJSgWqX5WC8bXLvQMNdLLyjvTtC4Gm3i1fU4kAzj7uJwP
	 gGmc4zGC0bxvW/4fAX3nh1PSfV+0MFbsi2SlOgSC3kXiRZiCTHhv0SgvR/DaldW3FWWQk
	 TGWlZ6eMGbEyduzxIaTpG4ZMbm1WV6oYE++NWX2dUJeCJGKL0xE905CQuI07WGN47tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852255;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:Autocrypt:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=mOD6YSGbVam4U+8skMw5qd6Gb3h93hyyBsMSX80qt+4=;
	b=CHNx3IwjpPfBQQkhzq65PNPOUZodfiLL2YYm4bdC4CbeT/VV54M7SqH8Ezq9U/pz7BeL
	 27pFzS3eUnpOCxwj1poiRPgtlLYMqpH3c9Hhjiler+EXsq+hwDLmSpJ94OVZRpkbQW6Hh
	 eEkyaMDNNgYqMkJ1Tnx9V2KXPCQiI+bCH2fniNNt0klRhKoaM3QmLU+DdWXt17AN+W5f/
	 R94Zbm9+AF0O3h7gGDFyBEZ22G9zGve1qA7D2OfYbQJICGQCdxoDgMvNmKlZSY48td8b3
	 Vv4XEqxjYiKmmDf8XlTnQZjVBM5ibZHZ92rENs9J5ZcWLPbDSft+kdJs9hnF5YN9scQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=HansenPartnership.com;
	spf=pass smtp.mailfrom=HansenPartnership.com;
	dkim=pass header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=rAqapkph;
	arc=none smtp.remote-ip=198.37.111.173
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8828606A31B
	for <linux-parisc@vger.kernel.org>; Thu,  5 Nov 2026 04:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8828606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=rAqapkph
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1793852253;
	bh=mOD6YSGbVam4U+8skMw5qd6Gb3h93hyyBsMSX80qt+4=;
	h=Message-ID:Subject:From:To:Date:From;
	b=rAqapkphOxXDj4zPYTt7GARjh+aBrMt8PWCweun9UZopo48vPmSxJ94DVAIL6oVoc
	 yETN3sp35flGPIurXQHNFLpo6zpRls3oQMwd577Y4HOvWRjJZkTxgaD8CGWakN+WVc
	 D3qwYCI9H/6RmlKX/zHhP08hZhL+GSBUWp3NBpRA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8309])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 5F8CC1C00DB;
	Wed, 04 Nov 2026 23:17:33 -0500 (EST)
Message-ID: <e771fca03d92444b3bffc717db8e884948ee3a5d.camel@HansenPartnership.com>
Subject: Re: [STATIC AUDIT] 8 Unguarded Execution Path(s) in
 `arch/parisc/kernel/firmware.c` (linux-master 7.4rc)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: security@ulshe.ai
Cc: Parisc List <linux-parisc@vger.kernel.org>
Date: Wed, 04 Nov 2026 23:17:32 -0500
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 22:37 +0000, John Edward Reagan III (Ulshe AI
Security) wrote:
> Hello Maintainer(s) of `arch/parisc/kernel/firmware.c`:
>=20
> I am John Reagan. This report is being provided to you under
> responsible reporting practices. It is in no way a critique on your
> coding skills. You should see the reports on my code, it had more
> issues than anyone's! Using the tools I built, I've been able to
> remediate those down to 0 in my own codebase, and I wanted you to
> have the same opportunity and feeling of knowing you closed potential
> holes.
>=20
> My goal is not money or fame, but to help us all to have better, more
> secure software and systems where people don't have to worry about
> their privacy. I thank you for taking the time to review the items in
> this report. If you find issues with the reporting or false
> positives, please let me know directly at joreag@ulshe.ai=C2=A0so I can
> make adjustments to hone in on the most likely zero-days.

In the new AI world, I really have no interest in any unverified
reports ... even in the old world we basically ignored the coverity
stuff because it was full of false positives.

If you want to contribute you need to join the new AI wave and get a
prover to show the issues you've found are actually real
vulnerabilities and then code up fixes which you can send via the
ordinary patch submission route because we think that anything AI finds
is ipso facto already disclosed because any old AI will find it.

I've cc'd the parisc list which is where you should send the proven
fixes you find.

Regards,

James


