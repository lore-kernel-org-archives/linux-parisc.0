Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F13B2FD9;
	Fri, 17 Apr 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418783; cv=none; b=jr+ls70p7zkJHl/KmplbKKSpgWG9Vd/BjemJs+dKxovbN/DQCUGKoXsvfEueD2xqgzDT5SbOvUSq++DMapOCrwg9Ns3p2lGKevoo4fjjcArIo84+MoC8GxB0z3TDI5utOavz8mDGiiZwFcAwZn82dbWB11Jvze/nsPEK4E/FrXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418783; c=relaxed/simple;
	bh=0eULmkjtqZZHQhrfjk+U8FtRKKa8/WJ843FF2os26c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DfdBbMgobLbP+FBW9U5HLq/RddblYcMsaaSommdffRL+uagKdjogBhNaaQ4hUIP3SAyLkf6eTry39vGX4aSGPgtiYyNmCjVs46tX4A8ZTw2PCb+lFBOOTuCnqFvA1B07HIavgbeFqaGJew2d/8D/GKD9F9ZdjzEPzxtgXZoibWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Z8cghBLs; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Z8cghBLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776418780; x=1777023580; i=deller@gmx.de;
	bh=+q779rjJxYjlpvz68JY7dwuo8VZ8spOGo+QAYYudhc8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Z8cghBLstGX0px5wmAlUaAPeByAD38HcrIr3QcyuKozOSmXy75KnAS/FjBhDm/Tt
	 CsCGIsaAEz8EYZ3KvcwenDPdVJYze+EiWveFJy6qOOXvbFLukHi+ilY0tq6KYUaKp
	 /ptmwl4azcfsao9p8BRClOLUm5LAbbgQhzcm+l4EPESOz/9yF1kjVQE3F74PzRbqW
	 X0JEPscJF+rmqQ9b3+UQATRI0rMYS+vzNHu5woZGRkjt1fM74Pb2NrZge5UDkORC6
	 HG4DxfHNS6RQtLD021ZaIUQ+I6bRpm6G/pjhyEBZaKju2cHpZhMsTFgaan0MG9WU5
	 E4qI48jav6rfXVloew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1w7qek3Paf-0039Ik; Fri, 17
 Apr 2026 11:39:39 +0200
Message-ID: <929ebeca-d070-4537-b3f5-3a4c93f1301d@gmx.de>
Date: Fri, 17 Apr 2026 11:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: led: fix reference leak on failed device
 registration
To: Guangshuo Li <lgs201920130244@gmail.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260415170515.3605095-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260415170515.3605095-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DmCvVlNVczBMPOwYvgUrBlR4en6GUgUWhCsWrkQaQMvoOkPJVJA
 pV0ud6TG1xC1EovPgSoJUF22p+G9Fi8oY8TdG3SUCkyyawMXqf1FRzcziBlqgb+zP5RL1Bl
 70SyJJ9bWA+mFJkek96uQ/hZsk1C/xcf2bLP60vw9nsM/pnatGrTXpKJDkdE66Y78LDA82T
 OUqXEtvmcH+DtsRFDsAog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oTKPr/LM4cw=;4yHO+0Fj5NzQfPcuF1ikmDXQ8k/
 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

On 4/15/26 19:05, Guangshuo Li wrote:
> When platform_device_register() fails in startup_leds(), the embedded
> struct device in platform_leds has already been initialized by
> device_initialize(), but the failure path only reports the error and
> does not drop the device reference for the current platform device:
>=20
>    startup_leds()
>      -> platform_device_register(&platform_leds)
>         -> device_initialize(&platform_leds.dev)
>         -> setup_pdev_dma_masks(&platform_leds)
>         -> platform_device_add(&platform_leds)
>=20
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() after reporting the error.
>=20
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>=20
> Fixes: 789e527adfc33 ("parisc: led: Rewrite LED/LCD driver to utilizize =
Linux LED subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   drivers/parisc/led.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

applied.
Thanks!
Helge
