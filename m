Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob01.one.net.au (mail-ob01.one.net.au [61.12.0.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31C5A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 20:03:17 -0600 (MDT)
Received: Received: [from squeak.local (async169-ade-isp-7.nas.one.net.au [203.101.92.170])
	by mail-ob01.one.net.au  with SMTP id f4H22Vw09129
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 12:02:50 +1000 (EST)]
From: amodra@one.net.au
Date: Thu, 17 May 2001 11:37:02 +0930
To: SOETE Jo?l <JSO@EUROPAY.COM>
Cc: "'puffin-t@esiee.net'" <puffin-t@esiee.net>,
	parisc-linux@lists.parisc-linux.org,
	parisc-linux-announce@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.6.1 isos
Message-ID: <20010517113702.W14368@squeak.one.net.au>
References: <A4A5E4C468B5D11190220001FA6835DD04DD892B@EPIXCH003>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD892B@EPIXCH003>; from JSO@EUROPAY.COM on Wed, May 16, 2001 at 08:05:56PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 16, 2001 at 08:05:56PM +0200, SOETE Jo?l wrote:

> !!! I just try binutils_2.11.90.0.7-2.99_hppa.deb but as failed on 'bus
> error' !!!

Don't use anything based on HJ's .0.7 binutils (which this deb is).
It has half of a necessary change installed, which unfortunately
for hppa-linux means 2.11.90.0.7* generates bad objects with
references to ".plt - 1".  These references will generate an
unaligned data trap when you hit them.

-- 
Alan Modra
