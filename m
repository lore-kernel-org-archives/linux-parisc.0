Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0936BCC0
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775590870; cv=none; b=KuXgUPeSr5rsKDcnE5EK07TJ9hf1RvrhUr7ppUGJ1+ICJp/+GEh+EatlnUO62/zOIvV9XddPZ3jDkta72e9zbNil0pDlI+Ffi6y0zy4zXJunWF8WDLs2l+u7TVsdyti2vdlAkv+dOcZ51b0JDvuPQReCzNMYiNcBccKyPvOa5+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775590870; c=relaxed/simple;
	bh=x0O1H0Mteo8ZCcUVShWseFec9hS8E+zmZFlGaVyQhtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TlAPhoWNpolU3Rw6jCYKtdPZ2EV5SDzMa9BggVNK84pfTXsyXJb7k5zToAX97O+qiRqe3iPL529j4HFYDsIyocb2mGuFmeZa4amyygpkasfnLcgE95f/wTjNN34NOeHFX30wPHYXi00yZy1uHgSLeG+IUN9/7Kl8c08m99xF/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=OrBLlF2j; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="OrBLlF2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775590862; x=1776195662; i=deller@gmx.de;
	bh=dlb8BscUE6XFmjiQsxPgyS1MUuHKuZKAyRHGRNlBlA4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OrBLlF2jCKrz15BClt/V0vJeUEYP/9ukXcFQdKlMFDJ6rnWT7PsJObIO2RXX+SYN
	 YrL/AOjeuF7WqCOLMY6aXWx1UCRqK8NwLsbQ16NDOlwBwWJkwNNGY3p1nkdDBbktF
	 iVwHRAE0rKER+Jqg/bXGvpg7qSZZ1I3qv83jNbUxSUc1c79rDl7xQi5EHm9K3DpS9
	 crNUgN9fr8HBtomWOpBj9/wcFIcxs8dmqgI/7oa3Pzoaqw5ZFnUCz4YjNOutHKMe8
	 i6kJgRbR9o/qOzAk9L3xutnKKx4jCNj64PkGBylVjn5Qs5M7pojrd7VuZsHe/7Wm2
	 R4NQE2jEeR6sw8uG3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1vPFUA3v0p-015EJo; Tue, 07
 Apr 2026 21:41:01 +0200
Message-ID: <2c04a461-9f41-4159-9cae-9fdaf171d93b@gmx.de>
Date: Tue, 7 Apr 2026 21:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: update outdated comments for renamed
 ccio_alloc_consistent()
To: Kexin Sun <kexinsun@smail.nju.edu.cn>, linux-parisc@vger.kernel.org
References: <20260321105831.7293-1-kexinsun@smail.nju.edu.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260321105831.7293-1-kexinsun@smail.nju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MOqePsMdjJTaif9vwyfaLcuOD74AB6ZBqR0IYiTE5kqnZ1qVliv
 CVwRAuzQEZQBd8yggkCRN153i5hY3+WPI3i5WfqqfQRo4lnTPvA7mkk2Y6Mrek23VKj5FVM
 KMb8Iol3wNRXp5/P338DscJ7DDmT5HRwt88uddB2QvHnDl3sWaeMhbHXhgJW0eIAix4I4ws
 VyrHjjKT5LT9hVsvbH40w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jr6FvAj6RN4=;Or6wm4tZGKHunvycIyzKfFTRhwn
 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

On 3/21/26 11:58, Kexin Sun wrote:
> The function ccio_alloc_consistent() was renamed to
> ccio_alloc() by commit 79387179e2e4 ("parisc: convert to
> dma_map_ops").  Update the three stale references in
> ccio-dma.c.
>=20
> Also replace the obsolete PCI_DMA_TODEVICE constant name
> with DMA_TO_DEVICE in a nearby comment to match the code.
>=20
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
> ---
>   drivers/parisc/ccio-dma.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

applied.

Thanks!
Helge
