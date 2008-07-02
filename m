From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Tue, 1 Jul 2008 22:28:21 -0600
Message-ID: <20080702042821.GB19593@colo.lackof.org>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be> <20080628202347.GA23898@colo.lackof.org> <4866BA91.9040607@scarlet.be> <20080629205242.GA7629@colo.lackof.org> <486925D4.7090608@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <486925D4.7090608@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 30, 2008 at 06:28:36PM +0000, Joel Soete wrote:
...
> Taken also into account of David remarks, here is the latest stuff tested 
> with success:
>
>         __asm__ __volatile__ (
>         "lci    %%r0(%%sr1, %2), %0\n"
>         "\textru        %0,19,12,%0\n"
>         "\tdepw         %0,15,12,%1\n"
>         : "=r" (ci), "=r" (pa)
>         : "r" (vba)
>         );

So can you remind me (and Kyle) why this is better than what is
there now?

> Tx to all for kind comments, they learn me a lot ;-)

welcome! :)

grant
