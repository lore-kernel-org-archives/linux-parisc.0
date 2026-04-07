Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55752DF717;
	Tue,  7 Apr 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775590029; cv=none; b=ZCdUHIecY1Qb0oOEjw8jGd3ZPEUJwwMPSRZaQhDln6mbFcZMwx4QYsmqqBWkqYL6EIfG9+K/cDVukQh+iDno4ITKFf0NWnb4nRLuF/7Yy8fwrDc/h02gu0HdDVGbspVJhi4z1pJWjap2Hv0rcb0npV4ew3qdvhZ3Zj7o7x0Plb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775590029; c=relaxed/simple;
	bh=rYlnThopm6W4Z8zOV4XbAhTpFvvpqbPiz0dheiZzPvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOcnbtv5erAE3zdSZLMTziq8SZmS9VXjh3sxfbqyUQhefEz6YNrC5O+112HM6LR6NpHhZp1jAsSheLpS6nGI+bK4DvSvO/b0iFc6p9jD/xi4zrpluL5yUBrSYZW/nNBbCApVMKgKMGgRXaR4Wk7YeQuT2KwcQypgQAd5msx4/DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=iWWbWlqQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="iWWbWlqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775590024; x=1776194824; i=deller@gmx.de;
	bh=rYlnThopm6W4Z8zOV4XbAhTpFvvpqbPiz0dheiZzPvo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iWWbWlqQG0GIoqI2tsFLZ5pzsokNwcb70XxQkxCtcVo7w3bKaSF0PCGtQrra8mKO
	 VGblkS85rwEP606/Q3183I4U+RljUzdZdsPDblneQlm1GcYbBgZOwudKTwa3/zEDW
	 G36Yf04yRNmT3YB4KcRQOhYMuKaoCw+0wKYDRMr+wrjyWZ54qqxcjYRO8jzj3Dx67
	 OsKGcHey7H6FzJKfqpMUVeHR2mqohFs+z/Dar8JNWJETDWl/c0mvI2WLhzAotEV8i
	 QT0DJdNx+VPFoKa/z24Dqee1edSvrqsGPxOskm9634FPKegUb5NXqCc8dKzPZN08A
	 RNfhFR9uuFN/J+fqNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3He-1wGnnE1C4O-00DwW4; Tue, 07
 Apr 2026 21:27:04 +0200
Message-ID: <b6edb6aa-76a6-4f66-bd04-6a2163591990@gmx.de>
Date: Tue, 7 Apr 2026 21:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build a
 native 32-bit vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
 <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
 <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9M2mAOURDhxsAuebJBKtwThm1OJa7KH2uGWR56CNJDxA/TGRaNx
 uVUSMoS6VPBm042Cbi2P3Q9sJBCG/WWICgrHf019+GiS3lonL+80HrRTKJqv3lT1AamhGSX
 SETNYsue/ruNBGX6M5YgML4eoWwv7KaKkj7LRhBXPilkzt1+V5xmjSsH3kCWhpe8mVlF29l
 xVyg9pg8M71gYjLCL5MGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DfZBJJ08Akg=;DPC1olnpuOi51s4CGpnJwDH6rx+
 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
 zX

On 4/7/26 20:06, Thomas Wei=C3=9Fschuh wrote:
> Hi Helge,
>=20
> On 2026-04-07 19:14:23+0200, Helge Deller wrote:
>> On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
>>> When building a native 32-bit kernel $(CC) the compiler is obviously
>>> able to compile 32-bit code. There is no need to force the user to
>>> configure a dedicated 32-bit compiler.
>>>
>>> Use the regular compiler for the 32-bit vDSO when it is sufficient.
>>>
>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>
>> This part is quite fragile, especially since the kernel is often also
>> cross built...
>=20
> I also used this patch during cross-building and it worked so far.
>=20
>> I can add the series to for-next branch of the parisc git tree to see i=
f this
>> breaks somewhere. (unless you take care of it at another git tree?)
>=20
> I'd like to take the nolibc patches through the nolibc tree.
> If you want to take the Makefile patch through your tree into the v7.1
> merge window that would also work, as I will only apply these patches
> for the next v7.2 cycle.
Ok I'll add patch #1 the to the parisc tree...

Helge
