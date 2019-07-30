Return-Path: <SRS0=IsNS=V3=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D61C433FF
	for <linux-parisc@archiver.kernel.org>; Tue, 30 Jul 2019 20:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 390FC20693
	for <linux-parisc@archiver.kernel.org>; Tue, 30 Jul 2019 20:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lpF43KNP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfG3U6l (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 30 Jul 2019 16:58:41 -0400
Received: from mout.gmx.net ([212.227.17.21]:57111 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfG3U6l (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 16:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564520317;
        bh=jQ4qtnSvw99dJT8q+L1x7Qoh2P2aSfPjUndMdpTuNi8=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=lpF43KNPSnF0qWpLzpGqosle6GPxilYV4z0aI7ex+eNSIYl0WoDZL9UWGfIdSl0bi
         LgNTabOs5xJiqF4LBl8g0LmeITvE6Yw3BCRewN7V//F7OC3l7Nm6e6HkF4+BMD5zyu
         jBxpAvo3Sslm1kNkX2pnDCEBLqny1xmCjN+sOVFE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.168.50]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1i0XoW2Gj7-0081Ys; Tue, 30
 Jul 2019 22:58:37 +0200
To:     Parisc List <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Subject: Do NOT upgrade to palo v2.10
Message-ID: <bff56161-3d9c-d4f1-c1cb-fd04de28eb59@gmx.de>
Date:   Tue, 30 Jul 2019 22:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:i/vrmo9w+VlQbh8Ew/AJqwcTGtkqQi8u/pCuSVuHOuayxGvt+R8
 bMWbi02a9nq3gWrf/xDjMg2iJSgmJa2pfcdxN98zSWpFTStHuhIIAeOoxgTwcmttsrVEVUW
 VM+rt+1yyHS3qsX6cSKysWqGXP+6SfBI2Sy1rSpUS3Hfc5MSJ+ZmQ3cmRUnhE1pCnnqsOUw
 toqFXzx366clsFRleYSig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n7QeLt0UGWc=:v/0j5yAUobhvosZ8kuHV6p
 d8QiNClsglq8mgcPcwiskLUrg75RwfcWCUNf8iKEX8iX9aEHxUGl+x6WG1KXPG3zmTW4PENB2
 ArgUXHASVRqG11U5l4nf6zSPiO4d/JIpGXRllqodXhF+ipVAsc/j8n3EN9sOWTJmKBg/uUkk2
 cPOCAzd7xODdUN8leLsZfZnPIdWw8w5lG4JGRRud3eV6aIR0Zna8b4bWyxruhQzA25HxH61MB
 9zxyRKEEA65SE9oieH5bPGmb8xZ1dr80Z1A2JG8xnQNcKRO26g2o70hjA1F54gUgBNkTCxg7W
 GlwPr+oTokux1cU8+GfyPCqxBA+4npCmVCL1N1+PaH2rpKgikrBbedr/VfKSPMe9q0Ve5A8rw
 jXlqyx4BhLNaYmq8WT62wn6PYo5/lndXqB23tN9dy3FUoLVwEI/DSoQC75CnL3l++dKjvdL99
 62idvwzUXMBtrL3GQ6D2IF0KDGRIKz3l5AJvwL8PpvDbGNcGjy3BbDItGxeEsjE4UEkLTdu/0
 /t66V0BQQoXmkZ+7yLWX1irYHAKa256Ame/pxLT5MjEQFWZwTI2UvDw97vGJts2RJxvTFuGQo
 NtHO5epFpKIordkg/+9Jsekq7uEX29+j+jN8o6ElqAg+u/62r5Plglvsl5m3b2y3fAojzHHMe
 DRExLrzqxDkYBCDdwXGPSNLcTRzVKjep+d/MAag0YKXeZb6MWFZ0U8RaFcRmdlLWfSHchvuLY
 wni/jeHiwRwr7hCM5oLG0X4/J+Ep7HSxIk5tvYDLhKHd3iDJ9UjrqVUvOZQrXV6xKcQixDf0G
 p+Z/70/Xld7nIjKcqy5r9p6qndFpVlhAcTv+G6I+DpTYaRv6CggNRel9LX8Fa5H2cwpCXR6M6
 9WK6JswSUGej2Y4iHY+OBH3VB8NXXfqufoTT36Ypu75BhgIKVcAW5SKwm6fXDYM+8SYRU9vmV
 k5QICoV/uqBXC72ZBTzaROFJfV8KVLI9mg8iJoP+6oKIP1IZeFZN7yg4gH4i/HOB6aWPN8yKd
 +i4M0E5KGElcnFPZDcCl8ytC/HHp9vgr3G3cKErAGTu1IwO7XFC5jqNNplcbl2zQvimkhMV1X
 xQPjEQC6bO5BdE=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

PALO version 2.10 was released last week, but it has a bug
which may prevent that you are able to boot your kernels:

Entry 000e0000 first 000e0000 n 2
Segment 0 load 000e0000 size 8249207 mediaptr 0x1000
Abort: Would overwrite palo 00060000-000f8e30 or data 3faef580 areas.
ERROR: failed to load kernel

I'm working on this issue, but until a new version
has been released, please don't update palo.

Helge
