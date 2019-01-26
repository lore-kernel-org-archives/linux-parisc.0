Return-Path: <SRS0=FM3T=QC=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E541CC282C7
	for <linux-parisc@archiver.kernel.org>; Sat, 26 Jan 2019 13:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B182821872
	for <linux-parisc@archiver.kernel.org>; Sat, 26 Jan 2019 13:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfAZNrn (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 26 Jan 2019 08:47:43 -0500
Received: from mout.gmx.net ([212.227.15.15]:46521 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfAZNrm (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 26 Jan 2019 08:47:42 -0500
Received: from [192.168.20.60] ([92.116.161.75]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MWTfu-1ghGXT2pFS-00Xbfg; Sat, 26
 Jan 2019 14:47:37 +0100
Subject: Re: [RFC][PATCH] m68k/parisc: Convert hp_sdc_rtc driver to rtc
 framework
To:     Kars de Jong <jongk@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org
References: <20181127210107.GA11661@ls3530.dellerweb.de>
 <alpine.LNX.2.21.1811280815210.28@nippy.intranet>
 <908a3147-1fac-6f38-c61c-b88c81dd23ff@gmx.de>
 <alpine.LNX.2.21.1901080855180.34@nippy.intranet>
 <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
 <CACz-3rjx=bcn7qK8qM_mYrW70d-OCpqO1iXS6DZVFb+G_dhvKg@mail.gmail.com>
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
Message-ID: <df8a7f49-920f-c57f-cb3c-4f775e0fbaca@gmx.de>
Date:   Sat, 26 Jan 2019 14:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACz-3rjx=bcn7qK8qM_mYrW70d-OCpqO1iXS6DZVFb+G_dhvKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Pr/WyrjbFlf2svLWQiBchRjiE9QtwdS+0TEJK/rwqW4efzISdJT
 3M8OYVDhxFls8e4fAJnda1IGZOa9uOFlAnNPU6UZK7+yoKUmeYKN6d3hspbRkApwwBpNKC2
 kgLpJNKjv0xTBDvz2G4FY2byJp8JZAGhgVbO1AhX5CTLrn/AyHuUDuk7F/oHAWfRXkPExoa
 IYVRZvLg1T4XQ9kyUHN3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pfIoRTPSOYg=:FGUhmKbTJUmadBF8Yv712+
 9sXzmQkUgv5yvvh+SufolBN9Zt290STFmBDhI/x5ud4yS8VXtIMnuFwu51Qr2z13Vg+amMAui
 O9jbvP7x3edbuPPjADohqqFYoUsi3Pb4FsiI4tMr2zdrCjf6qQbYHiOKJJB9aQWU+dS0dbXw9
 qxKlNmWb4Q1g1/25ZAoxlFbVJwrN782l1jFSA/8z6JnW6lKDDipiZ398NVWVsdl1bRG9AIqfp
 5VMzpZoBb5PN8ocnKw7lHB7Os6ZXBooJQ09+/Kx266awxQ8vRJGjD38PWkqlLcVHG97lm0Aay
 EZBCEqgn06L23CJni/UmqgCa5/+msCSFnmzjyUsUJEtYzI0pzJoHQth9lZF/RpPsuLPvf5G0f
 CQu+CV60WjqSOCW0Zuo0buSuHGG71WdWdKv63sP5wntMCVd8Hw0QuZd4L0UJnHzHvvaj4Gzsu
 CsI8OpxzVuiHkLxVopD8zeDN2L3Itgp80+BTGh0rDRIC69Mr0deHrhQPCETtCmd8yKiL/cK66
 6K09kGpeT7FFXlHUa1ZkxKdKZ8eLdyd/lO22plHMvfakAbwIfhY9dczxseciOf5yASEONm+3f
 gnI9kJB/EDNcI9RxNdhrDSS0v/nOMG4gQWukXMphxRseISVMcKa4mkzVTUFm1mpM+h8AUMdwe
 FmTtgmie+C7RChrNiVQWYYV8f3CDz05Nksz5jIlrVjCfdZ4bCdeZm0ISrN1+JO7eD32HmOTZi
 PGCXTaf/y4NmmlVQA+XHezAmFmexH5b7XpbC3V5dbnFavPrHbmoj8bBpcT1DQD0jf3HeHDNJB
 aY2LRROesnJ3MKXDCpf3hRnKevu2tczBK0MSqzveZh7zrSVGIVgtfXS/4ADvij74C09XHxdmS
 rZvPxCbd91XowGgF6KJB7Mg+sLP+jc8dwYVKjVOCS27G10xeOue/4pu5Umm80d
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello Kars,

On 21.01.19 09:45, Kars de Jong wrote:
> Op di 8 jan. 2019 om 09:34 schreef Kars de Jong <jongk@linux-m68k.org>:
>> Op ma 7 jan. 2019 om 22:59 schreef Finn Thain <fthain@telegraphics.com.au>:
>>>
>>> On Mon, 7 Jan 2019, Helge Deller wrote:
>>>
>>>> On 27.11.18 22:17, Finn Thain wrote:
>>>>> Adding Kars to Cc.
>>>>
>>>> Any chance this can get tested on m68k?
>>>>
>>>
>>> Sorry, I don't have any HP9000/300 hardware. I think that Kars does, which
>>> is why I Cc'd him...
>>>
>>
>> Yes, I do still have the hardware, but I haven't booted Linux on it
>> for a long time. I planned on doing it during the holidays, but didn't
>> get around to it. Maybe I can test it this weekend, but don't hold
>> your breath...
> 
> I tried to test the patch this weekend. I first started with an
> unpatched kernel. Unfortunately, there are hardware issues:
> 
> 1. The battery of the RTC is dead.
> 2. There seems to be a problem which causes autovector interrupt 1 to
> fire spuriously, which is the keyboard and DMA interrupt. At least,
> that's what the OpenBSD kernel reports. It seems to cause the Linux
> kernel to freeze.
> 3. The harddisk (original 200 MB Rodime RO3000T) is failing, so I
> can't fully boot OpenBSD to further verify this problem.

Thanks for the willingness to test, and sorry to hear about that issues!
I hope you get them fixed at some point.
Testing on real hardware is always useful.
 
> Anyway, I don't think your patch it will work.
> 
> When running on m68k, you're passing a NULL device pointer to
> devm_rtc_device_register(), which eventually gets passed to
> devres.c:add_dr() and that is definitely not OK.

I was aware of the NULL pointer, which is why I wanted real
feedback about my patch. Ideally someone with platform knowhow
could add the missing pieces to fix this NULL pointer code. 

> I think this calls for a proper platform device on the m68k side.

Yes. Who could add that?

Helge
