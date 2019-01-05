Return-Path: <SRS0=8551=PN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D67EC43387
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 21:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9426213A2
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 21:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfAEVV2 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 5 Jan 2019 16:21:28 -0500
Received: from mout.gmx.net ([212.227.17.20]:33851 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbfAEVV2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 5 Jan 2019 16:21:28 -0500
Received: from [192.168.20.60] ([92.116.168.54]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LgNGi-1h38n63lfY-00ngfC; Sat, 05
 Jan 2019 22:21:13 +0100
Subject: Re: [PATCH] parisc: Improve initial IRQ to CPU assignment
To:     Dennis Clarke <dclarke@blastwave.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190104230546.GA18977@p100.box>
 <76386f22-f894-5202-576a-357782743ec4@blastwave.org>
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
Message-ID: <e3ba658f-9505-8258-8172-746e234a8bb4@gmx.de>
Date:   Sat, 5 Jan 2019 22:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <76386f22-f894-5202-576a-357782743ec4@blastwave.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lqWxHb/0N2DVLbW3iGCh/D2oUQgj0S4RsFVwS1eFUQ44gV6g7W1
 TwLQ3EAP5WppxPRvycaXxjx/udaSzUjeUQY2+bODyudcxEkkH85jOSCgZgSji9nncUxpmTR
 2+wtT04ACaTz1rFrx/vhcvF3NZIhR9eOsClSlZwiAn3vH8zwMP01+8rNP/ovK99BohAZlhz
 t1S6WEmFjBz51FdGbubiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sZeMa3Zrw5Q=:TipDgJI/elq1tDRwffviVw
 9vnkQ97Pcv9KPL0MrzqF/aldtgphrjj5GdkxOMG9n8XRaC7ulsAp18Kjy/W7Ar2WUXU4BKEXf
 TMttNlQTYRvIV7nWnXrtHRko0rmnu6I80EjOe8e5Hk6qp5ytrpw6P0q2/0Lb3wuMLf6SslaH6
 +gXowSDBUZUl48ZGOFNcTV0RlScDtfzGAElE4rc2ExCmm+TCeZ/Wks4sL94WgHbNiVMH09AkG
 4Yp9Chg6RZB+A39EWJIatV1I2L4UCK2xBavvV5jaQ92rM6dwmf7kwYmwNdcR8+1V2XMZ33z7U
 0cE0KGjpc7/969RtgsdSfphNlH21ndEm1JVj2vr3CVLwtf/+gPUO/s7OCeOLTCqupG1pjyafX
 45vyAxjhp+WBbcVn9mzhEO95O47pNrL4KVS3gc2RuvH34jiSgrGSSMxxDg2VBJ7ywONfEfNnv
 zVVQTSy2P0AQcxeM3bc7Qt2tkCGr4LzTMFI1eCcAfwrADzB+fPhYNsId5hxCoJi91fuxgL9c7
 TaGf3zd/clep5PF+j4a+Ry0In8kXPX9vDCFUFK7hb7033S00cJh2Ztx2Hwz+6VsSKPNO2FbiS
 rTTHFtKQYPS5pBgX2dbYm2N6ZIEOGvBnwE9HuweE8M9A1ukPJGTtAzji7x+O29+ihmUt9YvdE
 doJ8EN1cqGSa9NUzOwkhaMoR/zU16keXdxndCK+3G5S72MPhhQz/Tsz33ksw9zkE1RapulC1G
 gv046y+Z354fK12mD06bXlBRhBsWLVEAb1/aolInyC7okgsoHuQgiyjYSJe5s+wjr/o10Qazp
 BCq0yztHSZBkhoB9DBFxISKe9W+3d1PY+m20bjvV6ldIFLMOlsz0GEygKYEB/w9k1IooUw81r
 IIwdMEoVvnRzf8mEmK+l1I7LeoMtIztPaMRIWvY3zip5i1zij+dSQu5xWQ53Tp
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 05.01.19 00:21, Dennis Clarke wrote:
> On 1/4/19 6:05 PM, Helge Deller wrote:
>> On parisc, each IRQ can only be handled by one CPU, and currently CPU0
>> is choosen as default for handling all IRQs by default.
>> With this patch we now assign each requested IRQ to one of the online
>> CPUs (and thus distribute the IRQs across all CPUs), even without an
>> instance of irqbalance running.
> 
> Will this take into consideration the features in default_smp_affinity
> and allow processor cores to be considered 'non interrupt' service
> state?

It seems the feature of default_smp_affinity to disable specific cores from
servicing interrupts doesn't work on the parisc platform.
On a 2-CPU machine I booted with the "irqaffinity=0" kernel commandline option
(to enable CPU#0 and disable CPU#1), which then led to a hanging kernel when
CPU#1 ist started.
On parisc, each CPU needs to handle at least it's timer and IPMI interrupt.
Any idea what I should try?

Helge
