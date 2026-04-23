Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B13DCDAB;
	Thu, 23 Apr 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928157; cv=none; b=bsBa+YkorVJA5zaCtyGn42IRkcO06TCubD7eZFKYJpW0ceZHX+yILkvGwYRbhXHP+0PLrblBJgqFge8pt/AqXOY7itOMRl7yJMYYOFr4IY3+8vA42yMwgvXzPU+5y5YVKJwK0TggVvH1RawbA6UFOqyxk5ZRuYj0F/XkFC265Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928157; c=relaxed/simple;
	bh=b9cw4wohONZAD4SyQnC1mzJoT2XU4pExFSg+xNI1x2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uRXpficWZlsaD6cZkxhXYMVWvY6/uG+RZXtPhRPxMUsU1lUUBL8G/tvEYin+F9jxH/8W1wHBq7EG44tS2KYvlcUjMM625/7zXV0Xd1phNqNxJpQnXgVdSS5UTixiHVU8U2XNss7s+EGeotGXQERFiaGqx2FUZUSIQjjpEGXybJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=AyFW0rDC; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="AyFW0rDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776928148; x=1777532948; i=deller@gmx.de;
	bh=b9cw4wohONZAD4SyQnC1mzJoT2XU4pExFSg+xNI1x2E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AyFW0rDCDWdhPzeFY7yYDiQ+6jrI9GhFKMMSl1obZDEhryPb7Xy2+C8L7yNCSwo5
	 HrcTMaoLx69vvMfL1IRfcQVB5ftbcvdVc1PdWE1tjAa0ztDi7iIwng8YF0N2YytzB
	 7SPM4nDYbAEKo7f19GorLX/LivcZKLpiDa7/cueJgFRGSxdUDdljed2UxzzEkW4ee
	 dUrk/HZ41iZGO0uLM68LZ1gXiyn5rxpVeKZEWS6BD72hGJ4VX1OAWUnUuxzhArSoe
	 XuDpz7sYmq1FVjaWT7Il8B5V2SJKDXkLuqTDE5SivSSWBLb48GG3kMjTS4zCo6yyS
	 Wx++OTNWPoaaa34l/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1wLsBh4194-00AE2U; Thu, 23
 Apr 2026 09:09:08 +0200
Message-ID: <3d9613cf-6caa-4609-b4a6-6fe06f5a7f7a@gmx.de>
Date: Thu, 23 Apr 2026 09:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: led: fix reference leak on failed device
 registration
To: Jiri Slaby <jirislaby@kernel.org>,
 Guangshuo Li <lgs201920130244@gmail.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260415170515.3605095-1-lgs201920130244@gmail.com>
 <929ebeca-d070-4537-b3f5-3a4c93f1301d@gmx.de>
 <f3cd203e-0acc-4b5c-b590-145c0e82c768@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f3cd203e-0acc-4b5c-b590-145c0e82c768@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mbByQEwsU0b3T2tSnKPAQ03pCduBTvHbwcoZCCxKDQOZIkvF0Xv
 7iRBwUbsZxobQ2f4G+5Y2w1l6dJBQxDT4/6+pe32CCuVddnM7eoZHioEVcFl3uMxYzgg21g
 /bxxBrh7Si6t5fgmyanzxyC6mNAVASTUt2yWsCHfH3xpapSsApF3rvPS/KB5aCebeySsn9k
 QHTFnnuSTcOJa46OE6fBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HJVrJA+N1ik=;uz65+oX2V0GkcT9fCDCF5AhKHCz
 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
 Su9lNBIDM4e0Whw==

Hi Jiri,

On 4/23/26 07:24, Jiri Slaby wrote:
> On 17. 04. 26, 11:39, Helge Deller wrote:
>> On 4/15/26 19:05, Guangshuo Li wrote:
>>> When platform_device_register() fails in startup_leds(), the embedded
>>> struct device in platform_leds has already been initialized by
>>> device_initialize(), but the failure path only reports the error and
>>> does not drop the device reference for the current platform device:
>>>
>>> =C2=A0=C2=A0 startup_leds()
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -> platform_device_register(&platform_leds)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> device_initialize(&platf=
orm_leds.dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> setup_pdev_dma_masks(&pl=
atform_leds)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> platform_device_add(&pla=
tform_leds)
>>>
>>> This leads to a reference leak when platform_device_register() fails.
>>> Fix this by calling platform_device_put() after reporting the error.
>>>
>>> The issue was identified by a static analysis tool I developed and
>>> confirmed by manual review.
>>>
>>> Fixes: 789e527adfc33 ("parisc: led: Rewrite LED/LCD driver to utiliziz=
e Linux LED subsystem")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>>> ---
>>> =C2=A0 drivers/parisc/led.c | 6 ++++--
>>> =C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> applied.
>> Thanks!
>> Helge
>=20
> Unless the static pcmtst_pdev has ->type->release or ->release set, the =
patch triggers a warning upon put().
>=20
> platform_device_register() should be fixed instead.

Thanks for the notice! I'm going to revert that patch.

Just yesterday I refused to apply the other patches for fbdev and suggeste=
d
to fix platform_device_register() instead. See:
https://marc.info/?l=3Dlinux-fbdev&m=3D177687117206684&w=3D2

> See also:
> https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail=
.com/
Thanks!
Helge
