From: "rubisher" <rubisher@scarlet.be>
Subject: Re: Yet another ccio fix idea?
Date: Wed, 12 Mar 2008 10:16:29 +0100
Message-ID: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "James\.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete\.joel" <soete.joel@scarlet.be>,
	"grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"kyle" <kyle@parisc-linux.org>, "matthew" <matthew@wil.cx>,
	"rubisher" <rubisher@scarlet.be>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]))
> > 
> > Flushing pdir_ptr may or may not work depending on the cache line width
> > (pdr_ptr[7] is 28 bytes away, so if the line size is 16 it will fail;
> > although I think almost every machine with a ccio has a 32 byte or
> > higher cache line width).
> 
> Actually, pdr_ptr is a char *, so this is 7 bytes away.  However,
> I think you are correct in saying that pdr_ptr[7] needs to be flushed.
> 
> The same issue would appear to apply to the other flush in the file.
> 
> The cache line alignment of pdir's isn't immediately apparent to
> me.  If the pdir was defined as a two word array, it might span
> two lines.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
mmm follwing stuff shouldn't so be enough:
Index: b/drivers/parisc/ccio-dma.c
===================================================================
--- a/drivers/parisc/ccio-dma.c 2008-03-12 08:49:20.000000000 +0000
+++ b/drivers/parisc/ccio-dma.c 2008-03-12 08:50:54.000000000 +0000
@@ -624,7 +624,8 @@
        ** the real mode coherence index generation of U2, the PDIR entry
        ** must be flushed to memory to retain coherence."
        */
-       asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
+       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[1]));
+       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[0]));
        asm volatile("sync");
 }

@@ -695,7 +696,7 @@
                ** Hopefully someone figures out how to patch (NOP) the
                ** FDC/SYNC out at boot time.
                */
-               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+               asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]));

                iovp     += IOVP_SIZE;
                byte_cnt -= IOVP_SIZE;
=== <> ===

Specialy for the first hunk where pdir_ptr is a u64 *:
ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
                   unsigned long hints)

into which with temporary pa var (defined as an unsigned long)
        register unsigned long pa;

*pdir_ptr is changed like
        ((u32 *)pdir_ptr)[1] = (u32) pa;
[snip]
        ((u32 *)pdir_ptr)[0] = (u32) pa;

What would be the best way to works?

Tx,
    r.

PS: in this doc feb96a6.pdf (easy to find) it was said:
"[snip]
Entries in the PA 7200 and PA 8000 caches are stored in lines
of 32 bytes.
[snip]

Because one-word writes occur in the I/O system,
for registers, semaphores, or short DMA writes it was necessary that the I/O
adapter implement a one-line-deep cache to
buffer cache lines, so that these one-word writes could be executed by
performing a coherent read private transaction on
the Runway bus, obtaining the most recent copy of the cache line, modifying it
locally in cache, and finally writing the
modified line back to main memory. For the I/O adapter to support a cache on
the Runway bus, it has to have the ability to
compare processor-generated virtual address transactions with the address
contained in its cache to ensure that the
processors always receive the most up-to-date data.
[s
[snip]"

2 thinks:
    - it seems to confirm that cache line is well 32bytes wide ;-)

    - for 'one word writes...' how should it be implemented?
      It look like the sba_iommu driver:
      "READ_REG(ioc-ioc_ha_IOC_PCOM); /* flush purges */
      but without more detailed docs on U2/UTurn ccio, I don't know how to
      implement matter, sorry.

 

---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/

