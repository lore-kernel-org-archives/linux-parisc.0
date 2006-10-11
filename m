From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Can't write to hard drives on a K200
Date: Wed, 11 Oct 2006 11:14:13 -0500
Message-ID: <200610111114.14135.mszick@morethan.org>
References: <J6B9MR$91CD8B56571F1770C341CEA677BE5E0B@scarlet.be>
	<200609290939.19381.mszick@morethan.org>
	<20060929145622.GM5017@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060929145622.GM5017@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri September 29 2006 09:56, Matthew Wilcox wrote:
> On Fri, Sep 29, 2006 at 09:39:19AM -0500, Michael S. Zick wrote:
> > I can confirm that - having never worked for HP, all I can do is guess,
> > and I often guess wrong.
> 

Still reading, perhaps learning.  Now have a HP specific question...

> 
> We can call you unable to read.  Looking at
> http://hwdb.parisc-linux.org/view.php?type=machine&name=K200
> there is indeed
> KittyHawk GSY Core SCSI (Foreign I/O Module)  (NCR53c710 driver)
> but there is also
> KittyHawk GSY Core FW-SCSI (A DMA)  (Zalon driver)
> 
> The hard drives are HVD SCSI and are connected to the Core FW-SCSI
> (ncr720 chip).  The tape drive and CD-ROM drive are SE SCSI and are
> connected to the Core SCSI (ncr710 chip).
> 
> This is not an uncommon arrangement; it is also found in the
> B160L, C100, C110, C160, C160L, C180, C180XP, J200, J210, J210XC, J282,
> as well as all the other K-class machines.
> 
> Several B, C and J class machines use a PCI NCR 875 chip to provide HVD
> SCSI.  They also still use the 710 provided in Lasi for SE SCSI.
> 

I am still studying the documentation with an eye towards re-writing
the ncr-risc code as hp-specific...

I see from a note on the wiki that some machines with more than one
GSC (GSY?) bus run the buses at different speeds (32 Mhz and 40 Mhz).

Could you (or anyone on the list) eyeball the GSC scsi card(s) and
see if they have their own crystal(s)? 
Or are these controllers clocked by the GSC bus clock?

Expected would be a 40 or 80 Mhz crystal depending on the controller
if not clocked by the card's bus.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
