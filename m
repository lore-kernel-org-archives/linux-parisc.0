Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA23758
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 18:07:57 -0700
Date: Wed, 1 Mar 2000 21:07:45 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: sba_io_pdir_entry()
Message-ID: <20000301210745.W812@abacus.local>
References: <20000301165037.U812@abacus.local> <200003011924.LAA09530@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003011924.LAA09530@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Mar 01, 2000 at 11:24:44AM -0800
List-ID: <linux-parisc.vger.kernel.org>

> /*
> * SBA Mapping Routine
> *
> * Given a virtual address (vba, arg2) and space id, (sid, arg1)
> * init_io_pdir_entry() loads the I/O PDIR entry pointed to by
> * pdir_ptr (arg0). Each IO Pdir entry consists of 8 bytes as
> * shown below (MSB == bit 0):
> *
> *  0                    19                                 51   55       63
> * +-+---------------------+----------------------------------+----+--------+
> * |V|        U            |            PPN[43:12]            | U  |   VI   |
> * +-+---------------------+----------------------------------+----+--------+
> *
> *  V  == Valid Bit
> *  U  == Unused
> * PPN == Physical Page Number
> * VI  == Virtual Index
> *
> * The physical address fields are filled with the results of the LPA
> * instruction.  The virtual index field is filled with the results of
> * of the LCI (Load Coherence Index) instruction.  The 8 bits used for
> * the virtual index are bits 12:19 of the value returned by LCI.
> *
> * We need to pre-swap the bytes since PCX-W is Big Endian.
> */
> 
> void __inline__ sba_io_pdir_entry(u64_t *pdir_ptr, space_t sid, void *vba)
> {
>         register u64_t tmp;
		  ^^^^^^
u64, not u64_t, please

>         mtsp(sid,1);

>         __asm__("lpa (%sr1,%1),%0"      /* Load the physical address */
>                 : "=r" (tmp) : "r" (vba));
> 
>         tmp &= ~0xfffUL;                /* clear page offset bits */
> 
>         __asm__( "depdi 0x1,0,1,%0"             /* Set enable bit */
>                 "lci (%sr1, %1),%r29\n\t"       /* Load coherent index */
>                 "extru %r29,19,8,%r29\n\t"      /* right shift coherent index */
>                 "depd %r29,63,8,%0"             /* insert coherent index */
> 
>                 : "=&r" (tmp)   /* output */
>                 : "r" (vba) /* input */
>                 : "r29" /* side effects? */
>                 )

asm("lpa (%sr1, %1), %0", "=r" (pa), "r" (vba));
asm("lci (%sr1, %1), %0", "=r" (ci), "r" (vba));

pa &= ~4095;
ci = (ci >> 10) & 255;

tmp = (ci<<foo) | (pa<<bar);

sounds better to me.

> Side note: should "space_t" be "unsigned long" or does parisc-linux
> define something already for space ID's?

unsigned long should be fine.

> I would prefer not to assume space ID is always zero or something else
> hard coded.

We want to map IO space to userspace, so the version above is all right
(it's a bit careful, but it shouldn't waste any performance).

	Philipp
