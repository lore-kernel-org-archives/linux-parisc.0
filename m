From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] cacheline size and IPI
Date: Tue, 22 Aug 2006 14:58:29 -0500
Message-ID: <200608221458.29491.mszick@morethan.org>
References: <J4EPT2$29A32450E1241FA2763D117BC258E270@scarlet.be>
	<20060822161200.GC20945@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060822161200.GC20945@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue August 22 2006 11:12, Grant Grundler wrote:
> On Tue, Aug 22, 2006 at 06:00:38PM +0200, Joel Soete wrote:
> > > No it can't. The CPU and memory controller have to agree on one size
> > > for any given implementation. The IOMMU has to use this cacheline size
> > > as well.
> > >
> > I doubt it could be important but is there a way to know the size of the
> > cacheline 'negociated' between cpu and mc?
> 
> The cacheline size is decided by the HW designers.
> Not negotiated at run time.
> 

Joel,

If you look at the information available with the pdc_cache calls, it
should contain the cache line size.

The people in the hardware design department might not actually have
built it that way on a particular machine, but it _will_ work the 
same as what is reported.

> > PS: I forgot to ask: can you tell me in very short what IPI means in the linux
> > kernel (iirc also related to spinlock management)?
> 
> Inter Processor Interrupt.
> When one CPU wants to get the attention of another CPU and ask it
> to do some house keeping work.
> 

Which is why a processor busy waiting for a lock must run with the
interrupts enabled on pa-risc.

Mike
> grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
