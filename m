Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05518
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 12:03:39 -0700
Message-Id: <199911131905.OAA01807@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 715 useful
To: adevries@thepuffingroup.com (Alex deVries)
Date: Sat, 13 Nov 1999 14:05:09 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9911131458240.3678-100000@vodka.thepuffingroup.com> from "Alex deVries" at Nov 13, 99 02:59:04 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Sat, 13 Nov 1999, John David Anglin wrote:
> > > For the machines which have ASP, am I right in saying they have no other
> > > sources of interrupts?  ie what I want to do is:
> > 
> > Under hpux 10.X, I was told that the NCR 710/720 controller devices are
> > sources of interrupts.  They do this by writing to the processor.  Thus,
> > it appears they bypass the ASP.
> 
> I think those are routed through ASP just like they are on Lasi.  
> 
> At some point we need to be concerned with Zalon interrupt handling too.

I was having problems with SCSI timeouts and LPMCs on my 735 after upgrading
to 10.20.  Grant Grundler wrote:

> In looking at the PA7300LC ERS, I see that detection of out of range DMA
> addresses has to be enabled in the MIOC for LPMCs to occur as a result of
> these events.

This is really interesting.

> 
> >From page 83 in the discussion on "System Start-UP",
> "MIOC_CONTROL (address 0xF###'F080). This register contains bits that control
> both the I/O system and the memory system. Refer to the memory controller
> section for information on setting the memory-related bits; the I/O-related
> bits should be set as follows:
> * set dma_noecc if the PA7300LC should not flag bad data during DMA reads;
> normally, if a double-bit memory error is detected during an outbound DMA
> transaction, the bad data word(s) are marked with bad parity on the GSC bus;
> * set lpmc_en to detect and generate an LPMC on DMA accesses to memory
> space that fall outside of the system's installed physical memory;

The SCSI driver will attempt to use "Transaction based Interrupts"
only for GSC SCSI cards (use "Zalon" front end). The c720 driver programs
the card to generate interrupts by writing to the Processor! (ie way above
memory). I wonder if this is causing the LPMC's.

You need to patch out code in c720_init() which calls wsio_get_interrupts().
Don't patch out the call. Rather NOP out the STW's one at a time which
should immediately follow that  call until it works.
Should be two places the return value is stored and one of them
enables transaction based interrupts.

> * set fast_memory if dwmode (also in MIOC_CONTROL) is set;
> * set lopowhilat if the PA7300LC's power consumption is critical, and you
> wish to slightly reduce it, even at the expense of increasing CPU to I/O late
>   ncy;
> * (set dma_nocache, pgape, and pgdpe only for diagnostic purposes)."
> 
> If I knew where where lpmc_en was set in 10.20, maybe I could turn it off
> for testing.

Very likely early during processor initialization. I don't know that code.

grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-660
>   5)

Grant Grundler
Unix Developement Lab
+1.408.447.7253


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
