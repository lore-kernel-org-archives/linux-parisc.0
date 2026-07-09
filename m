Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF12410D1B
	for <linux-parisc@vger.kernel.org>; Thu,  9 Jul 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595791; cv=none; b=JnG/cev36+qn8cEs/DL8NzyGHTHO2viD18U3/ChwkioFYFkMZGIK6EaGsLMihYW/wm5Wjm4rJDh+6ei9RtWM6bPSaOMFpsAgJNwhOcPxQ5uREfCi1ijy2j0ufzmyT5pDfRF8GdNxnV5rrw2uM3sBptSOCpkiTEgB66B+grMo9+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595791; c=relaxed/simple;
	bh=khehXiLJiCSvkVxdEgobbE7CP/Mf6o7o044NnO1eP4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxMzf8m5nZbK5gnVhfz0YYm1pKIdrdJEgMi7FkSQr2tMPmbRnskkQI9lHamSaIvRdZ53UfL3PnmaJmCAdRPDstWf/vClRbw0ENTdl/SpgUnlN22ozi8D7V1NeJH0sK9a5AKOIqzVq8V9Zoes6Wh2A24m0n1nS/QoSV9TJQM8E7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6Z+l6cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ag/SrbdG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6Z+l6cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ag/SrbdG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxuS31614867
	for <linux-parisc@vger.kernel.org>; Thu, 9 Jul 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=; b=i6Z+l6cz0ADxMir5
	PP7gquUEvOGqieG+lf85k6tqb18XN99Vb/XbQueU32Nh4DFYdvrk7j7dFspHsXdS
	Cy7w+CsZ/lI338HKy004q1RoAkSXUYbZGedzGtf6/R1/0ogaog7QiT/r0AH6uhhW
	EGub/EAkoHwsQwiSwXadb/oYPAyoLb8nSMPbvA5/LtqwV8trHzPhgOS4T3OKYTVp
	y5/p6PBjRcCgw7xpwdmKpUFT5d7kIO23k48hxSlZ8uRGHGGnWe45xji+gjzdUnc9
	Wyi3IdVy9kYk4bNta4UN3ybii4hmT7hogdBdgOfzXklVyIt2UwzF5HAMNiWsF/IF
	edCxbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kdmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 11:16:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so21944286d6.3
        for <linux-parisc@vger.kernel.org>; Thu, 09 Jul 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595786; x=1784200586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=Ag/SrbdGUN8YwevKN60f9TpkRi7MJt6/BNfS37YQFmPHeHSx3laUoMgitr96H5QhOd
         o8EjDmh61KKjgNd1zttP6futg8bxxbP47cKdvTIz2KeeDHVAkElMvq93BEVC5NfvuFAx
         MRxUjZpkns+njyUCUHuXfEyZMKxpXo1ZC1Q9rMkIpGsiqVCZSinHAdD7dtvRiDAHjs0F
         xhQeQlD/SubDG5+cJ1w8LEpEbcfLDwRmXPq1/cXqL0qsGxD+sRjZQBctQy63laQj9AT5
         1imZXsBLxHjeUYPZZw67h9B8raHgwSVBx+6D+MhgLkNMiWCZRDER8kVZuMgfTlSjuYGD
         ab+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595786; x=1784200586;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=TZqL4wGNabPqghAaGV3Cr6gqkEAUqu4Egz/+c/GiosR/iAWwhcwwmTZvBjDs228Qzw
         LYB9Umd8g+bHRmYR67M6lqKzJujP3LQbOcI+DkIRvRS8vwKZgTF4mIcoGM1yeUFXqqlv
         Gc/DYP1+8iM32F4xqqugolxx1vBpGP/xN7TaJt0nRl9zWt+wKzQwhJvQiTqWIWLJeXts
         RNyiJKn4imFNfXmIIzmcuDVrCCDSwNCBP2KVvNMo7LJFHcXKvvmirVQlcGcVmCYe4nUC
         I8CweKO43VeYbN+40jN8iR1npqadE5VQtZY04b8mn89U1H4jQER61dh6KIrOhJmZIW2E
         2DPw==
