Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC47482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 13:45:20 -0600 (MDT)
Date: Tue, 28 May 2002 12:45:18 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <Pine.LNX.4.44.0205281234370.11012-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0205281239110.11012-100000@garibaldi.apptechsys.com>
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

On Tue, 28 May 2002, Jeremy Drake wrote:

> On Tue, 28 May 2002, Grant Grundler wrote:
> 
> > It remotely possible the latest commit I made will affect this problem.
> > Can you retry with -pa28 (or -pa29)?
> Sure.  No problem.  I've been trying to keep the kernel as up-to-date as 
> possible...
OK, I was doing an apt-get update, and the damn thing died at Reading 
Package Lists... 0%.  I'll see what's up with it when I can, do you want 
ser pim, ser pim toc, or just wait for a new kernel?  (this sort of thing 
happens a lot on smp, but this box is surprisingly stable on UP)

Some things that occured to me about the hardware that may be influencing 
this.  The on-board USB on this box is broken (as in physically damaged).  
I have a pci usb card in there for typing on the graphics console, and 
when I installed it into the first slot recommended by the manual (2 I 
think) the box did some HPMC stuff when it tried to do selftests.  I moved 
it to slot 8 and everything seems happy with it.  Maybe something in the 
smp code is aggrevating these problems...

> 
> > 
> > grant
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> 
> 

-- 
Tact in audacity is knowing how far you can go without going too far.
		-- Jean Cocteau
