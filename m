From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Tue, 10 Oct 2006 16:08:41 -0600
Message-ID: <20061010220841.GG12490@colo.lackof.org>
References: <J6V48N$07BEC56C541729714304848986C290A3@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J6V48N$07BEC56C541729714304848986C290A3@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Oct 09, 2006 at 11:41:11AM +0200, Joel Soete wrote:
> Hello Grant,
> 
> I back port the sba sg list manager in ccio-dma on my d380 (not enough time to
> test c110).
...

Sounds like you have some debugging to do still...I'll try to
answer the questions below.

> That said, there are no public doc of this IO stuff

There is none for CCIO. And I no longer have access to those
documents (deleted them from my laptop/workstations).
You'd need access to U2/Uturn ERS via OSDL.


> and so I didn't change those 2 hunks:
> [snip]
> static CCIO_INLINE void
> ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)
...
> ccio_ioc_init(struct ioc *ioc)
...
> About which cames to me 2 questions:
>    1/ what is supposed to contain an io_tlb entry:

You want to know the layout of the "ioc_command" register.
It is a combination of iovp and command.


>       a io (page size) address as seems to say the value
>      ("CMD_TLB_PURGE | iovp") in ccio_clear_io_tlb()

Offhand I'm not sure of the exact split but guess it's
lower 12 bits for command and upper 20 bits for IO Virtual Page
as used in ccio_clear_io_tlb().

>       or a memory page size should be splited in
>       severall tlb entries per ioc->chainid_shift?

ccio_ioc_init is just clearing the entire IO TLB.
We know there are only "1<<CCIO_CHAINID_SHIFT" IO TLB entries.
See comments above where CCIO_CHAINID_SHIFT is defined.
ccio_clear_io_tlb() is just purging all of them.

>    2/ what is supposed to contain the ccio io_command register, I mean that
>       I don't understand what seems to me to be different io_command
>       contents for CMD_TLB_DIRECT_WRITE or CMD_TLB_PURGE?

Generally we only need to use CMD_TLB_PURGE to avoid use of stale entries.
You shouldn't need to change the uses of CMD_TLB_DIRECT_WRITE.

> If you still have (or access to) this internal doc, it would be great if you
> could find some time to explain me those stuff.

Sorry - I don't.

Hope that helps,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
