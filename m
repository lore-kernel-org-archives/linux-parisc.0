Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BC71482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 12:14:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15NIJh-0005wT-00; Thu, 19 Jul 2001 19:14:29 +0100
Date: Thu, 19 Jul 2001 19:14:29 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>,
	marteaut@esiee.fr, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.6-pa20 question about modules
Message-ID: <20010719191429.A22668@parcelfarce.linux.theplanet.co.uk>
References: <OF46B79DB5.FE766246-ONC1256A8E.005BA756@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OF46B79DB5.FE766246-ONC1256A8E.005BA756@LocalDomain>; from jso@europay.com on Thu, Jul 19, 2001 at 07:46:09PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 19, 2001 at 07:46:09PM +0200, Joël Soete wrote:
> make dep clean bzImage modules modules_install 2>&1 | tee
> /var/tmp/kl-200107.log

don't do this.  make dep creates dependencies which then need to be taken
into account for later steps.  you might rely on make getting this right,
but i don't.

> ps: but with parisc-box I met a problem which I do not met with the
> xcompiler on i386 linux-box:
> 
> dmfe.c: In function `dmfe_timer':
> dmfe.c:1193: Unable to find a register to spill in class `FP_REGS'.

bug in that driver (it has x * 1.5, which uses fp).  fixed in alan's tree,
though i don't believe it's made its way into linus' tree yet.

consider youself lucky you get compile-time errors instead of random
inexplicable fp corruption.

-- 
Revolutions do not require corporate support.
