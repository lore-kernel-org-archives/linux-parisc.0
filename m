Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9D2773D8;
	Sat, 25 Jul 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785009876; cv=none; b=FIh4VcgruByL0WdDOioB23qyjkdjSRjFaSj+LHaDOaKnxtv3o1cG4toHE/k+4INThJdxKSdBqX6Dc8d1rXE7w5dZmXS3N09kzcgHOADhrw+HQ2VMnoDEqaVtNDw8d80OorC3dltPEHKWVsDUdOwAYeK2SJpXrD4pQ0r2Lyku5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785009876; c=relaxed/simple;
	bh=yC0b3TQloPzW/oKuurZGhJzFnHdbqjUqzAO9HoVGo4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ouj5mENRTY82FI6QolR2+wJXqg8MQC1JslQXFM8V+sVtd4hhkv/468HMS2Lbgm3xKPsx3QAw80bAbpNTZnFnv3lvOUYrAhutAuR6MFKYDlOWYqd/UO/wb+XXtLL/aO3Kqe5Px9vmre6ahXeVFZwvMd6RQQFyVpMkjYxBouea6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=cgA0q1Re; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="cgA0q1Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785009863; x=1785614663; i=deller@gmx.de;
	bh=75w/jARfBfGHDEb1Bo+7C+/NMI/M7VgGmcNm29baMl8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cgA0q1ReafVrMj1Vf5ElHnPQH3gWwFDCoe2izUkmdVrQUtMv8EKuS0hWTZ6USDgb
	 PB90+JkwIaeAyb+TTUMzqh+SQrWER9jOulQrZx3NtzS6rafsNQYS6b0PCUmGh6vHt
	 wTtJVXaCk4eMAxRg2+fQn6Ad7AR+09o0yw4JbhFRaMa/9BtYyk4iUGFYIHT5wz7YU
	 Zglxub9eMGzs+TzV4flWDcM+unJeVb+QwwDl3Tgx/TOR477qTExrBKUKD1Z1YcSi8
	 8ewzoHmP6Jw4Mlk1nZ+l5Cio/CPwFTKUfdNSabGq02efmtMxu63e2rS0kOUkrcBb8
	 1vyaEhf1iCOGBGf2AA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1x34iE2nof-00uMoC; Sat, 25
 Jul 2026 22:04:23 +0200
Message-ID: <2edb44c9-46d0-4f98-9588-339220ad3c74@gmx.de>
Date: Sat, 25 Jul 2026 22:04:20 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] parisc: Remove unnecessary NULL check of the
 kstat_irqs field
To: Radu Rendec <radu@rendec.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705210951.2717741-1-radu@rendec.net>
 <20260705210951.2717741-3-radu@rendec.net>
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
In-Reply-To: <20260705210951.2717741-3-radu@rendec.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mKbqjQ3e5dKxvBQqQOKumm9Eyx/vadQj+efWcOVd+Bm/Ve7n3TM
 RrfncK07GiU1XwDXzwFokS+26d/GdMWCHRhwgHeyQim7xM17yxHzeW/b+4wKXlz/FQgStoU
 4/PMqxgqFKj5UIWHK6Y3symJkUzvPTxJpn2FqBxTr5SQw/dfdAYe9fYRAXreD3JS/upU8mC
 Mum+mlQOjsM/yl0Z7DKmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6zeVYeCoc6k=;nGRNftl+d5ItqNL8kuGGGgi2io/
 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
 lLowmTSuDiCySqhBU5Nhc

On 7/5/26 23:09, Radu Rendec wrote:
> The kstat_irqs field of struct irq_desc is used to store a per-cpu count
> of interrupt events. It is initialized in init_desc(), along with all
> the other fields in struct irq_desc that need explicit initialization,
> and therefore it's always available (non-NULL) for any valid interrupt
> descriptor.
>=20
> On parisc, CONFIG_SPARSE_IRQ is disabled, interrupt descriptors are
> allocated statically in the irq_desc[] array, and kstat_irqs is
> initialized implicitly to NULL. The kstat_irqs field is initialized
> later, for all descriptors, via start_kernel() -> early_irq_init() ->
> init_desc().
>=20
> smp_boot_one_cpu() is used only for CPU hotplugging. On a SMP system,
> the boot CPU initializes the interrupt descriptors as described above,
> and smp_boot_one_cpu() is called later, for the secondary CPU(s).
>=20
> The previous patch in this series makes a similar change across the
> generic IRQ code in kernel/irq/irqdesc.c, and provides a more detailed
> explanation of why kstat_irqs is guaranteed to be non-NULL.
>=20
> Signed-off-by: Radu Rendec <radu@rendec.net>
> ---
>   arch/parisc/kernel/smp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Helge Deller <deller@gmx.de>

