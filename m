Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA11975
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 06:11:27 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 1 Nov 2000 13:13:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA14090;
	Thu, 2 Nov 2000 00:11:11 +1100
Date: Thu, 2 Nov 2000 00:11:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Elf Header change proposal
In-Reply-To: <200011010937.CAA16167@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0011012311450.26717-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 1 Nov 2000, John Marvin wrote:

> So, the bad news is that I wasted time writing an unecessarily long
> design proposal. The good news is that the only thing that needs to
> change is value in the e_ident[EI_OSABI] field, so that we can
> differentiate 64 bit HP-UX binaries from 64 bit Linux binaries.
> We should also change the field for 32 bit Linux also.

Some other bad news is that the change isn't quite trivial, due to not
wishing to break other bfd targets.  The good new is I've made the
change.  Compiling at the moment.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
