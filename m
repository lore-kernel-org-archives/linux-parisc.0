Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1873C10F0E
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85F8D20896
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="G9SCAnP0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfDGSnr (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 14:43:47 -0400
Received: from mout.gmx.net ([212.227.17.22]:49671 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbfDGSnq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 14:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554662625;
        bh=tI8opZmvIB/HcMAgqHM+bMalrqZ9G4SuraBIwQit2hM=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=G9SCAnP0q7rSCRv8qLVim8WMnHlXOuXBfKDckcIxCXUquCWUPK8TzL3PMS9cAI7dE
         6nyKXoOqEBohmcZnsAOFtVmufbhEeUba5Uako0vWHAUwDuRkNFlGzgomtwA8itla4f
         GSFYiVNi7rNj6cja8DaxQnQ+xq+GLIoZSP7/2S7g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.154.227]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MfSrf-1hWglX43lD-00P6ku; Sun, 07
 Apr 2019 20:43:45 +0200
Subject: Re: [PATCH 0/2] parisc: add kprobes
To:     Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org
References: <20190407181058.29728-1-svens@stackframe.org>
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
Message-ID: <2c41b6cd-c952-e92a-ec1f-d3a1d6ce5ad8@gmx.de>
Date:   Sun, 7 Apr 2019 20:43:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190407181058.29728-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QiBaFbdaVsuD+qzfwvFQQwuioMugfx7OcmGIhE4Hnd0F+oZlXOc
 v8K4hWG2DZ8LC36MTMaELUG0HHPKrap+Lr6HGDUa5Xo+7LCtIBVtplqCnTbQXxAb8iaijo5
 H9lC5jsi7PDCZ7j9lgMu7NelvQxx9KUCcVZ+4/pGHHiUy/7MQWtKfITdIEkC3pV05wwgA5k
 v0Bk8p2z3eN6Zmbp8iQkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A7l+9WrlVx8=:mVKxwWkvqZd81+XOE3pNvC
 Rhgv5GUNjh4YjDET7JS2fTuB0v0KJcq2dn7yL5CeRGU6uyaVF+ahDDvIeibUZgkxj62MF0/sX
 Gk703MRFLMC6GC1EjwGWAqHUt+qGsHOiM508MMiBvL6yoU5WxRfnATNUsKmnzoNaafXAZ5Azm
 U2HmyWNqLBOXcHffDutDkdERKi2ecC2t176nE4P+B1QSkPZC9JBk+BEEqaO7htuotdK+6DUOU
 fmgrhsLNl5hwp5TYlaAZdgX6rGomM6yXvJXxrNdBuf+sBAuCfCs124QRtlfKKW0VwHbtepcQ7
 GjZIuo1PoUu7LYSF2uOhkIfHdyBZlLTwMRd6e+TmLdonL5IZG1G5ipgDeyD/U2CGLmfh/q/Rd
 aX0HvoHiyy8lSrWiJCccQ5hRPUiRCkT0bSG+HTc+8hVYZIJK8gFJD66mon10aEdAN5YMxIIO6
 Gitsn0djI3kW+w7TRqku1ZcMxKIWk9+3WksQ4P9vjnmoO6L4hPrHfytTwZwA7Wlyzwx0LcJlo
 RVZpe2YWBgc/g55bS/GW1sdcw/piSgU9GS8RlQint3R6UvXvw1kChzGgM4KLGz2ThGzrtukGw
 uZTIxZxzGYfAvzTj8r+JlZnXlpTqlioHTSpJfcrMIHV2p2J9HcD3xh1/j4ZAdMnqmV98NzWn8
 NQtktE1+9hplyGdWLzgMaCbvGEjO+KCA0I8zX80VmcdNOTDIRAgaB482yvCsmK/ha2VLxkFMJ
 b5jgmRsSfQs2gtp5nvt5dD5yEhHdgXzufHN+uzUG5sOolW+JwXWwAfrAQjF9Ssg2RTnlbsI5H
 9PepJNibMjVUSEGJNyHrBilw/Ylf1QRVV/sT+5VkfSp/ZeqS42DDsdxi6YlIzYDAZiLx2XWKa
 AIA1p/mRy38l2yYNxh7t5wlKxYhg/SC+tkjlzEJ+oPS8dV5cOSGwfesHlz4vhjmNEZV9QXSs0
 AoDrp80QIibAY8wSILL/zlmNPlvofDv8Egx4H1ncobD6OIY7THlBGZQ5lgFud2ZmeKNG2hDLX
 RFe3c6clvIRreq8ogjz9p5Q=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 07.04.19 20:10, Sven Schnelle wrote:
> these two patches implement kprobes for PA-RISC.
> Sven Schnelle (2):
>   parisc: add functions required by KPROBE_EVENTS
>   parisc: Implement kprobes

Thanks!
Applied to my for-next tree
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

Helge
