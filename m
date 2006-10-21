From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 21 Oct 2006 17:17:46 +0000
Message-ID: <453A563A.9050704@scarlet.be>
References: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
	<20061012010426.GA18624@colo.lackof.org>
	<4538BB5F.5040703@scarlet.be>
	<20061020155059.GB23094@colo.lackof.org>
	<453904E4.60608@scarlet.be>
	<20061021061944.GA24732@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061021061944.GA24732@colo.lackof.org>
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
> On Fri, Oct 20, 2006 at 05:18:28PM +0000, Joel Soete wrote:
>>>>> chainid_mask 0xfff80000
>>> This second chainid_mask is 13 bits wide.
>> mmm sorry how do you compute this wide value?
> 
> Count the number of contiguous bits set to 1.
> bit 31 to bit 19 is 13 bits.
> 
Ah thanks (one more stuff in my dico ;-) )

>> Btw I just discover an interesting comment in rope.h
>>> /*
>>> ** IOC supports 4/8/16/64KB page sizes (see TCNFG register)
>>> ** It's safer (avoid memory corruption) to keep DMA page mappings
>>> ** equivalently sized to VM PAGE_SIZE.
>>> **
>> [snip]
>>> **
>>> ** PAGE_SIZE could be greater than IOVP_SIZE. But not the inverse.
>>> */
>> and specialy:
>>> ** It's safer (avoid memory corruption) to keep DMA page mappings
>>> ** equivalently sized to VM PAGE_SIZE.
>> which was related to the original question I didn't reach to explain better.
> 
> The "avoid memory corruption" refers to the fact the we are likely
> to map *more* address space than the device actually will DMA to.
> If the device is doing DMA to 4K and we map 64k, than means there
> is 60k more DMA address space the device can write to than it needs
> permission to.
Exactely my understanding ...

> The trade-off is between efficiency in creating
> DMA mappings (reducing the number of mappings) and how much
> address space we actually use.
>
... too ;-)

>> So even if I don't understand why, we have to limits the number of iotlb 
>> entries to 256 (without doc I just accept it).
> 
> No. The number of IO TLB entries is implemented in HW.
> The SW (e.g. ccio) only controls the number IO Pdir entries and
> thus the total amount to DMA that can be mapped at the one time.
> 
> The size of a page (as seen from IO) is just much simpler to manage
> when it's the same size of a page as seen by the CPU.
> I need a really good reason to make things more complex.
> And in this case I don't have a reason. I just want to enable
> someone else to experiment if they have time or reason to do so.
> 
I didn't mean to make more complex?

But the confusion may be came that I took a comment in sba code to explain somthing which weems to me strange in ccio code?

Or my english is to bad or I missed the meaning of this hunk:

	iova_space_size = (num_physpages << PAGE_SHIFT) / count_parisc_driver(&ccio_driver)

   means simply that we equaly balance all my ram between ioc then
   [in my config 256MB / 2 ccio bc == 128MB]

	(assuming it >= 1MB and < then 1GB)

	iov_order = get_order(iova_space_size << PAGE_SHIFT);

         /* iova_space_size is now bytes, not pages */
         iova_space_size = 1 << (iov_order + PAGE_SHIFT);

   we compute just a new value so that  "iova space is log2() in size."
   [in my config 128MB]

   then we compute a pdir_size, reserve pdir_base and the same for res_size and res_map according to IOVP_SIZE.

   and finaly what I certainly missunderstand:

	ioc->chainid_shift = get_order(iova_space_size) + PAGE_SHIFT - CCIO_CHAINID_SHIFT;

   i.e. if I translate in terms of power 2:
	chain_size = iova_space_size / 256 [ in my config 128Mb / 256 = 512k]

   and my understanding of seting io_chain_id_mask = CCIO_MASK << chainid_shift
   was to configure ccio to use chain_size page size (and not IOVP_SIZE because it would resulting to much io tlb entry)?

   what seems to be confirmed elsewhere by:

> static CCIO_INLINE void
> ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)
> {
>         u32 chain_size = 1 << ioc->chainid_shift;
> 
>         iovp &= IOVP_MASK;      /* clear offset bits, just want pagenum */
>         byte_cnt += chain_size;
> 
>         while(byte_cnt > chain_size) {
>                 WRITE_U32(CMD_TLB_PURGE | iovp, &ioc->ioc_regs->io_command);
>                 iovp += chain_size;
>                 byte_cnt -= chain_size;
>         }
> }

and nowhere else chainid_shift is used in sg list managment, only IOVP_[SHIFT,SIZE].

so either somewhere I learn sg manager that actual iovp became 512k (but seems to be break 2 sba advises: iovp_shift > 
PAGE_SIZE, DMA page mappings not equivalently sized to VM PAGE_SIZE)
or i save IOVP_SIZE (my preference) but recompute iova_space_size and all related values to setup ccio?

Or I just have to wait public ccio doc to better understand how this hw works ;-)

Thanks for your patience,
	Joel

> grant
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
