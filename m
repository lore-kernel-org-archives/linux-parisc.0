From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 19:41:10 -0400
Message-ID: <20080528234110.GD30501@phobos.i.cabal.ca>
References: <20080528190946.GA30501@phobos.i.cabal.ca> <20080528200035.GB30501@phobos.i.cabal.ca> <119aab440805281555n7d16c1ccn4a2d73f267c3b686@mail.gmail.com> <20080528230025.GC30501@phobos.i.cabal.ca> <119aab440805281637x722fd461n335a49aaa41c8a2c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440805281637x722fd461n335a49aaa41c8a2c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 28, 2008 at 07:37:14PM -0400, Carlos O'Donell wrote:
> On Wed, May 28, 2008 at 7:00 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > Building the kernel without optimization is very tetchy... if you can
> > guess what passes to remove, I can try... one of the optimization
> > effects that must go is DCE though, otherwise we'll have undefined
> > references to things (ie: kmalloc_too_much in a switch that should have
> > been eliminated except the constant case.)
> 
> You *need* to build the kernel with -fno-dce and -fno-tree-dce?
> Are you working around another compiler bug?
> 
> Take a look at the attached scripts I use.
> 
> ./o2list.sh > o2list.txt
> ./permute-options.sh o2list.txt > run.sh
> chmod u+x
> run.sh
> 
> Normally I can simply run the results on a target and
> know which is good and which is bad. Unfortunately
> you have to link each into a kernel and try to boot.
> 

Other way around... we *need* dce (but apparnetly not on this file)
because of inline constructs like

	switch (sizeof(some constant)) {
	1:
		blah;
	default:
		some_undefined_reference();
	}

Ah well, anyway, it works built at -O0, and buggers up at -O1.

Want a copy of each of the .S?
