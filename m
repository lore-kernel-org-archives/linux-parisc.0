From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.10-pa1 build failure [drivers/serial/mux.c]
Date: Sun, 26 Dec 2004 14:11:12 +0000
Message-ID: <20041226141112.GE11543@parcelfarce.linux.theplanet.co.uk>
References: <200412260212.19982.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412260212.19982.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 26, 2004 at 02:12:19AM -0500, Mike Frysinger wrote:
> this hunk is bum:
> --- LINUS_2_6_10/drivers/serial/mux.c
> +++ CVS2_6_10_PA1/drivers/serial/mux.c
> -       port->irq   = SERIAL_IRQ_NONE;
> +       port->irq   = NO_IRQ;
> 
> NO_IRQ isnt defined in any headers, but the serial_core.c has a similar hunk:

include/asm-parisc/irq.h defines NO_IRQ.  The hack in serial_core.c
is there because I build the parisc tree on a bunch of different
architectures (mostly i386 and ia64), and not everyone is defining
NO_IRQ yet.  There was a discussion about it on the linux-arch mailing
list and Ben Herrenschmidt is supposed to be driving it.  He's been
busy; I was just switching us over prematurely.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
