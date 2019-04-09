Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3D6C10F0E
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC08C2077C
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Y4RTkLUm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfDIRxl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:53:41 -0400
Received: from mout.gmx.net ([212.227.15.15]:59579 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbfDIRxl (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554832419;
        bh=cRo60QYglYAHtSU+iu25ueM+zFW+bmcO7OO4uJj7wg4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Y4RTkLUmyP/0KJg3gtH7jQlUR1z9aeCSvhNtLUrfbf5DONeRc2lJDcfwrdi+FUxC3
         a/PnZHGmwTWFfmDhKkyVu8/xj2msZyPpD3f+3wkFoNNfJ6Rcjc0xfQLqB/r6NUozqD
         RfFqYRlXzckjC/xD4dCXZIVmNaImjmAMBS2TrpJ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.130.134]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M0QAP-1gt4nu15Rt-00uVzs; Tue, 09
 Apr 2019 19:53:39 +0200
Subject: Re: [PATCH 0/4] kretprobes for parisc / cleanups
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org
References: <20190409173030.26234-1-svens@stackframe.org>
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
Message-ID: <7333adce-7a51-1962-b33d-c949c9940fdd@gmx.de>
Date:   Tue, 9 Apr 2019 19:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409173030.26234-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tlpQ8HVOD+wWWRm8AITHH/ggJv67C1QW92v1GSu8zlcH018Cu/9
 h6TVhkElaNmltWvxKpL2pa88nb8d6tbs3XezOsm/XX8rm2iLnFO5M4bXf5PVuzi7Ib4Sc4F
 Hp3l05yPNSyFDWWYMtk6Tdrw1TzXATds0wySggVNOdnWfJs+Vv9E0YXK5AtSxgq9jJwuuoF
 VWUytSIgUTm6iM9pNk3Eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C6E0jAb2Syk=:ckIR/WhVjueEnYgmydkegE
 lgz2I06O/Ns/gSe6kgjytWua+FysenVKWidFNztF+sTVAcSYLi3udOH4kab25dSigYVf8DcWE
 mXs/MF0HMNnUqHTm0yFOsPi2/UfxSDnj+sNGUb+/q+I+4AcM+mGSYh9DSWJECewNRy++H38Di
 RcTJzYNhV2EbopglsiHY1eOwqDUIHW8mtqmZdRDf88TXLxYv4m9JXLdGaMLnmC9T/MDOxqGnn
 NH2wfDTwWjgizlJQ62BJpuRz1ebvZv9bBXagy0w9HjYtB+y33tIzdIo0LFYksSQFlVjQRh9PE
 4cC207iWYs1k4csty1oj11WcPm1XTzZT5PwyIK5dHIxFkeo6wBMFyVbATpMFrZJlnSlPCotxg
 68b3IdgP9jgUth1VphXifsJaMoX7xgJiO8M+j+Gan9x10FGREPA0+u89h9MxVDd/yVsRMAZ+f
 R7qKdsK6ZHdtQpOyRfejR7pAZHsujcZlozDsZRhVGTY1DZO6roiEwV2IwCg5+wZ37svKhMHCC
 lJgWdcBlJbQDxj1DBntVd3mBKeCPS6z8wNPs/WVkKU3aHlKiOgabY4ycwa3iK1rB6lPs1746u
 X5YAI2PJjuGJU0K6JAiMxVWpYVERV0MhxvZszS/ih4KLc02rVXAnmV+Lm8sNqvz0950zSKXqy
 10m5eD5yl3TFRKJQEUSXYEarggYOoSUCfWS0T2F2GnxtIHQnB5sGsAA1/dOjZEMvVQ1ZiVn3R
 k1MMUfdVqfDR/sN6PK399lkV9jTJDzg7rkx+6WYmruA+oadJVJOQqBssrmM8P0D3yHNFWJYqc
 AZL5N4QnkbmeWQh7FsJ5GIqL7QIb5pfzvoqiD7zIVEao1F1EyF1Go/HjZC/L4nL9GMFIVfcge
 9acTr/9ekxfYNwYg8Aj6n1eOTaUquzWeBrwugtG5oP8j8Y/KA+lVhD5rkg67qY
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 09.04.19 19:30, Sven Schnelle wrote:
> this patchset implements kretprobes for PA-RISC. While working on
> kretprobes i've also made some minor fixes.
>
> Sven Schnelle (4):
>   parisc: remove kprobes.h from generic-y
>   parisc: Implement kretprobes
>   doc: update kprobes supported architecture list
>   parisc: remove unused flags parameter in __patch_text()
>
>  .../features/debug/kprobes/arch-support.txt   |   2 +-
>  Documentation/kprobes.txt                     |   1 +
>  arch/parisc/Kconfig                           |   1 +
>  arch/parisc/include/asm/Kbuild                |   1 -
>  arch/parisc/kernel/kprobes.c                  | 110 +++++++++++++++++-
>  arch/parisc/kernel/patch.c                    |   9 +-
>  6 files changed, 116 insertions(+), 8 deletions(-)

Thanks!
Applied to my for-next branch.

Helge
