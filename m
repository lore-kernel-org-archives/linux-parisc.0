Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel 2.4.17-32-smp problem 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sun, 24 Mar 2002 09:33:16 PST." <Pine.LNX.4.33L2.0203240928550.13376-100000@eiger.apptechsys.com>
References: <Pine.LNX.4.33L2.0203240928550.13376-100000@eiger.apptechsys.com> 
Date: Sun, 24 Mar 2002 20:58:48 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020325035848.477324855@dsl2.external.hp.com>
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
> I was running 2.4.17-32-smp before.  It just updated a debian package of
> the same kernel version.  I had no problems with the old one, other than
> the fact that it seems to ignore cpu0.  All processor time goes to cpu1
> and cpu0 gets a ton of idle.

hmm..that fits with the "top" report of 50% idle that I've seen.
We've already got a bug report on this, iirc.

Your observation suggest something wrong with either process scheduling
or process accounting.

And I hope CPU0 isn't completely idle, look at /proc/interrupts.
I know interrupt distribution works.

> When the box crashed both times, I was checking out the cvs tree :)

network/IO intensive load - lots of interrupts...hmm.

grant
