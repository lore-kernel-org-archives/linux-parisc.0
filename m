Return-Path: <SRS0=SQlM=SP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D408C10F11
	for <linux-parisc@archiver.kernel.org>; Sat, 13 Apr 2019 17:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A2182084D
	for <linux-parisc@archiver.kernel.org>; Sat, 13 Apr 2019 17:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfDMR5o (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 13 Apr 2019 13:57:44 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:41681 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726297AbfDMR5o (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 13 Apr 2019 13:57:44 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190413175743.ZWDG4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sat, 13 Apr 2019 13:57:43 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190413175743.IWOW30132.torspm02.bell.net@[192.168.2.49]>;
          Sat, 13 Apr 2019 13:57:43 -0400
Subject: Re: [PATCH] parisc: use per-pagetable spinlock
To:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Mikulas Patocka <mpatocka@redhat.com>
Cc:     linux-parisc@vger.kernel.org
References: <alpine.LRH.2.02.1904061533530.21941@file01.intranet.prod.int.rdu2.redhat.com>
 <1554580144.5053.4.camel@HansenPartnership.com>
 <14301958-d484-dceb-b48f-c5bb91c0639e@bell.net>
 <a870fe87-0a23-a829-b388-ca9499fc7596@bell.net>
 <359b1ce8-4486-1090-8db7-252f311f51f8@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <1b20a59f-ad4c-2c1a-7b5c-cbdd86082c44@bell.net>
Date:   Sat, 13 Apr 2019 13:57:42 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <359b1ce8-4486-1090-8db7-252f311f51f8@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=5ypQrAzGAAAA:8 a=FBHGMhGWAAAA:8 a=Jf8cDY2UCG0ndUKv_boA:9 a=QEXdDO2ut3YA:10 a=vfUNbsYLo2IA:10 a=lMylKNZlyRsA:10 a=QnlTcYk_iZbCEFXf-YqT:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfJHybbUhy0N0ZbmNI2PMbKvWWOV66iWq59YDQ65XKJ96DO944LkA/cl/Ss7/ZhTPa2PEw6vyXgG+WOk90ckmTYtnpZWkF34X3cxha1/R2XoNpPeV6sia FrQDOUS1xhh0odRiLDnflBmGeHJnPVB51nyuDbnc+X9l3AMVKdTOMrh5ORtBAy6l+H4K8NSqv08T9g==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-13 12:23 p.m., Helge Deller wrote:
> On 10.04.19 21:27, John David Anglin wrote:
>> On 2019-04-10 3:10 p.m., John David Anglin wrote:
>>> Was merced bus used on PA 1.x?  If not, then the locks could be
>>> removed.
>> Openpa states that merced bus was used in L1500, L3000 and N4000.  All are Pa 2.0,
>> so locks are not needed.
> And according to https://www.openpa.net/pa-risc_chipsets_stretch.html
> it seems that a IKE I/O controller is used on Stretch only.
> So, detecting an IKE should be sufficient to check if we need
> to avoid multiple TLB flushed on the bus...
>
In hardware.c, we have:

        {HPHW_BCPORT, 0x800, 0x0000C, 0x10, "DEW BC Merced Port"},
        {HPHW_BCPORT, 0x801, 0x0000C, 0x10, "SMC Bus Interface Merced Bus0"},
        {HPHW_BCPORT, 0x802, 0x0000C, 0x10, "SMC Bus INterface Merced Bus1"},
        {HPHW_BCPORT, 0x803, 0x0000C, 0x10, "IKE I/O BC Merced Port"},
        {HPHW_BCPORT, 0x781, 0x0000C, 0x00, "IKE I/O BC Ropes Port"},
        {HPHW_BCPORT, 0x804, 0x0000C, 0x10, "REO I/O BC Merced Port"},
        {HPHW_BCPORT, 0x782, 0x0000C, 0x00, "REO I/O BC Ropes Port"},

Dave

-- 
John David Anglin  dave.anglin@bell.net

