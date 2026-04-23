Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BC3D994;
	Thu, 23 Apr 2026 05:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776921848; cv=none; b=Pc7U0YQTMLUGSO/TYE4b6i7a3D7DSzUF40JjDQYIOmll5qMWjtVZhc3IoffniBus2PfJlgmTQgSgGC2r/8fj/qyukmlZ4kDgABK7bW3wx6pY8M7mdcRYKBMz/nvJX95omwkZXu1pN36PZvw/rjNUDBPcBDQARyYn1e9jEdah3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776921848; c=relaxed/simple;
	bh=7TEw+/yz/qzu5bAnkuu1LFWesAIgTB3HMDZulDr8t0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P10SVYJ/eNHAKVvnvTUl460LrCbLECWsdN5BgrpZs/88so5dXUEUC97UPLsPUgOHL1+hpKY8pDvADwlIDLazrR5IZCjIcfRJGL+vYPjhhCLDWZpU+Bnt6Mq8Tm05SPar8+dojkuFAivztgR7typ87d7+p6csJLvKbVwJ4Ocq00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cvtq2KyS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cvtq2KyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225F9C2BCB2;
	Thu, 23 Apr 2026 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776921848;
	bh=7TEw+/yz/qzu5bAnkuu1LFWesAIgTB3HMDZulDr8t0A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Cvtq2KySs1xJrj4Wb9TdHeWK+7LRBEWyQWAJwAQ68pR3ggA4x2N1zQhRZrOB1+pnb
	 66wgR9G3KZSrG2fLcG0POCkgcsHi9uq04J+ThLP32HHJCvcniAmB2hHyiyHhBGySsa
	 ViJQmMIB91JSQdVfBcHGbXBDhparQLsdaGK24WUwRtsQTqWDNjVHIvGNhxMZF7Tln8
	 9eTQRnCsrO+hfD3FKkspjNJU16hgEjnaQ/zGWY3ny7oXqOh3tBi/Hf4mRI7u07KHHJ
	 IFaXlixxRmE+iOJBsMD3ZTjM/YhwhZjKB5O8dWibFGdSmdc2QhVRR4BPWLvyMl6Gd+
	 p9Ll7JrY/homA==
Message-ID: <f3cd203e-0acc-4b5c-b590-145c0e82c768@kernel.org>
Date: Thu, 23 Apr 2026 07:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: led: fix reference leak on failed device
 registration
To: Helge Deller <deller@gmx.de>, Guangshuo Li <lgs201920130244@gmail.com>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415170515.3605095-1-lgs201920130244@gmail.com>
 <929ebeca-d070-4537-b3f5-3a4c93f1301d@gmx.de>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <929ebeca-d070-4537-b3f5-3a4c93f1301d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17. 04. 26, 11:39, Helge Deller wrote:
> On 4/15/26 19:05, Guangshuo Li wrote:
>> When platform_device_register() fails in startup_leds(), the embedded
>> struct device in platform_leds has already been initialized by
>> device_initialize(), but the failure path only reports the error and
>> does not drop the device reference for the current platform device:
>>
>>    startup_leds()
>>      -> platform_device_register(&platform_leds)
>>         -> device_initialize(&platform_leds.dev)
>>         -> setup_pdev_dma_masks(&platform_leds)
>>         -> platform_device_add(&platform_leds)
>>
>> This leads to a reference leak when platform_device_register() fails.
>> Fix this by calling platform_device_put() after reporting the error.
>>
>> The issue was identified by a static analysis tool I developed and
>> confirmed by manual review.
>>
>> Fixes: 789e527adfc33 ("parisc: led: Rewrite LED/LCD driver to 
>> utilizize Linux LED subsystem")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>> ---
>>   drivers/parisc/led.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> applied.
> Thanks!
> Helge

Unless the static pcmtst_pdev has ->type->release or ->release set, the 
patch triggers a warning upon put().

platform_device_register() should be fixed instead.

See also:
https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

thanks,
-- 
js
suse labs

