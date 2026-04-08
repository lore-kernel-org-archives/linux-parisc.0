Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AA3D7D60
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662844; cv=none; b=iwi7fAA4QDHOdv380c9dH6aCj9qLuZ1u7DY2C5gvrqWvEHM3FqO3Z4L6BYQRpwCUVMye1k8NRx5lE03fZKU8HQsQigg/EBky41KprvGEWA3IwyG3+yl3v1M48mbJEC7G9a3XPW0FVRhJFRerA8Jo777hHj/YH+BNgqKYeKebtKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662844; c=relaxed/simple;
	bh=jdNqLLswlFWsxidy5c2YDapEZ1wFkRP0fi9hQdLpECU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PR9aLSNZXS4vZbe/H/XphtABbu62Au1i+Hk50tYmnKPHJlHneSNmltDm8sVo7h1GgofSuC0PGzFo7yhPceORZWamDSxFVM7JRy0P6qcghdx0aTvb7cggDNIeFUU/mD+yK1un8/mY1Xo1Vo4MmkwakqmfMZhjdIeKKlQ8zWi7dKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=FfMrHByl; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="FfMrHByl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775662831; x=1776267631; i=deller@gmx.de;
	bh=X2BnH8ldinnyog+dVl03SstgrYgDEw9XSFifXm2Y7zs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FfMrHBylkvGK+apOAk3VGp5/m53G8hjFIWIjW1tDyRRVKwYbOOscvUGQHLN1zdYJ
	 4xadEEP7A2DGtns92msyZJiroCu+tsBdOKRQNEapIqKAlZAitrRdwstzrLGNG88gI
	 hFnidLIWOglS20TvhHxPmsLedL5gEoeb1lc+DKIcjgjzajOlFWFXzi89roPsPrIag
	 X310VKJU/2nGCSFJKscZBU5bveyQiez8Le+YG65L801LDpIXGef/An36r7flVNimv
	 MUltvWAw3h71bo2UaYxGCryrgYB3olquKoqtuchY4Z9yP15lZw1syiS732OLv07zI
	 HD/DkWBzLtCUaN0bOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCOK-1vnJIg3MKy-00JyQV; Wed, 08
 Apr 2026 17:40:30 +0200
Message-ID: <37bfa178-8364-41a1-b871-71beaf8e3a98@gmx.de>
Date: Wed, 8 Apr 2026 17:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Helge Deller <deller@kernel.org>
Cc: linux-parisc@vger.kernel.org
References: <20260407222714.178861-1-deller@kernel.org>
 <befbf96a-6a06-4f7c-96f7-12475ca867ee@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <befbf96a-6a06-4f7c-96f7-12475ca867ee@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SMcNwHVO2qm7ooDadKe/i87Hk094J3+fqgOw7T9XjefQSKlPE2l
 jSjJM6b8o/gP5LuY3e4B6xF2S4VuK1NQn8RYhCwLiYmDBEGZAZmYknoCedTY7X4izFZNHus
 7w7fenl2OqFxzqsTSdDh4ELGfQAeMhao7sKdIXIN+R3gylOHeYHTwkwcRpleY4JTrEFd918
 GAPm67yJxeMb1vQhr7GEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q4lXQy8OykM=;swDLsHm2iXG98NRn971eqXfp/tk
 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

On 4/8/26 17:22, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-08 00:27:10+0200, Helge Deller wrote:
>> From: Helge Deller <deller@gmx.de>
>>
>> Drop unnecessary code and syscall tables when we run a 64-bit
>> kernel with conpat mode disabled.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>   arch/parisc/kernel/syscall.S | 11 +++++++----
>=20
> The series currently does not disable the 32-bit vDSO when
> CONFIG_COMPAT=3Dn. Is this intentional?=20

No, but I had not yet figured out how :-)

> For me it would be convenient
> disabling it to avoid the dependency on a 32-bit toolchain.

Right. Will try.
 =20
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.=
S
>> index f58c4bccfbce..bc5421ca537f 100644
>> --- a/arch/parisc/kernel/syscall.S
>> +++ b/arch/parisc/kernel/syscall.S
>> @@ -241,7 +241,7 @@ linux_gateway_entry:
>>   	/* Note!  We cannot use the syscall table that is mapped
>>   	nearby since the gateway page is mapped execute-only. */
>>  =20
>> -#ifdef CONFIG_64BIT
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
>=20
> Shouldn't this also be just plain '#ifdef CONFIG_COMPAT' like in the
> other patches?

Yes. (will fix both),

Thanks!
Helge
