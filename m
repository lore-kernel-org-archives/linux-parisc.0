Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F97369990;
	Thu,  9 Apr 2026 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733094; cv=none; b=XtiT3aU1xgLXPJALEXX3PmO/6Sx9yE6Rl8a65HcWb2wxJl9qmBfSUSac3RLC+uewpaAfBDql8KxpRZauer9SpTgKJJrcCuCCqO5aFjkL1Vy2VDsMtj6DurUJMxWq7K81oYLelXskOGD645nkJdrVshlSt4zCiPnsKTgkK/AlDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733094; c=relaxed/simple;
	bh=G5en5AcnWvT2hwBscvwVC96xaxUOaiarsrkBPmT4rSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fid7pbFc5KqWWbkTVSo1nJ4+5C/ksg8xjnSnC4qlJFKSYDisW2NaC283DoORb6x2cLQBgI20YIf6mmWnFv5q/4weiMa5kYE/jVAcWSkMSDajFihj8nTJb3hNORzLTXpq9QLvMBxx3LPhrm2xlvaiUTWJ6GLDsqrQYIx6A2fNdMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=XfjFgvqD; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="XfjFgvqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775733070; x=1776337870; i=deller@gmx.de;
	bh=Rdq2TRFsgrJfko1ypxizPifo/WHff70O6Q0kO2g1BM8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XfjFgvqDODZfR2kQntxnO9hGHIe+VgoW0BebhMfRhFfA85lEex0m6cIkhX3Pm+Me
	 aAkR5FH7W93Nbx2OopUWc5vBBJwI+UlSlx44M8v2h5xFxlay3VMg0iEq34lBanJ20
	 c9YA6jZ9aM5TZrjSOPQ1Zet45nvWTQlw5qsKesi+4CQ5aB6ITp/wLKb5tWipU4L76
	 pg0OxnKhfCjBgmw7PIJQB9IhNflhztjwI1Gx6BNdMSjf3hUeYnOWX8Ug14CWQo3eu
	 T5rxv0sMLq7etuVeYtwie53BRK5Op6CVLigydVTUbaaqsG+BgAzOiak3szUw4sWaM
	 bzjcuvdFeXgdKCsEyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1vuMKX3j2q-00JU95; Thu, 09
 Apr 2026 13:11:10 +0200
