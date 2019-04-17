Return-Path: <SRS0=jXT6=ST=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC80DC282DA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BE022183E
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="NwjUuTp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfDQVBW (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 17 Apr 2019 17:01:22 -0400
Received: from mout.gmx.net ([212.227.17.20]:41155 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728074AbfDQVBW (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Apr 2019 17:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1555534875;
        bh=kgn36woc8sTZtH0vBu1HSQZkgf762Xd45KZ57uU096A=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=NwjUuTp1sorSJe9z1OAsYn8dPEFeeNz9Mqf3sBLBAMZH81EdZSZZrwk5zTN6gIPLQ
         iL+xcoKq3te63bRoa7lmSp8ck1cTsQmyQg1QBtWCW4HRWQxiWeWdgIgpiD3a+c9vYp
         2O4Ze+k3vsCKhVKCbNf0qhebEiA8jcyrO5nbYesE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.169.10]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MI8iw-1hHQAv15vq-003xnS; Wed, 17
 Apr 2019 23:01:15 +0200
Subject: Re: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>,
        John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
 <20190417205515.GA2001@t470p.stackframe.org>
 <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
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
Message-ID: <a8829e22-e5e7-a896-5cd3-0cc82a96c227@gmx.de>
Date:   Wed, 17 Apr 2019 23:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d5IciLRqAkusodPB25tsh6hHh662Klu1C+yv3uyCI6hFkBNPAvl
 oHX3kMDAttFlU1h3zoL6Tzxfrsgrpz/LCvGdTc2IKwq49DRqpUeRwaTJstJhF03U3/pdMRZ
 b6lLNq0wrR92PMB41VEkQlyhStBEU6PaKi65hEN1dxWY6q2IDkn3IL9qCj0zM1FpnUnKnw2
 C37BFYz2mH4SmMaPG0Ueg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VvQfzx7O4pc=:Hzltnt25wtObyOaVLr7T1r
 1z6wPVsR5tl2yvnE7MxlalB4TjsD3xtzxXGqe/VXZbtuQXCrfjK/CpzMcYHEw2kt1ix4M9j4f
 5++cQbWd/9COnS5y+HnhqLX94BgYSrCtXgl+9MK4FWRYfKLFdL8EqUdjcUeY52IHYld7SLB/Z
 /y/ByIA6+s0LA6WevFzX1vXWNJC3VaDnx0xigxQcRhmvVtF733QtVNKrjabe8KdAVOlqg05wV
 MFYZvWHRdg2YOeWhBSWFLRN/dsOJjMpBIeOZ+ZZkHztdPM6cxv6e4FHdImdYJVPHsiCpSk5T+
 NSiOEjjZqGW9XpYwljDVvvZckMBp3HnevO6F+f2uPlDI4fwjvluOV4lRZAaKlsXLI7tO17Up6
 ewEQBTN1s9kTQFTLtRqZH3xe/EbwP1DWRMqglEz4Z2jfe1W4oCE0SLSoGbbV14p0iyAgKMumD
 YBY1v0e8gDku2JX4JFOdJ1YUlYwrNTJ9PO8tC7bGh/PrXtVFFyieMS2TcCbGboPV37fskJt72
 ApZaSiUA40uAfMhVf0P2GpHlAep3i6qWvHEIyw2amqqDeajVIPw+gTYRxdHNzJpQscmPMY2Ts
 zapftqU+lDQNfndB1Q40ulNE85uAquowxupm4XWQ2Eks1qex4evKosnMFDKhcUh9LHRE4Ct5H
 D9I6Eu7mUXGLd+AAMh32xhd57eCUQWzmuqHwe0oDOcHO/NGCkv/MKVrJfJgukf9sJ/43gxPdn
 EscmjKZ9vfCW4RLQQ5pYTYEP+9LwL9LDlH1sJke7DgOirjNhgi2ipCdamfuhrY9/EdfNdUIN7
 iZZIee1+7xQChRy+GSEsmxyPuYttBkMCLEW7LWqp+za9ySutqmnsOwRjTya6oGTUAXrZI1ib6
 21znfRilIE8oCuAAS3IB8nShF0Gh4IZHKhg9DeY0XhZcthxi57ryRa6zM40Eek
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 17.04.19 22:58, Helge Deller wrote:
> On 17.04.19 22:55, Sven Schnelle wrote:
>> On Fri, Apr 12, 2019 at 07:12:04PM -0400, John David Anglin wrote:
>>> TLB operations only need to be serialized on machines with the Merced =
(Stretch) bus.
>>> The only machines in this category are L and N class, and they require=
 a 64-bit PA 2.0
>>> kernel.  On these machines, we use local TLB purges in the tmpalias ro=
utines.  We don't
>>> need to serialize TLB purges on all other machines.  Thus, the lock/un=
lock code can be
>>> removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is=
 not defined,
>>> alternative patching converts the TLB purges to local purges when PA 2=
.0 hardware has
>>> been detected.
>>>
>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>
>> I had this patch running on my C8000 and J5000 for a few days, and have=
n't
>> encountered any issues.
>
> Nah...
> I do have one of the critical machines (rp5470), and I tried
> to add the necessary code to detect and handle the TLB serialization.
> Until now the patch sadly doesn't work yet (hangs at boot), it still nee=
ds more work.
> You can find it in my git tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/=
commit/?h=3Dtlb-flush-merced-bus&id=3Dfc6044f83cb9828ec6ebecb23a46549d9ebc=
518f

Please ignore my comments.
Dave's patch is OK.

I mixed it up with the Mikulas Patocka's patch: "use per-pagetable spinloc=
k"
https://patchwork.kernel.org/patch/10888249/

Helge
