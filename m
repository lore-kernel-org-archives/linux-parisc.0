Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 18 Dec 2002 14:24:55 -0700
To: Joerg Steindlberger <j@steindlberger.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] still problems with PCI IDE controller
Message-ID: <20021218212455.GG17944@dsl2.external.hp.com>
References: <200212160609.XAA18500@udlkern.fc.hp.com> <1040050989.13786.23.camel@irongate.swansea.linux.org.uk> <courier.3E005801.0000711F@server01> <courier.3E00E3ED.000010DA@server01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <courier.3E00E3ED.000010DA@server01>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Dec 18, 2002 at 10:08:34PM +0100, Joerg Steindlberger wrote:
> Dino f2000000: IRQ base 96, stuck IRQ lines? 0x2

The loop that reads and deMuxes the IRQ lines for Dino exits after
a few times in order to avoid monopolizing the CPU.
What that msg tells me is we are in the interrupt handler long
enough that the next eth0 interrupt is outstanding again.
I would guess this is because IDE is handling IO on the interrupt
stack (reading block data via PIO).

IDE in PIO Mode (ie not using DMA) does not play well with the
rest of the system.

You can usually ignore this msg.


> Seems that there is still nobody else who tried to use cheap IDE disks with a 
> parisc machine :-(

Nope. IDE is EEEeevil ;^)

grant
