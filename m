From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Fri, 13 Oct 2006 10:44:06 -0600
Message-ID: <20061013164406.GC13770@colo.lackof.org>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<20061012195503.GA15124@colo.lackof.org>
	<452F70F2.4020700@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <452F70F2.4020700@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 13, 2006 at 10:56:50AM +0000, Joel Soete wrote:
> 
> 
> Grant Grundler wrote:
> >On Thu, Oct 12, 2006 at 10:02:13AM +0200, Joel Soete wrote:
> >...
> >>well according to the choice of a PAGE_SIZE, a IOVP_SIZE and the actual 
> >>system
> >>ramsize (imho badly named num_physpages?), you can setup the sba?
> >
> >Is that a question or a statement?
> yes,

A correct answer here would be "question" or "statement".
Maybe you want to restate the question so it really looks like
a question.

> >PAGE_SIZE is a compile time option.
> as well as IOVP_SIZE.
> 
> I would just like to be sure, even if it's not translated the same way in C 
> code, that the ccio statement:
> 	WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift,
>                   &ioc->ioc_regs->io_chain_id_mask);
> 
> do the same job as sba statement:
>         WRITE_REG(ioc->imask, ioc->ioc_hpa+IOC_IMASK);
> 
> i.e. seting up the ioc register containing the mask corresponding 
> (one-to-one mapping) to the size of a ioc physical page; and by the means 
> of this mask we set up inderectly the physical page size the ioc 
> (respectilvely ccio and sba) will use to work?
> (just my guessing because no docs)

I think so but am not sure either.

> >Off hand, I'm not sure. It's probably related though.

Actually, it seems that the number of TLB entries is hardcoded
in the _MASK. ie 256 TLB entries:

	/* Uturn supports 256 TLB entries */
	#define CCIO_CHAINID_SHIFT      8
	#define CCIO_CHAINID_MASK       0xff

The "if 0" block above that suggests someone was expecting
the number of TLB entries to be different for different chips.
However, U2 and Uturn both seem to only support 256 entries.


> >We have RAM. The CPU TLB that organizes RAM into "pages" as the
> >minimum granularity that the kernel manages permissions and use of RAM.
> >The IO TLB doesn't have to use the same granularity as the kernel
> >though it's easier (and probably faster in general) to do so.
> >
> Ok so rephrasing the question: the ioc physical page size should be the 
> same as the virtual page size managed by the related sg list driver?

Yes. important is "should be". It doesn't have to be.

> >Ah. chainid could have more to do with the number of TLB entries than
> >the size of the pages. I'm not certain though.

I think the width of chainid_mask describes the number of TLB entries.
chainid_shift probably describes the IO TLB "page size".

And reading the comments in the code help too:
        ** Chainid is the upper most bits of an IOVP used to determine
        ** which TLB entry an IOVP will use.


> PS: those investigations to atempt to fix c110/d380 fs pb make me discover 
> that this d380 have in fact 2 U2/UTurn (as well dicovered by linux kernel). 
> But one this is specialy design to server only one hsc (aka gsc) io slot 
> tagged TURBO ;-)

Ok. But if there are problems only for SCSI and not for 100BT,
then it's either a SCSI driver problem or the ccio_map_sg() support
is broken (handles coalescing of blocks - disable coalescing
to test this out). 

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
