From: "M. Grabert" <xam@cs.ucc.ie>
Subject: [xam: Re: [parisc-linux] Get your Matrox PCI cards out of the
	basement ...]
Date: Thu, 3 Jun 2004 00:19:32 +0100
Message-ID: <20040602231932.GB21817@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: parisc-linux@lists.parisc-linux.org
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

On Thu, Jun 03, 2004 at 12:17:34AM +0200, Thomas Bogendoerfer wrote:

> ....I got the matroxfb driver working on my B2600 including X on top
> of fbdev (the mga driver doesn't work yet). So far I just used
> a very old Matrox Millenium I. Below is the necessary patch for
> 2.6.7-rc1.

Great news!

I just got mine two days ago (from eBay), and compiled 2.6.7-rc2-pa1
yesterday (with matroxfb support), but haven't tested it yet.

I'll apply your patch and recompile 2.6.7-rc2-pa1 and let you
know whether I have success on my C3000 aswell.

Thanks alot,
   Max


PS: My Matrox as also a (2MB + 6MB expansion board).
Did you pass any special boot flags? What about the VGA BIOS dip switch,
is it set to enable or disable?

----- End forwarded message -----
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
