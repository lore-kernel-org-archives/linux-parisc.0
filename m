Return-Path: <SRS0=OjrN=ED=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC9C388F7
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Oct 2020 23:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD00120791
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Oct 2020 23:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=techtravels.org header.i=@techtravels.org header.b="w1jmDGIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbgJ1XKl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:10:41 -0400
Received: from box.techtravels.org ([162.243.220.157]:37447 "EHLO
        box.techtravels.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731936AbgJ1XJI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Oct 2020 19:09:08 -0400
X-Greylist: delayed 4200 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Oct 2020 19:09:08 EDT
Received: from authenticated-user (box.techtravels.org [162.243.220.157])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by box.techtravels.org (Postfix) with ESMTPSA id 041D83F1F0;
        Wed, 28 Oct 2020 08:29:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=techtravels.org;
        s=mail; t=1603888198;
        bh=r3JGfSbhqALVtSoYk64EyIXKoztH+vowZnL9ryhncAY=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=w1jmDGIPPAyCdMWNCkUavvulQbYL5Nn5xnWxcvdMXoNhaEwQHxzeeYl6OUivWMk15
         GM6XxgRHt78jo+x/+y0bIL1kBdlg+HUoxZl77yAw788gLtawy2RuPdrOi+w0/PM4Jf
         BFHOvojeT1VsUjw0GmFeiAO6moiXQvZUF2m/sTBB8hZdXxmejPkBDzDjG9VrVksch2
         sd/5bJbVTjE9ciLM+IBLBJ4hI9bk0oOcACzVODYKZratzCG9WorNA4eiQUBiGTsSHh
         Dtyb50HpvIn4eqdLTjG9HiaUI7MtofnbtiPvl1MZud21Az6OSDbfUWHlX1DrWTs/hh
         mic9UebYfZ8pw==
From:   Keith Monahan <keith@techtravels.org>
Subject: Re: HPPA support for IGNITE-UX install discs
To:     Helge Deller <deller@gmx.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Sven Schnelle <svens@stackframe.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        qemu-discuss@nongnu.org
References: <fad1bbcf-51c4-f381-87cf-23d5f9787df3@techtravels.org>
 <69e13e3a-f236-871c-0491-bb8d53c74a18@amsat.org>
 <d84eea18-3bd6-bda9-3e63-749a96e1ed94@gmx.de>
 <daaf28c5-c0d6-87bd-3b60-2687913e7a12@techtravels.org>
 <6ae9bf84-bf40-caf4-d22e-a8df4de26d3d@gmx.de>
Message-ID: <c13cafb3-7a0f-2ebf-9a48-b203168376b4@techtravels.org>
Date:   Wed, 28 Oct 2020 08:29:58 -0400
MIME-Version: 1.0
In-Reply-To: <6ae9bf84-bf40-caf4-d22e-a8df4de26d3d@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Helge,

Thanks for your reply!


On October 26, 2020 4:01:52 PM Helge Deller <deller@gmx.de> wrote:

> Somewhat late reply...
>
> On 9/22/20 2:28 AM, Keith Monahan wrote:
>> Here's the ioscan from the actual hardware
>>
>> no_hostname:/> ioscan
>> H/W Path    Class Description
>> ===============================================
>>             bc
>> 8           bc                      Pseudo Bus Converter
>> 8/0             ba                  PCI Bus Bridge
>> 8/0/15.0              instrument PCI(103c1650)
>
> That seems to be a specific HP PCI card.
> Maybe it's possible to pass-through it at some point in an emulation ?

Not super concerned with emulating that hw there. That card is used to 
connect the PCI bus (in turn, connected to GSC via DINO) to the logic 
analyzer backplane.

>
>> 8/16            ba                  Core I/O Adapter
>> 8/16/0             ext_bus          Built-in Parallel Interface
>> 8/16/1             audio            Built-in Audio
>> 8/16/4             tty              Built-in RS-232C
>> 8/16/5             ext_bus          Built-in SCSI
>
> ^ this one isn't implemented yet in qemu.
> As I said in another mail, we currently emulate a PCI SCSI card instead.
> Maybe emulating the original SCSI controller isn't hard, but I don't know
> and I'm not a SCSI expert.

The NCR 53C710 SCSI that's present inside LASI was pretty common. One of 
the uses includes the Commodore A4091, a SCSI controller sold for the 
Amiga 4000. The A4091 is emulated on WinUAE, which is open source. To 
make my story go full circle, looking at that source, located below, is 
based on QEMU source!!

https://github.com/tonioni/WinUAE/blob/master/qemuvga/lsi53c710.cpp

which is based on

qemu/hw/scsi/lsi53c895a.c

I don't know the significance/complexity of the difference between 
emulating a PCI card vs accessing things via LASI, which would sit on 
the GSC bus. Wishful thinking is that once we get there, that we've got 
existing (albeit different system emulation platform) working code that 
emulates those chip functions.

so then maybe there's still hope for this cause eventually! :)

>
> I think the SCSI controller is the biggest issue for now...
> If that works, the installations should continue.
>
> Helge

Thanks,
Keith

