Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A6379EFF;
	Wed, 29 Apr 2026 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498599; cv=none; b=VUVGghIHLYB9mVviZyPeHysH15CR9bihbMOBc4b7/c/rxOmVORiwGWrh68hUq7UX9Yz0LSvTsuMZklo0ac1uDgYTraJpOTocJu77oFMAv76cs5P94eQj0FVdRpZO18JcO6KwWNYhuSGW+fcf1FpEdbM/NXb6h/bjklu6h5943Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498599; c=relaxed/simple;
	bh=2bhzFCSElVLJ2B4JNaMRwvdXrlXKHC/R4PTzAJURYiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7XezRKfJv1mIN9a53XRklikbqPh+cYInllim6LAr/ZoinaueZhdlygGUQj1tGXzLk2FPM6JaBzU6etXGoBKhaQSSogh7S4Z9LsQf9Ri13n1HGMvA/P818QJPHPjJl16LIJenBtbMfJkEqicrH8s7JAe15bh1Pb73UbpzYCXyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=b+T4AMmn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="b+T4AMmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777498593; x=1778103393; i=deller@gmx.de;
	bh=ZqII9VTLfz3quiWMaG4SttnMEAajw7M90n2DAeGBFxg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=b+T4AMmn3/zcH6bVOQu+RMwdYwWz7VYehS/uTFzId1eMEZKIuIeUTxyilF+NOiJE
	 48T6oT+q5ZW9khgF3MEhQ81gdJjZgld2jW1ayywM59vqdFiykzY4TAbZWWxUbf0UE
	 wxjQZjnCCG7rBRTfScB6LPNYKpUbHzAXVGyD1J+LBcYsNZnaMcG1pQ/cHYi9lX/Lx
	 kiKkReREWM0fUMLjGZ7CzAZGdTAQh/pTrRtvfZILNkmiH9kt9Z/LcrA6osTMc2C3w
	 TLnICxdj6VWxCpYWjrWOjU7zhPqSB+M9LzfSAyGSOKSSD/CSg/x3rkhwth+FDnL9Y
	 Z1LWXrdYoiMIdXUPag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1vtLMh2C9S-00Lhdk; Wed, 29
 Apr 2026 23:36:33 +0200
Message-ID: <539e314e-f0ea-49e7-9e80-0c40036a2e31@gmx.de>
Date: Wed, 29 Apr 2026 23:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Only call VDSO32_SYMBOL() when valid
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-parisc-compat-vdso-v1-1-5242b8ac59db@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20260429-parisc-compat-vdso-v1-1-5242b8ac59db@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tuKZCLm/gZhxu9Luas1EQEKCw2kkgMGmpH9GGerfBkxgTMbtEBp
 2TkyHRLNTCPFKtQSluEJK1pBGESD2VVBVa+8P6cbAA7EEkg+pmQf0xRWXQCz/szDGYk4n+W
 Oj06bGyhcA1WC6SCS/nMJ/ChHYGCiACK2BcQmOpv9LcaY5v4T4isMkF944j2BMnTgvYfODK
 PvmwKi8VtMGhhWXnFXBoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:agC5CcsIg1M=;bscT/zYLsqv+2r2J1y6U6H7RScv
 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

Hi Thomas,

On 4/29/26 22:59, Thomas Wei=C3=9Fschuh wrote:
> The definitions used by VDSO32_SYMBOL() only work if the 32-bit vDSO
> actually exists.

Do you have a .config with which the problem can be reproduced?
 =20
> Fixes:  3dce91790205 ("parisc: Allow to build without VDSO32")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   arch/parisc/kernel/signal.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
> index 64a62006bb15..192121047633 100644
> --- a/arch/parisc/kernel/signal.c
> +++ b/arch/parisc/kernel/signal.c
> @@ -276,7 +276,9 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, =
struct pt_regs *regs,
>   		rp =3D VDSO64_SYMBOL(current, sigtramp_rt);
>   	else
>   #endif
> +#if defined(CONFIG_PA11) || defined(CONFIG_COMPAT)
>   		rp =3D VDSO32_SYMBOL(current, sigtramp_rt);
> +#endif

This is wrong (dangerous).
If this BVDSO32_SYMBOL() line is left out, the "if (in_syscall)" below
is put together with the "else" in the VDSO64_SYMBOL() path above.


>   	if (in_syscall)
>   		rp +=3D 4*4; /* skip 4 instructions and start at ldi 1,%r25 */
> @@ -514,10 +516,12 @@ insert_restart_trampoline(struct pt_regs *regs)
>   			rp =3D VDSO64_SYMBOL(current, restart_syscall);
>   		} else
>   #endif
> +#if defined(CONFIG_PA11) || defined(CONFIG_COMPAT)
>   		{
>   			err |=3D put_user(regs->gr[31], &usp[0]);
>   			rp =3D VDSO32_SYMBOL(current, restart_syscall);
>   		}
> +#endif

same here...

>   		WARN_ON(err);
>  =20
>   		regs->gr[31] =3D rp;
>=20
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260428-parisc-compat-vdso-956b2a3a2123
>=20
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>=20

