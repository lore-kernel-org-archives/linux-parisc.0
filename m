From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git patches] parisc for 2.6.32
Date: Tue, 6 Oct 2009 13:52:35 -0400
Message-ID: <20091006175235.GA11702@bombadil.infradead.org>
References: <20091006172602.GA1924@hera.kernel.org> <alpine.LFD.2.01.0910061035050.3432@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932836AbZJFRxR@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.01.0910061035050.3432@localhost.localdomain>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 06, 2009 at 10:40:10AM -0700, Linus Torvalds wrote:
> 
> 
> On Tue, 6 Oct 2009, Kyle McMartin wrote:
> <
> > Mostly fixes, except for the tracehook stuff...
> 
> I don't see how this can be fixes, since I can't recall any parisc pulls 
> during the merge window.
> 
> Yes, there have been parisc changes, but they've all come in through 
> commits that either were global and people also fixed up parisc while at 
> it (eg things like "fcntl: add F_[SG]ETOWN_EX"), or they have been build 
> cleanups where you were cc'd but apparently never even bothered to ack the 
> change.
> 

Christoph Hellwig (1):
      parisc: convert to asm-generic/hardirq.h

Jaswinder Singh Rajput (1):
      parisc: includecheck fix: signal.c

James Bottomley (1):
      parisc: add me to Maintainers

- These could wait.

Helge Deller (3):
      parisc: rename parisc's vmalloc_start to parisc_vmalloc_start
      parisc: Fix linker script breakage.
      agp: parisc-agp.c - use correct page_mask function

- 3 build fixes (the vmalloc one is a warning because of a name
  collision.)

Julia Lawall (1):
      parisc: correct use of SHF_ALLOC

- Correctness fix (the two symbols have identical values, but still.)

Kyle McMartin (7):
      parisc: tracehook_report_syscall
      parisc: tracehook_signal_handler
      parisc: add missing TI_TASK macro in syscall.S
      parisc: split syscall_trace into two halves
      parisc: stop using task->ptrace for {single,block}step flags
      parisc: add skeleton syscall.h
      parisc: HAVE_ARCH_TRACEHOOK

- Fine, I can drop these until .33

Tim Abbott (1):
      parisc: Make THREAD_SIZE available to assembly files and linker
scripts.

- Build fix.

I mean, take them, or don't. I'm not going to lose any sleep over it. I
do this on a volunteer basis when I have free time between work and
school... 

regards, Kyle
