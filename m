Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25C3815FE;
	Tue,  7 Apr 2026 22:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775601219; cv=none; b=KZIpoa5IC9MUM9h0qU59U0ZaOStsPOfIF537UJt/PD/CqYF1mRXbdrrbLBKh7uxfEbp/JLGigiM8yyPor2oTZZZiXteTLyXKNU+8WfsUFR1lDwFbuXWOqxGMwQ0V/iZpuLD1ryWIwtxie/7jEaU7ZYpClqmxtCndh2YO7tyT8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775601219; c=relaxed/simple;
	bh=oxSLaYQPLflFslLPD/mfHXNMGCrK3gC/JbgQt66YdxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa3TSFTzMN/wpiSU0vITT7PiQ7iq1CqDPiuu5vNYhL+kyIMrSkA7IUsGawUDcbAIxXw9hHkWCl0F/S7ZOj2SU1qtl8eSqMolXe0HSyZ51I5GEf6TWmMYNXdHcIEIBaRAK9FI+SKIkmrx9x0t4oyIVC5Taf4D+EKwZ+wekMS70bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=KygEVEcc; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="KygEVEcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775601215; x=1776206015; i=deller@gmx.de;
	bh=oxSLaYQPLflFslLPD/mfHXNMGCrK3gC/JbgQt66YdxQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KygEVEcc6GwxbcDtj+tJVIpUT5zOJpyT9HjIGSDsFjiCoikMDKYcgZ71Yz3j2IP0
	 FOsWqLm8lgQEpQKhhm1MlmzrBCdLY2dh5YYE5PNWqaM3CMPPjSQ344F5EI6m0UE1x
	 HIJiLTg4FwJxyltxOp2Bs47HyWxcIivTSYL2S9n0Td/TgRZYkjjV9fkCA/6MeLDEs
	 t7pWq33L8+XoupXN5oa0Fvqizz6zLMyfMD608rUtC54IdC4NDZ2G75AqEMvat/F3Y
	 zYbJDyryu+p2TagEjwibnru4rgYSMgL0Cz/iOpu6bRvijisuDbqVtk9b75cOa1rQp
	 S9F9eTKMP18LekbzWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFzr-1wHhEI2qE1-00CpK3; Wed, 08
 Apr 2026 00:33:35 +0200
