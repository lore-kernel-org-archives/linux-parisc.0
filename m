Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB643E3DB8
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595819; cv=none; b=nS4cX8/4ztbj+8mGRcvhB1EM5ImI+ugGlYbLLBNMgz5aXqTdOnIq2GIT3owsdRXSbZbnV+XwJWSu5Xz7bI3tJHJKNdzV6a5xHb0h5Wk5eTg9U4bgLx7rKRGFt/Y+f+OYwgCqk5A2OgE0Ib+rUBY4r0t6l0VflUHue2Dd+ibxMJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595819; c=relaxed/simple;
	bh=tutnNf9YAg3H/q95A7Iik+KRuKDbYTmWKhCV2b/wa50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UasgNTSLRO0wa5yD7604sZDKbrenvxkhud86Hzb/6dbUeY5Evx4gaL7oMLYxIajMnZwKBZslndFzctJh6vNAFwLg1CoGsBsWRNuJ0YfNq+23YIAKDl6G7uhNrRBwnIUfUynAqEWJBbU8a0DKG9McMumUA1KS9IRKJ+nyJS2upM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZBcJAam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvx9Fx7c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZBcJAam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvx9Fx7c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AwsSv1470055
	for <linux-parisc@vger.kernel.org>; Thu, 9 Jul 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=; b=bZBcJAam+ibbXFwx
	fYme4cr8sBqjGZ8/bhY813m3zZdemgRcv+ZZn5hEkMKaS7vw0Lsk0C+lZaMW/4N7
	48Ti3b9W5djrMW6C6sRvr/fRMwvlr3Xwdk0O8mST92o98b2JRkz34WzfXmdlRdyc
	+GNzKHdNyJRx4XFA9Y/FW2dL+68kjj0jsC9rEzLvB9U2wtPREHvCZncHnjBH0nco
	DqfIf8EOVkC/PQXn3R9FFwNfO+c4fAiAxBDB9r3vKIUe0k0qjSg4thZ00H8jr+97
	7VzXtBysfy4u+kGoa711kKXXJoacuD/Fbabaj49b91/ZVeI4dz7AgvccLaeW9YDn
	oHnuIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u3ga9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso10817321cf.0
        for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595815; x=1784200615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=hvx9Fx7cK4VyY+n1f4ICesIJSEiyOkjWYm/+wOPIGIE6QiViWOxkwyW/o0ZYA+vKfx
         a3/4svYb1xl1nzDXkAHEhNJSI+YLc1ERvCjcxNTzHPxDo+JaK4OuzKr5LHPzJenvz1rd
         PtXLddXNFrmCgZc8T2+19wRWurIRQ7x/5U/g7W5OYUNT9ZT0qtva1Ujvh999WOl3lgUF
         kn/dp1QcOO6tQUgD+WMA20w9FG5HMjpnSpBee64rVwcP7YfJv7IdrLz6E4E3efDXsifM
         JKCp1ABHDEiq0SQpy2MjheWV0g0rCbui6tCg3haQZURxY5JZL/i/WNWTRUjq8faEsLAT
         Cpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595815; x=1784200615;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=lOQn1+VUt8xutaf96pFuZRoVOOJ1TJUq46AawC6LF1qphx24rgpgdIQKB9wJ22nxE2
         geFI+rDUjO/0GY+1q5dsm0cNxMEF+UIPCyOlCfIjM3wYcQbuJqQ2TUC0CeEF9wNqOFaV
         utMct3X2G/EzcGa9lcgs6hvhxYxa/AlaLldy6BRWskrF080JzONULJp7kR0hj9rlk9KR
         goV+03Dg66p4RreM3tTOt5+zDappmOJySDhUiSC9upNgLnYjH5Dyr3e7RKdvhS9/YbkS
         vnDnMl4b78f/DQzZNurb4nstq8ZQftNEtOZb1nZexTsxK9ON8czTbuRtACgD6dBWeVzw
         RA2A==
