Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout03.sul.t-online.com (mailout03.sul.t-online.com [194.25.134.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id CAE66482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Apr 2001 16:23:01 -0600 (MDT)
From: buffalo bill <buffalo@uranus.solar-system.the7lg.de>
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] 710 SCSI & LAN problems
Date: Fri, 13 Apr 2001 00:22:48 +0200
Content-Type: text/plain;
  charset="us-ascii"
References: <01041223044200.22122@venus.solar-system.the7lg.de> <20010412231257.D11226@linuxcare.com>
In-Reply-To: <20010412231257.D11226@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <01041300224801.22122@venus.solar-system.the7lg.de>
Sender: buffalo@venus.solar-system.the7lg.de
List-ID: <linux-parisc.vger.kernel.org>

> No, that is expected behaviour on older systems with non-consistent
> memory.  The problem appears to be with interrupt routing from the
> scsi and lan chips to the cpu, and we don't have the documentation to
> resolve that at the moment.
>
> Richard

Thank you for your answer.

I almost forgot to say: HIL is also broken on the 710.
I guess there is nothing recently working on the 710 that needs to handle 
with interrupts.

Could you tell me on which chip is the interrupt handling done ?
Is there something like a APIC ?

Heiko
