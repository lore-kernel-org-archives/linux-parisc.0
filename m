Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Tue, 28 May 2002 12:45:18 PDT." <Pine.LNX.4.44.0205281239110.11012-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0205281239110.11012-100000@garibaldi.apptechsys.com> 
Date: Tue, 28 May 2002 22:39:16 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020529043916.A15D3482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> OK, I was doing an apt-get update, and the damn thing died at Reading 
> Package Lists... 0%.  I'll see what's up with it when I can, do you want 
> ser pim, ser pim toc, or just wait for a new kernel?

If the box HPMC'd, I'd like the "ser pim".

> Some things that occured to me about the hardware that may be influencing 
> this.  The on-board USB on this box is broken (as in physically damaged).  

That's a good observation. Can you characterize how extensive is the
physical damage?

I don't recall anything on the previous console output that suggests
the USB interface driver isn't happy.

> I have a pci usb card in there for typing on the graphics console, and 
> when I installed it into the first slot recommended by the manual (2 I 
> think) the box did some HPMC stuff when it tried to do selftests.  I moved 
> it to slot 8 and everything seems happy with it.  Maybe something in the 
> smp code is aggrevating these problems...

Possible. Which manual are you referring to?
one that came with the USB card or some HP PARISC manual?

grant
