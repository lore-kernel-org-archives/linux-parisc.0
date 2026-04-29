Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2A1FECAB
	for <linux-parisc@vger.kernel.org>; Wed, 29 Apr 2026 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489239; cv=none; b=N6YmxVtCQZV2R+/MOi/eyB1bynNyHFiK+Zrnq6OnLeYPR9gOoRs3WrAw2pLWpEazTo1B9P0WOBbRRABNAQJV89EgJeoyp9ILeqdcmX+mttHl71Ugpt/XMor4E8BhyW+dWZf9nIysIsmDjo8vuj45CSpS9hZIYJefTCkzgzTsPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489239; c=relaxed/simple;
	bh=gzK/iDvv7uZOZTYFXwiuUJivKzY7ql7tTXKIZgUFniM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=npjZSrKL6xUeA7XKpk2ioRFkyJ5YSHbGqW25d/uH5M27/qQUEsHdgB+QwcnRjA4qd/BUMZCXlj/XOXwptoRyL56bsSMJkb+BGNhdQcdtt8R3qEMGYgVSY+SvM4ocMDhTrj3488BZuKBACU8IbWM41JXq3uafV2b4RRAEZyJ+i9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=hX7xktES; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="hX7xktES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777489233; x=1778094033; i=deller@gmx.de;
	bh=CvJ885Z+CIPOhJZIYxxtVO2t2OmAKNuHxb4qgfDm/qo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hX7xktESMB4dEZLeLRYH1m4PeFPwY+2NmysetTpAjMlzyOtnGNe4UD9F6CKSzqKS
	 nZsWCszSLSfneBUYG9Kre4W0lXBsY0FtJDzxSGxZBr/EqlACWR3mmjPyTjIzEgJsP
	 2CqOYW5qJTKkrBep1GRTXMHHCAuf6P5BKaXxUQrpbA7GpZ8ryTxs52GSnaJac3KIb
	 iwlB1IBWYOATTy4aVwpeU7svJS3YKQU7pJynEmyjA52w1Q0f1lrKZI+0VMfLntOep
	 tsCbunQECISwsmYzbpKHoIm6rSKxbHW1+JVjeMOJ2gDEN0A1Sjc6wTyPQji6LPXhY
	 UcGJgLPHMYbFPNUO5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1vUjtN2DyW-012VUg; Wed, 29
 Apr 2026 21:00:33 +0200
Message-ID: <7cd5a4a0-c3e6-44e1-9d9b-6ac7b69ad306@gmx.de>
Date: Wed, 29 Apr 2026 21:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bisected] Failure to build 7.1-rc1: fatal error:
 generated/vdso32-offsets.h: No such file or directory
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
 linux-parisc@vger.kernel.org
References: <1777487907@msgid.manchmal.in-ulm.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <1777487907@msgid.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b60REbkQCOt/9gZm7KDs2wmqJS+FpGOGPkJwo3WD6Ts9/W+GS5W
 tEA5HwhA1cWB13sOTwsXpUFrBer/NZUHrQOJWQcKS5JlZ/HGHaSRRKQuDEWRL+r0YCoFUvK
 Bo9yEDZZlsOthRQSNh3605OyDN9N1nrWvZiGqkt8FsyWDEqLnm8wqDe1lU8zWY+SI8G5CRr
 iyaRWbV9dzpy4pfI2bfAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kzj6kyqieRY=;hYuWcR64oRVx2hMcD1YNfdtkoeK
 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
 G0AcBtcq8EMlXjkOvcipiCEFhHk=

Hi Christoph,

On 4/29/26 20:43, Christoph Biedl wrote:
> Hello Helge and friends,
>=20
> building 7.1-rc1 for my parisc box fails:
>=20
> ```
> (...)
>    CC      arch/parisc/kernel/drivers.o
>    CC      arch/parisc/kernel/alternative.o
>    CC      arch/parisc/kernel/signal.o
> In file included from arch/parisc/kernel/signal.c:32:
> ./arch/parisc/include/asm/vdso.h:11:10: fatal error: generated/vdso32-of=
fsets.h: No such file or directory
>     11 | #include <generated/vdso32-offsets.h>
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.

Indeed!
You are compiling a 32bit kernel with PA2.0 instruction set:
CONFIG_PA8X00=3Dy
CONFIG_PA20=3Dy
In this case CONFIG_PA11 is not set, which is what I test for to build the=
 32-bit VDSO.

I need to think how to solve this....

Thanks!
Helge
