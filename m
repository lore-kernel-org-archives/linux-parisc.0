From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Thu, 12 Oct 2006 13:55:03 -0600
Message-ID: <20061012195503.GA15124@colo.lackof.org>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 12, 2006 at 10:02:13AM +0200, Joel Soete wrote:
...
> well according to the choice of a PAGE_SIZE, a IOVP_SIZE and the actual system
> ramsize (imho badly named num_physpages?), you can setup the sba?

Is that a question or a statement?
PAGE_SIZE is a compile time option.
PA2.0 CPUs support sizes other than 4k.
And I think it was Helge that started on enabling bigger
page sizes but it's not working yet.

...
> (is it only the number of io tlb entries?)

Off hand, I'm not sure. It's probably related though.

> My thought was very basic: imho vitualising actual adresses pages would just
> be translation of adresses but the virtual page size should be the same as the
> actual one?

"actual one"?
We have RAM. The CPU TLB that organizes RAM into "pages" as the
minimum granularity that the kernel manages permissions and use of RAM.
The IO TLB doesn't have to use the same granularity as the kernel
though it's easier (and probably faster in general) to do so.


> (and btw the ccio bc using actual pages'size in accordance with computed
> chainid_shift (different then IOVP_SHIFT), ccio_[map, unmap]_single should
> also use chainid_shift to compute chainid_size and chainid_mask to manage sg
> list?)

Ah. chainid could have more to do with the number of TLB entries than
the size of the pages. I'm not certain though.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
