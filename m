Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6943CE53;
	Tue,  4 Aug 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848553; cv=none; b=CqNAnnHxkAxiBqqKkc2eKYiv1xh1xc7+M2ONilWmabIGZ41XUiIiZ29gBsZonOFZ6NSX5xr4ss0O8FbqHwl7xatIMvpkWeHIigeYvBdnICOOyMUEmYXBYHom7W8DftvbOneN6KmYakT+SZiMjBwlTmz89CWFd7O8Ozy+6yt7LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848553; c=relaxed/simple;
	bh=6I7qSQdpavF/Ez96lKdcML521EzmTnjnGGgfc7eRXak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMyq3oLmTh8j/DVxDEdgcuaejw+Rln7EQKWKBkkTJpn75GKm4eiwa2ECN+6PPnIdpTbRrFP968F4RgyPDTpf+acJBZqWhhQZPDVfTkXW0/blR8sPlC6f8EAii3Fz/fpNG+/uTZ3+jjoYO+9FITpb69eXM+B5+385TgOF850wbPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=s6/fvqYI; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="s6/fvqYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785848533; x=1786453333; i=deller@gmx.de;
	bh=7rev9jSa0fzxwrXGx5wyOn8Tv8MVnSK6Oyt9+P7moRE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=s6/fvqYITY3HhPLOe/nrsLt4akw6zkvhJ+zXk8LRo5/qhXcy0cfn4zuz6CJ2h0nb
	 c6BbzO/7LViG8zBpoXp5MFkCIp1R8Zo7g9BUz+ngBI7DjR458BsrNr8NBFXMwBagj
	 8unFlO3rnmrx8r9bBK5kpc3pZWByRiabkNpszgR/jAUBWZd5eEWaIaR94veSouGiF
	 QtJQavqAluQP76dV/u6QdZNRIiD1Hw5ZDuxs+5FSUV2XzVMQmYxOlej1eHtKRQKgA
	 l0WGjw3nX2xCkiCMxgas97xdk6bXLYxlan9dmiOcJaJmmYnHnM/1JiPyklx4Fg257
	 nQ5TzplMMcZecFHwLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUmD-1wlzSt3U7T-002Akt; Tue, 04
 Aug 2026 15:02:12 +0200
Message-ID: <1de035b6-bd2e-4b60-a389-05465e6ae3e2@gmx.de>
Date: Tue, 4 Aug 2026 15:02:11 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] UAPI: Drop PER_HPUX personality
To: Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@kernel.org>
Cc: linux-abi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20260731125651.2924-1-deller@kernel.org>
 <anHiICAgWyO3yjxL@infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <anHiICAgWyO3yjxL@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZPgKZt4JUpSaTDTgGGGaUE/qT1q590GsFw5Rm3j4glzxJLApXnf
 Oi76gZ0DnB1JHGJmhTBzSoXC3P0ehYww484rqeMuOa+SyBFi15Xy42+PssYbwUQ2hLzgk/C
 oChzjA4gyD12mKVl08iTe+x7WrtNloCl60qzHbljgTl//IyVc+x8G7vELBnRbBmMgMAV8vq
 qUXjiiGcBuwvPiJsPGUjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jnc2g2OCleM=;GpUNye2OuyOf+aZlBTXVt5G60WX
 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

On 8/4/26 14:59, Christoph Hellwig wrote:
> On Fri, Jul 31, 2026 at 02:56:51PM +0200, Helge Deller wrote:
>> From: Helge Deller <deller@gmx.de>
>>
>> Two and a half decades ago, there were plans to support HP-UX syscalls
>> in Linux. This was never fully implemented, never worked and was never
>> actually used by anybody.
>> Let's simply drop this define now and free it up for other usages.
>=20
> Looks good:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>=20
> There's not real tree for include/uapi/linux/personality.h, maybe
> we can get Andrew to merge it through -mm?

I can take it with the parisc linux tree, if ok for you.

Helge

>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>   include/uapi/linux/personality.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/pers=
onality.h
>> index 49796b7756af..243f5f80a7b8 100644
>> --- a/include/uapi/linux/personality.h
>> +++ b/include/uapi/linux/personality.h
>> @@ -62,7 +62,6 @@ enum {
>>   	PER_SOLARIS =3D		0x000d | STICKY_TIMEOUTS,
>>   	PER_UW7 =3D		0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
>>   	PER_OSF4 =3D		0x000f,			 /* OSF/1 v4 */
>> -	PER_HPUX =3D		0x0010,
>>   	PER_MASK =3D		0x00ff,
>>   };
>>  =20
>> --=20
>> 2.54.0
>>
> ---end quoted text---

