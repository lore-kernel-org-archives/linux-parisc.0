From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Sat, 14 Oct 2006 21:28:58 -0600
Message-ID: <20061015032858.GB22026@colo.lackof.org>
References: <J70JNP$255156D3B4F90827118C5EFE40FD3ABF@scarlet.be>
	<20061012195503.GA15124@colo.lackof.org>
	<452F70F2.4020700@scarlet.be>
	<20061013164406.GC13770@colo.lackof.org>
	<4530DF1F.5060601@scarlet.be>
	<20061014141147.GM11633@parisc-linux.org>
	<45317453.1090603@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45317453.1090603@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 14, 2006 at 11:35:47PM +0000, Joel Soete wrote:
...
> So here, I guess that software reflect this hw configuration and when a 
> lasi module driver (let say e.g. 53c710) need some io resources it would 
> forward the request to ccio module driver which would most probably have to 
> use its own sg list management functions (like ccio_map_single(), 
> ccio_unmap_single(), ccio_map_sg(), ccio_unmap_sg(), etc) which I called 
> "sg list management in ccio".

This is correct for C/K/D/R class machines which have U2/Uturn chip.

> Otc on b180 lasi module would better have to address there request to the 
> "Pseudo Bus Converter", i.e. quasi directly.

"Pseudo" means "fake". Ie the "Pseudo bus converter" just a place holder
in the HW path on B-class machines and not a real piece of HW.

> So why/how the kernel on b180 would use those same functions 
> (ccio_map_single(), ccio_unmap_single(), ccio_map_sg(), ccio_unmap_sg(), 
> etc) to manage sg list of a non-exitent device???

See arch/parisc/kernel/pci-dma.c for B180 DMA mapping functions.

> What did I miss?

You missed where/how dma_ops gets assigned.
Find that and I think you'll understand one more bit of the puzzle.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
