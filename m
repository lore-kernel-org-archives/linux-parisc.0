Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0539B943;
	Tue,  4 Aug 2026 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857659; cv=none; b=dTJw9D41snNMDAcOHYgxTUViY1Emo1+4cbm2b/y7949HyEuOcKc8JJdUUevMHhvSairPQTa3n9B43Q46b6ehAWiMd4pMxZ4DSvg/BSYonfC1zJfN8cdi8Wn0KKBL55EmhX5hZprgijmdqm+HBXLGVzs+BvniQvibGjL5NfBzqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857659; c=relaxed/simple;
	bh=6SQtmNHJ2hPxzlhOBXX95xj5A9SN1Q0of3pqhiZKmn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPdpPM2ST+cABkJp+paU08bG+ZfNpgxjwqgW32Yy5T7QGmSI2NcJnj+bmh85mcDOgEpWp/nMANX5V8ZMwTVlehyB7aqO/gOzO9SBtogXGolOV/ak9bTLx2qPq9pCKSaxPnPIRKPwjAUV8n0I7vxfMH2N2bSLxSh6WpfYYUJ4HcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=VpT1oM3f; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="VpT1oM3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785857655; x=1786462455; i=deller@gmx.de;
	bh=dhlweY/T8spEJgo6wbTHfkifo6EXfHV/By3ptSId/3o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VpT1oM3fxpVx1cMipbjacZMJj0/GwUnHDARd2GoQQeKcf3Z1vAwMAiH+JLmH9AHo
	 7eyYgYNk95MvM0kjGdVlIQ6DWxvFTfjsj/KQF/JwKD8w7+73Nq5QG6+lpiTGHwIrQ
	 NjfoLbf2g5t4zqgu3g8e084p78ndr/E+HPlZUCLRXTlrHOtnW3c/hUZmHzZ8zUANq
	 His8hn9VKxJ6nS1nktHz2/Qi5Z72ZjCIA6Wx1AbYa7tjnfVqeXI2jmPyE/UrJZGQa
	 wJK08nUdE/QvE/XVmdyXumiyGzZqxx5pHdHln5Gv50BeaSmaRH2NPGE7yyc7kPsld
	 XINSvoMffqiY3/zK5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSbx3-1wTSs33pNZ-00RJii; Tue, 04
 Aug 2026 17:34:14 +0200
Message-ID: <a6b6e412-2f02-4016-9eef-255b8a99bd3e@gmx.de>
Date: Tue, 4 Aug 2026 17:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] parisc: Use asm-generic/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804152953.136376-3-thorsten.blum@linux.dev>
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
In-Reply-To: <20260804152953.136376-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0Zmu9LO5zi6ySy2Hfj6HJzA2zxoW5Kv8JyQGcOvgmdv3c0ia3CB
 ajz01SQlOT/h68pr9YE3ruQdHxjukOzS8ONqrmJbQF3QMO4WmEOXK/Kojr9A4hvtqj+OghB
 wkGpzNgz/T3saRySSrQI4RE1jHhYmnlFMMytQZfpk9sffX5wfX4C6F1h7NsX0GX+nGHZulq
 ZHylrbFafA/JCIVAdOS8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cn3Petucg8g=;jDV4/s8Pdu/FKeRM1d6npB2Ednp
 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

On 8/4/26 17:29, Thorsten Blum wrote:
> asm/serial.h only redefines BASE_BAUD with the same value as
> asm-generic/serial.h. Select the generic header from Kbuild and remove
> the arch-specific header.
>=20
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Delete the header and use Kbuild instead as suggested by Helge
> - Reword subject and patch description
> - v1: https://lore.kernel.org/r/20260804132051.104647-4-thorsten.blum@li=
nux.dev/
> ---
>   arch/parisc/include/asm/Kbuild   | 1 +
>   arch/parisc/include/asm/serial.h | 8 --------
>   2 files changed, 1 insertion(+), 8 deletions(-)
>   delete mode 100644 arch/parisc/include/asm/serial.h
applied.

Thanks!
Helge
