Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF3A283FCF;
	Mon,  4 May 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888169; cv=none; b=b6piOl/+J5NU3OF3Coanm3sBou+0awYFE18QvG7wk/Bic0WvuAdoATUZ9HLTzIfW0/N0nRA7LQ8uZs06YkVEVq7PF0QocnsCuWwiRAwCHRASwERvyORuJuGJLAh0fJ1LnUw3eytk9KWcnPEBKqVMZy1GZKM0LgwygO8WPIOr050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888169; c=relaxed/simple;
	bh=5SA8S0FrtnS8AI56yJsvM7v9nuz9awCLIl0tcXK6GyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx3jG77tiy/LM3VS0iTL2g2aSkbDreFVp+zbhDviYHOTvxQjDjGslwDf12V1KCF8QVJ0AgrweP1ciwwM0KVWJGa3lSq6eDip67w1Q6wO4m4H1MgHNKF/U6NsnTMB9UlN7kfUeNFon8rwwBEuRIFOG3GriD3ZVVmx+5XBDCG1NkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ozqixwwM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ozqixwwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777888160; x=1778492960; i=deller@gmx.de;
	bh=fvLm/u2Z6ezJcp4RLcH1CtCPC3rDS2VPhqz9frlLkWo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ozqixwwMRnOXMiX2QGfljGkXwJWPmnAXxyrYviZXgRf59xH+PET72uGd8Q9RHrgt
	 KuGDaKHYfNb/iyKSpREQ/00hmZpP6NuwoA8JyKobGUrPRMRNGlxIP6FMWRBCWPv4q
	 N9CnjIzxnsGgx2taro0vQm84rPgVu4W3jSpI1rcRL9P0x7T2fCMYZABkZy8cAPw+j
	 E8r5KuZTz+SK7U2gqwwz6cqSfXHXua1AAvucwnM9dzMbine6+2WPouxTAqCqdv3sf
	 zO8Q4sNFaC9evzfugpEbnivJYEKLWuXJDMfBnoME08owVJ1HY5vNsFD2qbcuJb9xl
	 OkQVzUI5TTUoBBI0fQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzOm-1vwgMd3Fc4-00Ueci; Mon, 04
 May 2026 11:49:20 +0200
Message-ID: <8c495765-4e5f-4058-b6b8-0ce657be1388@gmx.de>
Date: Mon, 4 May 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] parisc: Fix IRQ leak in LASI driver
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
References: <20260503041744.201647-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260503041744.201647-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V8KnGk/Q5EClkLCrXAxkxdTSTWJdNa7VKIpdr2V5KkjWSat3Zue
 qQB/jem5beoGpT281OLJ5k1LKX6uMzNs6hcXSC8OmW0YD13zO+FLUPpcgX2my7yWrucsFKn
 G3GhgwVP1FhpluqA9NrxAkGHVSGkfsoA2/mbLDqqFV9+EEdqaSCDkZtHMXIK7U+0HIdNXmi
 DZm4egA0l2Wtgxq4GlxDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2PvEwxO5a10=;M2F/5LBVbi6lQlh8PdycnFcUjb2
 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

On 5/3/26 06:17, Hongling Zeng wrote:
> When request_irq() succeeds but gsc_common_setup() fails later,
> the IRQ is never released. Fix this by adding proper error handling
> with goto labels to ensure resources are released in LIFO order.
>=20
> Detected by Smatch:
>    drivers/parisc/lasi.c:216 lasi_init_chip() warn: 'lasi->gsc_irq.irq'
> from request_irq() not released on lines: 207.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202604180957.4QdAIxP6-lkp@intel.com/
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   drivers/parisc/lasi.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Patch applied to parisc git tree.

Thanks!
Helge
