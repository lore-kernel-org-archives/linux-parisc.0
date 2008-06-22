From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another inline asm worry: mtsp() macro (and may be other)?
Date: Sun, 22 Jun 2008 11:15:42 -0600
Message-ID: <20080622171542.GA31925@colo.lackof.org>
References: <K2PKFI$6B7F5B0E10C229208B934B9E4E289468@scarlet.be> <20080619161151.GB6049@colo.lackof.org> <485ABAFE.2010504@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>, kyle <kyle@mcmartin.ca>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <485ABAFE.2010504@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 19, 2008 at 08:01:02PM +0000, Joel Soete wrote:
...
>> We could. But I thought there are cases were we might want to DMA to/from
>> user space directly and that's why Space ID is a parameter.
>
> Ok but it was a BUG if temporary space reg is not 0, so???

It was a BUG in 2.4 kernels since 2.4 didn't have the VM support
to do DMA to/from user space.

I thought 2.6 kernels could DMA to/from user space (related to Direct IO).

> btw system seems to boot too with asm volatile("mtsp 
> %%r0,%%sr1":::"memory")
> may be the cpp can catch in the mtsp(gr, cr) macro if gr==0 then I can use 
> this insn if not the original macro???

Yes. I like willy's proposed patch for this.

thanks,
grant
