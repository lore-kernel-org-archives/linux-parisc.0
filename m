Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1097140DFD3;
	Tue,  7 Apr 2026 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587245; cv=none; b=DhSiM0BWfC8wUe7MGMVaW9rJ5RzkG2w+x4qzltrSIRLMQxwr5vcTu0c+I9g+WmAPVjlbC/71fzg7+YDOa7yxY7GG+CIe5J7QcWwW+on5aE3gKqPkYJno8KV9HSkW/0ZshKVhNnVLhRylhe2UmWnZTvLAme5Q49DRbrwFEHXGZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587245; c=relaxed/simple;
	bh=N73CMTX/Wi4nFFdcwCmqe/1HZ+X71Aef/ru3g5YVqnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtqskymWNACSc62D4pJZXUfg8GVYHJhhBxPKK+rskCx+6ZR3z7uGq4BgJZt6L+OfzPqtG+45jF2zj375D5qg29WTmsoj52EV08/f01Mw5X2qYjdE2rQbYQgR0Q3edDLbkiNdaRDLzFSBIYxjm0VHEh5h+QrSQ2SNbvt+OTouuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=SE7uqa7d; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="SE7uqa7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775587241; x=1776192041; i=deller@gmx.de;
	bh=N73CMTX/Wi4nFFdcwCmqe/1HZ+X71Aef/ru3g5YVqnQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SE7uqa7dFGy/d01ELTcCrP016EWOFxitQhhwlL6U0WRRxyrJ7E22YZovx3APCgW7
	 UuEq0CC3fiWFx3p/EmCB/n+wO5uFkNsXlcnuZB3ZckOukl55k52jQLAjYnm5EoJnV
	 Ibw5YO540Y0dRsZUes59gSStZIUKspwFOoZd/dRDb/0lkf9Nw5kwUlwdFCUtdsYUq
	 TB3AhzLbEiG8EUcVNG2Sy1JD0FZ/OuCm//t8RmmMXbulTh2K3yBXOqJfnM3iG944n
	 k2l1/y6cw3xy31mXBcHuV+WoiGgx/yjFt7piq7OCIqRenM4gRVCya/2QRYqa6tmJC
	 RzLOECyRfOO/axcOPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s0j-1w9Ljz3yXn-003irW; Tue, 07
 Apr 2026 20:40:41 +0200
