Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 202FD487B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 21:33:43 -0700 (MST)
Date: Thu, 27 Nov 2003 04:33:40 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
In-Reply-To: <20031127042103.GC1321@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
 <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie> <20031127042103.GC1321@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 26 Nov 2003, Grant Grundler wrote:

> On Thu, Nov 27, 2003 at 03:07:18AM +0000, M. Grabert wrote:
>
> > However it appears that writing and reading from/to the harddisk slows
> > down the access time quite a bit (ie. streaming a 180kbit/s movie and
> > writing a file with 1000kbit/s makes the movie to appear/play jerky);
> > whereas multiple reads doesn't affect it (ie. streaming serveral movies at
> > a time with 180kbit/s each).
>
> DMA is probably not enabled. This means all data is "manually" (ie by
> the CPU) read or written to the IDE controller 16-bits at a time.
> With interrupts turned off, mind you.
>
> Enabling DMA would make a big difference in performance.

See the old thread:

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020851.html
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020886.html

I've tried to enable DMA and unmask interrupts, but obviously it doesn't
work; at least it doesn't make any difference in performance.

> > I've seen a config option 'DUMMY_CONSOLE' in .config, but I don't find
> > how to select it in 'make menuconfig' or any description in Documentation/.
> >
> > I have several machines that run headless - I use serial console then.
> > But I never had a situation where I didn't even have serial console ...
>
> yeah - the real problem is init sequence completely changed in 2.6 (vs 2.4).
> We haven't reworked all the same quirks from 2.4 into 2.6 yet.

So is there current a way to get 2.6 working *without* serial console or STI ?

Thanks,
  Max
