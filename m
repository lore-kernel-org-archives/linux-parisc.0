From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 14 Oct 2006 11:40:40 -0500
Message-ID: <200610141140.40487.mszick@morethan.org>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<4530DF1F.5060601@scarlet.be>
	<20061014141147.GM11633@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061014141147.GM11633@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat October 14 2006 09:11, Matthew Wilcox wrote:
> On Sat, Oct 14, 2006 at 12:59:11PM +0000, Joel Soete wrote:
> > but yes that's the primary question and:
> > 	* I encountered pbs with ncr53c720 and core io ncr53c710
> > 	 (different pb with each hba but same one-to-one on d380 and c110),
> > 	* but no pb with same disk (and its scsi chain: cable + terminator) 
> > 	with ncr53c710 (behind dino) on a b180,
> > so
> > 	* no hw pb with disk,
> > 	* no sw pb with nc53c710 Jame's driver,
> > 	 (even thought less sure, as make me noticed Mike:
> > 		on b180, 53c710 is behind dino i.e. gsc pci bus bridge, 
> > 		right?
> > 		on c110 and d380, this 53c710 is behind LASI (afaik just a 
> > 		vlsi assembly and no bus bridge)
> > 		so could be also a pb with 53c710 when married with gsc?)
> 
> You should never listen to Zick.  

More from the least trusted source of information:

The C710 designed into the LASI chip operates from a fixed frequency
clock of 40Mhz.

Ref:
http://www.hpl.hp.com/hpjournal/95apr/apr95a4.pdf
Page: 3, Section: Phase-Locked Loop Clock Generators, Paragraph: 1

All K-class systems have at least 1 HP-HSC bus, it runs at 32Mhz.
In addition the K-400 and K-410 may have an additional HP-HSC bus
which runs at 40Mhz.

Ref:
http://www.hpl.hp.com/hpjournal/96feb/feb96a1.pdf
Page: 6, Section: I/O Expansion, Paragraph: 1

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
