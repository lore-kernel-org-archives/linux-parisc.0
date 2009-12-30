From: Randolph Chung <randolph@tausq.org>
Subject: Re: futex wait failure
Date: Wed, 30 Dec 2009 18:49:41 +0800
Message-ID: <4B3B3045.1000609@tausq.org>
References: <20091229150027.317D74FEF@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091229150027.317D74FEF@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Not really, except that we gate immediately in the other code paths.
> The gateway page is special in that processes are not supposed to get
> scheduled off the page.
> 
>> The branch might get interrupted, before the process get privileged?
> 
> That was the concern.  At worst, an unnecessary branch is eliminated.
> It's clear that this doesn't fix the futex deadlock, but the timing of
> the lws lock code has changed resulting in slightly different symptoms.

IIRC we had to move the gate in the regular syscall path earlier as well 
to fix some security problems before. I don't recall the exact details, 
but I seem to recall it had to do with using ptrace(SINGLESTEP).

randolph
