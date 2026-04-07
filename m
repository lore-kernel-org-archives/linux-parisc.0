Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83D33CEA8;
	Tue,  7 Apr 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582092; cv=none; b=DhlbGevIMa5G/29ZHR7q1REQ8HlstAAW4MShmgdS45U1VcOW7At/zC1ViF2WnZbirL5RAPU3lRJu2gipp5U821gzbSei3ORJt454jmiJAZkjs5jy2LanZf8idHYH+MfMSPlBeT6dCpkMf8f4oxR6+DsqfY1DZlfBtAMEvTH9Ypk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582092; c=relaxed/simple;
	bh=xTEQBUU/WacHKSjAkPRhZNVntgq/6rXPiCdIqymmHsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEZJpLfR7/+HPPfLSBAiDmFsqbbwF3coLfc4Y7qFqOoB26srQ8ewfRFdFKXgqeIe48KrnPfOeqkkrsOEdO+4OvZLUsFwP3BTOQXQ30yQDjbqZYJudNOdI4GL8xsh6m9eXpGIIwBavc9k848gWC+VN1JEGbTKsCcbgXr3YNHuGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=RNL7Sfyv; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="RNL7Sfyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775582065; x=1776186865; i=deller@gmx.de;
	bh=M6NYo1AfQLU/bBO9qtJXUf+LcSxb3eOAifYF6bx85ec=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RNL7SfyvtfEqeWY5cGr38np4ap8Lk6Aala5g0Hcq/mgxKaBhqcLRAOJ1J2o49jFC
	 u+aMDOGTEkzAvuzPji0UAsVmpSKMHHsmtjl9oZd46NKZWLEFUsMa4izcdR5fzRasP
	 XqHZt2p/9ITG/9Hi5YMjPHwLLS8AYRmwG1dMhvK108TGpTG3JE3TTUgm6Y3RDi6it
	 AgmGMHMenijRby8IxLidxB8MdFRRt6keAMWLgmo3rzSA+BC0WOX73Ri1iDIw4cttJ
	 Xg7K5bmPcXTKXLMZQ+GCW5/d9bMtYE4zsyyIKl71rs4h4roeb2II89WJ/BPdK0zYv
	 cgJFnTjb8oBP7bz33w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1w2UTl0l2q-00SZwQ; Tue, 07
 Apr 2026 19:14:25 +0200
Message-ID: <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
Date: Tue, 7 Apr 2026 19:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build a
 native 32-bit vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SJSQyn9qWJxZc3ITVNVueVMaJoDZdcYm5qISyS5ghT5TWXY9G3H
 QAkAg9wkOqo2q9zdMzRM9KdyNheQ9QJYJqNSMoywdxPjVWJVIi9VbOIrFsx/TX7+2DfDEqC
 IypALx566IR8NRJhNTZcg4oEJqcFRmcpfEhlhkEzR36FznhWCrlQRRaF+/agBKqcA9TlgSU
 AB67lOuzXHFV/C6SzlwQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ehc1OGTxxFw=;dQfOr1Hv4uSs5HAVdXeeYLr1OHT
 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
 iOBw5AU1i/3sPXlg/GRzbUfQ==

Hi Thomas,

On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
> When building a native 32-bit kernel $(CC) the compiler is obviously
> able to compile 32-bit code. There is no need to force the user to
> configure a dedicated 32-bit compiler.
>=20
> Use the regular compiler for the 32-bit vDSO when it is sufficient.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

This part is quite fragile, especially since the kernel is often also
cross built...
I can add the series to for-next branch of the parisc git tree to see if t=
his
breaks somewhere. (unless you take care of it at another git tree?)

Helge

> ---
>   arch/parisc/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 48ae3c79557a..57320e1d8396 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -39,6 +39,7 @@ endif
>  =20
>   export LD_BFD
>  =20
> +ifdef CONFIG_64BIT
>   # Set default 32 bits cross compilers for vdso.
>   # This means that for 64BIT, both the 64-bit tools and the 32-bit tool=
s
>   # need to be in the path.
> @@ -48,6 +49,9 @@ CROSS32_COMPILE :=3D $(call cc-cross-prefix, \
>   	$(foreach a,$(CC_ARCHES_32), \
>   	$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
>   CROSS32CC :=3D $(CROSS32_COMPILE)gcc
> +else
> +CROSS32CC :=3D $(CC)
> +endif
>   export CROSS32CC
>  =20
>   # Set default cross compiler for kernel build
>=20