Message-ID: <ec478a34-c57c-422a-86e9-0b5d0440e6a5@gmx.de>
Date: Wed, 8 Apr 2026 00:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build a
 native 32-bit vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
 <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
 <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
 <b6edb6aa-76a6-4f66-bd04-6a2163591990@gmx.de>
 <e91c3d3e-2214-450c-a212-1baab9dace4d@gmx.de>
 <129b4f90-9f05-42d2-84a1-81a7fa1d88cc@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <129b4f90-9f05-42d2-84a1-81a7fa1d88cc@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0/wepDGjTCbFA90En2sGRTxXz0QDmLhhl7uGgS0VxeP+S76Ebpw
 5aVHhR0kzdzJSOu82ZAtArItoDrvx9Cbv7J6R0tSUGc1eMj4IEN0SjdI5MNL0+Ii2VdBHoj
 UMFBZ1SmYyzHlilPQv1mXHxcKepmWbr75TZ54toRKtSVri3lf2GQEiJ+JndWrz301GQw3xM
 tS01XnOH+Esf4a9SDZs7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KNj3ZnSQQcM=;c20xq917lV68hqR2tfWRzWJPS3G
 PvJQtivD1OY+k9Ot0Kh+AhMh62BGy8pWLCISDOqSCFR+quvqv+nZtoyGTONzqiMiMeALg1plt
 VGUiR/s+/xJO1Z/hq5XBI2EPlCm4aR9zZZZEPZssD4focdTN3c2Zku8tH8G3hRH2xPVg5vUf+
 x+BB5NmLOWLdLdHUwTGLpuFH/LCjdsX6HJzFqgyx6DRxteMuF361ozDqoZ81O7mjyn/lXGh9g
 jRwRmktF63qPlh8BNC12mK3gXvS64ZEP9E/DmwSHupbk3rGVLgb30Xu4JWhN8n4H79yyxn3il
 K5QEoDDAg+rLViFOxe8FzJ3VQxAmLZ9xuAlngrpJIZ5VWgOIpqu4MdlfvtfaGilL5EKK2DBaw
 UUo+LROI6Mf0Fl8s7u6D8NawBmwqv82Avxk5W80OoBTmmtDOmanaerIfDCxx/FFHWv1kkSAAX
 /9rumqZ4yBDYtlCMw+8OqKhGmmOkIr9GHUQ/boQOgE0oXcw4VQy0vwa4GMTMUzBB0FVhei0Rn
 zZ8P4JxYN8UgpO5ZNhhk8EFTw41AaetI6QPjyEVc/x6f9x4GNFul+9q73SD2Xdw+QCCZ3HilK
 YqeIWZOSnKx6PL0YjbMjWsAr9bOJWAhGjejLYQ7Xwr8HqmxBWRXW1nJXqXbN9a+G8ZkjU8Xly
 6bc9+Jn8qBXsliLYXfhLiz/OwRmcV8Tg93npaLuVokDB+dFonZhGsCkqgnZXUhuiLQltIfU4r
 o3tDJQgSZ+MkO3MgPo6iZX2PNsjBTYCO4Xr4yjuXFfHNcl0XtNRkrhJrOMH5wrFpwP14aLBM3
 ITB08WIIbUkt0/RFp2FLjKv0bw7mLsgx+XCBzYbiOgLBEhQUPlbT3Urd8et1JB1zzDp+DwB62
 m/tJbIJHgMLHFu91ooepuNfYX7fIvBeM6QOvefeR4faRJuXJUKoOh2sqlDNAYru41uxEuJq/z
 tr9+Xb0dkLBl0y9CKhzQZ7O83Ep/9Xwb7DUzgOXahXr0geH5qvxRbwjIxYh87Pvu1CeYZik/2
 XsnI1iHzV/PspFKA0+jecuBlJykT5z6qwijuvg1KPSpXbRRNCFQJ961Os1odDMDwhQnaHe/FN
 WGN5U+dnrZRH4pJ0BqAqh1K2pUtg33StfEGdBVq9UYLWzW5xEpKtaK5nBB9ZPujiYmjxjNfmP
 uMs/ASiDKBRVVgvYIfge4SB0fqDxW6kRw9cE6E82qsYGqEHFyTdffHaiJE8sXbBr9aBL1LtyA
 as/5wRr9C2l4aoR3FkgyCmXS0XczR9Y0Uq6GGdZxFAfwSbcf/LNEHaY0dBqWg1E0WUJbVQ5Un
 yVO7terF8wcBb232SUAC9+k8H1T0HIRFBBTytmqP4mZWvO4hqx9crop9hcDI4huzTzrGMbTyF
 akO05X6AogI630NSYJwsu6q8IpspFfR8SbwgsMI+2/7PWykkBIz0ES9rsg3kjLKvx5ubjTPs7
 fPyejKFGdXPW8g5pmtxSwYGA4BvZMKIhBXYHNiGVZSTpyx3I5MyMMohJ6SBz8gEZfFIAuWbqO
 hry/NIUcMvVK1RWXEy/XWOVNpR8DDayoXhiqxV4L4ouz/fm61+VIRI+sKsQf+WKKnIFdubRNt
 goztjsLdpR9paaEnnUTt0JAMo7/BAbTn6orHHgb2EnmKdS0sLtNa6KSb0FOBlx73RQIUIGCU5
 6PjxbMA1dUA/CeNFO+6hTHnBO6WPvMNFKA/G+L/XMVTfl3sSPoYL2xoVH5XAwjI7jvM4WQnz+
 sbL/nCQH7/iFyKBJqczJYnmVtVZdxD3JAlKrrDTC0kBT5M3WYjK6eKOFgNTslZfCak91J8Nmc
 l99Fmc+LgPOKZ6cT7xDk1qSCBQ/EaXeHO+/lU+iD8MsoIsw3ahh6rLlk7T726Ydy/rqHnwxDr
 K5gYAXsTxL14CesmmEM+dqyIxy11RetAuPDp3fXLc0ACjBcKcmtOVE57uWiNuI9//7QGz4lA7
 xj8IBh+ZK/N/nZmJsnawsiLrkGJ5f0d8oMaa/y0nVuShzyF8yc5kHUyvTD3mnK2HN1sMpaF/V
 qgCQf7n5hZNCVnxXh2E/KneQuLynct8kCzvG9HG5xrQYKdeJ6dUXyVp/Urio5QHQIgezjjj4r
 XfaT7AWlYNXvcoBxuRjzLiSCRpDZWd+tBKhYWlIQdr5ghoXkG8f468QQ1S+gYJZTNiACjzpeX
 N7yttRo5xOqpmVAo/AqG9B4NeShsT/jLc4bYmzCqdUVs5lVC23dl7ppqhcg4cxv18lm4LGM2Z
 SWkVwQwvxnXOKXEJLuO0hO1NPyIYp1V4TxwHcoPDSLB2WRT2e8pHFjTjvn5KdbtLnFVnxR165
 fTre5Zn497QW9y+gzreQMMLCAz/PmPD4MIWKDOxwykCxp4Go10w0LPLPC0YhbJ91ZB9NVL897
 gYSyxNqCFlWpSoN4gUbmVWzr7iEmN6lqjGidq8KeK6/C4hHEZYxNBDvO8Byc7/CZx5Fn4dFGR
 5ZC1XgJ30ibldqtzvTj2Xg/SyCb2fMKNpM24OUcKnHe81MZanppjpGBFg5ustSkpPL/0ETo69
 M2UDkhqqs6bWpXeZWFI7RGUHn/Z7IxKizuzoxuQ7fh1kum1rV1VP3yAHPGfwmfo+0zyx8RuAK
 1DwEzImk9VHUn16Bmekw+zVMe1MkJauVFD6idJ9gd0J+er6/fctNPEZJyxCRHq+FOjeSgefVl
 VmxOl17YGA9qJzkwGntOwlNOfd8WzRLn00VpZyxVsQlaKBxGIwGTP5gvRyaO6FrHcEFSp5zOP
 Pj8QcWEmxoxtnkJnmhpId8y4HL/4u6ziN4qBP032UauPNddv5KmocVX+V3YNJ4IMXAG5OcRPG
 7RTM+9o8fcu3//ctbgjxDnQcrfqlSduaebit1giccWZrc+IdAjLYdaSfRN4WZMTMDSaCGi6xr
 IfBQZWQ8SXB62DXxPebauoXsyW9WWb19c/quZDlxsMTt+Ub7O0Hhcs4IAelN7TqZC+ytB8OG3
 oB1DmtfHB7llqbebuBkjtRnCrvL9ULuOgyk1qbcl/hoWMClP9yHnX70EZipwagGfAJBNWMTrk
 dbPhh3XVtEKThT3rUq4k4HNDBdLTS2QTtlCKk6wFHAwt9OUs0lEqamBSutpbscVbxSotpnlEq
 xaxB0j1vqvHS1nkZ42Lc5rEGGRJfnfHW9Kq+y6I08Az7JEoYnORtSfKtx4EoTyDk+U3d9ody3
 hXerFAtfjn5dbBnK2uO4iVAneEb6Fc7ek0aM+MBxWRMTT5IKlNFWQz+WBRqoFOR8FQNbzGnGt
 qQVZe0dRn8uPZDFKLrxR0D/xyZLnqm0+cLRQ0qmk4k9/Qzlw6N/Y+UWkZVbrUmswq021dFo/u
 ZoAICRzyT5ZFfkMeXL2tZAG14+IThpTbkVT7zpU3ecAM9hlcHf4AbHYr2Ik1jx/clkfBXN/0S
 lyZ/HpowCSyQ3ZfXthGssqyJHEiCNMXSljM4AbsuZDVQ6Zxc5Qg9rWRQ4Ft13TqxW321xOexw
 jT+znOoMyZ5I5cgmP/y7cvQu6Sb7BD/F9xZ96iy9MDhgrG3aaatIl0bdVkM5CR4mzmy1OSdwi
 Yz9mRn7pM2hZGMEX0KnpxjeSnkcBCVeySoiZJX5lqEiOqUHJMeFrhw7GprldF9wnxbYsonoQA
 WcKw902vu1xVNtg/lweu8NK+bQSsGK4fcQRvLN195AsE3fosho9T5G/QABOXQwmzNiufpUdYK
 r/ZM9YmIxE4tigqFNH3KrQf1Pko8bChBJk6Kkf8OAU63qiSkLUkaVnkC8C0uq4QhSQVMXPkj6
 /MgMwQ/pt/ZHFzlqwPuyJ+yigl9rl6jS3Z53AHAakvCziD/rs7VaFy6mAlfgppPegxondfHLE
 IrilbiAY/hjY2+FH93k6fD1rFuF8XKra1b9N08hsLJoXrTroPJ0fcn9noIdZ/B/l2Xj1p0Ik6
 Ced1565gETvIL26y1atWK7hyR/ALG9JZjGoscnYESpHFlH6qmVyrvxiZNOGJojHB37bZP50UH
 2j++XmBofUeZ0qbxATXJPRsJoT2qal2q9HD3XQOwP9g+3x15r30CvB9YwsknNYhdC20WmN6hu
 1KoiqfWuiW1u463dODTZMgODiGyRiEDswbw+1j1wqx9f1njYpkvA3Rsq+nT2eq/lpbIu6sdnx
 ezKHtfhb6LNNgN5TavwwZpL5DBllXpK+iJ/yZMmqZEbUmGtv8TI3dCWdP25Noc+jMPC2+J7Vu
 jCM19oTpudFXbzpW3OotzMyenY1pUvhf1Skg08khivXvTzRJfkeG3SGI7qaZdCe+2zPM0vGxF
 vAfMVrBjyTM6Bk3n9n+D3dBClYpYX5315V8MuKMWhOXU5IyRGaTOxbRGdeydZdDLRY/YFYAYR
 rADDZ5IQWzKMi/z85I98vYrvhOgk9lOLGJjW1SufZesivta760L+L6zT/gzEynqBXYeK1NYfG
 8QJ3xafFTfkG55rvTy9WZIV6M0KXoUpyhCbdTcesSsLrPkNbMAsiJc9ti/VU70BqHzne9/X3k
 KVEoO3wMY7NmO3XZEOPsCnv2nY807oZp7WZch2T/KBeqsqsspsR6KdLCcbJgRE++G4Vf/eWBW
 nyM5WMr44ZgAVotE4dF5ADsDogLbPTVgkF3eHXy4TlPPFf1xh0d8Ell0PBl9liD8yPWipGopd
 3an9499dZAHBmEyxQzZkB9PtgQGTer8rcVclVPOCw/1EFr53JcgTxY0pGAfTSU1cvqvUeonEX
 aPW5RygNuAPVdLKiqEhXbATfiIg0T/UrAhB/nh9vUJL3AnFyEO7I+x+l0+q1nVaVeQhs4RhC2
 PiHQEJSOBsIUNLKwtSdK7dp9pUXQZnm3kIMKHJnCRbz+w35vS9oRJkNLD6Of1v1gDePA6k6r9
 BZ3DxBcJcu1gYyc+m0dANGzxWzCa17hFuDo+t/v/HXWcOu/HRlKp2wUZqkRJDrivUn4td4BTP
 IkYWg2H2dzjD7B94EuvuvROLXVY3VznHAlmzCricjBy3X380974TWh6g+hrvPURrK2d11mtfy
 6yEYtyO4CQ+iP7lwTp8VTCM2GQFW+fuLipgeQr/LEVzqTldyYyBFPZDQt5wuHsnQegWXIvSXp
 wJzjq0Hvu14zE8PisdZx6DxP79wB7B7eqtoRWAujytd219l1ViGNUUrDemxGRh+0hscsfB2Rh
 qi8Lb49nLBsCS3mSxOO6v518ixOvxxiAijuhQDaC1pUS1VTxpFWp5ES52fGKb+DealcU4cTaQ
 P1FfjCsQCbQ5DPpwL/xbdvuF+gX25hvfZPjT48XGNDeRpNskypcKYg3FcH64xMS4aUuMEPBrm
 PR+Y0Gn3CUzXTD8m4bkoKrLJFM1tl6ubJqnCFHslD2jt3qb3INIG6i7GEOKjRu9h8ichRxv/W
 A+V0n6nKMh5oIOxxAc18LtSWsRVIR73smHptaajKJ+pVOHH5cQ4MsrIvqjaIkAOeDVk2oRaLF
 og

