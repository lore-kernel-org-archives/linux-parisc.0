Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16548
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 07:34:13 -0600
Date: Wed, 22 Sep 1999 15:36:31 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Hai Vo-Ba <hai@fc.hp.com>
Cc: rbradetich@uswest.net, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Questions understanding exec_kernel
Message-ID: <19990922153631.C5481@suse.de>
References: <37E82CE6.3A5DFFB0@uswest.net> <199909221246.GAA29606@hpeshai.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909221246.GAA29606@hpeshai.fc.hp.com>; from Hai Vo-Ba on Wed, Sep 22, 1999 at 06:46:31AM -0600
List-ID: <linux-parisc.vger.kernel.org>

>     If I remember right, RFI followed by a NOP is an idiom to tell the CPU
>   to start fetching instructions from an absolute address pointed to by the
>   IVA so we usually want to that with interrupts enabled (Q & I bits set).

Are you sure ?  It never did that on the machines I tested on so far (712,
A180C and indirectly 715).

	Philipp Rumpf
