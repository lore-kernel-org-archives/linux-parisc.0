From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] hwpath for superio serial console
Date: Sun, 16 Jan 2005 05:47:28 +0000
Message-ID: <20050116054728.GS30982@parcelfarce.linux.theplanet.co.uk>
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


Now I've fixed pdc_stable to not dereference a null ptr, I can see
why it failed.  The hardware path it has is:

# cat console/*
[10/0/14/1/1]
643 

To my mind, this is a broken hwpath.  The algorithm we use for converting
hwpaths to PCI busses says this is:
10 (PA)
10/0 (PA)
10/0/14 (PCI bridge 0e.0)
10/0/14/1/1 (PCI device 1.1)

We're actually supposed to decode this as:

10/0 (PA)
10/0/14/1 (PCI device 0e.1)
10/0/14/1/1 (subfunction 1?)

This isn't consistent breakage, only for serial console hwpath on
a sprockets machine.  N4000 reports [0/0/4/0] (Ike 0, Elroy 0, PCI
device 4.0).  Sprockets reports [10/0/15/1] for alternate boot path
(Astro 10, Elroy 0, PCI device 0f.1), [10/6/2/0] for graphics console,
and [10/0/14/2] for USB keyboard.

To my mind, SERIAL_1 should have been reported by a hwpath of 10/0/14/1
and then two layers -- the first being 1 or 2 for SERIAL_1 vs SERIAL_2,
and the second encoding 9600.8.none (which seems to be 643 for some
reason).

How should we be handling this?  Look for a device, then retry with the
hwpath shifted left if we don't find it?  How about when write support
is added?  What does HPUX do?

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
