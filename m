Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61125482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 08:54:30 -0700 (MST)
Date: Thu, 30 Jan 2003 07:34:52 -0800
From: Randolph Chung <tausq@debian.org>
To: Michael Wood <mwood@its.uct.ac.za>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030130153452.GJ11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030126044656.GB6057@dsl2.external.hp.com> <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca> <20030127072615.GF8487@tausq.org> <20030128073101.GD20940@tausq.org> <20030128074607.GE20940@tausq.org> <20030130153832.GA12052@marmite.its.uct.ac.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030130153832.GA12052@marmite.its.uct.ac.za>
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

> Since you seem to have found the problem, this is probably not relevant,
> but I found this on Kernel Traffic:
> 
> 	Alan remarked, "2.5.x crashes erratically and randomly under
> 	high tty/pty load.  At the moment I'm assuming this is the tty
> 	code. That means we can't decide not to fix it since its already
> 	fatally broken." Close by, Linus Torvalds said he didn't think
> 	the TTY code was in such bad shape. He guessed there were just a
> 	few locking problems that had crept in, coupled with the
> 	preemption patches' tendency to expose existing locking bugs.
> 
> It sounds vaguely related, except maybe for the "high load" bit.

i think this is a completely different problem. the one Grant and I
found is very parisc and compiler specific.

randolph
