From: rubisher <rubisher@scarlet.be>
Subject: dma_addr_t: which comment is correct?
Date: Sat, 22 Dec 2007 12:15:31 +0000
Message-ID: <476CFFE3.3040102@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello *,

Continuing my blind investigation on ccio-dma stuff, I read those 2 different comments:
in include/asm-parisc/scatterlist.h, scartterlist structure is defined like this:
struct scatterlist {
#ifdef CONFIG_DEBUG_SG
         unsigned long sg_magic;
#endif
         unsigned long page_link;
         unsigned int offset;

         unsigned int length;

         /* an IOVA can be 64-bits on some PA-Risc platforms. */
         dma_addr_t iova;        /* I/O Virtual Address */
         __u32      iova_length; /* bytes mapped */
};

in absolute the comment "an IOVA can be 64-bits on some PA-Risc platforms." seems ok.

but otoh, include/asm-parisc/types.h, defined dma_addr_t like this:

/* Dma addresses are 32-bits wide.  */

typedef u32 dma_addr_t;
typedef u64 dma64_addr_t;

#endif /* __ASSEMBLY__ */

OK it's just a comment but imho there is interesting matter in x86:

typedef u64 dma64_addr_t;
#if defined(CONFIG_X86_64) || defined(CONFIG_HIGHMEM64G)
/* DMA addresses come in 32-bit and 64-bit flavours. */
typedef u64 dma_addr_t;
#else
typedef u32 dma_addr_t;
#endif

But I simply have no idea which "#if defined" would be the most relevant for parisc, any idea?

Cheers,
	r.
