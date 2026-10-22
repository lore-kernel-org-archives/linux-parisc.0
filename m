Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701774;
	b=3YmeSqYunbW6VsDXW3pUWQ+Sr2p6rekmnCgz1CH64WQa09e2ksQ6620trXBTFoV5mlfK
	 iBRZhVYN5QCpASd9r5sNrD/TpOXG7eaoCDjDu52K2qsHQYPHYds1oEhGv6UaxQ0FDggXC
	 zsqbZYAphWRUK3D5s5Jq/gqP00m5bR2Nqu1WTwev7e35tgD52+8RGPTUWdoRrcz7Lx+/8
	 UUi5VI82mo/y/KXZVSCGYkeEtcE1ioxyvpeZ5j3b8+Yl0gXhcW3QOyN7wjaNa1P0THn/c
	 aptDJs1DbwYgVTXa7Nc85tq21PE2ZEeaoGxnP8tmNqPHsNc61GzHfdWoezospm58Vew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701774;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=3apPxfALq9+0tmF07mrCUnqroSxESh8ttqdXZtYbTKQ=;
	b=Y2O+PjjixshxF8Nq2IJaF2tEHysquBW8YQOzB8on1fsV9naojvi0lKhXIrL8Nj4STZ+2
	 ayxjgDjc0UkpjzdNM8H6AgNa6sa5mmoY13HjYkpj/lwxOhkqOtdjChSHgsl3z8MP/bC35
	 B0fEUfPFVWpV4RC4NFOZAko12TQJzaw5ysf+1ih4K58dWD8NE9U7aCjCy2RngNJc4OZ0t
	 aElxJDsuETwORB7PV2DLmdoyrHgbI5DNFdc8qT5jITtqZoGt5ybpWy5PXOpn8Gui0AQ7M
	 utGkht06E0HmQnvsGj1Ds5rhRG8niDao2Y+Vu6qV9U9+11++sEpVWNG5JRfm/n3Dl3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=XpvpqwFv;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EB1606A319
	for <linux-parisc@vger.kernel.org>; Thu, 22 Oct 2026 20:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EB1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=XpvpqwFv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792701770; x=1793306570; i=deller@gmx.de;
	bh=3apPxfALq9+0tmF07mrCUnqroSxESh8ttqdXZtYbTKQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XpvpqwFveJ1oNIPP0OTukqMh9RbyssH95FdfusKxdVB3OrAUfs7Ga0tWUgF1yq8B
	 QKSKduc9yS8+laQL/W67XMw/MZ9v9HvY+BsEWCAzr724U0R5K3f9MemZ3MsEVkC+K
	 6+RCe/kAZCepXtaTpmqIE45DtkI/jnbkarHYYUsQYtWYRR0V2wU3bTgRCoay4LMVP
	 PMUxfzEbJonS63UDe6WIg88758jRwyiFMEKjwvXYyXdxsXGJO6IC6OcZ7s8MwDXwr
	 i+W6wRFsw8QqGZlj7KmPCBW/ZZ4WPGpxmQduJ712svjTwcALpjTTvTFfayM6j7n6s
	 mEfzaSuNcgFy+9NfwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1wsKRx2DV9-00caJu; Thu, 22
 Oct 2026 22:42:50 +0200
Message-ID: <24e7f55e-b847-454d-b6d9-13f598635c4b@gmx.de>
Date: Thu, 22 Oct 2026 22:42:48 +0200
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
Subject: Re: Crash when running 32-bit kernels on qemu with C3700 machine
To: Guenter Roeck <linux@roeck-us.net>, linux-parisc@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
References: <b9a0a102-701e-4160-b15e-ddf053f02775@roeck-us.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <b9a0a102-701e-4160-b15e-ddf053f02775@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iZxS3n6TjTbHu7mki1CG26uMhn1vZ5SpE300xfdzqdPKbaGE2xe
 3xYiX0xKUrFhqESjQyEnwq+iG7IZTUwNrRTq2FLViuCrOFh5dwTRInl2WsluNLwMh5vmiCz
 zFiS7B2h6plxRMB3E8NclhYsOt7/cJT2BKaa53xF9TeMbWBeW8QIje3tXD+Jkr3HwADjPkr
 +tnGhBOs/K5Zh+aFJx+Gg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hs3oCaPH7Lw=;y1pmIdX0g6lyr2NrOgEoluTjvON
 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

Hi Guenter,

On 10/22/26 17:32, Guenter Roeck wrote:
> as part of my kernel boot tests, I run 32-bit parisc kernels with the C3=
700
> qemu machine. That used to work fine. However, it started crashing a whi=
le
> ago.
>=20
> [    0.259126] Backtrace:
> [    0.259266]  [<1010653c>] alloc_tree_node+0xf0/0x1b0
> [    0.259743]  [<10106778>] alloc_pa_dev+0xfc/0x274
> [    0.259912]  [<10106118>] do_device_inventory+0x190/0x36c
> [    0.260095]  [<101050e4>] parisc_init+0xa4/0x178
> [    0.260256]  [<104262cc>] do_one_initcall+0x98/0x510
> [    0.260438]  [<10101564>] kernel_init_freeable+0x29c/0x34c
> [    0.260623]  [<1118f274>] kernel_init+0x2c/0x15c
> [    0.260799]  [<1042301c>] ret_from_kernel_thread+0x1c/0x24
>=20
> Bisect points to commit b8425ceefee5df2 ("parisc: drivers: switch to
> dynamic root device") as the culprit and, indeed, analyzing the above
> backtrace shows that the "root" variable in arch/parisc/kernel/inventory=
.c
> is NULL when the crash is seen.
>=20
> However, as it turns out, that is not the real cause of the problem.
> The actual problem is that 'root' is overwritten in
> pdc_system_map_find_mods() during the first call of mem_pdc_call().
> Apparently that code (or, rather, the firmware) writes over the end
> of pdc_result[] and/or pdc_result2[], and the 'root' variable is just
> close to those arrays in the memory map.=20

Nice analysis.
I found a similar bug a few weeks ago too. Not sure if it was the same one=
.

> The following hack "fixes" the problem.
>=20
> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware=
.c
> index c35a34809743..ae172a78f893 100644
> --- a/arch/parisc/kernel/firmware.c
> +++ b/arch/parisc/kernel/firmware.c
> @@ -74,8 +74,8 @@
>   static DEFINE_SPINLOCK(pdc_lock);
>   #endif
>=20
> -static unsigned long pdc_result[NUM_PDC_RESULT]  __aligned(8);
> -static unsigned long pdc_result2[NUM_PDC_RESULT] __aligned(8);
> +static unsigned long pdc_result[NUM_PDC_RESULT * 2]  __aligned(8);
> +static unsigned long pdc_result2[NUM_PDC_RESULT * 2] __aligned(8);

Of course I don't like this hack, but instead would like to fix the issue.
 =20
> Questions: Is that a bug in the kernel or in the firmware ?

This is a bug in the SeaBIOS-hppa firmware.

> Am I not supposed to test a 32-bit kernel with the C3700 machine ?

Yes, a 32-bit kernel on that machine should run fine.

> If so, would it make sense to prevent 32-bit kernels from running
> on that machine in the first place ?
No.

Which Qemu version and more important, which SeaBIOS-hppa version are
you using. The SeaBIOS-hppa v26 should have the bugs I found fixed.
Looking at the current code in SeaBIOS seems OK (Search for "PDC_FIND_MODU=
LE" in
src/parisc/parisc.c).

Helge
