Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA28144
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 15:19:57 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Jul 2000 21:21:32 -0000
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <20000713003533.Y9568@linuxcare.com> <E13CmYw-00077l-00@noam.fc.hp.com> <87ya3527ik.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 13 Jul 2000 17:14:55 -0400
In-Reply-To: David Huggins-Daines's message of "13 Jul 2000 14:46:11 -0400"
Message-ID: <87sntd20mo.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> It looks like binutils is incorrectly treating those fields as
> unsigned, or has an off by one error, or something similar.  The

No.  My mistake.  binutils is doing the right thing, the problem is
that, due to the way the LR' and RR' field selectors work, there is a
bad interaction between cases in which the DPREL21L and DPREL14R (or
any 21L and 14R relocations actually) are "split" like this, and ld
-r, which tends to increase the addends to a point where LR' and RR'
have different effects (LR' expects RR' to be positive, but it isn't).
Then during final relocation, the wrong thing happens.

So it would appear that this is a problem with GCC, but I'm not really
sure.

I'll have a better explanation once I work through the failure modes
and come up with a good short testcase.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
