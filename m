Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705024;
	b=YDdpmfQHTA/5/QQuz1uHqq19yIsmnrcAfFLgihDIjl4BNhxqenTWbAxg2OqmSVDeQGCP
	 z+1N0a1RWplRMagE4KD/9BnbzCgNw7R9CQRwboClupsEGGNHqBIVoeJP2KC1VB+kWydTO
	 mKfCElcnLQbEgbxsf3gWG6qBELf5X92mPKnzmLUb9jOVGhsUnxuSN7PWPjSi6ox5sAdhk
	 /lRW6BxFHZTSdwotDcZujp71YE0sz5VjGpYCfLHJGmPSPDYdUUcrSUD6aVcLTEiPPkXyD
	 Qa+Xkxu1WoLt8oaeGIPr2bN/ooGpupRd9Z3xPNx+ySGJyHgVt11FcYRmwVYGR91GnEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WPmLxcUOS2MjTieqsk/ACTfZcQ2csAhtOLzZkBL5tzQ=;
	b=dXeAVxLqoVO5Mow+z10EMDc89g6cA/iqE7Zsg30I5qGJ2AiIZ7Lnyue+L1QiGWMFtAdn
	 XuhwfAAqHqOnrsslBH30GuPHbE+owjs28tM8DAq/PIr+xXsJhJmg4KO5W2fpjyYijxSD3
	 nf5qKWa7YgU/+zsfwDg4PC6slmL3JP1bYQ3SUYRyJ2aV4n/pQa/iD5FshoPKeP4OaAUOd
	 1Azk2Z0jIGy8xbTa+N4EQFI3pRs9BCiWdLEcXtUl2M4GY41qnPTJXP8gJuZuPP/QDAo9f
	 foG/2H/vAg4pKVHuiv7YgRcsd4/6qIwUBxrbcKAp0jgk6cINSMq4zWQnU9HloWKJWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PSw5wKxK;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0733606A31A
	for <linux-parisc@vger.kernel.org>; Thu, 22 Oct 2026 21:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0733606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PSw5wKxK
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so294916c88.1
        for <linux-parisc@vger.kernel.org>; Thu, 22 Oct 2026 14:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705023; x=1793309823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPmLxcUOS2MjTieqsk/ACTfZcQ2csAhtOLzZkBL5tzQ=;
        b=PSw5wKxKOwWGlTBLcZFtc5OruGPjZjZZV3QfKs7G43LUP59eVRuDtmCEL6PbDaJKdv
         8CcMjZ9Yn+iOGi7vD0bXJ5q+NQN60ulLHOXY24h4RGA9T1nhANd9Aw5M43PX7ADm7sWr
         YSXEJepUGsbHR9RXKaTeHIXPC0ITfrY2BEKrfnb8J0gg/weyskWPwsdcL7cJIi3Ccwk3
         rXv7drmK/H3wtrEvYBk0s+A2KGTE4lQpzDS1o7AISsqhteg97NCrK+LZ/tFxwvtZKPH7
         LAcNaqeazy3svfJernZduJTCg7RJay/sqP1mIP8rbemKJhlNXT+vfEkh3UH3PPLUUJK0
         yGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705023; x=1793309823;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPmLxcUOS2MjTieqsk/ACTfZcQ2csAhtOLzZkBL5tzQ=;
        b=oI6nHowa8B3k9/Q2zWudi5pdxn+Xm+p00FQAvADInObYkY9p/ZVy9+SUP5M5uWp2mP
         cxnlHJnEyVKyG64mFa4RwVJJWGHo6m872nmrq7Xqzpv370CGioQwQtcd+qc1kKCFfjwa
         CvNWJjhxwQBNdcMUD4QJdOfWDT/lfO2IF+wafQnxL6c4XwYDzhij478XAEY4krYm/B7B
         DQE2lDrktq0UvyA8hreS/NG6XMFvME4LiGGhFI2QO6estmXWmCSTHi0ccHWwXl+IH58q
         EATdnKiYo5R2lEitSFJ4PUzDVw7RZUJPE80m1FHERCf9bs7J9voYyvFrhmYM9I05Sr7V
         l6DQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3JzsuZloTFFrCQsTsIgQFx3r0pz646TwUGB3/J/UVQZkWpJ1EwA7GnPpPE66vnlCMMooG2t+4vzwZsCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC5rgEKir0Hk5SMRXJx0uvRrMD2YmYr+wR4rbEznoFNbkv6iN/
	Qw4Sz5uxMy7/z+4FNec5r8omJa0MP3u2uC51UufMRlWB4z3gU64OxqkY
