From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] cacheline size and IPI
Date: Tue, 22 Aug 2006 10:12:00 -0600
Message-ID: <20060822161200.GC20945@colo.lackof.org>
References: <J4EPT2$29A32450E1241FA2763D117BC258E270@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J4EPT2$29A32450E1241FA2763D117BC258E270@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 22, 2006 at 06:00:38PM +0200, Joel Soete wrote:
> > No it can't. The CPU and memory controller have to agree on one size
> > for any given implementation. The IOMMU has to use this cacheline size
> > as well.
> >
> I doubt it could be important but is there a way to know the size of the
> cacheline 'negociated' between cpu and mc?

The cacheline size is decided by the HW designers.
Not negotiated at run time.

> PS: I forgot to ask: can you tell me in very short what IPI means in the linux
> kernel (iirc also related to spinlock management)?

Inter Processor Interrupt.
When one CPU wants to get the attention of another CPU and ask it
to do some house keeping work.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
