Return-Path: <SRS0=8551=PN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA96BC43387
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 22:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C3A3222C7
	for <linux-parisc@archiver.kernel.org>; Sat,  5 Jan 2019 22:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfAEWgd (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 5 Jan 2019 17:36:33 -0500
Received: from mout.gmx.net ([212.227.17.20]:33789 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbfAEWgc (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 5 Jan 2019 17:36:32 -0500
Received: from [192.168.20.60] ([92.116.168.54]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LoKHN-1hClKv18Mj-00gEuH; Sat, 05
 Jan 2019 23:36:20 +0100
Subject: Re: [PATCH] parisc: Improve initial IRQ to CPU assignment
To:     Dennis Clarke <dclarke@blastwave.org>,
        linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
References: <20190104230546.GA18977@p100.box>
 <76386f22-f894-5202-576a-357782743ec4@blastwave.org>
 <e3ba658f-9505-8258-8172-746e234a8bb4@gmx.de>
 <0d94b184-fd9f-b143-037f-7536f9e59625@blastwave.org>
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
Message-ID: <234eebc6-5958-8cf7-7914-4b39489c5218@gmx.de>
Date:   Sat, 5 Jan 2019 23:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <0d94b184-fd9f-b143-037f-7536f9e59625@blastwave.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wZld62Hb7lOXe3EwIwcZYlkzOZv+KlDoXHUSnFKghpiRTutuEOs
 1osmAyg/Esq5EV60BRhxN1i6DoStg3Ite4o0dMElbwl5l5PDzOy9bqE62AUJp2Oe/xUnktr
 kgKZc4b9f9UwSzLa/nFBiYIt6ENRGLPbANgzOPbRVOVvOwLYvGWzRoSOFRcXK+kKMJJkuiV
 kcFcP7AcxqPQTmryrsjWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eH654CqtHqE=:EFSUyrtqUx0uJz4Jj0Z5wU
 IgAQU6eRLNT4S9nOLJ4HCL9/Zdkm/3lfrJYmAolNItzVcCc7hSCaDIHIx3Qo8BRyXLi/Pcc/l
 aCx59wnI2/mhwurbfLXGh5eBrhwhhzkqJ+aworVxtDIzrtY02uU9hhepo4uiJZOPjUCmkj1ss
 dZMMoVIn58tP6r6AURZCSy0cCxGAUYP/KzeFjiq+VOFVG5iZfbH99Nym7eBbn00noy8bmBeh/
 3WbIyXRDGbUPdH2xOty5UeKWEDWosZ90whiS/uParTMuieTsKv6+gE7O0IPakEP+pNfhpo3y9
 2UOjHF3/QPMl01w7mfMwDaRoSP5v6oOFFgreuYn3m0gvl+oVQ1PZ5P3kJW1xNPph1AhQbpYgo
 Vj1L0UsYRTeR6+C9NjTLqsHUQEdLWPBNiN8wW9WCYX7SEwAVJmWOaWQkNSVlDWTeaFKvP32+z
 sdYsIlvB0lO2IcBFRSJhrgrIRqtOcWFyc9136z1l6KSC6JIA2z5n8veJaJO0FY7BOm5yHS9O0
 p6+UISetzzS6oXusUx5dAwmMZHEfGegoYme747NVnMOa6wm/nkuIdmigoJHymLQdvpWmSzBMG
 rwLpX6xnjSAXFbDM2kQYPAYY/MWjm92zA5887jDYJzEancXbhAhJ8Fnmcxa5o3ptAIpiSPps9
 J70nIKTf1wjn9//CTURxfAYXawo4gmkc1jhVpbH/wCPaFzMFdvb0eHKTVq5K2CoTkC/LDpZEn
 ArpyXZBYyhF0FyFmc8uiovbninAv4OXdlyNYFE2F0d9df9Nj4llljyiFhnXnbSsRUAheSNg8j
 6pcHm/izAt2ib4FVJ9X93v/rnFQx4o3rPvdt7uiwAX8FX9wy1DI1whh8dHpki3+onNtTPi7UX
 i6fKt5hxfAvm5hTVyFjO/J04PG+I3SQZJ75LJo6vDeRd5JS07138on0LYkppFU
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 05.01.19 22:45, Dennis Clarke wrote:
> On 1/5/19 4:21 PM, Helge Deller wrote:
>> On 05.01.19 00:21, Dennis Clarke wrote:
>>> On 1/4/19 6:05 PM, Helge Deller wrote:
>>>> On parisc, each IRQ can only be handled by one CPU, and currently CPU0
>>>> is choosen as default for handling all IRQs by default.
>>>> With this patch we now assign each requested IRQ to one of the online
>>>> CPUs (and thus distribute the IRQs across all CPUs), even without an
>>>> instance of irqbalance running.
>>>
>>> Will this take into consideration the features in default_smp_affinity
>>> and allow processor cores to be considered 'non interrupt' service
>>> state?
>>
>> It seems the feature of default_smp_affinity to disable specific cores from
>> servicing interrupts doesn't work on the parisc platform.
>> On a 2-CPU machine I booted with the "irqaffinity=0" kernel commandline option
>> (to enable CPU#0 and disable CPU#1), which then led to a hanging kernel when
>> CPU#1 ist started.
>> On parisc, each CPU needs to handle at least it's timer and IPMI interrupt.
>> Any idea what I should try?
> 
> Sorry, the first question was "does this work there" and we now know it
> is most likely "no". I tried similar on ppc64 and also arrived at
> nothing but problems.
> 
> I am somewhat focused on digging into RISC-V at the moment and your post
> raised the question in my mind.
> 
> One of the features I once enjoyed about Solaris was that it could
> easily bring cpu cores online and offline as well as disable irq service
> disruptions on any core with a trivial one line command.

That's already possible on Linux (e.g. on x86,power,...).
 > I always wanted to port something similar over to linux but would
> start with something interesting like RISC-V.

There shouldn't be much to port.
Even on parisc, enabling and disabling irqs on specific CPUs is possible
today with simple echo-commands into the files in /proc/irq/#/... (with the
exception of timer and IPI irqs).
Onlining and offlining cpu cores is on my todo list for parisc.
So, I think it shouldn't take much to do that on RISC-V too.

> ps: Also I still have those black superdomes standing around doing
>     nothing and still want to get serial attached, powered up, etc.
>     Yet another news years resolution post-it note idea.

Yes, would be interesting.

Helge
