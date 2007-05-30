From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3
Date: Wed, 30 May 2007 01:57:04 -0400
Message-ID: <20070530055704.GB18850__4112.02338659695$1416624378$gmane$org@fattire.cabal.ca>
References: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 29, 2007 at 05:34:50PM +0200, Joel Soete wrote:
> WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x150): Section
> mismatch: reference to .init.text:parisc_hardware_description (after
> 'alloc_pa_dev')
> WARNING: drivers/built-in.o(.text.lba_fixup_bus+0x3c): Section mismatch:
> reference to .init.text:pci_read_bridge_bases (after 'lba_fixup_bus')
> 

Harmless warnings. I'll get to these in the morning if Helge doesn't
beat me to it.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
