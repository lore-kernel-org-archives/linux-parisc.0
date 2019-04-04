Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB98C4360F
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 17:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C63B5206BA
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 17:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QlvwBRCH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfDDRyt (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 13:54:49 -0400
Received: from mout.gmx.net ([212.227.17.22]:46101 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfDDRyt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 13:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554400487;
        bh=Lb8Fy1pLYCAL2YgRAsh/muw/AnTo+2znz3tqbpvD3oY=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=QlvwBRCHLO7fY1Bb/WzT3gOsLYVMIfdInNulOB1vXFBoKhLQdIN1A8RIHPdPhW9X3
         1H32oluP1LDW6dpcWvhrP7/j1bL0jLiDOPOUmjNIhOjOamcNNh5x4BDtn7squOyB2d
         MuGMkX+iJp1y/pCsClKaAgM1wXVcJTtuCYx46kV8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.76]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M0smx-1gvPGi1ERL-00v9gD; Thu, 04
 Apr 2019 19:54:47 +0200
Subject: Re: [PATCH 0/2] small ptrace fixes
To:     Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org
References: <20190404161604.6165-1-svens@stackframe.org>
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
Message-ID: <b3504a3e-fd63-57d5-aa3a-09666b4f46d2@gmx.de>
Date:   Thu, 4 Apr 2019 19:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190404161604.6165-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bzhDrB2kFCAZsJ9zzjy1/RBFdZGBBGn6+rarVnFMXQH2X7psqVU
 /kgbPm2YLrHZ636okoW55M2G3unuFKQ0K6yUMjEDDCZqcLFYqvxOfji43DmZTSYbnh6qmY3
 r67tE21WCJqJf1PE+yjACZOyMQYX33+jrajpOCmzXBEWoQv2+IoBTPIVli5LI1XXYq/znUm
 bMEzPvsb+TPkIPnoupylw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DFsnwMk3qxU=:vN3dolta1dh2lw8opbwDTE
 ICi5p7tVLHS/9hBaqZ/yKagBIVMsbC4AliwjtMhR0fMtomdTm7gZO6EXFFvGQIF0+i9hYFPID
 jjQChaLS7lfwJBlUwSQBuuB38UIMSk/w8WklQHd6Ds6LdoU3BbHx/MpNF5n5rpexdB+N5G8gO
 Nb/6dg9ZNJI8NS4o3V30zgbqNcRTIU8oVo/WIbylrnMxfl8/cUvlkSzTfXVsstYXpeiaf0Y+D
 JZqWrXJTfD74sU9RJ26tlq6octbsfQqXy7BjQc1ZhJRMif5TwWoKMy8heWckqMCFAEe2jpKJF
 06Aopmmdv75B0heT3daZ2QbMdlGNhZuQFdlWAHJwWWuWVOS9iehUsCPzepZy4/bm/dQ3NJpVD
 u+cpTHq/XmyQv/bsRTMjeswsQQjX/X8aODWnXFz3JzZ0X9HZ/ulLq4uWbzSN/QuMejmxWI2/D
 FOBL9Kj6LVnFsKqPoBITmqgacRrOXMcfDJ3MEWTULBXdVJuxRjNteg16/BiBIREpmNkBzOkMa
 bzkycvMF7+AHmOEtWunlPl6ep6yKOlPRV3/Uvpc6xUKwa1xrup/4stL5VwasewQKDLDKPygCL
 hHVazIHkmGCmkxOqBv2MxQBGYwgxrWzQpg7TaCnhgqP13Yvm+Z0+oScUP8FtHgVIKf4obuzlK
 lr3/hpCjCZ3diVcAHwwv5GcE+6O6qYHYDj9VmFaQIMoft+zLEDmX7hBymLvKhqKMKzQzI9wMe
 qvMFHCDurj6OVa6pe9P2w+ha5sdDsRLSQaKDEFdabq5XkzH+pVtqi8Zl4mk2Yp9xvWZsgQdmS
 jg8qVkHCE8sGgVq+yVh3skdsqTJMjbv7v7uwXP8009gc3rCJsMDOKQOA+LjrJTBNN8yNIggpK
 oXtNMNXLPBx0t1GqA22jXLMtNpnogCl4G9FMgx5vYIBlGBSzSRrLdgg7tF4EiX
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 04.04.19 18:16, Sven Schnelle wrote:
> while working on kprobes i found two small issues in ptrace.h.
>
> Sven Schnelle (2):
>   parisc: regs_return_value() should return gpr28
>   parisc: also set iaoq_b in instruction_pointer_set()
>
>  arch/parisc/include/asm/ptrace.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, applied to my for-next tree.

Helge