X-Forwarded-Encrypted: i=1; AHgh+RqNWVWHcpUoge3obxXV8sX7gvMso+q6OuTJ2HkWzbR5vdmbdOIQ+Hr753ijnEpIz3sUAdfnlpxjtFpb7sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcXSd2I8Ht73eusg8l0ec8PVy/uJPPooaCbgO4Za03zp3v+5X
	5qhky0hz86wkLdqblW80Kc/HD+leT5gN2g1wM8xSqNr263MoQZKIIT9ppzoN2nU9kQraewOj8Tk
	r6GimS9NpYpHYqKSARJ5kPdPKTqDwYmi3st6UV+pr3qvlUg7hZ2r9CivkDIVyFWrF3gg=
X-Gm-Gg: AfdE7cmS8sUYzZPs6pb7zoSwYETEYCj2nAOSuHXdoPFw3mMxKNvfnECNAl/6tfVOMzz
	4V+nUHlaReLPmhTlotA3Tx8TGotS9DzVXbAeVTjzUTceVQ2rCFnXK8qXAzRQruQeeUKROoIPgvd
	YWH4xgJTm0tY4Cqd/b/cWncWLNucDlQbavjI5eNKspWCrn+nVXSUSE9Gd7VfzgUzN1WAFplx977
	aqItRxkbS80ZpsG9u553aYGfI1nNNLtbcsUYbNlqwigm7VmyAA+5uriWkUhdyXw/GP65L10mOOb
	7/Y9rm1D706XBpn0R1DFN4yg3x5RYWElq4k870kUF+yUWp2WNplrk7OuPHUCZXrdSiy3cKxJ0/a
	f4+YE+PO47ta8ghqDL/rtYPTtGOPt6E8LTgOfOetEKQd9lCViiT6rE4ZCO7qiOQ==
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236461cf.41.1783595815668;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236071cf.41.1783595815288;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm51612968f8f.15.2026.07.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:54 -0700 (PDT)
Message-ID: <b2ca1416-e2c1-46ac-8a26-ce671c76883f@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, x86@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.974626922@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.974626922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX9BnW6PQoV3YZ
 2pRc2BPR55t1mTldB93ARwEF3I/bRbIHKOg9nzWGoaCPUqiFVwzpf1cKuO+rUDJ2mJWx1vvF1t8
 Y8Kw1ILRW1cyW5X+mSzLJe+n2ADosPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXyMd2tfLeycha
 V2ZbgAPjz3WXnj578z0oRVuQXGEBnZGmAiNKX5w6abpSvQCurfoK1y0NFRVjIQPiOCIbJ38C18f
 ktbHv6OMUriHXvqYj6I2UFrsJpZiGmLCARgB18nBBtAtMQDpKTHlw+aBTItTVOMlP9AEAWDRo02
 E6A27hUku66XXplM17iGY0lMGXmuOtlGn9jVHFgoW9ZxStsVL+FlwHRSYAHWKyjV0L28Et/fE0Z
 I3nxcv0oqFkRDifpWpZMYyGLmzIb3XbKmhif4FYVv7uR9PJ4+nr64HAFrkkgg+bPFMEoM6AxOR9
 ODQVqHkNnyzlzrKsUlxglDpp9C2jArLtC99XDfdhh+zvdlTPN5194K2x1WrwJ1ARbjxpT9V3a47
 vqxvPYbJxodUmsldK3HxntWQCoscUChU96MPS6VCFbDPVjBMUotj7ZiW35kGQzfsCySKYQJVMMH
 dG2+O8lH3LxMzTgbq3g==
X-Proofpoint-GUID: 4OI6mHI4nWff5klOu0Kg7eJMhBWNKDmG
X-Proofpoint-ORIG-GUID: 4OI6mHI4nWff5klOu0Kg7eJMhBWNKDmG
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f8328 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108

On 7/7/26 21:06, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/kernel/traps.c |    5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
