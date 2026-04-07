Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06D372B38;
	Tue,  7 Apr 2026 20:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593239; cv=none; b=pc4ZpAZehJmOTWZ8ShlKseBcr6jiLeGQCjDVSblai2rswUBexUH6F/nIrtf+aIK7DiKwfVqyI7Ucx+Fgu3vfKrP5+brL65tSjqnJLi0AZLsevzx9eZnQRVDdXPP518eYqgKifPqbbUhMbE8yxOrcf8sJwwd03eXfiCXN6prJI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593239; c=relaxed/simple;
	bh=LQMKY4gxA5wDuL3PLkVQ46JKwkreyybgAcDiUcZHlMk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HA1IfZXMA7EE3SQmkT1PTJaLLpa8Sxssdu2fiVLt7dbxmgLwiGtsTokAnYDAVXC4+6RZRmsms6Vj3wllGcT3cFAHjDhMXeQcbl91dTKgPm0I4Q/a5pVlq0KjyIACSiwLjql+82SsBASBnl44JxiF7o2zosVvucoEWLhkWLFmYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=flDLVDJg; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="flDLVDJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775593235; x=1776198035; i=deller@gmx.de;
	bh=LQMKY4gxA5wDuL3PLkVQ46JKwkreyybgAcDiUcZHlMk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=flDLVDJgSAmJDDJGr3HY27Mj5+1d1vVnxx+g8o/Uwg+SdpgWNO31kX1vl7rvNpdJ
	 JPH0LUjbV9B5pVdrJTrCUc5IQ6ES2VOtpcYYVgFcI8/5YYdtM+6G0VBbkWqt2PIzx
	 GeVI8s0tI2ykeYWQnJinsRfgOWDArmLlsw8HdMJ2MuinPZYZwj0yRz3u8DS5FieWI
	 1kIToIY0jRq1+BjOiZtFIJT8WmveF0ajnl+r1WE4w63vQxV1cPJCe/hg3XQXQ1S7L
	 HvLCoVXChM9vSVbqaKu0XoyuUvkQo3EGrrJWUy0hul2mhvAtdQMJPoLIgXQhGHxvO
	 ab/+IY31lGRA4+VsPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1vzP213paF-00VKxy; Tue, 07
 Apr 2026 22:20:34 +0200
Message-ID: <e91c3d3e-2214-450c-a212-1baab9dace4d@gmx.de>
Date: Tue, 7 Apr 2026 22:20:34 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build a
 native 32-bit vDSO
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
 <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
 <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
 <b6edb6aa-76a6-4f66-bd04-6a2163591990@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <b6edb6aa-76a6-4f66-bd04-6a2163591990@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W+qPErjf0URwLGaEonTE6rfZBe1ikoKZHXMbq2nF/51EmKdfn50
 KwWFRd/O82noY1gCAnNZvij+YMoFjBsYbu5u6PyoX6m7oipDL395N8KFr4Lz7ijQuffm1jt
 7H6S8g/waBKlibpH4b7jCbn7dZDouBIcjzn7QCU27NSRcog4Jj7NwEHRYkB8t0m/5+Sri+2
 EgtQcPrWKmYzb+g4Y0C0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8J+xYbxFnN4=;hFPn9cut+X1QBsjDze2krcAzjRO
 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

On 4/7/26 21:27, Helge Deller wrote:
> On 4/7/26 20:06, Thomas Wei=C3=9Fschuh wrote:
>> Hi Helge,
>>
>> On 2026-04-07 19:14:23+0200, Helge Deller wrote:
>>> On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
>>>> When building a native 32-bit kernel $(CC) the compiler is obviously
>>>> able to compile 32-bit code. There is no need to force the user to
>>>> configure a dedicated 32-bit compiler.
>>>>
>>>> Use the regular compiler for the 32-bit vDSO when it is sufficient.
>>>>
>>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>>
>>> This part is quite fragile, especially since the kernel is often also
>>> cross built...
>>
>> I also used this patch during cross-building and it worked so far.
>>
>>> I can add the series to for-next branch of the parisc git tree to see =
if this
>>> breaks somewhere. (unless you take care of it at another git tree?)
>>
>> I'd like to take the nolibc patches through the nolibc tree.
>> If you want to take the Makefile patch through your tree into the v7.1
>> merge window that would also work, as I will only apply these patches
>> for the next v7.2 cycle.
> Ok I'll add patch #1 the to the parisc tree...
As I assumed.... it breaks immediately for me.
On an x86-64, running "make ARCH=3Dparisc palo" doesn't work.
I think you set the "CROSS_COMPILE" variables. Just leave them out....

Helge
