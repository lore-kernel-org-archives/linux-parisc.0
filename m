Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA17206
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 20:00:01 -0600
Date: Wed, 5 May 1999 19:43:53 -0700 (PDT)
From: Kumar <kumar@ix.netcom.com>
To: Alex deVries <adevries@redhat.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linker errors
In-Reply-To: <Pine.LNX.3.96.990505012802.22012I-100000@devserv.devel.redhat.com>
Message-ID: <Pine.LNX.3.96.990505193047.183B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



OK, I used milli.S from the source distribution.. and its linked properly.

I do get warning messages like -
Ignoing subspace declaration due to ELF bfd bugs, but it did link.

Loader is not ELF aware yet, though. Tried u_entry in mklifheader to
be after ELF header in vmlinux..did not work. 

					
Also the comment in linux/include/asm-parisc/pgtable.h is wrong.

/*
 * The Linux memory management assumes a three-level page table setup. On
 * the PARISC, we use that, but "fold" the mid level into the top-level page
 * table, so that we physically have the same two-level page table as the
 * PARISC mmu expects.
 */
 PARISC MMU does not enforce any structure on page tables. In particular, 
 page table/tables are not multi-level. PA depends on the format of TLB
 insert instructions. I guess all we are going to have is one big flat
 page dir in memory, which is nothing but a bigger TLB cache. Could
 someone with write access to CVS source base can correct this.

 						-pkd



On Wed, 5 May 1999, Alex deVries wrote:

> 
> On Tue, 4 May 1999, Kumar wrote:
> > I am getting following errors even from the latest binutils and
> > parisc-linux-gcc. Are there any special LDFLAGS that one needs to use ?
> > 						-pkd
> > 
> > parisc-linux-ld -L. -R 0x100000 -N -S rom_interface.o setup.o utils.o
> > strutils.o bcopy.o main.o io.o -l milli -o vmlinux
> > parisc-linux-ld: can not size stub section: Bad value
> > rom_interface.o: In function `cout_putc':
> > rom_interface.o($CODE$+0xe4): undefined reference to `$$dyncall'
> > rom_interface.o: In function `bootdev_sread':
> > rom_interface.o($CODE$+0xe0): undefined reference to `$$dyncall'
> > rom_interface.o: In function `pdc_call':
> > rom_interface.o($CODE$+0x118): undefined reference to `$$dyncall'
> > main.o: In function `parisc_init':
> > main.o($CODE$+0x208): undefined reference to `$$divU'
> > make: *** [vmlinux] Error 1
> > 
> 
> Hm.  I don't get this at all... it certainly links for me.  I do get a lot
> of errors with the linker itself, but nothing fatal.
> 
> Are you using the pre-built cross compilers? If so, which ones?
> 
> - Alex
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
> 
