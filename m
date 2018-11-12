Return-Path: <SRS0=Hn0r=NX=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B88C43441
	for <linux-parisc@archiver.kernel.org>; Mon, 12 Nov 2018 17:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68429224E0
	for <linux-parisc@archiver.kernel.org>; Mon, 12 Nov 2018 17:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68429224E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbeKMC7R (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 12 Nov 2018 21:59:17 -0500
Received: from mout.gmx.net ([212.227.15.19]:40025 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727659AbeKMC7R (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Nov 2018 21:59:17 -0500
Received: from [192.168.20.60] ([92.116.170.42]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MZkv0-1g4BKe265G-00LS7x; Mon, 12
 Nov 2018 18:05:06 +0100
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        HPPA porters <debian-hppa@lists.debian.org>
From:   Helge Deller <deller@gmx.de>
Subject: New mail archive for parisc-linux available
Message-ID: <4fffe816-29b8-d4b9-6d83-c9b05a45c0c7@gmx.de>
Date:   Mon, 12 Nov 2018 18:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xkeanCPBBHXPVBMVHHmV3mpIAx62oirnwOLv81tC2Va26a6m1F/
 ILw3/khTcIsIePqtRzJ59a1INfCPGUrn9UFLFdzxMxiZARcvMCs/wLDh8aeOpZpyBJvsyfq
 egrx5MVidqM+GZidcsktbHtSI8bbq7taRjvJrBNb2Bz1kruZIC2XIPQVfNGdHAMpl/warJu
 VeYdU7B9PVkfaeLweDGCQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9ypumjcEys4=:IrvpexDwsKMSxKKZC4mnZn
 3kHln7/yriJ61VIvPmEkD0OH2PSGN0KpZ7t481r0+iw9PvRPwtCVw4wNYDnH6y8opymWt32a9
 eGpRcs5yL/689lMnZtXFdHsvy0FftenHd46rbgh6u2ctat5pSuLOMi3loexekUZ2xj3uCLzjC
 xSbbO5V1xZkwouNrHSD6S4VTRcyGiz+4qJs2or5SdEPCPkS0oJx8F5bQzHlWEU7JFQ8OnhY8Z
 9vJ+ghqocriPgPvGl8tdz2TzOjInj3heSmH9e5X4zdIejsI3kgoDCzN82Il6OxdK1ER1HThNS
 FGQrGjzoLokqpFQsEjn3870gEHQRrHC2f4yCDiw8zJgZigJzObkl5Zw7NXZo6omLpKiYQb//g
 pSAuq+VG6+RmK+epnSODTwoxwaK8PYSIDxws01GhAwNdY/T3Q/bzQRqKAEAJEFOQrnsr8gPqr
 bn2YIh0JS/h0uEjI/sR6fNFJoa72ZeE2NT/N9efzyGibuDOo1heUM3LhqhWyi78BYDsCm/8is
 1ia+TQU+1T837kfjqKoK2h72gFKmZHDllVuT5TqEBJCG63QywIBuVKgNLD08kAl+QSGKQtpPF
 mOxxfGjFHHMtchoW8e5MUNpeEjHDtPgNHYMzRGPVF1IxKwOoX1gsqmsEGyWfRvdGAh0gCKmdD
 Jj1eqB6eSNIPeQjBG0Q4UMgjn98yKHO0Ak4PGcoPf9Wl+dHuB10k+X7Iw8xlFbFvQ9z3g1qjF
 X/kBYVAcyj5clpDauk/YWNv6dEyvaYWievqgNYBIGjBPu5Yc6hFf4TGrDrmecHtuxTPNgXyCW
 1iPKFoDavBWJY4M00Xf6l+m0FVpNC/xUc/eOgZfMXbGLmtosSSf42mbbRnP1bYP+E/WKFYd+4
 3LLenEHgeQMealKjI0R7Tz/Tw2cDHXRQB1zHus1Nl1ZtqC8/Gs90hFc8VEAVtL
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Dear PA-RISC Linux hackers & fans,

The admins at the Linux Foundation have been so nice to set up a new 
complete parisc-linux mailing list archive with me.

It's now available at:
	https://lore.kernel.org/linux-parisc

Access via NNTP is easiest:
	nntp://nntp.lore.kernel.org/org.kernel.vger.linux-parisc

A list of currently active parisc-linux mail archives are listed at
	https://parisc.wiki.kernel.org/index.php/Mailing_lists

and I think the very first parisc-linux related mail I know of is:
	https://lore.kernel.org/linux-parisc/Pine.LNX.4.04.9901291134480.1532-100000@sprite.osfi-bsif.gc.ca/

Helge