Message-ID: <4c1c0d5c-d05c-4b98-bfbb-bbb2650c0fab@gmx.de>
Date: Tue, 7 Apr 2026 20:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tools/nolibc: add support for 32-bit parisc
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Willy Tarreau <w@1wt.eu>, John David Anglin <dave.anglin@bell.net>,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-3-f70b4509c44a@weissschuh.net>
 <0fad3d18-72fa-4d99-b9ac-477964fdd654@gmx.de>
 <9477a477-6abc-4de3-bb9b-1080e0cefc80@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9477a477-6abc-4de3-bb9b-1080e0cefc80@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+8bnkYcI6UEvw/qOeXmTwJ+6avvbB1g/+wFiI9xLJ9eyitee+Q2
 p7meXY0DqaqTY7j0F2rLYpw2VQdH2SFQcZsVg2/slXKMK/kW0x0jxTG2k0EHBXFym05BbHe
 eGBFW29I8MYZe51XUcJlCc64S5Z7wfJSjcg52A7CKs15YqyXVzG+Ajxj9E2EeaSyY5El9v6
 eq5PvzbIwfq4EuBvJB64A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xQTZ21e1v7Q=;c8hsMnVX6aHnOZqZIkPEm0EHemL
 oSpYQ65PRXdQo6nMET7jYljgkUAm7aDI4hcDpQGoMMObjxzdixOzs5B2bXVxpSfJ43TR/5N6f
 +J1bhEneYVlDZMhv5fFG+GZxQRrAN1BleMsMmF5/+s/F1qn2uOGpwtvQJ2AXSsmuq36GMsYXg
 XtnS69Il2OROXYSholef+P0FyIOpb8L/U5ud+kfH0VUbzynIS34txK3ZXfMfdLKfrioPZ7z8T
 WhBtbSJGTdVnjijiveq5WFk1lvlM3CycHv4DvmGOq9hV2Rk4LMlPcDwp4JoCVvtQJUvUuSluU
 R/V7F7Dlgxt0JZwDmY/dYmLaOFpFGaJ82g73kgQfeBEDhx/D6sFmM1a+aMn8oYPUDzOUn2M43
 +0XluCxwRah6Om51S3hw+w6w+q9sGuHmkR0ZHHDSdhWFLq2Fj/hoZsH77amWE8eeuTMa4Vu15
 jtg30EVOeG1DENC1qxfyBDM6A6JXKj7wJKMyc10JEucI4xFz5vzIOmpgLoBDIgSminZP7SH9d
 V+h6rGS+5skMY0tysd1xLaPcruyrZlNvyVSPbR7MXrug0QmZv2SZdggZTwW/aSYBsL/BbpiuL
 pDgI9h6MzjuyAP6VgO+mc/I0ORAzLR6lZYTk9bO1O8cOmrM92yFws6rtkgVGKRv3SElG6Ql76
 lCJShAHhx9Dm4lednxcL1tI6L2ngilCMYWA+FJitStb7+9dLDdH6Kt5DkdNE1ZhyVbhC2HQcC
 a4j8JZGAly7bIbr87H9Qw2OxOd4ofd2xsUxvSQuVrw+Jt94RlKPxcxpTJLFM7ZXodEVUCGHtb
 Gn4pjcpfsBaSGoM2uDBqXLiHyIV6DYp2dl25Wip3u5Gph6x0Tx0DJyvA61NIcPbtYWg6u37ZZ
 uigHIHjCXOb6xmdB+VCtzfyZCDpDdbJMSYRCIPEy4JyNpQ29t7h+9DTviLTeg0U91UuLtVNF+
 HxI6MPVjzRGyqZrYsQKqjXB3vLemSQ9RDrndmstFUbMOYOqfCs47Tg7Xb2AYh8E9YCEnSeA7n
 E+RxXXjoc+MPhsge4mQ0+bFvHx36uIKO82DxlOB95NfoP0u/oZ8GZmuiPnpKvtAi+6kmnuF9i
 kcV3gW+yZUXW/lFjvRzJDvh7N2X51sVMjoM/EvIQxuogr+cgW4i3uvGMCVV15t/HzvUotSf37
 8vhnXfmX4qDEiVKRCLWpaBH38ZOHg0daLR5tl3KFb8lvqA3haS8UI9SAcc/A9WdAiodiEgyVE
 1jNYSpMogV7DERtfy484oEtFEQgASMvfbvNHrFSVYcTiDmZrZxtsk8KiDw1Vw+lRqD/wONjZe
 sh1qsK3XT8jvM4pEQMN9PswUDLZ5VwmM09VptJs/95u3RBTFuBV7AmgYvQtVW07jnISQ/VosH
 BeZYGe8MCE3HSBm+fBcPUYhVN+NIYja/bIBIlO6JG4/DMOUPho6kzru0ehqTYLPOxx9F0K9V+
 8hOUReJN/TjQglk+1qcQre9H2iWIFP2X2MAmd1UaQXhqqHLPutzyhIKTPbb0CDzG3Bz2YLNrG
 QkxesriVEr9am+k2WE1HEOs3nJb9BC6yYMxUZZAzyWKzI+NHPpVujTez/UKCqPCXFipsezhrl
 d71rb+Pc7u/X/tHjOk8qlFkw0IfHdNGmrL1syq9p9SFRW3wMHcAAyzX4/6ZaoyFDKVbOK6xSo
 wU0AJ+2AJCiZgTNDry7PcUSkdvKF0rpeEQjiZw4r4uNqrwKji8+kAgghvAtsBHVyyE7eS3m3Z
 xWkJDJvlUcKyk0NYFsD7S8gsxW/j8csJySKAv1jcAXfar+sGdExtfR2M7iUda96hxN6minLhr
 1DLeDEKMuheBnc2RnROo/oN8ouMsX55tWlxxe3sLAe6/DGykawYWSs5dbGgPaaz4C3dgOJgHm
 9gJskPky7bh51QAOxPr5t5+qjpuy+wQC1xog3Mzj8krODNaPQdK64AzGVhgMRtLUYCjq0o+0f
 AkNA8uQYiwNli/2H/mr6ypEuBMOOd3UW3RJyiLJq4eez2oXUDoQbb8G3FIfk1yzG9p/Myivoh
 R2of+jOhjTK3HInJv8FOF7GZn1Xu29YbGQTr+246QyWo0n0talURZROFr1heMie8mpWFg1RFG
 yTGs9VHuY++CU1/fng3q2TxmbYrZdsZr/0tkL1qBgtlNbnm7Yk1h0sXRkTQ6MOD7QYdbuH7JK
 4aMH120Dd+mIvNCHap6gO5AMur+AjMA93KTgnDPPMGxmd/G2/jJH8sJ/sE3TRz3lmc2EbIG7M
 Q3ZACDNddyyI35jk9br/EB2tyX1JXdj2MKlNDRLgZZVYGgGTw5CME77JN9GRf2xcZfs258Qyd
 siSnShLhwZ9g7HwtJCSGI0PH9+892Eu2ZoMrwjhEHi/9M3J8ERoXvBjHsEw2B5egkprq17vn5
 7Z76q1gdIeYb94tJGRzoZHfIqq7TGQRHWbZSQzo4l+SC73rBIMNcZH4SoDpE8Ll2TwBZ0J2Ct
 +2OiHjOLbzEyrOFkA4u23iiNx5Z33FGY6amDx3YSwrKG8a2ZeDe+9FTwWhpzorUl9jgC8c89t
 8QYwvBlift65BhymqfRN7a5jus0JSZH7SfCSPsgRSf4qLu60ysFuH4ru1DGfVAPPKJaNHrKvr
 h6NFM63Z2/ELn0ghJjmCj+spLzkjEuRbU7giB2cGSHgqPU6VTtxz8Ca07mLUEKjuS1GzNmq5z
 CboQRFMHRbVp+9YMocWezCvgwLcU/TZ1UgK8VCmZl6+FwUgkXbC+3qB5tWHAc6Cw6DvoLxJzH
 nQHCWDQrc4yNjAv/H+OagMxW9j+TtfCWNOOgtZNZpxejKCZ3du+0yeqlPC/fAheRwLXAorDGv
 EigXx9PTZXYTyIEgROn2dwYCdl4lehADC//FO6QfHM/dVAdc4hF1VDR4KcAzvBCX5U8zLXPFf
 l5/goxkvKayXILisyd3fw9D4lOSzVwCkNgMV3Ad+iElmm9BPvD6vcoynmWwtokBHS8xWrbFen
 YvFPD9O5xk8or5d6+/EdTvB8iGsnXo9rqn6BJmvqLqLbm+jIA7tGTvqy152lZXPZuAI+TEYRN
 +iRBYbYi98sMLwe2ePIOfelvgjtpoHDLOlFLKq/UmP/KQ1/FOe28X8gVuYoYX1oXSDkToMMpv
 +qCub1Acct+rV75gu+CxiX0QBLqwuLdXcBQqAdX7FHagIj7GTrVZJByBJlkQpe4qE3o9iNDrO
 l6lgp17eFQQFveIY+1FRuAtvp/r2AWlZbh6y79HM18Ik4RbeujD64R7/myguCaSG9Ws21icVn
 NjsQX2vQaj2ix2U/G83aNKfFVFdtgSKi26xigcM5Q8mQPRN1J24/Yt/0LcB3ck3Rh/M29RqRx
 YbySdeD81oUvfNwUSmXNa31n19YK7r9asN8oI5b4doh+8wGhBrsWfWukUPqeSz5m8J+CGAj5o
 hr2G/iCUeVGZ2ejTfmWFgqoJljofUj+eEMChR8U50XmQNx3ZuP3rLkky83yU0hLp+1LmwjkzV
 6sbR5yYD3X8TdJn8TP0xa77tNyqX8bwTOasjiHWJUUEeHAK02hSlRLPB4Ffavq3/XtWpjqq1d
 pBEP/3/6UlPJ5uULOe7kxAOV04sqO+d++cPQcQjtzaEDsDdMhS/GZA2NvZY6oURQKq3Q2Fze8
 y8YmbUJZt4sgTAOaOiyLPcayEZyAHh2j1eYrSlebUAkycCN+/hHjDAjQ9yahjJbKsIFyeTXyj
 /8TP9u9DVrcDBrvhsp8jC+D2MXze3TsEyn0bUmZYveBj5tGfsI1Yv9SN/nJ+eCELafhQny3+F
 H8IuCLnZBlujHxSkcT94VCGcz2//pNxH/adXsmwSvoe5wjovAZAEh/SbCzrMpgjaWdzxV6chl
 Cn4A0sFf276yQAW5//2+MXwb6GTQ9ucsQ9CWwo8cNNhdWIm31HjW7T27UN8M/PEYzu79b5NIT
 1r7pZ7JfqiKRi64ZjokQDaQCH34IhybG/27+EgxaJLWP4qKeBKTEDiVD6dywleNbwAcp7sVsv
 /rtijTdrQUoq3xaGWeVmd5t4/lLikLp+eUZ1NdEoufsZdu6Np/qX/JejfeDh7COdWWZ7iJvhH
 tM7GHvIn7C46NaHShYPSB3PzhOkfWnHClesDoh9Qj1yRWSCPK4kQIAZWzhKcU+TNf+8py0h+1
 MmpADxA81+4w6tasXV9/c7kW5w+FssXWKfwD7my/SFUQSoSwq1aDDm5SQygUNpHs+Ckh2P14C
 x30WIUyBMJDk+jesXr5xFuthtf0Kx0wzQ7uoH30nOafFWCZF8JoPbzEZ0UkwVlBFoO1NSkORb
 vvDI9soZNSUJR7pZkU654VRvb6cvAZGLsgDlNr4/cHJn+rFVjsqI3x/E6tt3f9ummyUxqLp6h
 boQrmTWglT3B7JnFtKGRkGDn2uGHLaZ9iNlPJUPRToAsxouzmm8XPoyrBaXxyui2qonlUvOgl
 3ZEfoXmsPbBXldnyYnEabAz6pguTM7ecBM4IkI/z/0mQgwrgj3YE8B9ZVcKVGFU5l5y2rAySr
 9B9RIT1e9DvlKt4rpyQD8K4ZGRtcjG8yiMg5W2D3cWVKksTdEGivnR87yzWCFruceiy7vUPLH
 1l5t1ezHgJi2bmO7p63Z9K+4QLOjLf2hust8AWi4b6MUKZ8IXpiUtPj2Ocj+dit7JnbF2/X6M
 5PzRiwJhtRTQk+G9TQtfAOCx2KCI6ueTPQJZQ5Tdfj3Pk+epYhHNSwfI/RFEpyd4sxcBo2DxK
 WrTvW7YJir9pRwvxIgtMJWiheOghynjwAyGXh/KZZMZpcBZY+RYZYkGY4xf2kY87pOqxoA5ZY
 /NRO+11dtaY2n1MrtdlqF5xCzMgOHDzxZVPKQkCOSg9PxknAx5I5ISYcsuzNPVWokqA5xN1Bi
 tB6NN1pbj2P1lVm8v/cN7eBuxraMYQrdaD7FirIRfsVpC17dEOVdLzYeXH5rftNj3Uhwry2E2
 CPCOki3QPfejSdkyW8QXa53/588dr+Nz4njXO/zNEiWOHd2I8ZJ5n5QvWa3Z/gCC0C9fdMoB7
 c7R9QoeFD7Z1OzFEMN3rG1QgdD3w2NEj2M3FKyp1+kxLqpuENRBxOhgacpt63F+OhXLsx4Twt
 U4DbSvI/ZYZJVVlZ46r6zG8Hn9QhIr5lrNtt6bWX2rkrOQTwbgqnoSf7NFs6yTqhNGNfzpu3h
 XP+XpOZ6TbhGDsfy2Cdiu8ujbIGFuqLSsZOffyq8RxPfk8hgDmdrsNn1Hv9OF8n4yxO5LI4BC
 v858yXtaGcjLxqpvhhBZfqebEi7Hq4GP8Uk8NeaVpOQKmQQQfYF8evyvMPRM+l7sf+lGcs8tz
 TwPjCocT+ifEKczDT5fSpotzbgDCiJASnyuObFA8e1c4cV0K8u2xkjkS2ju2q7mQirBOJlI64
 GrOnvCDPjoGabZaO1MTWuhG6gNDPJhH+zZUHsVPEr1hP0a9TSrddtk=

On 4/7/26 20:14, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-07 19:33:05+0200, Helge Deller wrote:
>> On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
>>> Extend nolibc to target the 32-bit parisc architecture.
>>> 64-bit is not yet supported.
>>
>> Adding 64-bit would be very cool.
>=20
> It is on my roadmap. But the 64-bit kernel I tried didn't seem to boot.

Just in case you used qemu, you need to use "-machine C3700" or "-machine =
A400".
The default B160L is a 32-bit only machine.

> Also it would be nice if CONFIG_COMPAT could be disabled.

Ah... never thought about that. Will check, but I don't think
the kernel will become much smaller.

>> Dave Anglin is currently working on adding 64-bit userspace support
>> to gcc/glibc (dynamic loader), but that takes some time.
>> In the meantime a 64-bit nolibc would be cool for testing.
>=20
> Nice. Do you have instructions to run the 64-bit kernel in QEMU?

As mentioned above, I think the "-machine C3700" should be sufficient.
Some more info is at: https://parisc.docs.kernel.org/en/latest/qemu.html

> Is qemu-user support planned?
32-bit qemu user works great and is used on many debian buildd machines.
64-bit is on my todo list, I just need time to do it :-)

Helge