X-Gm-Gg: AYBFou0rMBdPezVf9MhtCwg6nLhyBM/nL36XFecvzzPYJgDAZoSefhazX3NI8fWvb4l
	2lNHVn0ePOw4NpMKD+c7ErhQ47yiM8N7yavu3CG0cjuvA98gzLYyrrybSr817qpArkTlgDXUCqk
	9bokqtpG8X5Wdx52MYRZGrFolHQfAdROy4sUPg7hAE3b+OffzUk5YAwjR7aVMqDpfc9jMUaXfv5
	vyZUPWXLHMRq6Lb1wiWhH2ByO4eK2uONpNTubxiWsBo2LP2hrEvm0xsYVpCS8R+Mv23XE8srG/E
	xUTkVBwxMUjCg7sOcNxxMnAh+2QXBZI8T3SdgFq/3D8tZzhQ76Cy3OHkntEXZd5S9odlDafYHMH
	YB6mYS0RP6R1TWKWTqm4dmo95iO9CUUliC2M8XU+4ie7qpUjaEkDP0VE2ECFA2J7btKTLFcSBn2
	sL0v6xzuOqU/eZznlmse2W2dLjhbgsXqONn+BpnRrdyXoLyhj7A1EUZZhJ8W+sTZEb3yUlXRF0f
	dUl7HMH3v/NwmBoqsZr+f1q56bXK6LDAF5nn5eFNQXtz/pmpk9j3YdppyL+t2dqsZ8JwMsREs3p
	+EQKs5/IVhlYDBkrIiLpoNi7kTlQYZaWDljSDwDrS2jVyBQtSaM=
X-Received: by 2002:a05:701b:4250:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-195997fc2dbmr803344c88.33.1792705022685;
        Thu, 22 Oct 2026 14:37:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eca18b99sm562743c88.20.2026.10.22.14.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <68e415b2-20f1-44ab-9f36-f591427677f0@roeck-us.net>
Date: Thu, 22 Oct 2026 14:37:00 -0700
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crash when running 32-bit kernels on qemu with C3700 machine
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
References: <b9a0a102-701e-4160-b15e-ddf053f02775@roeck-us.net>
 <24e7f55e-b847-454d-b6d9-13f598635c4b@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <24e7f55e-b847-454d-b6d9-13f598635c4b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 13:42, Helge Deller wrote:
> Hi Guenter,
> 
> On 10/22/26 17:32, Guenter Roeck wrote:
>> as part of my kernel boot tests, I run 32-bit parisc kernels with the C3700
>> qemu machine. That used to work fine. However, it started crashing a while
>> ago.
>>
>> [    0.259126] Backtrace:
>> [    0.259266]  [<1010653c>] alloc_tree_node+0xf0/0x1b0
>> [    0.259743]  [<10106778>] alloc_pa_dev+0xfc/0x274
>> [    0.259912]  [<10106118>] do_device_inventory+0x190/0x36c
>> [    0.260095]  [<101050e4>] parisc_init+0xa4/0x178
>> [    0.260256]  [<104262cc>] do_one_initcall+0x98/0x510
>> [    0.260438]  [<10101564>] kernel_init_freeable+0x29c/0x34c
>> [    0.260623]  [<1118f274>] kernel_init+0x2c/0x15c
>> [    0.260799]  [<1042301c>] ret_from_kernel_thread+0x1c/0x24
>>
>> Bisect points to commit b8425ceefee5df2 ("parisc: drivers: switch to
>> dynamic root device") as the culprit and, indeed, analyzing the above
>> backtrace shows that the "root" variable in arch/parisc/kernel/inventory.c
>> is NULL when the crash is seen.
>>
>> However, as it turns out, that is not the real cause of the problem.
>> The actual problem is that 'root' is overwritten in
>> pdc_system_map_find_mods() during the first call of mem_pdc_call().
>> Apparently that code (or, rather, the firmware) writes over the end
>> of pdc_result[] and/or pdc_result2[], and the 'root' variable is just
>> close to those arrays in the memory map. 
> 
> Nice analysis.
> I found a similar bug a few weeks ago too. Not sure if it was the same one.
> 
>> The following hack "fixes" the problem.
>>
>> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
>> index c35a34809743..ae172a78f893 100644
>> --- a/arch/parisc/kernel/firmware.c
>> +++ b/arch/parisc/kernel/firmware.c
>> @@ -74,8 +74,8 @@
>>   static DEFINE_SPINLOCK(pdc_lock);
>>   #endif
>>
>> -static unsigned long pdc_result[NUM_PDC_RESULT]  __aligned(8);
>> -static unsigned long pdc_result2[NUM_PDC_RESULT] __aligned(8);
>> +static unsigned long pdc_result[NUM_PDC_RESULT * 2]  __aligned(8);
>> +static unsigned long pdc_result2[NUM_PDC_RESULT * 2] __aligned(8);
> 
> Of course I don't like this hack, but instead would like to fix the issue.
> 
>> Questions: Is that a bug in the kernel or in the firmware ?
> 
> This is a bug in the SeaBIOS-hppa firmware.
> 
>> Am I not supposed to test a 32-bit kernel with the C3700 machine ?
> 
> Yes, a 32-bit kernel on that machine should run fine.
> 
>> If so, would it make sense to prevent 32-bit kernels from running
>> on that machine in the first place ?
> No.
> 
> Which Qemu version and more important, which SeaBIOS-hppa version are
> you using. The SeaBIOS-hppa v26 should have the bugs I found fixed.
> Looking at the current code in SeaBIOS seems OK (Search for "PDC_FIND_MODULE" in
> src/parisc/parisc.c).
> 

I tried 10.2.4 and 11.0.5. Trying with 11.1.2 .... ok, it passes.
Guess I should have tried that first. Oh well.

Thanks, and sorry for the noise.

Guenter

