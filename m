Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 438CF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 00:26:40 -0600 (MDT)
Date: Tue, 28 May 2002 23:26:38 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020529043916.A15D3482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0205282315190.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, 28 May 2002, Grant Grundler wrote:

> Jeremy Drake wrote:
> > Some things that occured to me about the hardware that may be influencing 
> > this.  The on-board USB on this box is broken (as in physically damaged).  
> 
> That's a good observation. Can you characterize how extensive is the
> physical damage?

The plastic thing that the pins sit on was missing from one of the 2 usb 
ports when the box arrived.  I, not having noticed this, plugged a 
keyboard into it.  It worked, but after playing with serial consoles and 
such it wouldn't go back.  The pins were bent because the reinforcing 
plastic was missing.  I tried to bend the pins so that they didn't short 
anything, and one broke off.  Both onboard USB ports haven't worked since.  
When booting, it said "initializing keyboard" and then "IODC error".  I 
put it on serial console and left it alone after that.
 
> > I don't recall anything on the previous console output that suggests
> the USB interface driver isn't happy.
> 
> > I have a pci usb card in there for typing on the graphics console, and 
> > when I installed it into the first slot recommended by the manual (2 I 
> > think) the box did some HPMC stuff when it tried to do selftests.  I moved 
> > it to slot 8 and everything seems happy with it.  Maybe something in the 
> > smp code is aggrevating these problems...
> 
> Possible. Which manual are you referring to?
> one that came with the USB card or some HP PARISC manual?

The J5000 owners manual, 
http://www.hp.com/workstations/support/documentation/manuals/user_guides/j_class/A5991-90000.pdf 
near the top of page 54 it says "For non-graphics cards, insert them in 
this order: Slot 2, then 8, 3, 5, and finally 6."

> 
> grant
> 

-- 
If a man has a strong faith he can indulge in the luxury of skepticism.
		-- Friedrich Nietzsche
