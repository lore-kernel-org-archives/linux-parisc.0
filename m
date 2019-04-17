Return-Path: <SRS0=jXT6=ST=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA4FC282DA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 20:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CEE4E20693
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 20:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WmIIC8IY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbfDQU7J (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 17 Apr 2019 16:59:09 -0400
Received: from mout.gmx.net ([212.227.17.22]:36375 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbfDQU7J (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Apr 2019 16:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1555534739;
        bh=kiDoPBYyWqczFmljzxKMH8bNieMf27gxdFpXXQtv8yM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=WmIIC8IY875+rq8AltDgqSK8l40Bywu5ixC85O/REOTNwB/dkKnE1519asBLA/twg
         pusSLnzPjsrZ/G8WCkewzrEaPh1lt0GJ8r+2BhWLC33WbOGcnHKCqqgDottMsrVR/D
         RtuPtVNBKcWqwXuuqhWP0q07pfPPpKicMFnJIvYs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.10]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MRocn-1hRhRC2S09-00SucQ; Wed, 17
 Apr 2019 22:58:59 +0200
Subject: Re: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
To:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
 <20190417205515.GA2001@t470p.stackframe.org>
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
Message-ID: <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
Date:   Wed, 17 Apr 2019 22:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417205515.GA2001@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0d8aPeyaQEIqsYYX3LUWoPhkvZjJMDWOZOowmkPFEQUyX3bKHAI
 vc+tUI2CXFR/grpRkwRqU8gYBZ+ZsYpJ1bVFpuK0D7mjDzl77jEzvql0z2AaqNGVSFzZmXH
 ayhDpxCyvG4xqNWobXqXlhQSSHzNlA4dACJPh5yQVsOerfAhqEByGmNFHoyGLwBaGuRR2M3
 1cCvlVJ0G+VDPhGsYxvVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bx3GaDIOmuw=:Dw7QwKdH1P4Y1lB4DbqIGc
 lIAsrv0kLruL6TlnSYahwq855ew5W5KbOMzIr4+gmM3EQqS1pCOc2pp7lWqBjxgBPU7/NL7z0
 3JI/Fv8DNgFvUl511+vQQVzPXtIm/n7SnKX3pTFTqEF8VQvqoL5Bqk6R4prKaqM2g7yXXVXJn
 0mukLN6wMVyqJsdv3urplcgjEBti6LvTrmpYKNDK48IQuPJzO+BOZaOrdAR4tKfvgz0QupQSj
 YowErjAiBG4/98g4f0u+wL0VXjNfKw8g7VaAC9BIUks96dDrdoMhG6nI4lL6mj+/UBpYFqBNo
 /wgl9FHp4A5h1ko5FIP9J0C9rd3JXKdibpPdY+W5GOU6sEhhLYBD//9QrHXbzeDEuRZcZS9Oj
 XEgxF024ilmFfXe0S9qXEBQZdsN9PrP3CJVyeWOK1STJElHDn5W/vxhHRZqD6Pq53GQuHFvBf
 5oBgl+GEKC0QpwIc1T6eboYtlhRZaA5Wnyva7ijep6DxS8jySGi1y0htUfhybix5hiI8U2cJu
 em7TdQYdodCH8q2CWdEQhMWjTxJY6nS2PzWAO5sYsOY+T6uGA0cCh1unuawY9R67cRws2qqDi
 jALDkE6UfY8HqjG1wpbOEOuOOmBCgdR/weRdzPVp1GTBL7c23eS8WoGSn6/btzJ0sdf++bGfC
 hJx8bjshs5sca4hG3Vje0Do46gWsu3xYKV8I734vpo1XukkcgrgBpxXPHehFcI4h/X6L1ZlaY
 PhhbTxdOJU9Na4xKgUPFEJrekn9Ih6XlqF53JAr44XOIZiEjOmFE0P+dT0OtaCPMjxZ0ESxH8
 AGC7/rbxJuGoSI+cmhxbqdlDR7BkjHTp39i9cIfcUlVcEgnmBJmTUGgqwC2iIbRyArn9d6zuA
 xDrkUEkzA5EnDZQBBLlxbPQiQWPOuFDBMD1cVDUafLTvOssK+txspTA2z6RcZy
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 17.04.19 22:55, Sven Schnelle wrote:
> On Fri, Apr 12, 2019 at 07:12:04PM -0400, John David Anglin wrote:
>> TLB operations only need to be serialized on machines with the Merced (=
Stretch) bus.
>> The only machines in this category are L and N class, and they require =
a 64-bit PA 2.0
>> kernel.  On these machines, we use local TLB purges in the tmpalias rou=
tines.  We don't
>> need to serialize TLB purges on all other machines.  Thus, the lock/unl=
ock code can be
>> removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is =
not defined,
>> alternative patching converts the TLB purges to local purges when PA 2.=
0 hardware has
>> been detected.
>>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>
> I had this patch running on my C8000 and J5000 for a few days, and haven=
't
> encountered any issues.

Nah...
I do have one of the critical machines (rp5470), and I tried
to add the necessary code to detect and handle the TLB serialization.
Until now the patch sadly doesn't work yet (hangs at boot), it still needs=
 more work.
You can find it in my git tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dtlb-flush-merced-bus&id=3Dfc6044f83cb9828ec6ebecb23a46549d9ebc51=
8f

Helge