Message-ID: <26567bee-8e1a-4fbf-8910-42448ad0d4ab@gmx.de>
Date: Thu, 9 Apr 2026 13:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tools/nolibc: add support for 32-bit parisc
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Helge Deller <deller@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net>
 <20260408-nolibc-hppa-v3-2-961f3754b506@weissschuh.net>
 <adbTmisC4ICO_RLD@p100> <9ce29573-1c0a-47ec-8c0b-4706205cecbc@t-8ch.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9ce29573-1c0a-47ec-8c0b-4706205cecbc@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sa9UfM7bIFAG/St0EwpHHiXjnJYU5hlM0QK8m+ILPliXHLZfRL8
 I9lDMse9Mx/5ChXBG+Dc2mkrr22UTXYTnwdHwbBDLrZu9hkr5uzrcMuSrSh9lLZ6afKsf1b
 wp5n7HkL3a8VndTxOe6HWszKjOiJcqcbzPrC+wSqE6Je5bBNeWt67UXDUEHdvWZ2dSa5kDQ
 nPs7qokyVNHSqr4mnMq3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aMEUCqd0iRQ=;n4X7EJPdSaTHUpAo5C6gyojmryK
 S1hTarQMeX8kL5nmQTOO8r79SgMkhLGyi6v2+E+KxtTkSuNx7Omz8UStj+ozf0Rckhre5nQcT
 OBs6+dMIoS7M9aeXWuGIAiOlItv9+d0LnDadd8z1/2NHRjCRdR+YtivoEloREsmzjBX1X0VsW
 Zanr2/kq5lVcjgCYu7nEX0INanw1ucUcumDTvM6ken3HtYib/Vn3ooClEqxKEY//d1gHgQ8K+
 Nh32XcDhK5Sm0YSd8HCo8aPAkyDAuQPlQGbI8IXD98OlTVPrI7+UDGfbw+5rG5yPVgkIzyA9o
 kmcc/q6JfYZJqQfUn6q6wtGYnHbc3jLb+VcfQUEFhb1o0V8nNaJe/xLFIweOgrcztqwna0LWU
 quv81w8Vt8FYGX7mUTttwYnJYSuulhzvK+JNH/ENZegLnX+jyF5/j5MJqiFIFpCJ6HPeiuc4t
 jMrVOavjsJEg/yEuK2o/UisyupCzhJSV3LjaFPVkWr6EfZAjSmk954AmTVJ31Gr8bYtrT1s6x
 Jb3fECed/Kh5jF0hWKpc0MUxU9Xcfh+sCSNS5WPWMrazh4VLOn3PQflE4Xax8jwYMPJIPm7Ed
 A0Hu9rfbc95J9huNNKdj013aXvDp4g2aQHXsgGjweU/Llh6ImNz3dH9VnfziT7NUlUx3pVp8d
 knCd4SyxuLhSTyztSQa5Ti1JaA99XMBbVQcNQg8wWuds1T3BHCOpvV3pMiqdBnjyf7fxONEQH
 6nvBYXkJ768Q6OFZUcY0GEwJ6r4INC9JgUHk1Pd9hnqo0mRn10a0cLS45u5OQ3raQiLsOt3rB
 hXEjgFKRArwjGVBtVmJgYeKPW+BgahznhR1QiOSHVjr43aZmINsLnMf15IAVhAkgRIWhq5TNi
 Vt+uVEvidvF1SEO7zQ/ZQibSoUpK9ZQffyHgmeAW2P5pSzgG9FwLtZlZgVBQ1ep9CoZPmix0C
 FdoCZYeswhzLORnLn2p+TYIXAtlMB97eW9+HqJ9oRxc+WcD3MKD5C4AWzDf48Q9OAtlTcntl1
 PeCkhpy79LR9trJ1Z21anDp4MbdEFPxleDyMModmlKeHHFopDEcG/2QVSg727nzDFVh/NC/x6
 BktvDBbiDudfRDf/5sJiNFrpmzOK+bw7Yp13I3JLPVnFR9HJEGlKik62SYvNP1QG+lO2i5yq1
 nObnLCQ7Xckwqw7jgnwQTLzePHgEHio4KoRzAc+gMccWCRcv6RiePrDPcfeGdW/H/tT/eX8ad
 t/htH6PFN5FbbwVN8N69DrJF1tm30RtWTfzoyreKq0GaH8LMvoYhHtPx8E+f/x3pJKQp/DEMY
 oCHeH+8Vhf8Eu56I5zyWJgWrUOCGR8sIDxoHPjdQB3sjVTUApsSbN6WD8jpa2onteZetZA7Br
 pUnHkYaeOrwVjVw2ekKGwsMmyxm3BqPFAy5e/gxSiRWq1+s94cWN4HcqAnMz3tRFCg+bAxxuo
 Z+bE/kVbjsmxQdiQLyRWy38Y/fZcSq82YDCfrgNDynzOFyBLV/0B5TUuc8zuZwxvnvqQgMH5p
 axigEZY76r1W48lctcp2CDrxyt9l76YiJAjdFbZqMZcmksTqfT65oqbQuvILEstTVsoUNLEQg
 bMKqj0mcqDjLtbZhxyHM9B2QUgyC5QxtRBv1XHX17co6FlzGW6lxD/kdhbGaC2B4duEtLk41v
 1Kfkp1nlEth725ppfaHwnoehIo9NLF1u1ji9m+kQK3rSc5ySwG5EvUyAtRMaPsgGafzdqOdBV
 iehe1aqj4yjBXGrtNBnxudr6uNzPcICi+xJW2rqr4oGT7NHwc5TKn9OJIuiwJU/5mgGakN5BC
 Ck2KTPwPHKJBYkQVvUPWuPwZ1hpt8fu4rIfZYYxa4j42HUwnt9E+N/65CRkyfH7hAE1sHjESF
 SlsMrxsF0tHjdo6CBuZr7e/KwZbffOLjmTwwKcHDeYqkR2F6F+cvq+Xm1KoDvZOmuuEY9Kb3j
 zc2v2tC6a2ah38BTjsEH75WVHIkoubFXVy8nWJzGELduo3AtgFZFxqc8Bmk6BxmKy42azMbmV
 UBTrG+7z2RY0/uE34QYHrc86H59Ap+Mc2oUTsaLVQgta0zHwP9PYTWAgRH46oPDrKZgcqOvWG
 04HfMs6WfDMu8gvIMw67tWNX5FOt9F4ASwzV8WyxkPsf83Nsj7xP5R0IWLsFgR+Oumx8Rm9kB
 4RTxMNVcbLo3/GQECwMY902DgQsxvsDTsr/s7i/o0nq1EdCNO8DanuS4n34W4rqonbJsE5ghy
 IjgBB1/tKg2If9jAig2Mhc1RYgK4OAgkEcKLfoACr9CoqRmmvlSj8oRB6meKpqyco4pf0Mcgx
 rK8hpzJLqfB1Qzbz+4n54rdVVGMY6o6YYgxLl4RPPvOMHtQqiPDMkGmerMrUY/NVISoRN7Ya/
 6AEgjGLpZfMeoLkbcvaad1LdKTVr8dTp4J76eJyUHCh7WyvOuoL9O6vBr5Af8vt/pun9j4DH0
 HXDWPgjYQhvt4nqIO+g04h+7d6WP8/6qoyQVfN5EZrECXb7MDPfVeBH2kbvJQdF+3p/3DTvDi
 KJO6kXrRO8CJRHdalU+MODXF6TzpMQhnZiMYSTqeRPweLpr69iTHQjYbdpswx2sVx8TqeO/Qe
 LQnRxPInqNYxvpFLZ02b9H3/R40vUfv6bAfP+53xwDIFVKI4+beJlSlSXNQfFb0uZ0AbKRIRJ
 AM1HyK3mYsFFxR6b0Ad9hDtrLm04oOqmYmWerud7f9fhDkPHTum9zcPdYd5FYbCjgsrTZ2W9B
 mwggHk4Q4T3b2MbsZtMEasXhLVvDuHGm2O8xpGwRZJ4Rnt5N+kbms+LeB2CHR3IeDwpQ5LwzP
 q2f7b5bh+Z08ieor37RNk8OwwWz+MevnCW+e6h56ywLr4hVmO7OVBqL2Quv1wLcWByD2K7K1c
 0c/Ssca/bmKb/D79keMpFlb2Sfr/kKCm83A/8fnAAgsiNyvuUdB3hwfFGv4WSTbMHJNzOHxOh
 SdbjpUdhf7Olv3qVh2XSKr2Q4diGcDnuhogxvoSfye6d4tpcMKsPvp5ZIYJgrRc9NyNxSUism
 Ug/ZQigSY4N6cORkELdyL1r/kHZthWtNPPjVN4wgILrYaCmuYwor+zF1lNfth7UkS8EVlslVu
 Ejx1pLnA27BI6BJ6ZA9luGs+dagrDu19EQ000LnA5kuwsuGNAPLpen4z0lf/wDyWEu0K3/r0P
 PbDcwmMQEiamqE98vsQCDbGunNYGDnrqPmLnKHTLOQOaNI+Id8CyispqdKHGnO2Qir3WYrnSy
 GCWthiHD+eslckCKJTswmTCg/ycTL/fruIYrxWLjvOmcIjCp5EYAsgtkRMXgwn2xnM1imYVPR
 P6haSM72wSNtWUNVn/zOHzkPrt6Gx3lpkk+y45PXJJkpPwi9eDisJ6ArrijCjKd9l0coLxK0k
 h+g9kowqjR8mF4u4ZqsARoZb5VADR32NbtK/7BBjTUf5UYhNLYowwux1ognsgO9KFnKByCI9r
 wmUzN+1DbX1PG2LIQpj/ATVY4Kddqcbw9rCXEgTnXsNCLpYzKiMzK1PeXQ5zGBmQCkcc7OoGI
 sMGZ0c656OaNRdTtUc+kTktvC98QluX2dOE5smopfJst8iaNq+9LyIjNQKFjdjTe20hUZHAbl
 a8kBS4EHg4MZo9UgfRVa3wUxjxr6MP2CwJnZNbwmiE4z9KpEUahcKABssVbiJ9XZYX1cZov+9
 dT9bY/XckcUQC3RRIC6mwYp8e50oAsiFvlUrc2qlhEBDbo/d4DUs+RGzDXkmWlhDgV1WSLMYZ
 rMYdaH08EkY/+tc6mVLFmpqoZ/F0iRmIB0aZsbVAX8QUgFHFWYCHrL7RVCxgMyuUiexf1FgzZ
 QmYbLRpYqAVLryTYakFBuieCSfWkyF3SBc0opxZJvXlh+68hDW49ZmDSoVXxhnURnQXHkWlkV
 ZoTTF3SWtutBgIky5MMHCHPjqBfhQuFJthF71ru2cWCmEDU2JPGy5m/Rmh9DwpdlMG2o9Vdr2
 EJAFJqksadZUU6n3aqWwaOL0JwiJpQr2GCcE3eOd43FflRE2oRUlfWEDOai2SErgmAqMqZ5bd
 vnIqT4ak90oQim4vOIc7UrOqKH6RlAXi8Al+y/n/SEfCXxNqI07ECx8X63iNh+OMy61tNQ4cD
 0OIpnDlfFenLfr4+buVLghkOjpd2tA/dNLE+0+UbWo/Gngsgo9IRfOWBtDigKxIh63rIFOCdc
 pyazWeTXpyqlv4GsTYzjlEQHcTFQ7wBaXDo/kw9NSx6sHquFlLNkavkasgG3ZpwgCP9ZOeIyQ
 qy6b/p7KQjDtx33EgpeLfhDk9DV6SdC12RUtlx5/9smSJjAMIzR6F92BXoIljeQRXHxv6c68x
 tUAJrHi/S8CKOCcb2vueMcYF8iK3X4+ekiN4oVv0QTWD43sAuycmS8r68jNw6UUeFU1XMiDsC
 uBGaF202eg6LBX07O77WVQdkdS4S4KWDPlgRvOt243ihs+4z5UAICZpW2HZ3gGe755IsEpeX1
 TEK1mJiwXZAyjNyQgNiPRisn+Gtvrg2K6/B5N1Z5cHPbCoVbc66AGJnWS8yuW6otKcrbXB7Du
 zhrCwI8pw9I8MAJIkFPiK2FAL9g0kaN4XS9IWJ1J9wKBoHaCHHxv5g44audHvOreB0qv1eUUf
 g0JE+099SFfSE7DkrtLj4/L6QSz/RwtKBWZccw4HP2Vu4AYEr+cTID9q5fvHeS8SHYcJ0cMGW
 KTKf8Nwn2iJJ9iuD/ys1YgbuY5I04Qux8vbSk8Sq95UwGF3UA0shBZLEemv97BRyItbht9IFB
 7nvKsfM/Jy86Dr1C6Xu/SlmeKjZelZanpzlgTbv2OafhXGKXgrHriaW+LuKAkHTN5dreJlAXM
 pER+Qk5GVps4hgo9eEcbT2bzia5bEjE84KmgKbQVhCa38LfXiJEiQ8fenFmGNyg5T9hWF1rSK
 AKpp4pFKJxfdJtcslPiGKK+eyG/V1TDHXYJpYHiuNWF9a+JfHPu/zWqOe/NWx5AOut4pcdAKS
 2zt6cEaOVQpSVjrSIz4VZo+PQNEWXL8ofNc0qCMO64DzNEdguOy3g6rTb+8abIfXVWPrQ2GLp
 zcRrU2nM0xUdBb2nBrjU8C7aUNlDWSxN4fpBtjHsBVWcemAsB6x4wRfpYPSYeRYy4ExpxLJ/c
 AJALdPIyRirQoLmFv1sB35EepqDcYYM3ixlF2AKkDRvOSUIaNBDH/X4OSIO41TxCWlUW/gYyF
 IpXqNz/da8fnevOVcKTzEZxVIgI56BnCsMyGjGLSne6KR4WFzB5WQEtP8e9KELvZcrCk2iKHn
 ZQVpT42YZeIyS8HlLg9ZyZRhmEstE0GBPovmYlcfS0U1KQaNY8+fI+3dFPLl9yDknJBFaX7tu
 9GSL3MhUZMBU3t2NRXrDmQCuqIV+v5XcU5Ad7WTUGZ2eeDS4TLkR8vl1ZmrGy5iHfThmSN8Nx
 WrXXtHULo/loGVRDFtws9dgBn6Gp5IiU/PSpW0p7BSvGY=