X-Forwarded-Encrypted: i=1; AHgh+RrTPKaIO8Jz09HCovk3Bz/xruFYvZ5NKs9Nu/9LISduD4CMFwTRhwFBISg+A6Otl8WPtc0DQinETnph0pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhxsnx7XjtMcWIYKBDPt1ZQ6n8UemNxNf6yLEAHB0MeS3ShaKS
	Od+UQkq8yRmNnmlAuPs3tGU0bjtPhXhdhUr67lLZvP2RS+9kzDOozTTzGwURqoNeWXWKlhODHcU
	D17a9CwOwms2Ha0bUlJfyDRUaAXnMXeGbRBJJRsoTeV5z2Zf6olfVWAbHsYDqjKFcpsQ=
X-Gm-Gg: AfdE7cmW8X3UuTvgUSlYWHitNP6hdzqbw2npQJlXLjrC3m+ZO8svii386/QTBeP+bKp
	BICu7SYBxiPzV4hiTlmWR9IImBy1DfIx2jfeM8eOmjuVcNa1cS8fc7HEw1fnFjkFggJPOTRl8qN
	rBwR5Kt9nJVcvV/8Eha4o7fEuDNPPXmrBZ891KCOgZ8yAkc3dqIF/YpKk5jpndP27n6U3Mfgnxd
	+xYSFZ1uMWM8Kk2YtWZd+eU/yUNhEtp0SmQIP27R9strZSyy0iRTmF16wf28MEV8ZbdTXCAi0cc
	OMhQV3PzhGT+xI+zL/xf+kIbbLIZ2UFVfXbsXh9qR+9JNwmXstJe6imxwEUCIzhHVr2AN9HVJIC
	SSYK6N1Vm9zn+sKGaLsFOTYsS/ZtxImJ0qeVrBH9RuU0QV0fVDOeVKhOdgoVdgg==
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72818441cf.28.1783595785877;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72817641cf.28.1783595785396;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm54261424f8f.1.2026.07.09.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:24 -0700 (PDT)
Message-ID: <b45abac8-0e8a-4005-a050-a0d37e1c8e2a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
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
 <20260707190253.918861529@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.918861529@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX+Gnr03spcOxI
 gVR8EFI+sKXb8B1tlOIjRcBI3t+NU1ssLsc+zZiSedty+R19Lyvp/TCgYp6z6gjDi2GoFqhuq8u
 3Xpre8PowX94FJTY+1aP5p30n3NkQ7Q=
X-Proofpoint-GUID: aSF5IdYBL5t0Yxn1TpW3H5EA0Al_uUUA
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f830a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: aSF5IdYBL5t0Yxn1TpW3H5EA0Al_uUUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2flazDgI9M1z
 NDiJ0LqHcfcBPwirwNQQaRDwQST8zzOAUlyjYCZ1vHVNpMly9JoGTIiC0H4B6iTswcaw7kZbx6u
 9GQjz99bGpsYytrNi1x63mSxMVSbDgpar+KZkIhRRSjX+iP7UliPbudI//D+nPrkoRikeligIh+
 sqS/HOeUe1C8Hfhk+6NrNdgD3muwgRBInle7jtDSxMjjMAobJfh/UTKaa24NraFHK2rxy5ghGKO
 hDXibaZLC4XxpIppL/x5R9eiwnRBQRy93muPD44XoV9PqS2V5ARdHTZhwo/sbIglbW297Yd6s3A
 CLanIGA2r8VyLbypEknSi8LmlEPXqyJOgrMwVSs0eEF45IpHdFoultDY1EqfbDvEehlD6Xkbu+o
 YQOZ67wvOZFIwUODOtlzbTKECXYNJ9Gxe9ns0CT6f0S1psK5xj08tyIe5US0nVsQRR83/U4oTkm
 /YJKdVewe9c6HiF6sJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
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
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/syscall.c |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

