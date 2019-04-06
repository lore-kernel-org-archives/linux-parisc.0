Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55018C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDEAF213F2
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 20:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="AMyk07s2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfDFUQC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 16:16:02 -0400
Received: from mout.gmx.net ([212.227.17.21]:52405 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbfDFUQC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 16:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554581750;
        bh=R8TwMSfg7BEjawIH3QjaaLhwkP2HzqLlNXoZLneiPUg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=AMyk07s2pO9UehYvFi539+ZQrxS+ybT2c2R+Xq4qUXdk+5Jf8M1rCaFDRCiL5IsSM
         wTAHimf+2Hptr5cBg3zF4PUsLmzXrBzJUHWZIREHbfKPgMpEXMAPs7IkuGoul0fNFG
         Rk2yrNf2/fOGyL5cWap90LofcG7bZrXJxZuRu+68=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.5]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LsD9n-1glsgE2lY7-013sKy; Sat, 06
 Apr 2019 22:15:49 +0200
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
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
Message-ID: <d340ec78-0829-8a5d-1002-2e08e0b9babb@gmx.de>
Date:   Sat, 6 Apr 2019 22:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554580144.5053.4.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UNO3sLTOkcIfjpzD33lqNRJXA0RV7h2lQAtKuaWVXBwpSSrGXPU
 gk9nCrScHs3aWfMVHZphYxceNO1DWwsJp5wDnZ/pSG7xwUFOjOC1weXF5E/o+C0zCTDoJ6F
 pvvWU8tleHTRLcmVurgPdKERH41pFQXiqUgYqzdIgLyPJmNOcNu1ZF8r7yrvM2LQwTKNvSK
 7AShf1eF2jb59/XYix0aQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rHrXlTHcBQs=:gADaw+SPenWZ+ZLe7i584O
 vQc+2SPp4mNa+zPTCv5Uk4WV3TE0sYf9V+aZdw+Sbh1eT6Ci296LktXgJpG1d+ORE9lfe0+8Y
 ajsLaRRb2GxN+QNJFhrUr++cdWwfer6FTNI9R2H1xZd/AutW0CwBS+AS1UhNnk9d7b1pj4hvb
 oAbStYAHYbq+W6St+xzfMPlHVHPtZ/BGbVrho12dCqlJ5fuvCV6BIY16wtKkOArDgwCSnIVE2
 RztJOnZ53VibKqU0l3hEkBjQz3aJeMR6flzX31pLNWZWAIsSyKC9Ru4ZdtbHbayzq0Jx1Y2uK
 AI42oLs0Bh/6RbFFCwlorKCaNbrzATdIW8DKv4WBs9FDzeqoUL3UTydbOVzerMkr1OOaIY7TX
 FmbdAXoCCyWeKR14gDzzy69q/8TY1VgrSgUsdgFEBHr8Q/E+Yp+U0cD8kfdXf1xDkSlghCQb7
 lwGeJKcGIYCJua9YAr7s/i0bLvk7MIks8uo7ITIi/KWi9IBBfqVqf8xIkqwxG+PLj+CicIaly
 7LOFKV+qvUjz0aTehRn8E9SkF0t14gy4K9pGw3uqwYbOZnPzte2Ec+H9hVtDmuXpc+5Y8E2ZH
 K63ehOq2yvTInlyOwf7ZHSThTpItjGz0ur2381Ny3qmCCrTbDHWts4TLE9w8/pU9uXXrJvMPI
 MY9zUNg8D6Ca468XPi0hRelVqhJoYvR8g7eelMyO65+NmbgsWl3CmEYqt958XmDfGY8nZcywE
 ORY4ARA6YERZi+BG3V7DzWGPSCzlGxHsBuN3rFofY6J+AWsyyDaX8aPzxhyDpR3LVLRnufjlv
 1FpZ4J6r0cjpjVtRqF2QQqzqHbNZfdp/S943zLh/0Ek5L60UmBlJ7RnUYPA/NYe0FKfKI4qvS
 WLty40P13BlfYOmu2oRTFrlak8dY+fjJWl4224A9gtiLAL0kNGLBRc4Dl090iz
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 06.04.19 21:49, James Bottomley wrote:
> On Sat, 2019-04-06 at 15:36 -0400, Mikulas Patocka wrote:
>> Parisc uses a global spinlock to protect pagetable updates in the TLB
>> fault handlers. When multiple cores are taking TLB faults
>> simultaneously, the cache line containing the spinlock becomes a
>> bottleneck.
>
> You can't do this.  As the comment in cache.c says: the lock is to
> protect the merced bus, which runs between the CPUs on some systems.
> That means it must be a single, global lock.  Of course, on systems
> without a merced bus, we don't need the lock at all, so runtime
> patching might be usable to fix that case.

Is there a way to detect if a system has the Merced bus?

See arch/parisc/include/asm/tlbflush.h too:
/* This is for the serialisation of PxTLB broadcasts.  At least on the
 * N class systems, only one PxTLB inter processor broadcast can be
 * active at any one time on the Merced bus.  This tlb purge
 * synchronisation is fairly lightweight and harmless so we activate
 * it on all systems not just the N class.

30% speed improvement by Mikulas patches don't seem lightweight...

Helge
