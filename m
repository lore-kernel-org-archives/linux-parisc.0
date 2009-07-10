From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Thu, 9 Jul 2009 20:15:04 -0400 (EDT)
Message-ID: <20090710001506.A2C43507E@hiauly1.hia.nrc.ca>
References: <20090709225511.GE10979@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090709225511.GE10979@lackof.org> from "Grant Grundler" at Jul 9, 2009 04:55:11 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Thu, Jul 09, 2009 at 03:11:19PM +0200, Artem Alimarine wrote:
> > Hi guys,
> >
> > I am new to PARISC and to this forum. I have a small question. There is  
> > an instruction in entry.S that I do not understand. It is in the the  
> > macro make_insert_tlb
> >
> > Kernel 2.6.26.2:
> >
> > 537        /* Enforce uncacheable pages.
> > 538         * This should ONLY be use for MMIO on PA 2.0 machines.
> > 539         * Memory/DMA is cache coherent on all PA2.0 machines we support
> > 540         * (that means T-class is NOT supported) and the memory controllers
> > 541         * on most of those machines only handles cache transactions.
> > 542         */
> > 543        extrd,u,*=      \pte,_PAGE_NO_CACHE_BIT+32,1,%r0
> > 544        depi            1,12,1,\prot
> >
> >
> 
> The "*=" in line 543 will determine if "depi" instruction (line 544)
> gets executed or not. You'll need the "PA-RISC 2.0 Architecture":
>     http://www.parisc-linux.org/documentation/index.html
>     http://ftp.parisc-linux.org/docs/arch/parisc2.0.pdf
> 
> And read page 7-47, 7-48, and Table D-14.
> 
> 
> > The DEPI instruction on a 64-bit machine sets bit 44=32+12,
> > whereas we use the value as the argument to IDTLBT, which expects bit 12  
> > to be used instead.
> >
> > Does it mean that the U-bit is never set and the  
> > authorization id gets corrupted???
> 
> U-bit will get set only if _PAGE_NO_CACHE_BIT+32 is also set.
> 
> The bit enumeration is *reverse* with MSb being 0 for all ASM instructions
> and all references in the PA2.0 Arch manual.
> 
> Because this is a 64 bit build, "+32" is needed to refer to the lower half
> of the double word (word == 32 bits).
> 
> > Is it a bug or my misunderstanding of the code???
> 
> It looks correct to me. "12" here always seems to refer to the U-bit as
> defined in the PA2.0 Arch manual.

To me, it looks like the instruction should be a depdi.  See the preceding
deposit of PAGE_USER.  According to the IDTLBT description, the U bit is
bit 12 in r2, not bit 44.

rp3440 boots with the depdi change.  Building gcc...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
