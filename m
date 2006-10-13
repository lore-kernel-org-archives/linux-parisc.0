From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Fri, 13 Oct 2006 10:56:50 +0000
Message-ID: <452F70F2.4020700@scarlet.be>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<20061012195503.GA15124@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061012195503.GA15124@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Thu, Oct 12, 2006 at 10:02:13AM +0200, Joel Soete wrote:
> ...
>> well according to the choice of a PAGE_SIZE, a IOVP_SIZE and the actual system
>> ramsize (imho badly named num_physpages?), you can setup the sba?
> 
> Is that a question or a statement?
yes,
> PAGE_SIZE is a compile time option.
as well as IOVP_SIZE.

I would just like to be sure, even if it's not translated the same way in C code, that the ccio statement:
	WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift,
                   &ioc->ioc_regs->io_chain_id_mask);

do the same job as sba statement:
         WRITE_REG(ioc->imask, ioc->ioc_hpa+IOC_IMASK);

i.e. seting up the ioc register containing the mask corresponding (one-to-one mapping) to the size of a ioc physical page; 
and by the means of this mask we set up inderectly the physical page size the ioc (respectilvely ccio and sba) will use to work?
(just my guessing because no docs)

> PA2.0 CPUs support sizes other than 4k.
> And I think it was Helge that started on enabling bigger
> page sizes but it's not working yet.
> 
Yes what I remember too

> ...
>> (is it only the number of io tlb entries?)
> 
> Off hand, I'm not sure. It's probably related though.
> 
>> My thought was very basic: imho vitualising actual adresses pages would just
>> be translation of adresses but the virtual page size should be the same as the
>> actual one?
> 
> "actual one"?
yes my mind is very ground basic and only what is 'physical' is actual to me (well near about, I never made the travel of an 
electron to verify the cut-up of the ram but as far as it behaves like foreseen I just have to accept it ;-) )

> We have RAM. The CPU TLB that organizes RAM into "pages" as the
> minimum granularity that the kernel manages permissions and use of RAM.
> The IO TLB doesn't have to use the same granularity as the kernel
> though it's easier (and probably faster in general) to do so.
> 
Ok so rephrasing the question: the ioc physical page size should be the same as the virtual page size managed by the related 
sg list driver?

> 
>> (and btw the ccio bc using actual pages'size in accordance with computed
>> chainid_shift (different then IOVP_SHIFT), ccio_[map, unmap]_single should
>> also use chainid_shift to compute chainid_size and chainid_mask to manage sg
>> list?)
> 
> Ah. chainid could have more to do with the number of TLB entries than
> the size of the pages. I'm not certain though.
> 
> grant
> 
> 
PS: those investigations to atempt to fix c110/d380 fs pb make me discover that this d380 have in fact 2 U2/UTurn (as well 
dicovered by linux kernel). But one this is specialy design to server only one hsc (aka gsc) io slot tagged TURBO ;-)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
