Received: from mail.sf-mail.de (mail.sf-mail.de [116.202.16.50])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E975A37BE70
	for <linux-parisc@vger.kernel.org>; Sun, 23 Aug 2026 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.16.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787513177; cv=none; b=toD5itN85P0hkr04OciyYpA9anbpCWXPnZ6DhunGcWhc9zsnepJ3+S5iGM5ZSWRh7GEkW0LdevRAV3XgmSpM0kYAg27WjJf7JawYiawK3WpO4p1u3V3o1L3os0h031zWwWE3J/58YU7hOSS63m69RmURSxCE17GBb6Mx2ZXD9Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787513177; c=relaxed/simple;
	bh=iSXgNK29f6Qd/XOrAsiFDPTPBmFy66RC8U0m8EGO++I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xtlq1DTAbCjYiryURPFQ6u53qpQ/me/hrtRcVjt+Slpy3L0+K2VJUr/FaYir9AABzwOSsqMElbKEc0jkmcgRGox0REdrFf3oFchGLLnlZPlTUEbg1OlUDDBEfkncL+SamMy1niUrqKdFm3doTXTETZkt1N0cvHYtLvm+ZfltYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de; spf=pass smtp.mailfrom=sf-tec.de; arc=none smtp.client-ip=116.202.16.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sf-tec.de
Received: (qmail 159433 invoked from network); 23 Aug 2026 19:26:15 -0000
Received: from unknown ([2001:9e8:6dec:6400:1c7a:74ff:feab:3a03]:37034 HELO eto.sf-tec.de) (auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.39dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
	for <jeandelu@tutamail.com>; Sun, 23 Aug 2026 21:26:15 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: jeandelu@tutamail.com
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Parisc <linux-parisc@vger.kernel.org>, Helge Deller <deller@gmx.de>
Subject:
 Re: [PATCH] parisc: eisa_enumerator: Fix out-of-bounds reads of the EEPROM
 buffer
Date: Sun, 23 Aug 2026 21:26:08 +0200
Message-ID: <2531343.FHFDcahYGt@eto.sf-tec.de>
In-Reply-To: <OzWfYcD--F-9@tutamail.com>
References: <OzWfYcD--F-9@tutamail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23836544.IJoHohA0GJ";
 micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart23836544.IJoHohA0GJ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: jeandelu@tutamail.com
Date: Sun, 23 Aug 2026 21:26:08 +0200
Message-ID: <2531343.FHFDcahYGt@eto.sf-tec.de>
In-Reply-To: <OzWfYcD--F-9@tutamail.com>
References: <OzWfYcD--F-9@tutamail.com>
MIME-Version: 1.0

> @@ -491,6 +492,13 @@ int eisa_enumerator(unsigned long eeprom_addr,
> printk(KERN_INFO "Enumerating EISA bus\n");
>   
> eh = (struct eeprom_header*)(eeprom_buf);
> +	/*
> +	* The EEPROM contents are not to be trusted: clamp the number of
> +	* slots so that all slot records fit into eeprom_buf.
> +	*/
> +	eh->num_slots = min_t(u8, eh->num_slots,
> +			     (HPEE_MAX_LENGTH - sizeof(*eh)) /
> +			     sizeof(struct eeprom_eisa_slot_info));

I wonder if that should write out any sort of warning message about a broken 
EEPROM here.

Greetings,

Eike
--nextPart23836544.IJoHohA0GJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCaotJUAAKCRBcpIk+abn8
Tq46AJj0fUmYxztYmJ6jUrwFRpqsRGm9AJ45oAHxyvx4lQFR3VtmOXUAqFK8Dw==
=OyIJ
-----END PGP SIGNATURE-----

--nextPart23836544.IJoHohA0GJ--



