From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] kernel config file for HP D-series
Date: Fri, 26 Nov 2004 18:53:05 +0000
Message-ID: <20041126185305.GH29035@parcelfarce.linux.theplanet.co.uk>
References: <41A7487B.5080809@lycos.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: maillist parisc-linux <parisc-linux@lists.parisc-linux.org>
To: =?iso-8859-1?Q?Corn=E9?= Beerse <cbeerse@lycos.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41A7487B.5080809@lycos.nl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Nov 26, 2004 at 04:15:07PM +0100, Corné Beerse wrote:
> Does anyone have a kernel config file for a HP D-series machine which I can 
> use as a start point for my kernel configs? Preferably a D370 with 2 CPUs. 
> Or can anyone guide which of the basic configs can be used for a start 
> point? (I guess the B180 but that does not work out of the box).

You can start with just 'make defconfig'.  That should produce a working
kernel.  Options worth tweaking (with menuconfig, or vi, or whatever)
would be:

 - SMP on 
 - PA7000 -> PA8000
 - PCI_LBA off

If you have no HSC-PCI cards, you might want to turn PCI off too.

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
