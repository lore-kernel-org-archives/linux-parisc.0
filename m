Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailf.telia.com (mailf.telia.com [194.22.194.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89A354A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 13:47:19 -0700 (MST)
Message-Id: <200102212047.VAA18271@zaphod.halden.lillfab.se>
Date: Wed, 21 Feb 2001 21:47:15 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] Help wanted on an 715/50 "old Box" 2
To: Alex deVries <alex@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3A92FF66.BB9B30C@linuxcare.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 20 Feb, Alex deVries wrote:
> It seems very unlikely that's a Tulip chip, since that's a PCI chipset
> that can't connect to EISA.  If it's another EISA ethernet chipset,
> there's still some WAX work we need to get through.
> 
Actually I think there was EISA tulips (DC21040-based), but for Linux
you need to use the de4x5 driver rather than the tulip driver.

/Daniel
-- 
