Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00EDF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Apr 2001 02:10:14 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6197CB008; Tue, 17 Apr 2001 09:10:27 +0100 (BST)
Date: Tue, 17 Apr 2001 09:10:27 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: buffalo bill <buffalo@uranus.solar-system.the7lg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 710 SCSI & LAN problems
Message-ID: <20010417091027.H11226@linuxcare.com>
References: <01041223044200.22122@venus.solar-system.the7lg.de> <20010412231257.D11226@linuxcare.com> <01041300224801.22122@venus.solar-system.the7lg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01041300224801.22122@venus.solar-system.the7lg.de>; from buffalo@uranus.solar-system.the7lg.de on Fri, Apr 13, 2001 at 12:22:48AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 13, 2001 at 12:22:48AM +0200, buffalo bill wrote:
> > No, that is expected behaviour on older systems with non-consistent
> > memory.  The problem appears to be with interrupt routing from the
> > scsi and lan chips to the cpu, and we don't have the documentation to
> > resolve that at the moment.
> >
> > Richard
> 
> Thank you for your answer.
> 
> I almost forgot to say: HIL is also broken on the 710.
> I guess there is nothing recently working on the 710 that needs to handle 
> with interrupts.
> 
> Could you tell me on which chip is the interrupt handling done ?
> Is there something like a APIC ?

A custom HP chip, called ASP on the 710, I think.

Richard
