Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF34C4843
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 26 Feb 2004 08:57:00 -0700 (MST)
Date: Thu, 26 Feb 2004 08:56:59 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040226155659.GA11451@colo.lackof.org>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Feb 26, 2004 at 05:24:45AM +0000, M. Grabert wrote:
> Maybe I took out too many lines when I responded to my Alan's reply;
> The first part of the mail describes a problem with the siimage driver
> (big-endian problem), the rest of the mail is also about the Promise IDE
> controller I'm currently trying to get working.

ah ok. that makes sense. I probably just read your mail too fast.

> Both the Silicon Image and the Promise IDE controller show the
> "hda: lost interrupt" symptom. However the Promise driver seems to
> me more 'usable' or easily fixable than the siimage driver, since
> it detects the controller and hard disk correctly!

yes - the endian issue is probably harder to fix.

If the Promise interrupt is being delivered on a different interrupt line
than the one advertised (INTERRUPT_PIN), then dumping the state
of the IOSAPIC should show which IRQ input is "high" and we can
figure out where the disconnect is.

But I'm skeptical that's really the issue. I suspect more the IDE command
isn't being programmed properly into the Promise controller and thus it
doesn't DMA correctly or for some other reason complete the command.
ie it has no reason to interrupt.

> The Promise Ultra100 TX2 controller is reported to work on PPC - not the
> siimage one - so there is probably no difference between the PARISC and
> PPC ports in this respect.

ok

grant

> 
> Greetings,
>   Max
