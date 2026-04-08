Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15CB34677F
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 19:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677703; cv=none; b=D5mvZmtnaoh4e4BPCsWzYrhTEVNp1OjT7KWrHh4jjfoU6FUP+R/TqPyM65vcqNMJUqxZKBoOjYypmLlXbUYab3bIr4E8wQlnUdwPJdgdSI1Pti12lwg1sr9VCBGWRwdCM6LxSV7URniN4SyRs42bBOns+Ckp0+vnyVX65RPWlRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677703; c=relaxed/simple;
	bh=SKWzQ16UNDr6nkMA7JHwDeDVQnJnPO7Or4AsV7jEpSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnvpA7xxqtQJD01syAb7stK+vvCa7nUPvIeIGPK/gmmrAEY18FR3gVPut3JppajAppPlvi4D2G/nQXVV5YBwxnV8YXWugvJYQ5TxR0PzQMsDzxoKW1vmTuHt7zNIVEm63UJo3qRUPBHRQvshWx5rxFg3uDc+0Y2WnEvNiXvB91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=W7Z3vXGW; arc=none smtp.client-ip=209.71.212.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="W7Z3vXGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1775677701; 
        bh=z+rGesXR30/EWW5tdSCfoLnFod42yJxCzFNFen7BAAc=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=W7Z3vXGW8V8ZyAcCzg9nIq3OazcV4vsa4hCyUFZnTLijc2hn9suODvOYsux34D2EsDszKwps4idJlds2ykC+3lGsWrPcB6kFFF+otgfmoYKDVOT1Sea3UrQK1e27SrTOHRn8O4zL5aqaW3qZ6xlc+z+FT5sGVxQxv+/hEPlccHzJEskQFuMdaEWBGiWNr5mJMN2V57Kk4bOH4etTsbrV34N/SdmSLGiOMnpC6OcizB4cCY/ub+aYsUa9eH1p/agmRxS0RDtCDjW1bVM1647glbb5dxZs0Txosw/OK8KMYijyplGHvEkpaGfRvP9wEjA+1Pb3QebnCzxVb7zlVzTAdg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 69B90D150288EEF0
X-RazorGate-Vade: dmFkZTE4vmbBxrlINXP+i+8nr5fz2LCsU5h0qgSeI3QnV520ZFO5MvMhmmuQMegP5QWH4WmqeTxy/MlJUjVK4WSuMFY7zAVPNsHoyZwkSB32kmV3hiC0zbGQ+uoT8gofuQ0DPGLbCmidn6Eo9L0/64V1bnTeZzRx+Bdbiosf6t4DChm42HtBepB3lbQx8oLBydXGGa4DHq533NgGGX7UX9LXCTCRcAFqj5swVj6SfIssRCbxZhYJHvtC+883dPrTsNb1QsA8Uw1lYelI3TZyteY7ryLoU703G2bnh9su8oi3hs8nvMIDWAtB4qSuTjg67Kk4ZHP5tUl6tjv16SadLte0CSBBMkdMAsJ3qRVxEAw0nH6+jbzoFYgUZLcHTG6JiDmgMxn860ydM39K4CjhgkAxtOjYSuAICNkpBtuaa0kdiKsYDnFJQPNA0Or+D1he977ATLInePEt4oP2AHf1z9HJ8dqvQTM0LR5LNtfe6IqpSHbGeW3fEfE8P+UkAwhI5Gu1lcbNcgizQDgF9+qQKq3h1S9tmS/38uK3MEDONZtvspW5U4GngKNb5ZYYMEp9Vsic3wykVLnfDakcVtxXalGz+0+RELOHOtKPpIl0z/+enkQxgqeXGQXpEG5KHmtGYu1oMUqgl9ltSAOvwAW3TZ3hC1dCvS99y07bxWUnThpXcCDS9g
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.112.252.193) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 69B90D150288EEF0; Wed, 8 Apr 2026 15:47:21 -0400
Message-ID: <06982096-2867-4bad-b67a-a6420fa9f034@bell.net>
Date: Wed, 8 Apr 2026 15:47:20 -0400
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
To: Helge Deller <deller@gmx.de>, Mikulas Patocka <mpatocka@redhat.com>,
 Helge Deller <deller@kernel.org>
Cc: linux-parisc@vger.kernel.org
References: <20260407222714.178861-1-deller@kernel.org>
 <89d620a0-f6b8-60ea-d423-77b0094756d6@redhat.com>
 <6c8d6fbb-fee8-48a3-b05d-41e1f50bf9ec@gmx.de>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <6c8d6fbb-fee8-48a3-b05d-41e1f50bf9ec@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mikulas,

On 2026-04-08 2:15 p.m., Helge Deller wrote:
> Hi Mikulas,
> 
> On 4/8/26 19:42, Mikulas Patocka wrote:
>> On Wed, 8 Apr 2026, Helge Deller wrote:
>>> From: Helge Deller <deller@gmx.de>
>>>
>>> Drop unnecessary code and syscall tables when we run a 64-bit
>>> kernel with conpat mode disabled.
>>
>> Where can I download 64-bit parisc userspace? I am interested in trying it.
> 
> Sorry, there is none (yet).
> Static binaries do work already, but userspace with shared libraries is being
> worked on by Dave. Various patches have been submitted to gcc/glibc during
> the last few weeks and progress was made, but it's not finished yet.

Helge slightly exaggerates the progress...

The major change is fixing the shared library support in 64-bit ld.  For ld to be
really useful, we need stub support for long branches.  At the moment, there is only
one stub section which handles dynamic symbols.  This might be sufficient to work
on glibc but gcc is too big to build without long branch support.  -mlong-calls
didn't work on hpux because the millicode library, milli.a, contains some short
branches.

I have a few more binutils patches for hpux and testsuite.

I have some gcc updates for the 64-bit hpux support but I have been holding off till
gcc-16 releases.  This improves EH handling.

Sven started on glibc port but this work has stalled.

I can cross build gcc with 64-bit ld on hpux:
https://gcc.gnu.org/pipermail/gcc-testresults/2026-April/873088.html

GCC test results are mostly similar to those with HP ld.

I have a 64-bit GNU userspace for hpux that I use in testing.

Dave
-- 
John David Anglin  dave.anglin@bell.net