On 4/9/26 10:38, Thomas Wei=C3=9Fschuh wrote:
> On 2026-04-09 00:15:54+0200, Helge Deller wrote:
>> * Thomas Wei=C3=9Fschuh <linux@weissschuh.net>:
>>> Extend nolibc to target the 32-bit parisc architecture.
>>> 64-bit is not yet supported.
>>>
>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>> ---
>>>   tools/include/nolibc/Makefile                  |   2 +-
>>>   tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++=
++++++++++
>>>   tools/include/nolibc/arch.h                    |   2 +
>>>   tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
>>>   tools/testing/selftests/nolibc/run-tests.sh    |   8 +-
>>>   5 files changed, 194 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Make=
file
>>> index 7455097cff69..81187126bf93 100644
>>> --- a/tools/include/nolibc/Makefile
>>> +++ b/tools/include/nolibc/Makefile
>>> @@ -17,7 +17,7 @@ endif
>>>   # it defaults to this nolibc directory.
>>>   OUTPUT ?=3D $(CURDIR)/
>>>  =20
>>> -architectures :=3D arm arm64 loongarch m68k mips powerpc riscv s390 s=
h sparc x86
>>> +architectures :=3D arm arm64 loongarch m68k mips parisc powerpc riscv=
 s390 sh sparc x86
