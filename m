Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x2.nokia.com (mgw-x2.nokia.com [131.228.20.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D595482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 00:29:25 -0600 (MDT)
Received: from esvir06nok.ntc.nokia.com (esvir06nokt.ntc.nokia.com [172.21.143.38])
	by mgw-x2.nokia.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f8A6Tp327091
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 09:29:51 +0300 (EET DST)
Received: from linux.nokia.com (linox03.ntc.nokia.com [172.21.29.49]) by esebh01nok.ntc.nokia.com with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2652.78)
	id R4RMQQKR; Mon, 10 Sep 2001 09:29:22 +0300
Received: from linox03.ntc.nokia.com (linox03.ntc.nokia.com [172.21.29.49])
	by linux.nokia.com (8.11.2/8.11.2) with ESMTP id f8A6TH628740;
	Mon, 10 Sep 2001 09:29:22 +0300
Date: Mon, 10 Sep 2001 09:29:16 +0300 (EEST)
From: Hannu Martikka <martikka@linox03.ntc.nokia.com>
To: ext John Marvin <jsm@udlkern.fc.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel panics on 715/80 [It works!!]
In-Reply-To: <200109051257.GAA23109@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.33.0109100922070.26516-100000@linox03.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 5 Sep 2001, ext John Marvin wrote:

> > Sorry it took so long to do further debugging... Anyway the System.map
> > says:
> >
> > 102ee3a0 ? parisc_hardware_description
> > 1010ae98 T alloc_pa_dev
> >
>
> Oops. I found this bug last week, but forgot to commit a patch for it.
> I just did that.

Now it works for me too. Thanks!

> John
- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
