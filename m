Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AB8E4868
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 20 Feb 2004 11:22:01 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AuFHQ-0004iG-9n; Fri, 20 Feb 2004 18:21:40 +0000
Date: Fri, 20 Feb 2004 18:21:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
Message-ID: <20040220182140.GC11824@parcelfarce.linux.theplanet.co.uk>
References: <402A4CA500006EA3@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA500006EA3@ocpmta2.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 20, 2004 at 07:04:26PM +0100, Joel Soete wrote:
> Hi all,
> 
> My collegue make me notice that the N4k on which I can test Linux was supplied
> with 4Gb of ram (which if confirm at boot prompt) but Linux only see 2Gb.
> 
> It is a dual cpu machine, is that 1/2 ram dedicated to 1 cpu and the other
> 1/2 to the 2d cpu?

Unlikely.  As I recall, the N4k diagram looks like this:

<-PCI-> Elroy <-Ropes\      PA <-+-> PA        PA <-+-> PA       /Ropes-> Elroy
<-PCI-> Elroy <-Ropes-\         DEW       RAM      DEW          /-Ropes-> Elroy
<-PCI-> Elroy <-Ropes--> IKE <-Merced-> Stretch <-Merced-> IKE <--Ropes-> Elroy
<-PCI-> Elroy <-Ropes-/         DEW       RAM      DEW          \-Ropes-> Elroy
<-PCI-> Elroy <-Ropes/      PA <-+-> PA        PA <-+-> PA       \Ropes-> Elroy

So the RAM is uniformly-accessible from all CPUs, but the IO is not.

If you look at pat_memconfig() in arch/parisc/kernel/inventory.c, you'll
see how we try to figure out what memory ranges are in the machine.
Want to try debugging that, see what's being reported by firmware?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
