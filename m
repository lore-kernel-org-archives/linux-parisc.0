Return-Path: <SRS0=9Rxp=OG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B8BC43441
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 20:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26EB72086B
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 20:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EB72086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbeK1HuN (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Nov 2018 02:50:13 -0500
Received: from mout.gmx.net ([212.227.15.19]:47713 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbeK1HuN (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Nov 2018 02:50:13 -0500
Received: from ls3530.dellerweb.de ([92.116.167.94]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M6jMS-1fVOXH0IdQ-00wVTB; Tue, 27
 Nov 2018 21:50:59 +0100
Date:   Tue, 27 Nov 2018 21:50:56 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] MAINTAINERS: Add hp_sdc drivers to parisc arch
Message-ID: <20181127205056.GA11635@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:0w+/oyDKN8Mtb96mr5UbGTbWkdwqrfzG0WmyroN50FRY7nzzPrY
 FrjMHixBMsBecx695c4ptH/oXbtkOGzLBKgVa7oRHo95FMC2B7zEOGnXHyqPnPS2tAOA1xx
 mLIA9VFB4uxtxht3M91fXj9ZPWfxM58j69hGBRNeQHmvLhexG+y/lvgXAJ+te66nTijtWqq
 oLd12u18RMoFxrPjq0BfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kcYm5pbojTE=:IhTJ0buBNcrlR176tJcnDb
 UwnqBMbV9b1gNc240PfC0a7wR/Xy3KqCl/X9A1GMK+rRjt5AHBkUg0TftFQvVyu2biclmkcO5
 EBAcbtSeoxhCGfDDXpHK8x41otrSE1s1uOMpgOEBChQldtMUWYMr2LtO+sxSDiK9jVpvqwGJT
 VEMmOXD2R/8PU4H2txopVYyFPq+tSzDH03UjAza6JS7mnTGRBdJMYbVG34KNSxmNDpfmPaRi0
 9wR1XQKrRlukAyESMDxEV8+YrVy+cBHVs//8BOS+umtKeoO2mTPuIyWMBMWeNB0DX/nDIV8mh
 PLx2LC84TmFEa/MBXLpj1ee/bR+8W4YkG5CfLt4GZ1UyYEyqTSN6qgD9sCMchXRwBTxk/gOTr
 lyu6ZJ+eeFjObVF0qmbWnTIjRNtnpuAIXfSI44oPo4KCLBI+oIyRxFYsYEO5iSgKKsGMNu1kt
 xigIHCOuxZGajEJi14vgSuPx344TATQBfSfr1kix7hYRhrpTbws26mMx3nhqthIfQNW6E9+O8
 eaqOJUQG/D7CHU/iSbxClkYDoazmTFkNQIb28qLpcj1chwppyivyUhCC5yDpRabL0T3iqlzZi
 a2rpeija6/lfsbMiHksN1M97/D1zWYAYJlR6MsqgpHh+Mp3k4mVSOQl1CG0FwHX7fNxdeuYWN
 NMCivs7uSsn+AtNWvPBsqRN4vSYCh2yLPHWrmtPBwZ/9ePTfATqGvvwcyo1Tk59KAgUnENMXd
 SsqOTVwMGmfEfOJfObUa/hoPWrQtDgnxAQ7UjpuSrOG89d/Y+1m8+3bHCu9E+jLk/B+l1+ECv
 XYRTppxKD0QynjLUhCC2im/DlLnfjj+R6cqvVCt/BPZJvbO28cdeGD6ZbCyGSueJwZr/RWpiR
 hWq+/LVq0cbY6Y7gH3Y7FrcW9YuGcfQRhIvPLsvVk=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/MAINTAINERS b/MAINTAINERS
index 380e43f585d3..6f86e26ed858 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11263,12 +11263,15 @@ F:	arch/parisc/
 F:	Documentation/parisc/
 F:	drivers/parisc/
 F:	drivers/char/agp/parisc-agp.c
+F:	drivers/input/misc/hp_sdc_rtc.c
 F:	drivers/input/serio/gscps2.c
+F:	drivers/input/serio/hp_sdc*
 F:	drivers/parport/parport_gsc.*
 F:	drivers/tty/serial/8250/8250_gsc.c
 F:	drivers/video/fbdev/sti*
 F:	drivers/video/console/sti*
 F:	drivers/video/logo/logo_parisc*
+F:	include/linux/hp_sdc.h
 
 PARMAN
 M:	Jiri Pirko <jiri@mellanox.com>
