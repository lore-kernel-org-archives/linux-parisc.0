Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D7DC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 08:38:43 -0700 (MST)
Date: Thu, 30 Jan 2003 17:38:32 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030130153832.GA12052@marmite.its.uct.ac.za>
References: <20030126044656.GB6057@dsl2.external.hp.com> <200301260509.h0Q59ntl001762@hiauly1.hia.nrc.ca> <20030127072615.GF8487@tausq.org> <20030128073101.GD20940@tausq.org> <20030128074607.GE20940@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030128074607.GE20940@tausq.org>
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

On Mon, Jan 27, 2003 at 11:46:07PM -0800, Randolph Chung wrote:
> In reference to a message from Randolph Chung, dated Jan 27:
> > > well.... Grant and I did some more debugging on this.... here's what
> > > we've tried so far:
> > 
> > ok, here's what's happening apparently.... (with many thanks to Grant 
> > for a sharp eye :)
> 
> there's a temporary workaround in cvs now (2.4.20-pa23). For people
> who have seen the crash with gcc-3.2, please give it a try and let us 
> know how it goes.
[snip]

Since you seem to have found the problem, this is probably not relevant,
but I found this on Kernel Traffic:

	Alan remarked, "2.5.x crashes erratically and randomly under
	high tty/pty load.  At the moment I'm assuming this is the tty
	code. That means we can't decide not to fix it since its already
	fatally broken." Close by, Linus Torvalds said he didn't think
	the TTY code was in such bad shape. He guessed there were just a
	few locking problems that had crept in, coupled with the
	preemption patches' tendency to expose existing locking bugs.

It sounds vaguely related, except maybe for the "high load" bit.

-- 
Michael Wood <mwood@its.uct.ac.za>
