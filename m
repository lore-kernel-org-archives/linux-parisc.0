From: "James K. Love" <jlove@scires.com>
Subject: [parisc-linux] HP755 IRQ issues
Date: Wed, 6 Dec 2006 16:13:47 -0500
Message-ID: <20061206211729.B28157D66F__2038.52394265613$1416624227$gmane$org@free.linux.hp.com>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset="US-ASCII"
To: <parisc-linux@lists.parisc-linux.org>
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

All:

Interrupts do not appear to work on my 755.  I have both a 715/50 and
755/99, and I'd like to get a secondary 3Com EtherLink III ISA card working
in an EISA slot.  The 3c509 driver loads fine on both boxes and the card
works just fine on my 715, but pinging on the 755 doesn't generate any
interrupts (at least none visible in /proc/interrupts).  Both boxes have the
same kernel (2.6.12.2) and kernel configuration.  Also, I turned debug on
for the eisa driver and output looks nearly identical on both boxes.  The
only difference appears to be that the EISA driver reports 'SEU4870 ISA
memory' in slot 2 of the EISA bus when its enumerated on the 755, but no
card is actually in slot 2.  Does anyone have any ISA card working on a 755?
Do I need to tweak anything in my config or source to get this to work
correctly?  From browsing the source, it appears that interrupts are now
edge triggered by default for the EISA irqs, right?

Thanks,
James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
