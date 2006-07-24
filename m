From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 09:51:37 -0500
Message-ID: <1153752697.1235.32.camel@mulgrave.il.steeleye.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153708426.1235.11.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-07-23 at 22:33 -0400, James Bottomley wrote:
> > Grant expressed worry that "Pattern 1" was indicative of a dma sync
> > problem with the network socket read.
> 
> I'm still dubious about this one ... even if we agree it's a D cache
> issue, it's definitely a D cache issue affecting program execution (i.e.
> function pointers or call indirection).  The data coming out of the
> network pipe for ssh never finds its way into the execution stream,
> which means it's unlikely to affect these areas.  Additionally, ssh has
> message integrity checks which fail noisily (i.e. the network data is
> verified against a secure hash before it's used).  So, if we had
> incoherent data from the pipe, I would exect to see periodic MIC
> failures, which we don't see.

Let me back up on this one.  I still don't think it's a DMA sync issue.
However, it could be a different D incoherency issue.  Because the linux
kernel operates with kernel to user aliases (i.e. the user address of a
page is rarely congruent to the kernel address of a page) it is possible
to generate D incoherency by missing a flush when a kernel page is
reclaimed (i.e. freed).

The scenario that resonates nicely with all this has to do with the
skbuff allocation and copying.  Because the network read path isn't zero
copy, we do intermediate copies into skbuff areas before eventually
sending the data to the user socket.  the idea is that the skbuff is
freed and then reallocated to the user process in the fault (this gives
us the necessary same physical index).  If the kernel address of the
skbuff were accidentally congruent to the fault address, we'd actually
see the skbuff data instead of the underlying page data if it weren't
flushed.  The problem, as usual, is that this isn't pa8800 specific ...

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