>>>   arch_files :=3D arch.h $(addsuffix .h, $(addprefix arch-, $(architec=
tures)))
>>>   all_files :=3D \
>>>   		byteswap.h \
>>> diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc=
/arch-parisc.h
>>> new file mode 100644
>>> index 000000000000..8580be5c9c58
>>> --- /dev/null
>>> +++ b/tools/include/nolibc/arch-parisc.h
>>> @@ -0,0 +1,178 @@
>>> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
>>> +/*
>>> + * parisc/hppa (32-bit) specific definitions for NOLIBC
>>> + * Copyright (C) 2026 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>> + */
>>> +
>>> +#ifndef _NOLIBC_ARCH_PARISC_H
>>> +#define _NOLIBC_ARCH_PARISC_H
>>> +
>>> +#if defined(__LP64__)
>>> +#error 64-bit not supported
>>> +#endif
>>> +
>>> +#include "compiler.h"
>>> +#include "crt.h"
>>> +
>>> +/* Syscalls for parisc :
>>> + *   - syscall number is passed in r20
>>> + *   - arguments are in r26 to r21
>>> + *   - the system call is performed by calling "ble 0x100(%sr2, %r0)"=
,
>>> + *     the instruction after that is executed first, use it to load t=
he number
>> better:
>>     the instruction after that is in the delay slot and executed before=
 the jump
>>     to 0x100 actually happens.
>=20
> Ack.
>=20
>>> + *   - syscall return comes in r28
>>> + *   - the arguments are cast to long and assigned into the target
>>> + *     registers which are then simply passed as registers to the asm=
 code,
>>> + *     so that we don't have to experience issues with register const=
raints.
>>
>> side-note:
>> this is actually really tricky.
>> I've seen cases, where the syscalls were not using the given registers,
>> because the callers were too complicated and the compiler could not gua=
rantee
>> to actually use the given register.
>=20
> This is weird. We are using the same pattern for all other
> architectures, too and so far that worked fine.
> Was it a compiler bug?

No, it can happen if too many registers are in use and if you e.g. hand
over arg0 =3D a+x-z, arg1 =3D 100-z/3, .... (I mean if you put in multiple=
 calculations).
For now I would ignore it.

> (...)
>=20
>>> +#ifndef NOLIBC_NO_RUNTIME
>>> +/* startup code */
>>> +void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_p=
rotector _start(void)
>>> +{
>>> +	__asm__ volatile (
>>> +		".import $global$\n"           /* Set up the dp register */
>>> +		"ldil L%$global$, %dp\n"
>>> +		"ldo R%$global$(%r27), %dp\n"
>>> +
>>> +		"ldo -4(%r24), %r26\n"         /* The sp register is special on par=
isc.
>>> +						* r24 points to argv. Subtract 4 to get &argc.
>>> +						* Pass that as first argument to _start_c.
>>> +						*/
>>> +
>>> +		"b,n _start_c\n"
>>
>> you can change that to "b _start_c\" (without ",n") and move it
>> one line up before the "ldo -4..." instruction. It's a little bit faste=
r".
>> The ldo is then in the delay slot.
>=20
> Ack.
>=20
>>> +	);
>>> +	__nolibc_entrypoint_epilogue();
>>> +}
>>> +#endif /* NOLIBC_NO_RUNTIME */
>=20
> (...)
>=20
>>>   QEMU_ARCH_USER_ppc64le =3D ppc64le
>>> @@ -199,6 +203,7 @@ QEMU_ARGS_sparc32    =3D -M SS-5 -m 256M -append "=
console=3DttyS0,115200 panic=3D-1 $(
>>>   QEMU_ARGS_sparc64    =3D -M sun4u -append "console=3DttyS0,115200 pa=
nic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>>>   QEMU_ARGS_m68k       =3D -M virt -append "console=3DttyGF0,115200 pa=
nic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>>>   QEMU_ARGS_sh4        =3D -M r2d -serial file:/dev/stdout -append "co=
nsole=3DttySC1,115200 panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>>> +QEMU_ARGS_parisc32   =3D -append "console=3DttyS0 panic=3D-1 $(TEST:%=
=3DNOLIBC_TEST=3D%)"
>>
>> You could change that to (untested):
>> QEMU_ARGS_parisc32   =3D -M B160L -append "panic=3D-1 $(TEST:%=3DNOLIBC=
_TEST=3D%)" -nographic
>=20
> Will try.

I tried.
You are using "-display none" which is nearly the same.
The difference is: With "-display none", you will see the output starting =
when the kernel
switches to serial port".  With "-nographics" you will see everything from=
 the start
of the virtual computer, e.g. BIOS messages, boot loader and initial kerne=
l messages.

For your usecase either is OK.
 =20
>>>   QEMU_ARGS            =3D -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIO=
S) $(QEMU_ARGS_EXTRA)
>>>  =20
>>>   # OUTPUT is only set when run from the main makefile, otherwise
>>> @@ -215,6 +220,7 @@ CFLAGS_i386 =3D $(call cc-option,-m32)
>>>   CFLAGS_x32 =3D -mx32
>>>   CFLAGS_arm =3D -marm
>>>   CFLAGS_armthumb =3D -mthumb -march=3Darmv6t2
>>> +CFLAGS_parisc32 =3D -mfast-indirect-calls
>>
>> would be good if we could go without this...
>> But for the beginning it's ok.
>=20
> Why? As nolibc is compiled again for each application, any users which
> don't want this don't get it. For nolibc-test it avoids a dependency on
> libgcc.

Yeah, but I think we can avoid libgcc other ways too.
I will try once it's upstreamed..

Helge
