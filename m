Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA21282
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 13:57:57 -0700
Message-Id: <200003011924.LAA09530@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Wed, 01 Mar 2000 16:50:37 PST."
             <20000301165037.U812@abacus.local>
Date: Wed, 01 Mar 2000 11:24:44 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] sba_io_pdir_entry()
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> The documentation definitely isn't very good, so I would propose to write
> to the list whenever you need an asm statements and aren't sure how
> exactly to do it (most likely you don't even need the asm statement).

Ok. Let's try it.

I'm working on the code which generates/writes the I/O Pdir entry
for the "sba" I/O Pdir. It will be called for every physical page
which needs to be mapped for DMA.

Here are some constraints:
o I'd like to have as much of this in 'C' as possible without
  compromising performance.
o This code will probably only be called from two (maybe four)
  locations that are variants of the performance path.
o Will only be executed on PA2.0 processor - could be running
  in narrow or wide mode (ie 32 or 64-bit kernel binary).

I haven't read the "info gcc" stuff yet.
But here's what I've cooked up so far:

/*
* SBA Mapping Routine
*
* Given a virtual address (vba, arg2) and space id, (sid, arg1)
* init_io_pdir_entry() loads the I/O PDIR entry pointed to by
* pdir_ptr (arg0). Each IO Pdir entry consists of 8 bytes as
* shown below (MSB == bit 0):
*
*  0                    19                                 51   55       63
* +-+---------------------+----------------------------------+----+--------+
* |V|        U            |            PPN[43:12]            | U  |   VI   |
* +-+---------------------+----------------------------------+----+--------+
*
*  V  == Valid Bit
*  U  == Unused
* PPN == Physical Page Number
* VI  == Virtual Index
*
* The physical address fields are filled with the results of the LPA
* instruction.  The virtual index field is filled with the results of
* of the LCI (Load Coherence Index) instruction.  The 8 bits used for
* the virtual index are bits 12:19 of the value returned by LCI.
*
* We need to pre-swap the bytes since PCX-W is Big Endian.
*/

void __inline__ sba_io_pdir_entry(u64_t *pdir_ptr, space_t sid, void *vba)
{
        register u64_t tmp;

        mtsp(sid,1);
        __asm__("lpa (%sr1,%1),%0"      /* Load the physical address */
                : "=r" (tmp) : "r" (vba));

        tmp &= ~0xfffUL;                /* clear page offset bits */

        __asm__( "depdi 0x1,0,1,%0"             /* Set enable bit */
                "lci (%sr1, %1),%r29\n\t"       /* Load coherent index */
                "extru %r29,19,8,%r29\n\t"      /* right shift coherent index */
                "depd %r29,63,8,%0"             /* insert coherent index */

                : "=&r" (tmp)   /* output */
                : "r" (vba) /* input */
                : "r29" /* side effects? */
                )

        *pdir_ptr = cpu_to_le64(tmp);   /* swap and store into I/O Pdir */
}


Side note: should "space_t" be "unsigned long" or does parisc-linux
define something already for space ID's?

I would prefer not to assume space ID is always zero or something else
hard coded.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
