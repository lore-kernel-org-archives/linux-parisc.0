Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Duraid Madina" <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430 
In-Reply-To: Message from "Duraid Madina" <duraid@fl.net.au>
   of "Fri, 08 Mar 2002 14:51:03 +1100." <000301c1c654$78ae35c0$022a17ac@simplex>
References: <000301c1c654$78ae35c0$022a17ac@simplex> 
Date: Sat, 09 Mar 2002 01:28:10 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020309082810.CD8FF4835@dsl2.external.hp.com>
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

"Duraid Madina" wrote:
> ...and Intel gigabit ethernet NICs (based on the 82554 chip).

I've tested the e1000 (4.0.24-k1, iirc) driver on HP's "2cd generation
Intel (r) Itanium (tm)" systems and it basically works. Based on
this, I would expect this e1000 driver to work on A500-like systems.
(ie rp24xx boxes). Someday, if i get the itch, I'll plug one into
my a500 and try it.

and later:
> A computational physics code. Ideally I would run it in 100s of GB of
> RAM. About two months of pain went into making it work (reasonably
> efficiently, in theory at least) in 100s of GB of swap.

The approach seems really odd - you are looking at 64-bit userspace so
you can *swap* large amounts of virtual memory in/out. If you expected
to be IO bound, tuning the app to know more about IO (instead of
swapping) makes more sense.

Have you tried begging, trading, or buying some cycles on a Superdome
with some 100GBs of RAM instead of waiting for weeks to see your jobs
run to completion?

my $0.02,
grant
