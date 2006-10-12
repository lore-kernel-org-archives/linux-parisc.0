From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Wed, 11 Oct 2006 19:04:26 -0600
Message-ID: <20061012010426.GA18624@colo.lackof.org>
References: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 11, 2006 at 10:48:56AM +0200, Joel Soete wrote:
> > > That said, there are no public doc of this IO stuff
> >
> > There is none for CCIO. And I no longer have access to those
> > documents (deleted them from my laptop/workstations).
> > You'd need access to U2/Uturn ERS via OSDL.
>
> Any links (I looking for in http://ftp.parisc-linux.org/docs/chips and more
> google search but no success?)

No links. OSDL has been talking with HP about NDA access to specific
HP docs for OSDL developers. CCIO docs could be added to that
list of docs if it exists anywhere. I believe PA8800 ERS was
a targeted document as well (for example).


> >
> > >       a io (page size) address as seems to say the value
> > >      ("CMD_TLB_PURGE | iovp") in ccio_clear_io_tlb()
> >
> > Offhand I'm not sure of the exact split but guess it's
> > lower 12 bits for command and upper 20 bits for IO Virtual Page
> > as used in ccio_clear_io_tlb().
> >
> mmm could it be the pb: the computed chainid_shift on my d380 is 19 (decimal)?
> 
> btw what's about the IOV page size used by sba (IOVP_SIZE i.e. PAGE_SIZE till
> now?)

sba and ccio are similar but not identical.
The intent for variable page sizes in SBA is so it can match
whatever page size the kernel is using.


> The question for ccio is: why using chainid_shift (by set io_chain_id_mask)
> different then IOVP_SHIFT, as ,as far as I understand, we manage only
> IPVP_SIZE page? (imho couls be what means "FIXME: Can we change byte_cnt to
> pages_mappged" of ccio_mark_invalid?)

Maybe look at how chainid_shift is initialized and that will make sense.
I'm not sure I understand your question otherwise.

> btw what is correct for you in this setup:
> WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift,
> &ioc->ioc_regs->io_chain_id_mask);
> 
> the name variable seems to said it should contains the mask correcponding to
> the chainid_shift i.e. imho:
> let say CHAINID_SIZE = (1UL << ioc->chainid_shift) and so
> &ioc->ioc_regs->io_chain_id_mask = (~(CHAINID_SIZE -1))

Uhm....sounds reasonable to me. All I know is I believe the existing
code use of chain_id is correct.

> Ah btw there wasn't any 'flush purges' action o do with ccio like in sba or
> only to be managed with fdc/sync?

No. Purging IO TLB entries is not like changing the IO Pdir entries.
Related but seperate activities.

> > You shouldn't need to change the uses of CMD_TLB_DIRECT_WRITE.
>
> but here it's a bit confusing: we are at the kernel startup and just init the
> ccio so afaik nothing yet in ccio tlb or at least we don't know what it
> contains

Exactly. We don't know what it contains. This makes sure we know.

>  and we are writing this CMD_TLB_DIRECT_WRITE for this iov page
> address (i << chainid_shift) for i = 1 to 256 (the 256 Uturn tlb entries).
> 
> That said (without doc), I wouldn't touch to this loop.

Good. :)

> May be a last q.

Maybe? :)

> in your code comment you spoke about spa_shift but I didn't find it anywhere
> else (neither in the code nor in iodc doc), any idea which symbol is related to?

It's obviously a stale comment and you might look at versions of the CCIO code
in the 2.4 source tree to find it.

I suspect it's chain_id_shift but am not sure.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
