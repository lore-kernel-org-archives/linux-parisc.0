From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [RFC][PATCH] Demultiplexing SIGTRAP signal
Date: Tue, 23 Sep 2008 13:28:12 +0200
Message-ID: <20080923112812.GL29021@elte.hu>
References: <200809221602.32616.srinivasa@in.ibm.com> <200809221841.27993.srinivasa@in.ibm.com> <20080922145404.GC27956@elte.hu> <200809231523.52802.srinivasa@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roland McGrath <roland@redhat.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, paulus@samba.org,
	linuxppc-dev@ozlabs.org, linux-parisc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>
To: Srinivasa Ds <srinivasa@in.ibm.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809231523.52802.srinivasa@in.ibm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Srinivasa Ds <srinivasa@in.ibm.com> wrote:

> On Monday 22 September 2008 20:24:04 Ingo Molnar wrote:
> > * Srinivasa Ds <srinivasa@in.ibm.com> wrote:
> > > --- linux-2.6.27-rc7.orig/arch/ia64/include/asm/siginfo.h
> > > +++ linux-2.6.27-rc7/arch/ia64/include/asm/siginfo.h
> >
> > please do not send patches that modify include/asm/ files, the
> > include/asm-x86/ file should be modified instead.
> >
> > (this problem will go away in v2.6.28 when we'll move include/asm-x86/
> > to arch/x86/include/)
> >
> 
> Ingo, Sorry if I have confused you. [...]

hah, indeed - i mis-read them as include/asm/.

> Currently a SIGTRAP can denote any one of below reasons.
> 	- Breakpoint hit
> 	- H/W debug register hit
> 	- Single step
> 	- Signal sent through kill() or rasie()
> 
> Architectures like powerpc/parisc provides infrastructure to 
> demultiplex SIGTRAP signal by passing down the information for 
> receiving SIGTRAP through si_code of siginfot_t structure. Here is an 
> attempt is generalise this infrastructure by extending it to x86 and 
> x86_64 archs.

applied to [the new topic] tip/core/signal, thanks Srinivasa! There are 
some other pending x86 signal changes already, so i based 
tip/core/signal on tip/x86/signal.

Roland, any opinion on this change?

	Ingo
