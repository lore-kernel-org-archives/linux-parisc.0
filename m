Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E23F4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Jun 2003 14:39:44 -0600 (MDT)
Date: Sat, 7 Jun 2003 21:39:32 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EE1007C.3030904@tiscali.be>
Message-ID: <Pine.LNX.4.44.0306072132250.30116-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: compiler & kernel (2)
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

On Fri, 6 Jun 2003, Joel Soete wrote:

> I launch it on my b2k and it seems to works fine (any boot pb); I so use
> it to rebuild te same kernel with gcc-3.3.
> It also compiles well (in about 12min).
> But I notice something strange: runing a top in another xterm, I notice
> that swap was well on but absolutly not used where usually my kernel
> (near about debian std cfg) used about 20Mb of swap (with 256Mb of ram).
> Is it a wanted behaviour? (config option?)

I don't think I can help you here, I hardly run out of physical memory
(I've 1GB RAM in my machine), but during my tests I was able to
deliberately force the machine to run out of memory and using swap.
I never see the kernel using swap on my machine at all, unless I really
want it to happen ;)

So swap for me works, but I hardly will ever have to come into a situation
where heavy use of swap space will be required (at least I hope so).

Max
