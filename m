Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38F084852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 11:18:55 -0700 (MST)
Message-ID: <4037A133.5020906@tiscali.be>
Date: Sat, 21 Feb 2004 18:19:31 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
References: <402A4CA500006EA3@ocpmta2.freegates.net>
	<20040220182140.GC11824@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040220182140.GC11824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Matthew Wilcox wrote:
> On Fri, Feb 20, 2004 at 07:04:26PM +0100, Joel Soete wrote:
> 
>>Hi all,
>>
>>My collegue make me notice that the N4k on which I can test Linux was supplied
>>with 4Gb of ram (which if confirm at boot prompt) but Linux only see 2Gb.
>>
>>It is a dual cpu machine, is that 1/2 ram dedicated to 1 cpu and the other
>>1/2 to the 2d cpu?
> 
> 
> Unlikely.  As I recall, the N4k diagram looks like this:
> 
> <-PCI-> Elroy <-Ropes\      PA <-+-> PA        PA <-+-> PA       /Ropes-> Elroy
> <-PCI-> Elroy <-Ropes-\         DEW       RAM      DEW          /-Ropes-> Elroy
> <-PCI-> Elroy <-Ropes--> IKE <-Merced-> Stretch <-Merced-> IKE <--Ropes-> Elroy
> <-PCI-> Elroy <-Ropes-/         DEW       RAM      DEW          \-Ropes-> Elroy
> <-PCI-> Elroy <-Ropes/      PA <-+-> PA        PA <-+-> PA       \Ropes-> Elroy
> 
> So the RAM is uniformly-accessible from all CPUs, but the IO is not.

That is also what I believe to have understood from our previous talk about N Stretch mmu
(but I am never sure to well undertand, thanks to confirm)

> 
> If you look at pat_memconfig() in arch/parisc/kernel/inventory.c, you'll
> see how we try to figure out what memory ranges are in the machine.
> Want to try debugging that, see what's being reported by firmware?
> 
I will try.

Many thanks,
	Joel
