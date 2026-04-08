Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5052FFDC4;
	Wed,  8 Apr 2026 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775681548; cv=none; b=m5RBwfE9xGAjuFICrxushAMdj9TpffqBIaYlbdx7vvMI1uPlTmsEMs1lCJFbchuzFDM/VbdykVG98Rw6dN/bmdjux8birhnOGlBuBj9WFIw4O+KgqmUTVvYJ3Cyx+7VyZxnSAF4qfYCSw3ED3xSBs0ea2RkP/Uzb2Q+SrCe9axo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775681548; c=relaxed/simple;
	bh=x1k8jAk3eblxQy30vRTeLRcoJP2oJjgimJIP1NYajEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xysojr8msJKprjuhtxsuIOU2Vh945dr+QzFMBbL6OLOFvJplP2WMiUto2NErRXmiPulfI/mStLP+gj2VVNE5s8zLsC5TMD6rJyZ4pR4fRaCG/neKVFGLjrQKP2xH1233hlX106HTAwOzk3f6DQUp8Q4P+AE9j4PYOKc6vi5Doo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=n+mPjtVm; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="n+mPjtVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775681544; x=1776286344; i=deller@gmx.de;
	bh=dYMxx7U0QvtjKTgkWajjUDGK0ufWZeGOY+GcLIWMAfw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n+mPjtVmeQjkgOy9emFbPQAbL42r4IOxZhzieX0CsbSPKg03rjIMxZ6z388Cm4e2
	 /X+tCZXZ0XuDbarv4tFF5FJ3rW8bP/3dvaNho0hu6yZquBVLlQ019DcBz2EKn810J
	 AHxpSRcljriGgerPtQijUWalhxMxPIADTCNrL294aQXPgctRnSn1W88yY4c9o50Ay
	 l1pJzUKlLEgKIARYg64fwXVUGgBrAie47vsRYsooal02JyubllC6NAjjM/pu1tx5s
	 K8Ns5oIHHQQ3XIPjKFPeTHF6JepbqeconeUO19wqhk6qND3oxSp3xKmt4iZfJUIXp
	 7tuWXZ/On5GbMRqg+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1vwoXF3ZOk-00RpBH; Wed, 08
 Apr 2026 22:52:23 +0200
Message-ID: <bcf93eb6-3937-4165-a4cd-569d1cef8f7e@gmx.de>
Date: Wed, 8 Apr 2026 22:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] parisc: Makefile: use the regular compiler to
 build a native 32-bit vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
 <20260408-nolibc-hppa-v2-2-7fe404cb61e3@weissschuh.net>
 <1ac41118-471e-44a9-bf2c-f727ec5ded42@gmx.de>
 <273b3a02-9c1d-4a92-ba7e-fc10a0ef869f@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <273b3a02-9c1d-4a92-ba7e-fc10a0ef869f@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CHJblIU9rgqVM9tlkp26QXm9Yy9pSP32jFTkfcy/fKLB8uMV+NK
 8UMDg7QKUia8TkUBtw0qvyL/Pcf39Hda0CoYLSYvP8npFBt10dK5xOfcueQdnAyt0daE4HR
 pjeUQiBT0SBd/DtFu7grep5QirirCaA86sGocXxjvrBDLGg60nVa4xeMtkeO+SxP2+v53bt
 YeXvFJlHXDzN/s9JtTIIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:m9WGmDQgFtM=;HzSn1/wS4xdtHTLEqHmbAlQafky
 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
 lud2stgbqG7j10wiwMYbFdWA==

On 4/8/26 21:42, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-08 21:01:45+0200, Helge Deller wrote:
>> On 4/8/26 20:18, Thomas Wei=C3=9Fschuh wrote:
>>> When building a native 32-bit kernel $(CC) the compiler is obviously
>>> able to compile 32-bit code. There is no need to force the user to
>>> configure a dedicated 32-bit compiler.
>>
>> I'm not sure, but still I think this logic of your patches #1 and #2
>> may break the builds for others.
>> That said, I'd prefer if we can get it working without your patches #1 =
and #2.
>> Can't we do without them?
>=20
> They are mostly do avoid hacks in the nolibc testsuite.
> I'll drop them and use this instead:=20
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -175,6 +175,10 @@ test_arch() {
>   	fi
>   	MAKE=3D(make -f Makefile.nolibc -j"${nproc}" XARCH=3D"${arch}" CROSS_=
COMPILE=3D"${cross_compile}" LLVM=3D"${llvm}" O=3D"${build_dir}")
>  =20
> +	if [ "$arch" =3D "parisc32" ]; then
> +		MAKE+=3D("CROSS32CC=3D${cross_compile}gcc")
can you try if
		MAKE +=3D "  ARCH=3Dparisc"
works too?


> However in the long-term it would be nice not the need it anymore.
> Afaik is parisc the only architecture which needs a special compiler
> specification for the native vDSO.

actually it doesn't. It will figure out itself.

>> I tried your patch series, but they fail to apply to my series or
>> upstream.
>=20
> These patches are currently based on nolibc/for-next
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/=
log/?h=3Dfor-next

Ok.
Thanks!
Helge
