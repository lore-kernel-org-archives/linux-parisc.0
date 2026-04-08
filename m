Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1A2331A44;
	Wed,  8 Apr 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674934; cv=none; b=gL/at49NEEynCQxgxmzfJ3k0twL0RFX8oKyrRTr9nn0oXZV2I2XfSmFmY6U6q2S2drW1xB+SIn8NppgGNbrzzATgZo5lD/eWOAoA0jAjhWRw2VC0pLbTylCh3CiZyxpRSoDSDe9xdZvx40nxqNjBnSjECu8D712VEuiASQ9VTMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674934; c=relaxed/simple;
	bh=D5h+R/zdCS2cHOxOg4kqt3yesfKI/+k4qy/DNllidzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/I2CZPJITu/T91SibLT8EzJ4sWCXiCCAO1oYaXdBr7Kb2WsQFif853MI5Bqj1LZ2dgzUYwIX0HDrRPG2u48WOspKx2isO/niTWtxYwBRdZp697clWORla8jaKq+k8MAPpQRFWlcX2mmPRJC7DtHu+XtKZwDVLOCZ7+RV/Y1Xr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=r6LygUMU; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="r6LygUMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775674907; x=1776279707; i=deller@gmx.de;
	bh=hyRBkmyVFVTP8jMzI8SwYKtzuIzT1qYtZNY72S2UXSc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r6LygUMUkY2BaMyzmzeEVsUVQU29NyALfIOTl3s3D3xpedfnbfyhBejjWrF6NGuu
	 SKlRT+LIgi8f5i2uNWf2oRpMjx/4adlJJJhltHTbUJuGwVWIzMzPQe/rvV5qm/qvx
	 89Tz1zlLVVxoFecvqkgai3LpaXQ+bLCdQrsXoJYe7kvBCmgS2V5786+RD5GK3C/d7
	 1KymLP/wqC1acqZOtSGK65f6DD3YlqhZerD4GIP8J6aUNyRCis5KOzBAWv/8E5QbY
	 hk17QBIxGG8toHOzAy/o2gySDQltE2vpcJVsV3p/swqoDBoxzEiHsc2A94tIpjXQ7
	 a1yM7P5pygpxUjjfxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzyP-1vc2ke0FQ7-00aIxw; Wed, 08
 Apr 2026 21:01:47 +0200
Message-ID: <1ac41118-471e-44a9-bf2c-f727ec5ded42@gmx.de>
Date: Wed, 8 Apr 2026 21:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] parisc: Makefile: use the regular compiler to
 build a native 32-bit vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
 <20260408-nolibc-hppa-v2-2-7fe404cb61e3@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260408-nolibc-hppa-v2-2-7fe404cb61e3@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2q6ZusF3Itd8ZECR6OotOsDWIHBbou4JvxjlxUxatV27L0E92RS
 frrd+EnSGDEU8PCzACQf55/ppvSPtIQheSHMulav/H+OaFKJAwDpU81A8uk8Ewbjxa4V5yl
 6YmCmfriRICVkNayo1FvTC+hZ8hRUkNNKR8lc9JoRgZbm9wjLUZvMkjcBli7w1Ol9VfpX6W
 QP3hvTnq/zAT0OVjGggVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xhA7EABmaUY=;4wFJYhLFKYl9/A410Eia289W5ud
 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

Hi Thomas,

On 4/8/26 20:18, Thomas Wei=C3=9Fschuh wrote:
> When building a native 32-bit kernel $(CC) the compiler is obviously
> able to compile 32-bit code. There is no need to force the user to
> configure a dedicated 32-bit compiler.

I'm not sure, but still I think this logic of your patches #1 and #2
may break the builds for others.
That said, I'd prefer if we can get it working without your patches #1 and=
 #2.
Can't we do without them?

I tried your patch series, but they fail to apply to my series or
upstream.

Helge


>=20
> Use the regular compiler for the 32-bit vDSO when it is sufficient.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   arch/parisc/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 92b769f4bbe7..ab8a93e773fb 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -49,6 +49,7 @@ ifdef cross_compiling
>       endif
>   endif
>  =20
> +ifdef CONFIG_64BIT
>   # Set default 32 bits cross compilers for vdso.
>   # This means that for 64BIT, both the 64-bit tools and the 32-bit tool=
s
>   # need to be in the path.
> @@ -58,6 +59,9 @@ CROSS32_COMPILE :=3D $(call cc-cross-prefix, \
>   	$(foreach a,$(CC_ARCHES_32), \
>   	$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
>   CROSS32CC :=3D $(CROSS32_COMPILE)gcc
> +else
> +CROSS32CC :=3D $(CC)
> +endif
>   export CROSS32CC
>  =20
>   ifdef CONFIG_DYNAMIC_FTRACE
>=20

