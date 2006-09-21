From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Anyone maintaining Mux?
Date: Wed, 20 Sep 2006 20:51:29 -0600
Message-ID: <20060921025129.GK2585@parisc-linux.org>
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


Ryan's listed as the MODULE_AUTHOR for Mux, but I haven't seen anything
from him since he changed jobs.

I recently did an allmodconfig build and I'm looking at the missing
symbols.  A modular Mux looks for:

WARNING: "pdc_iodc_putc" [drivers/serial/mux.ko] undefined!

That's funny (mostly in the sense of odd, with a tinge of amusing)
because mux is supposed to be an output driver ... why's it calling pdc
to write bytes for it?

Turns out, that's in mux_console_write() -- ie only used if
CONFIG_SERIAL_MUX_CONSOLE is set.  It's an exact duplicate of the code
in pdc_cons.c.

We have five options that I see for solving this:

1. Make CONFIG_SERIAL_MUX a bool.  No more mux-as-module.

2. Make CONFIG_SERIAL_MUX_CONSOLE only available if CONFIG_SERIAL_MUX is y.

3. Export pdc_iodc_putc.  What's one more symbol between friends?

4. Delete CONFIG_SERIAL_MUX_CONSOLE and make pdc console work right.

5. Rewrite the Mux console to actually use the mux rather than PDC.

I'd like somebody else to be enthusiastic enough to do #5, but I'm
concerned that we don't really have a maintainer for this code right
now, and nobody's going to have time/inclination to do it.

BTW, owning this hardware is not required to work on this driver -- we
have a K-class with remote power in the Fort Collins test-ring.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
