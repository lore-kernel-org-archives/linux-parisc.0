Return-Path: <SRS0=h12M=SR=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456DBC10F0E
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 15:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0035920825
	for <linux-parisc@archiver.kernel.org>; Mon, 15 Apr 2019 15:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="RmYJg5Zc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfDOPyw (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 15 Apr 2019 11:54:52 -0400
Received: from mout.gmx.net ([212.227.17.21]:48903 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfDOPyw (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 15 Apr 2019 11:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1555343683;
        bh=rxruGYfHp3JrvL0BPq1X/9iiESe2Kaaou4uj79HAT9I=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=RmYJg5ZcwuBLoyNagM0R+/lYH6cAg/8aiFhJMJzf/DyAeFPFUU/v1+UnI9EVlIiby
         OGvrGqnA+SFcqpHTbv6fG5OHDAZNZ1KtRhOqhROwfnqmqMAX5n7LkPxw5Nqf9jw9cx
         M1u1oVPzDne6EOTQL9RwEOlnMJRueXv17zEQOGlU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.189.244]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MZ8fw-1hYpFX08bs-00KyiZ; Mon, 15
 Apr 2019 17:54:43 +0200
Subject: Re: [PATCH] parisc: Use ldcw instruction for SMP spinlock release
 barrier
To:     John David Anglin <dave.anglin@bell.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <a12f7c71-553c-1e4d-d986-8a966f6e83dc@bell.net>
 <059fe85b-468c-06b4-fb07-dbcbf2d222c9@gmx.de>
 <ad7a78c7-ef33-7510-577a-731ceabd5561@bell.net>
From:   Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <52ec4072-6535-8fcc-61e9-b17b36a92397@gmx.de>
Date:   Mon, 15 Apr 2019 17:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ad7a78c7-ef33-7510-577a-731ceabd5561@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:i0LWZh7MVxIqsrllJyFs1SaRO+Ui69MQIvrcPX6hmvbAnhoYI/H
 xHIXqNuKROsHOOSKlR6WAibqFDnYkl9oPQ4O8uHpg6j53/K6niM1UfO2V9ncpcKYuDIKzsj
 xOZwR1SxaHsNG1SKlo8tZJglsMw3UpyDCn07z2QTtYPchoe4m1SkC35iFaEGs0mnCfMtUCE
 2Ii/Jg5SxAYt1QgdqOCxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPFRu5BinFM=:hUEUUOJbJMLXbXln+l7Ajv
 AxLYN9s+tFxudlo1tGEQAR6LrGsx432bmQk9lOrWlyCFIibwFS5JTqHMlpKdzYxdcWtOcCwkn
 kv4y1Y7IKtPtZQVP/Cg286oIPuGZScnwuiQV53F3Nsm1yjsSanRsaitDlR7qtW9C56LJPp4Ec
 z0BOyART4sGptVTzrQyvRFXnSiLmSv/xPA6r+fzDYQNn+6V7aytzHBrcyCyDjMxR4UFD3EkJc
 DGGjq6kEKmidJPdMCn/fGxou3hLB6xM6KqzXnqaYxHEy7rHvdrltgqs11kW2nlsfmrwtKZWSZ
 zDKVHnLLWfqNWh+ozMqZ2hQOOJqsUEEmZLyYTdsuA/lEdbEXzKabMoQjhiNE2i+L98dI87XkD
 7w72wY/u9hh37VCaw5WUM2LxZEiYSKEjhBb7McwUWY+oip6mOvvgHO0OsNOc4n0tQQ0z6x8ZH
 /g4MQTs0yYy6JY7G51jimzM09QsHpkAUtTT45F/vaKOJAcexTdQEstMH7pkGdWD/qlD3547T3
 uVsdsGOto96XjsZdM77KREhoacR6Hx84DhEDf72ePF59oYlbLKwJoETyeDDpbJAgsgtNkVQDx
 U2sZk5CIgDulmGZ/KgmH4YJuXBdYKDaS1D7aORII9FZpbxDgA7bwVpxnLPgTrDOcskkFsuy8V
 8NZ5hnCsoskiVHRy1zNODB9VxIjx861znNCuOlOddloc8LiA/kkWsik5ersGf8rQNeUOCoc7G
 f7tmaeMDnvhvs4ofwmB1Fd5+YXVEs7F2M5KyOHxQloPDxyn3PAa8HXcQx0O3XbIGEuYMm+A6x
 5IE7E7kZdxvt/+d7aOZEfTS08WtPseuj/j2yWkDqDgumH+3ESHJym756NBsLbsyKXFxnIgqir
 J3t1nhUADIS6j7Tv2SP2+xHEibZx+P8rPmHkeAlqVOa4DWdz6e/QRr5dIH7Ocs
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 15.04.19 15:44, John David Anglin wrote:
> On 2019-04-15 8:43 a.m., Helge Deller wrote:
>> On 15.04.19 01:20, John David Anglin wrote:
>>> There are only a couple of instructions that can function as a memory barrier on
>>> parisc.  Currently, we use the sync instruction as a memory barrier when releasing
>>> a spinlock.  However, the ldcw instruction is a better barrier when we have a
>>> handy memory location since it operates in the cache on coherent machines.
>>>
>>> This patch updates the spinlock release code to use ldcw.
>> Just out of curiosity: Did you maye do any timing with that patch?
> No, but I think it made 800 MHz rp3440 nearly as fast as 1 GHz c8000 based on buildd times.
>>
>> Secondly:
>>
>>>  	/* Release pa_tlb_lock lock without reloading lock address. */
>>> -	.macro		tlb_unlock0	spc,tmp
>>> +	.macro		tlb_unlock0	spc,tmp,tmp1
>> Above you add the tmp1 variable...
>>
>>>  #ifdef CONFIG_SMP
>>>  98:	or,COND(=)	%r0,\spc,%r0
>>> -	stw,ma		\spc,0(\tmp)
>>> +	LDCW		0(\tmp),\tmp1
>> couldn't instead %r0 be used as register target in all ldcw()
>> accesses you added as barriers?
>> Or would the processor "optimize" the access away (which I doubt)?

> No.  See page 6-12 in PA 2.0 architecture manual.  I had wondered
> about it when I wrote the code.
Ah, Ok!

I've applied it to the for-next tree.
Thanks!

Helge
