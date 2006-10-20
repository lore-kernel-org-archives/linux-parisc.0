From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Fri, 20 Oct 2006 17:18:28 +0000
Message-ID: <453904E4.60608@scarlet.be>
References: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
	<20061012010426.GA18624@colo.lackof.org>
	<4538BB5F.5040703@scarlet.be>
	<20061020155059.GB23094@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061020155059.GB23094@colo.lackof.org>
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
> On Fri, Oct 20, 2006 at 12:04:47PM +0000, Joel Soete wrote:
>> mmm offhand wasn't there limits in ccio page size like in ia64 sba comments:
>>> /*
>>> ** The zx1 IOC supports 4/8/16/64KB page sizes (see TCNFG register)
> 
> I don't remember.
> ia64 sba is the 3rd generation IO controller.
> U2 (ccio) is the first generation.
> Sorry, I'm not interested in comparing them.
> 
no pb,

>>> Uhm....sounds reasonable to me. All I know is I believe the existing
>>> code use of chain_id is correct.
>>>
>> Just come back here shortly: the computed values with my hw config (256Mb 
>> and 2 ccio) are
>>> Found U2 at 0xfff88000
>>> ccio_ioc_init() hpa 0x00008000 mem 256Mb IOV 128Mb (27 bits)
>>>  base 10740000
>>> ccio_ioc_init() res_size 0x1000
>>>  chainid_shift 0x13
>>>  chainid_mask 0x7f80000
> 
> This looks correct.
> 
>>> Found U2 at 0xfff8a000
>>> ccio_ioc_init() hpa 0x0000a000 mem 256Mb IOV 128Mb (27 bits)
>>>  base 10780000
>>> ccio_ioc_init() res_size 0x1000
>>>  chainid_shift 0x13
>>>  chainid_mask 0x7f80000
>> otoh, applying this other formula [io_chain_id_mask = (~(CHAINID_SIZE -1)); 
>> with CHAINID_SIZE = (1UL << ioc->chainid_shift)], I got:
>>>  chainid_mask 0xfff80000
> 
> This second chainid_mask is 13 bits wide.
mmm sorry how do you compute this wide value?

> Remember that the mask can only be 8 bits wide for ccio.
> 

Btw I just discover an interesting comment in rope.h
> /*
> ** IOC supports 4/8/16/64KB page sizes (see TCNFG register)
> ** It's safer (avoid memory corruption) to keep DMA page mappings
> ** equivalently sized to VM PAGE_SIZE.
> **
[snip]
> **
> ** PAGE_SIZE could be greater than IOVP_SIZE. But not the inverse.
> */

and specialy:
 > ** It's safer (avoid memory corruption) to keep DMA page mappings
 > ** equivalently sized to VM PAGE_SIZE.

which was related to the original question I didn't reach to explain better.

So even if I don't understand why, we have to limits the number of iotlb entries to 256 (without doc I just accept it).
but in term to 'avoid memory corruption' why don't we limit the iova_space_size to 256 * IOVP_SIZE?

Many thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
