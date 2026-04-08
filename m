Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031E2BD030
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672119; cv=none; b=NdJ5KROc4B/V8tJjtqx8DTb9iYQ+wBfQ1jXxdqrHTw+KusOYsRF42HpC5nBFXfe2WiX9lCOZ2X0C4+XL6mGgHYtvlgGaKfbWDMN+5xydb5oyCznXv5fcDEmmM6sxhkD7jr2RH/Z0GYr+SAkORi8NaulkJSbCK7kiS/qn30PnmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672119; c=relaxed/simple;
	bh=is5EqPpPm4wc8GolzScytZTPqjd3buXID50TM4kIYe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UM1pUeT/p1BG4Kiqvo5JCENngiUrA1Pv5jMiX3jofWa78hPGwZ3rzLsHmEWdcGk/4fuGB+WR/cU+CGrj1/VsN1gQVGwymoY3ATjlvkfEr2Bbk3Y/lYZbKodWyeqzFp4IYzmQf7y+ZtrA+NAlG4tgA/UgO3kUV//D8F4ZR316zxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=LbPSFlT0; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="LbPSFlT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775672115; x=1776276915; i=deller@gmx.de;
	bh=is5EqPpPm4wc8GolzScytZTPqjd3buXID50TM4kIYe8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LbPSFlT078nfBB0cyMsjfpvANt/9mNIwIngXPy++DbB99YOTI3VAWQYJSCQKLla2
	 8HwnMBZm9R5li8Lr0BKQs0znaPLHC5vAHWspK1dqnCUKGa3PYDxJ/+gtvF6etTEgW
	 S10pzhC54ehBpLGNf/KHtsuI1UoWz09LklUM2XLbDErFJ2qLN1ZBIgQQGA52jZ6mF
	 2uRNMlOfWYxuuZud37kORFOIMlTWo7ZRgLcVT3CKk+jc1FAiW9U1fwMwjn46pisGQ
	 HflgJxCmenp9BDDFDD48+XV8BT9LqCvk83NzIAApvmaqC+46iqN0XqV0EFfHw8ci0
	 Rxl2HFpquq3CpyWCkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1vIqso0X9J-00v0my; Wed, 08
 Apr 2026 20:15:15 +0200
Message-ID: <6c8d6fbb-fee8-48a3-b05d-41e1f50bf9ec@gmx.de>
Date: Wed, 8 Apr 2026 20:15:13 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
To: Mikulas Patocka <mpatocka@redhat.com>, Helge Deller <deller@kernel.org>
Cc: linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
References: <20260407222714.178861-1-deller@kernel.org>
 <89d620a0-f6b8-60ea-d423-77b0094756d6@redhat.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <89d620a0-f6b8-60ea-d423-77b0094756d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pGYkmebFxTZAhco8TwP6wg6VqDS84Vjw58VmLnk2WgQyQKrPyRQ
 /GgkfuKJR2n/WCpzL3hxjEybHAl8+Mgo7HjFi5i9j2Gy9n5pDsslD2siTREQWW/zAnMcqs0
 t440tvswItUafEtS+/VcIQPE+CnH32wWVldWckfcDrn8J8HEJAVhR7R6klNJ9eQ3zjmgyN1
 uQ/oy9LCZdYrYgJaH7MxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3RzodGBUzcw=;rq4KV5imWfZrpKduOhDsoxEj/VJ
 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

Hi Mikulas,

On 4/8/26 19:42, Mikulas Patocka wrote:
> On Wed, 8 Apr 2026, Helge Deller wrote:
>> From: Helge Deller <deller@gmx.de>
>>
>> Drop unnecessary code and syscall tables when we run a 64-bit
>> kernel with conpat mode disabled.
>=20
> Where can I download 64-bit parisc userspace? I am interested in trying =
it.

Sorry, there is none (yet).
Static binaries do work already, but userspace with shared libraries is be=
ing
worked on by Dave. Various patches have been submitted to gcc/glibc during
the last few weeks and progress was made, but it's not finished yet.

Helge
