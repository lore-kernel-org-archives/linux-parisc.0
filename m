From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.10-rc1-pa17 more BUS_IS_PHYS fixes
Date: Sun, 21 Nov 2004 14:32:50 -0700
Message-ID: <20041121213250.GB1477@colo.lackof.org>
References: <20041120234853.5544149406D@palinux.hppa>
	<20041121001718.GG11503@colo.lackof.org>
	<41A0C6C3.7090103@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41A0C6C3.7090103@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 21, 2004 at 04:48:03PM +0000, Joel Soete wrote:
> >I expect one more patch for ccio driver if/when someone is willing
> >to figure out one small problem. ccio_dma_supported() *only* supports
> >32-bit devices. CCIO should be able to support any device which supports
> >more bits than are needed to cover IO virtual address space. It should be
> >a fairly small project to compute/locate the IOVA space size and
> >then coding that up for ccio_dma_supported(). I'm happy to review
> >patches and printk output if someone does this.
>
> Sorry, I don't see yet how using structure device to determine the IOVA 
> space size of a dev :(
> and not yet where can I find a list of those dev. May be have you an idea 
> to guide me?

The ccio driver just guesses at a "reasonable" size for total IOVA
space. Ideally it would have something to do with which type of
devices were below it. But this is not the problem I talking about though.

The problem I describe above is what happens *after* the CCIO driver
has decided the size of the IOVA space. ccio_dma_support just need to
know what the IOVA size is so if a device that supports more or less than
32-bits gets the right answer back. Right now, it's hard coded to 32-bits.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
