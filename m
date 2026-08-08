Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D52EDD58
	for <linux-parisc@vger.kernel.org>; Sat,  8 Aug 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203426; cv=none; b=qp0QfwpXK/LVEu9r9K/zqBAe9osgsr4GGulc9ZU57aEYyC/V09WQB7szXl17Co+2pgp94vj5jnNe6AGzKAxDn7UC61zifi2ECNTV0tXH9Tjh+eOSsXFuf29yCQsodywGhHROLa4M1iSvztDOINRjjaIZ914XdSL8V6kdzJzC5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203426; c=relaxed/simple;
	bh=CRcXn7m8fM6VJ5coS0KS9s7worbN69Xwzb0Yy23PKB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHracz4qyQV+osFN4X7k1VTB88kJ5mxP3cvJjh9TGZP9sSeR4/I3cQvRe+XiDjeyg5wvzMhR4vpzVkqc6dF2sJpP3eqQSWHlEGNT0vk01AoYBOw96jI6HmlJtYGCtT7VGaFoH3aQjHsQTAVOYsDc6A04v4cnQoXLGLsB75zhIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=E4THCKmi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="E4THCKmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786203421; x=1786808221; i=deller@gmx.de;
	bh=iZMtmnAitu/8l8qXj4mlebJT5j2+cw6GsN987u4BO3g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E4THCKmi3VeZDDeUH2cEhNmBAObKGUBPtekSafRtIZi+gvwVRnm9ZFBxry7Tgkkb
	 TIxXvhcJrArpSwWJf/OXG3tlRV44G9eVFstrrfhZqkJziSnmHxWBeCdbW16T3TRj2
	 jkLcFmiWP44/N2802H6Mkw+bd3HMsy6xO8uMyq+bTWrMr3+9SA/EKe9xmxW4aDkW7
	 OatYpYb/0iPkJd1v/roXtMeUDfXp7Moeut7k7VR9wwMCTT8jsR9jMkH0ykzmyCHAF
	 LKxnLUR3Ul6oV8wCypvx7m77s4WnIFJHg7+Uoqp4YfkxbL0yrt1Gr5oyRyygnnjV8
	 8tMzFGkj5mY2Uy3EaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Ra-1wzRG11aUi-011gzx; Sat, 08
 Aug 2026 17:37:01 +0200
Message-ID: <76185f88-30d4-4cf6-8f4e-cf3ababb9b06@gmx.de>
Date: Sat, 8 Aug 2026 17:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: eisa_enumerator: Fix out-of-bounds reads of the
 EEPROM buffer
To: jeandelu@tutamail.com
Cc: Linux Parisc <linux-parisc@vger.kernel.org>
References: <OzWfYcD--F-9@tutamail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <OzWfYcD--F-9@tutamail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7dJwhOKUijdaswAZ9vFumBRNI8C/Y9pSVz+GOJuKQgKtyyogIsL
 blsbTiD7nKqQwfYR9or/qkyXkk/HYlW/b8p8/pRF2PVg4mo54AEus5vLVuA4/LvOU0iLaOh
 u/yeQotOXha/Sq3UtE/c06b0njMw+9zBO0bS4WOLtTq9KBI26irZI0FMexNzC4wu3M82BZh
 osd4Vps2L+JizbaxTz47g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HXeVVlWAKEc=;MRKyr1BgMrDOpF2qFNl0VCbeVEn
 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
 sP9RrZ07l/GHx+WLxP0=

On 8/8/26 16:02, jeandelu@tutamail.com wrote:
> From: jean delu <jeandelu@tutamail.com>
> Date: Sat, 8 Aug 2026 16:00:00 +0200
> Subject: [PATCH] parisc: eisa_enumerator: Fix out-of-bounds reads of the=
 EEPROM buffer
>=20
> eisa_enumerator() trusts the contents of the EISA EEPROM.=C2=A0 The numb=
er
> of slots is read from the EEPROM header and used to access the slot
> records at HPEE_SLOT_INFO(i) =3D 20 + 48*i within the fixed-size
> eeprom_buf (HPEE_MAX_LENGTH, 8192 bytes) without any bound check.=C2=A0 =
As
> struct eeprom_eisa_slot_info is 48 bytes, only 170 records fit into the
> buffer, but num_slots is a u8 and may be up to 255, so a corrupted
> EEPROM makes the code read up to about 4 kB past the end of the buffer
> (e.g. record 254 is accessed at offset 20 + 48*254 =3D 12212).
>=20
> parse_slot_config() has the same kind of problem: it clamps
> config_data_length against HPEE_MAX_LENGTH but does not take
> config_data_offset into account, so the parser can walk past the end of
> the buffer even when the offset itself is valid.
>=20
> Clamp the number of slots so that all slot records fit into the buffer,
> and hand the number of bytes actually available to parse_slot_config()
> and bound the parse by it.
>=20
> Signed-off-by: jean delu <jeandelu@tutamail.com>
> ---
> drivers/parisc/eisa_enumerator.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/parisc/eisa_enumerator.c b/drivers/parisc/eisa_enum=
erator.c
> index e0a57086a..f6014258e 100644
> --- a/drivers/parisc/eisa_enumerator.c
> +++ b/drivers/parisc/eisa_enumerator.c
> @@ -311,6 +311,7 @@ static int configure_function(const unsigned char *b=
uf, int *more)
>  =20
> static int parse_slot_config(int slot,
>  =C2=A0=C2=A0=C2=A0 const unsigned char *buf,
> +			=C2=A0=C2=A0=C2=A0 unsigned int buflen,

Can you please resend this patch?
Your indenting is compeletely wrong.
It might be your mail program, your mail provider or your editor who
messes up the whitespaces.

Helge
