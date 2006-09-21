From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Current allmodconfig failures
Date: Thu, 21 Sep 2006 05:42:40 -0600
Message-ID: <20060921114240.GL2585@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

$ grep undefined make.err 
WARNING: "flush_data_cache" [drivers/video/console/sticore.ko] undefined!
WARNING: "sti_set" [drivers/video/console/sticon.ko] undefined!
WARNING: "sti_putc" [drivers/video/console/sticon.ko] undefined!
WARNING: "sti_bmove" [drivers/video/console/sticon.ko] undefined!
WARNING: "sti_clear" [drivers/video/console/sticon.ko] undefined!
WARNING: "dummy_con" [drivers/video/console/sticon.ko] undefined!
WARNING: "conswitchp" [drivers/video/console/sticon.ko] undefined!
WARNING: "pdc_iodc_putc" [drivers/serial/mux.ko] undefined!
WARNING: "isa_bus_to_virt" [drivers/net/ni52.ko] undefined!

I suspect the flush_data_cache() is a relic from the olden days -- I
think the flush_icache_range() call should be sufficient.

The pdc_iodc_putc() call I mentioned in a missive yesterday.

isa_bus_to_virt() is an interesting one.  We don't currently have
virtual mappings for the ISA bus.  This driver needs to be converted to
use ioremap().  I'm tempted to mark it !PARISC in Kconfig.  Or rather,
mark it ARM || MIPS || X86 since those are the only architectures which
implement isa_bus_to_virt.

STI scares me.  I don't understand why we need the dummy console.  I
don't know if it makes any sense to build your console as a module.  I
don't know why sticore is in the console directory.

I fixed all the other allmodconfig problems I found ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
