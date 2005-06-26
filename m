From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: ccio-dma more debuging
Date: Sun, 26 Jun 2005 14:27:34 -0600
Message-ID: <20050626202734.GA3338@colo.lackof.org>
References: <42933E2F0000A9DC@mail-1-bnl.tiscali.it>
	<20050621171823.GB16368@colo.lackof.org>
	<42BD9D2D.4030605@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BD9D2D.4030605@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 25, 2005 at 06:06:37PM +0000, Joel Soete wrote:
> >It's easier to review if you submit those seperately.
> >Also because I probably wouldn't apply the white space changes. :^)
> >
> >
> >>-       BUG_ON((pages_needed * IOVP_SIZE) > DMA_CHUNK_SIZE);
> >>+       BUG_ON(pages_needed > BITS_PER_LONG);
> >
> >
> >This BUG_ON exists because I was lazy. Alex Williamson added support
> >for "unlimited" sized requests to arch/ia64/hp/common/sba_iommu.c.
> >We might be able to add that to our iommu-helpers.h file.
> >
> mmm is there a viewcvs for ia64 at some url?

Yes, but I expect it in our CVS 2.6.12 source tree.

> (I tried a diff between parisc and ia64 but to big to let me understand 
> what patch was?)

Right - that won't work. You'll have to dredge up the oldmail
were Alex proposes the patch. That should be part of the
ia64-linux mail in ia64-linux mail archives

> >Just ditch __FUNCTION__ and hard code the string in the panic message.
>
> Is there some pb I missed with __FUNCTION__?

Not really - but embedding it directly in the string just makes
less work for gcc.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
