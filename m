From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] CCIO dma io_command and related io_tlb format
	questions.
Date: Mon,  9 Oct 2006 11:41:11 +0200
Message-ID: <J6V48N$07BEC56C541729714304848986C290A3@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@parisc-linux.org>
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

Hello Grant,

I back port the sba sg list manager in ccio-dma on my d380 (not enough ti=
me to
test c110).

On one hand, it seems to improve a bit ncr53c720 behaviour: tar/rm loop t=
est
run longer (at least 2h in place of 5/10 min)

Otoh no change (may be even worse) for ncr53c710 and break secondary nic =
(the
setup of this card make panicing the system?)

That said, there are no public doc of this IO stuff and so I didn't chang=
e
those 2 hunks:
[snip]
static CCIO_INLINE void
ccio_clear_io_tlb(struct ioc *ioc, dma_addr_t iovp, size_t byte_cnt)
{
        u32 chain_size =3D 1 << ioc->chainid_shift;

        iovp &=3D IOVP_MASK;      /* clear offset bits, just want pagenum=
 */
        byte_cnt +=3D chain_size;

        while(byte_cnt > chain_size) {
                WRITE_U32(CMD_TLB_PURGE | iovp, &ioc->ioc_regs->io_comman=
d);   
                iovp +=3D chain_size;
                byte_cnt -=3D chain_size;
        }
}

[snip]

static void
ccio_ioc_init(struct ioc *ioc)
{
[snip]

        /*
        ** Initialize all I/O TLB entries to 0 (Valid bit off).
        */
        WRITE_U32(0, &ioc->ioc_regs->io_tlb_entry_m);
        WRITE_U32(0, &ioc->ioc_regs->io_tlb_entry_l);

        for(i =3D 1 << CCIO_CHAINID_SHIFT; i ; i--) {
                WRITE_U32((CMD_TLB_DIRECT_WRITE | (i << ioc->chainid_shif=
t)),
                          &ioc->ioc_regs->io_command);
        } 
}
...

About which cames to me 2 questions:
   1/ what is supposed to contain an io_tlb entry: a io (page size) addre=
ss
      as seems to say the value ("CMD_TLB_PURGE | iovp")
      in ccio_clear_io_tlb() or a memory page size should be splited in
      severall tlb entries per ioc->chainid_shift?

   2/ what is supposed to contain the ccio io_command register, I mean th=
at 
      I don't understand what seems to me to be different io_command
      contents for CMD_TLB_DIRECT_WRITE or CMD_TLB_PURGE?

If you still have (or access to) this internal doc, it would be great if =
you
could find some time to explain me those stuff.

TIA,
    Joel
=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
