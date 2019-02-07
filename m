Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1240CC282C2
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 22:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9CE32147C
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 22:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfBGWWD (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 7 Feb 2019 17:22:03 -0500
Received: from mout.gmx.net ([212.227.15.15]:50803 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726622AbfBGWWD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Feb 2019 17:22:03 -0500
Received: from [192.168.20.60] ([92.116.171.129]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MCtql-1h1SRU3uYV-009dyg; Thu, 07
 Feb 2019 23:21:56 +0100
Subject: Re: [PATCH] parisc: Add assembly implementations for strlen, strcpy,
 strncpy and strcat
To:     Matt Turner <mattst88@gmail.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190206222110.GA19527@ls3530.dellerweb.de>
 <CAEdQ38Eb4=i6ED-Ndgqu59C8Nmw-6ECVbm3snxSi06LgHn-sCA@mail.gmail.com>
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
Message-ID: <a2f5a38f-61bf-ec8a-b855-49f88b59905d@gmx.de>
Date:   Thu, 7 Feb 2019 23:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAEdQ38Eb4=i6ED-Ndgqu59C8Nmw-6ECVbm3snxSi06LgHn-sCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SArzSGrPmJYv2f4EHtFmsYegjnXkYs45S5Z//LNFrbAbg0iKf82
 c4/T00Ne65il0O6y9zXnAuxLucptzFLkOqPiCpt7uyiL+Bt0mLgVbn5xTg5oIV1EyDZ7F9Z
 V8wAOU4XTpR+0OR5GUO1WP7V+7z/2xHQcOGuNmVGwScI7ZbexrOn+zLTzp3o3Y4nkOrTckj
 usB4WdtqEUzg00J2Yj8JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eN07+EhY7pY=:wmPZ8GdRFf8aIX9bJyi93A
 INL1e57BWy9NFrpYaYeNQUQ0qmHY5yZMcgLk0y7m/+dRApiF7NPg9fkOMe7iLmhB9EauyFgrS
 sVGEMJJNdLSqYoHA8kuRKCIKOkmlAOJewFcMYadjsiNakbq8BJokZpZiTtTiZiU313l7TjAA4
 DbA0+4S3wwue9jPI9lRU3+FWj9GB1WKjd1IxTryM9mvabqvUIC6jCAn/f40ZZgpdc35yyMzpx
 W6elb1GqFaCbvCCRlGtboRTI8i6crJAqC/LHw9Da2O2buzxMeGqZPxU+9XnXwxAhETTUHQqfp
 yMlORjq9XX/10f5rYyuWBuSCHjgk93kGNK6JzbFwsTvwySiLhIifvwO04CMItCdaTzCmvQzCL
 kU8AIw3fA+n8bqjjBw7cqWdk0WepVzpaFNxMptYpsbwLklKQrGo0+58lHQzqWiJOVokhSP1o5
 nJc83Ye4/dVqRDUbGtqqM2r14t3WiBRSwtODZ840rNDEwkrUhfvXZO5QHipp68bEsIAvaNr3n
 uQD7xfYHkLa6kPM4OD/tUKBcRYkSfz6DNJ16Zs7tw/qnbJEYe9nnuwAlYqytYfrM9wbo1Cgqx
 Lz89l6AF9LhWyvgoZ1bscHz2q2PVnh9uk/OyigWlGtCOvpsekTTPKnRpeCK0aWfXf+kmi+aSY
 HKLj6/GzTZVo23MAwHKhBAUVrawIwvFw2i9IjT3mpr1Wa8/dJIwDtBE0uZKpqmQGlQ/AU5Guv
 sFgcQ+XGAMnLzcaFbYY1x1GBDK8kLx1unzCU+jMdOxAAQBJ/ILlzbAkPZ9hzk6AktaExWg3VX
 TJvYmkPAYJQw32E4GyrYqngE/0VhOPNsq5KGvyd/s8WKe7mycH9k5TBihm78tAFFlyb/+ft7h
 qAXvxGwPSPtRlUdzVCZKAgypEJBhCVmtszx90GKdmmQ6d3/A2SmLjqGAe+aKHR
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On 07.02.19 18:46, Matt Turner wrote:
> On Wed, Feb 6, 2019 at 2:21 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Add performance-optimized versions of the strlen, strcpy, strncpy and
>> strcat string functions.
> 
> Can you say anything else about them?

No.

> E.g., are you using some feature that the compiler isn't able to
> generate?

Some assembler instructions are used which the compiler doesn't
use by default for such use cases. 

> Do you have performance data?

Not yet.
Maybe someone wants to do that?

> Except for strlen, they look like straightforward translations of the
> simple C implementations.

The code is much smaller than what the compiler generates and 
the layout of the bytes-stores are targetted the behaviour of 
the parisc 64bit CPUs.

Helge
