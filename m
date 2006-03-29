From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] IOGear Firewire+USB card causes unexpected irq 2
Date: Wed, 29 Mar 2006 08:58:38 -0500
Message-ID: <20060329135838.GL9011@quicksilver.road.mcmartin.ca>
References: <20060329093444.GA5593@pooh.bubble.frostnet.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Chris Frost <chris@frostnet.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060329093444.GA5593@pooh.bubble.frostnet.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 29, 2006 at 01:34:44AM -0800, Chris Frost wrote:
> If I change the if condition in superio.c to not error when irq == 2
> the machine gets further but produces several warnings, errors, stack
> traces, and an oops or two. It does recognize the firewire controller
> and sees a firewire disk I attach. I am even able to mount the file system
> on the disk and list its contents. However, the results of a find on the
> drive appear to only come in small chunks when I type on the keyboard.
> It would seem superio and the card are linked.
>

lspci -vn for the card, please...

Try commenting out 
	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_USB) },
	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415) },
in superio.c and seeing if that helps at all.

Cheers,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
