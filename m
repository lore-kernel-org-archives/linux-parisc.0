Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA15666
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 16:55:05 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 22:55:13 -0000
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Branching "stable" 2.3.99pre8 kernel
References: <200009012000.NAA21030@milano.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 01 Sep 2000 18:27:21 -0400
In-Reply-To: Grant Grundler's message of "Fri, 01 Sep 2000 13:00:29 -0700"
Message-ID: <87lmxblpdi.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> David,
> 
> I don't mind...I just don't want the fixes you make there get lost.
> Please either post the fixes to the list or sign-up a maintainer (like
> myself) to merge fixes into the 2.4.0-test6 based branch ("mainline").
> I'd be happy to merge the few parts I understand/have clue about for you.

The branch tag is STABLE_2_3_99PRE8.  I've put one "fix" (really just
a workaround for some total stupidity that is hopefully a bit less
stupid) in there already, but I don't know if it's worth merging since
with any luck our userland memory management will be fixed for real
soon.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
