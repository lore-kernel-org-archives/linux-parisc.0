From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 14 Oct 2006 08:11:47 -0600
Message-ID: <20061014141147.GM11633@parisc-linux.org>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<20061012195503.GA15124@colo.lackof.org>
	<452F70F2.4020700@scarlet.be>
	<20061013164406.GC13770@colo.lackof.org>
	<4530DF1F.5060601@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4530DF1F.5060601@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 14, 2006 at 12:59:11PM +0000, Joel Soete wrote:
> but yes that's the primary question and:
> 	* I encountered pbs with ncr53c720 and core io ncr53c710
> 	 (different pb with each hba but same one-to-one on d380 and c110),
> 	* but no pb with same disk (and its scsi chain: cable + terminator) 
> 	with ncr53c710 (behind dino) on a b180,
> so
> 	* no hw pb with disk,
> 	* no sw pb with nc53c710 Jame's driver,
> 	 (even thought less sure, as make me noticed Mike:
> 		on b180, 53c710 is behind dino i.e. gsc pci bus bridge, 
> 		right?
> 		on c110 and d380, this 53c710 is behind LASI (afaik just a 
> 		vlsi assembly and no bus bridge)
> 		so could be also a pb with 53c710 when married with gsc?)

You should never listen to Zick.  53c710 is always part of Lasi on PA
machines.  There's a discrete 53c700 on pre-Lasi machines.  There is
never a 53c710 behind Dino.  Dino has a serial port, a ps/2 port, and a
pci host bridge.

> 	* most probably the pb is well in sg list management in ccio (afaik 
> 	not used by dino)

Wrong.  sg list management is used by PCI devices behind Dino as well as
by GSC devices.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
