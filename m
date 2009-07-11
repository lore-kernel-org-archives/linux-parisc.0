From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Status update on NPTL
Date: Sat, 11 Jul 2009 17:12:12 -0400
Message-ID: <20090711211211.GB31925@bombadil.infradead.org>
References: <119aab440907110717q1c55d329jbdf17924e0929804@mail.gmail.com> <20090711204625.GA31925@bombadil.infradead.org> <119aab440907111406g6ac13645h6c9fc2174cc19ad2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440907111406g6ac13645h6c9fc2174cc19ad2@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 11, 2009 at 05:06:52PM -0400, Carlos O'Donell wrote:
> On Sat, Jul 11, 2009 at 4:46 PM, Kyle McMartin<kyle@mcmartin.ca> wrote:
> > On Sat, Jul 11, 2009 at 10:17:14AM -0400, Carlos O'Donell wrote:
> >> I've been investigating the crashes, but because of problems with gdb
> >> and strace I've had to take it slow. Kyle, I have your recent strace
> >> patches in my queue to test. Thanks for that.
> >>
> >
> > Which ones? It would be good if some heavy debugger users could test the
> > changes in the tracehook branch with coredumps... I'll try to do a build
> > of strace using PTRACE_{GET,SET}REGS instead of PEEK & POKE for extra
> > testing there as well, but it seems to be working well enough for me.
> 
> If I understand correctly you added PTRACE_GETREGS and PTRACE_SETREGS
> with this patch:
> http://permalink.gmane.org/gmane.linux.ports.parisc/1882
> 
> Then you posted a patch to strace to use PTRACE_GETREGS and
> PTRACE_SETREGS with this patch:
> http://www.dailykos.com/storyonly/2009/7/10/752179/-What-staring-at-an-ass-really-looks-like
> 
> Is my understanding correct? I would need a kernel patch, an strace
> patch, and then strace would be using PTRACE_GETREGS and
> PTRACE_SETREGS?
> 
> How is the debugger involved in this?
> 

I haven't figured out how to make gdb use getregs/setregs yet. But if
coredumps continue to work, then the backend regset code is working.

Yeah, those patches should enable it for you. I forgot I posted the
strace ones.

regards, Kyle
