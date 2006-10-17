From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Mon, 16 Oct 2006 23:59:23 -0600
Message-ID: <20061017055923.GA6055@colo.lackof.org>
References: <J788XR$E1A2FE043CF88207AEC13412E82258F2@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J788XR$E1A2FE043CF88207AEC13412E82258F2@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Oct 16, 2006 at 01:51:27PM +0200, Joel Soete wrote:
...
>     but it seems that at in the history num_physpages (now ram size in bytes)
>     was well the physical number of page:
...
>     nowaday num_physpages is bytes so the comparision is eronous?
>     (compare bytes against page number)

Where did you get the idea num_physpages is in bytes?

These two examples suggest it's counting PAGE_SIZE pages :

mm/slab.c:      if (num_physpages > (32 << 20) >> PAGE_SHIFT)
mm/swap.c:      unsigned long megs = num_physpages >> (20 - PAGE_SHIFT);


>     the same way in:
>     iov_order = get_order(iova_space_size << PAGE_SHIFT);
> 
>     iova_space_size << PAGE_SHIFT == iova_space_size * 2^PAGE_SHIFT
>                                   == iova_space_size * PAGE_SIZE
> 
>     made sense when iova_space_size was a number of pages,

Look at get_order() then you'll understand why the "<< PAGE_SHIFT".
iov_order is being set to log2(iova_space_size)+1.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
