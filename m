Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA09801
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 16:25:23 -0700
Sender: drepper@cygnus.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com, binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
References: <Pine.LNX.4.21.0011220914180.16860-100000@front.linuxcare.com.au>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 21 Nov 2000 15:27:19 -0800
In-Reply-To: Alan Modra's message of "Wed, 22 Nov 2000 09:50:05 +1100 (EST)"
Message-ID: <m3u290j488.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> Ulrich Drepper also was quite vehement against changing sourceware
> FreeBSD binutils.

I've never said anything about any *BSD, why should I?  The *BSD
people wanted to change the Linux binutils.

Anyway, the ABI value is zero unless you implement ELF extensions.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
