From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Wed, 11 Oct 2006 10:48:56 +0200
Message-ID: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: "grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Oct 09, 2006 at 11:41:11AM +0200, Joel Soete wrote:
> > Hello Grant,
> > 
> > I back port the sba sg list manager in ccio-dma on my d380 (not enoug=
h time to
> > test c110).
> ...
> 
> Sounds like you have some debugging to do still...
(why I mentioned progress and failures ;-) )

> I'll try to
> answer the questions below.
> 
> > That said, there are no public doc of this IO stuff
> 
> There is none for CCIO. And I no longer have access to those
> documents (deleted them from my laptop/workstations).
too bad ;_(

> You'd need access to U2/Uturn ERS via OSDL.
> 
Any links (I looking for in http://ftp.parisc-linux.org/docs/chips and mo=
re
google search but no success?)

> 
> > and so I didn't change those 2 hunks:
> > [snip]
> > static CCIO_INLINE void
> > ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)
> ...
> > ccio_ioc_init(struct ioc *ioc)
> ...
> > About which cames to me 2 questions:
> >    1/ what is supposed to contain an io_tlb entry:
> 
> You want to know the layout of the "ioc_command" register.
> It is a combination of iovp and command.
> 
> 
> >       a io (page size) address as seems to say the value
> >      ("CMD_TLB_PURGE | iovp") in ccio_clear_io_tlb()
> 
> Offhand I'm not sure of the exact split but guess it's
> lower 12 bits for command and upper 20 bits for IO Virtual Page
> as used in ccio_clear_io_tlb().
> 
mmm could it be the pb: the computed chainid_shift on my d380 is 19 (deci=
mal)?

btw what's about the IOV page size used by sba (IOVP_SIZE i.e. PAGE_SIZE =
till
now?)

The question for ccio is: why using chainid_shift (by set io_chain_id_mas=
k)
different then IOVP_SHIFT, as ,as far as I understand, we manage only
IPVP_SIZE page? (imho couls be what means "FIXME: Can we change byte_cnt =
to
pages_mappged" of ccio_mark_invalid?)

btw what is correct for you in this setup:
WRITE_U32(CCIO_CHAINID_MASK << ioc->chainid_shift,
&ioc->ioc_regs->io_chain_id_mask);

the name variable seems to said it should contains the mask correcponding=
 to
the chainid_shift i.e. imho:
let say CHAINID_SIZE =3D (1UL << ioc->chainid_shift) and so
&ioc->ioc_regs->io_chain_id_mask =3D (~(CHAINID_SIZE -1))



> >       or a memory page size should be splited in
> >       severall tlb entries per ioc->chainid_shift?
> 
> ccio_ioc_init is just clearing the entire IO TLB.
> We know there are only "1<<CCIO_CHAINID_SHIFT" IO TLB entries.
> See comments above where CCIO_CHAINID_SHIFT is defined.
> ccio_clear_io_tlb() is just purging all of them.
> 
ok.

Ah btw there wasn't any 'flush purges' action o do with ccio like in sba =
or
only to be managed with fdc/sync?

> >    2/ what is supposed to contain the ccio io_command register, I mea=
n that
> >       I don't understand what seems to me to be different io_command
> >       contents for CMD_TLB_DIRECT_WRITE or CMD_TLB_PURGE?
> 
> Generally we only need to use CMD_TLB_PURGE to avoid use of stale entri=
es.
no pb to understand it.

> You shouldn't need to change the uses of CMD_TLB_DIRECT_WRITE.
> 
but here it's a bit confusing: we are at the kernel startup and just init=
 the
ccio so afaik nothing yet in ccio tlb or at least we don't know what it
contains and we are writing this CMD_TLB_DIRECT_WRITE for this iov page
address (i << chainid_shift) for i =3D 1 to 256 (the 256 Uturn tlb entrie=
s).

That said (without doc), I wouldn't touch to this loop.

> > If you still have (or access to) this internal doc, it would be great=
 if you
> > could find some time to explain me those stuff.
> 
> Sorry - I don't.
> 
No pb, that already helpfull.

May be a last q.

in your code comment you spoke about spa_shift but I didn't find it anywh=
ere
else (neither in the code nor in iodc doc), any idea which symbol is rela=
ted to?

> Hope that helps,

Yes, thanks a lot,
   Joel
> grant
> 
> =0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez =
aujourd'hui Scarlet One grace a un client existant de Scarlet, vous recev=
ez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http=
://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
