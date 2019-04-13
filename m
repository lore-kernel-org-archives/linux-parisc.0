Return-Path: <SRS0=SQlM=SP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578B9C10F11
	for <linux-parisc@archiver.kernel.org>; Sat, 13 Apr 2019 16:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 191A020663
	for <linux-parisc@archiver.kernel.org>; Sat, 13 Apr 2019 16:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="NOy61CBW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfDMQYF (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 13 Apr 2019 12:24:05 -0400
Received: from mout.gmx.net ([212.227.17.22]:45083 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbfDMQYF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Apr 2019 12:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1555172629;
        bh=WRAmYcEh0NE/eQY593kK/BUFeROB+uMPDm653RD+dw8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=NOy61CBWOhNTnfwkU3DyjTTPa79mdUwR0EmARC1ab570XYZpN6YDPoeef0r/R5oqf
         bDDldy1zaPUH6CRjIg+tAvk9AydRSPm3VRaeBDx18qYAq0aUkbseZzFavU8/i/IlDp
         vgzsEblyx9vMctthEPUWxsbaPUu5aDyY/psQYpXE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.88]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MGFz9-1h31F41e6h-00FAp1; Sat, 13
 Apr 2019 18:23:49 +0200
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
To:     John David Anglin <dave.anglin@bell.net>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>
Cc:     linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
 <14301958-d484-dceb-b48f-c5bb91c0639e@bell.net>
 <a870fe87-0a23-a829-b388-ca9499fc7596@bell.net>
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
Message-ID: <359b1ce8-4486-1090-8db7-252f311f51f8@gmx.de>
Date:   Sat, 13 Apr 2019 18:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a870fe87-0a23-a829-b388-ca9499fc7596@bell.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QigQLfiXRjdHJCNZ6Fn4WkMIy02tiTBTZ/3pSCIE0RUU9lyY0rq
 lZwEzXZeIsELoGYlFfVTCARv5fQ8bL2OgmL08LrI4NnERmSsRuFFXg4BHz64KmhcuF1W7Wn
 63cxOQE3sjo1TTcmjR/JEaEBPkpz5fK3Rb16X0pR+Y1Ar4Hq0XgjsCeI65lpK5B9oJGhN1q
 gzBhD/H2QvTb5D46XTWqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zj4GiUx+5io=:6yRYgPcu1L7tB1/MogtTuT
 hJcOH3hm/YJEfcMEeXRDqYLfWBegJ/59cmXnYzQZEp2+DG10PdD9IvWxMB63sGBEWqD3DgjXX
 tSJWpy4NIqsj6aONgUXIgwKZbJ/TMSsh1/oY15uZc8ZEl/2vQ4cIK6gEQvuD17+wdxKHK6m6r
 gCEUCzYUEusTAwURTSYMpB6Up4g/4R4+PWaUlzUqjVXOvj5kVMnPpt7JZ+44Ly+399tT3qmVW
 t244Har/zglgFYq4SD/hiIRDuahCSVOAS40/ynhTMEoDSu719qXQvVDDZr3j0RUXbPSGtOoDd
 YWGFHBGunnfesifuJ0njM1BSI0EaOaGlwCVTZUY+Wu8TR8e9E/ORH9bPU4PXeL9womCmf2ZpW
 i/ogyUMj2EjRz/Q/5n2LwdWZyuEqrT4s4o3UUWUUaX/AXYX+islzZjdPZ9erW0rmfvoDbcCXe
 o4WRfuOCFuj7InaPY+pCTYi46U9VG3qMqbGjcdBHPKb5m0b42E99hJrw8sEsc13KP9BwFHftO
 gPh7OhIxPnHc/xSxTCHR5AqYQOIiXoi7+gYiA0k10I603rUczEnrvjDzikdjMYp7S5A+oqU3O
 7a6AcTG6DFzevlrt1LhAtkE8F2GF9xAgRWGX8yVKA1JLiz0Dwl+c8CEeWcBjKBMfAJMKe5dny
 +pCFSUUTGJaHqfCNZDjdqU/SG4raFm4T8pP8iIMpeXYnvAMX+iwGC1WPt+HTFacEgTJny4iVI
 y0RblPNLixlnf3h+wHaHfbgxCQ8alaHn9Tog2odXCjCCp5gmI+4nkeBmayAl2qSCOrbZJNdN6
 YpH6Ge9Fg9RNJFawzd6Vqoree9gtyDQouwXU6GPXwzMx9fhP3KqfjLygjWQ7SyWVTuIh4qpWg
 Jtrhvo0TMofLGncV5BGrKQFJ6CgDkIAdzLvZFA4xvFBjjQlRIF/mgWWs2kiOC7
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 10.04.19 21:27, John David Anglin wrote:
> On 2019-04-10 3:10 p.m., John David Anglin wrote:
>> Was merced bus used on PA 1.x?=C2=A0 If not, then the locks could be
>> removed.
> Openpa states that merced bus was used in L1500, L3000 and N4000.=C2=A0 =
All are Pa 2.0,
> so locks are not needed.

And according to https://www.openpa.net/pa-risc_chipsets_stretch.html
it seems that a IKE I/O controller is used on Stretch only.
So, detecting an IKE should be sufficient to check if we need
to avoid multiple TLB flushed on the bus...

Helge

ftp://parisc.parisc-linux.org/dmesg/rp5470_3.10.dmesg