On 4/7/26 23:27, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-07 22:20:34+0200, Helge Deller wrote:
>> On 4/7/26 21:27, Helge Deller wrote:
>>> On 4/7/26 20:06, Thomas Wei=C3=9Fschuh wrote:
>>>> Hi Helge,
>>>>
>>>> On 2026-04-07 19:14:23+0200, Helge Deller wrote:
>>>>> On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
>>>>>> When building a native 32-bit kernel $(CC) the compiler is obviousl=
y
>>>>>> able to compile 32-bit code. There is no need to force the user to
>>>>>> configure a dedicated 32-bit compiler.
>>>>>>
>>>>>> Use the regular compiler for the 32-bit vDSO when it is sufficient.
>>>>>>
>>>>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>>>>
>>>>> This part is quite fragile, especially since the kernel is often als=
o
>>>>> cross built...
>>>>
>>>> I also used this patch during cross-building and it worked so far.
>>>>
>>>>> I can add the series to for-next branch of the parisc git tree to se=
e if this
>>>>> breaks somewhere. (unless you take care of it at another git tree?)
>>>>
>>>> I'd like to take the nolibc patches through the nolibc tree.
>>>> If you want to take the Makefile patch through your tree into the v7.=
1
>>>> merge window that would also work, as I will only apply these patches
>>>> for the next v7.2 cycle.
>>> Ok I'll add patch #1 the to the parisc tree...
>> As I assumed.... it breaks immediately for me.
>> On an x86-64, running "make ARCH=3Dparisc palo" doesn't work.
>> I think you set the "CROSS_COMPILE" variables. Just leave them out....
>=20
> Then let's ignore this series for this cycle.

Ok.

> How are you configuring your compiler?

Haven't configured since long time, because the default cross compilers
from Fedora and Debian just work.
I think 0-day team does build own compiler.

By the way... I just sent a patch series to the parisc mailing list which
allows building the 64-bit kernel with COMPAT=3Dn.

Helge
