From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Status update on NPTL
Date: Sat, 11 Jul 2009 16:46:25 -0400
Message-ID: <20090711204625.GA31925@bombadil.infradead.org>
References: <119aab440907110717q1c55d329jbdf17924e0929804@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907110717q1c55d329jbdf17924e0929804@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 11, 2009 at 10:17:14AM -0400, Carlos O'Donell wrote:
> I've been investigating the crashes, but because of problems with gdb
> and strace I've had to take it slow. Kyle, I have your recent strace
> patches in my queue to test. Thanks for that.
> 

Which ones? It would be good if some heavy debugger users could test the
changes in the tracehook branch with coredumps... I'll try to do a build
of strace using PTRACE_{GET,SET}REGS instead of PEEK & POKE for extra
testing there as well, but it seems to be working well enough for me.

> I've been building up a test case, and I can debug a simple nptl
> threaded application with gdb.
> 
> The crashes in xterm using the new nptl libraries appear to be the NSS
> modules (dynamically loaded modules).
> 
> I've augmented the testcase to use NSS, but I can still successfully
> debug an nptl threaded application that uses NSS.
> 
> I have a couple more ideas to test, but after that my next step is to
> rebuild xterm with debugging symbols and dig in to figure out exactly
> what's crashing.
> 

Cool. Congrats!

regards, Kyle
