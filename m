From: Greg KH <greg@kroah.com>
Subject: [parisc-linux] Re: [PATCH] Sort generic PCI fixups after specific
	ones
Date: Thu, 23 Sep 2004 10:20:38 -0700
Message-ID: <20040923172038.GA8812__38536.541365511$1416624480$gmane$org@kroah.com>
References: <20040922214304.GS16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Linus Torvalds <torvalds@osdl.org>,
 linux-pci@atrey.karlin.mff.cuni.cz,
 Andrew Morton <akpm@zip.com.au>,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040922214304.GS16153@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 22, 2004 at 10:43:04PM +0100, Matthew Wilcox wrote:
> 
> The recent change that allowed PCI fixups to be declared everywhere
> broke IDE on PA-RISC by making the generic IDE fixup be applied before
> the PA-RISC specific one.  This patch fixes that by sorting generic fixups
> after the specific ones.  It also obeys the 80-column limit and reduces
> the amount of grotty macro code.
> 
> I'd like to thank Joel Soete for his work tracking down the source of
> this problem.
> 
> Index: linux-2.6/drivers/pci/quirks.c
> ===================================================================
> RCS file: /var/cvs/linux-2.6/drivers/pci/quirks.c,v
> retrieving revision 1.16
> diff -u -p -r1.16 quirks.c
> --- linux-2.6/drivers/pci/quirks.c	13 Sep 2004 15:23:21 -0000	1.16
> +++ linux-2.6/drivers/pci/quirks.c	22 Sep 2004 21:38:17 -0000
> @@ -543,7 +543,7 @@ static void __devinit quirk_cardbus_lega
>  		return;
>  	pci_write_config_dword(dev, PCI_CB_LEGACY_MODE_BASE, 0);
>  }
> -DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID,		PCI_ANY_ID,			quirk_cardbus_legacy );
> +DECLARE_PCI_FIXUP_FINAL_ALL(quirk_cardbus_legacy);

It looks like you are doing 2 different things here with this new macro.
Having it run last, and leting the user not type the PCI_ANY_ID macro
twice.  How about if you want to do a final final type pass, you mark it
as such, and not try to hide it in this manner.

And do we really want to call it "final final"?  What if we determine
that we need a "final final final" pass?  Can't you fix this with the
link order like was previously done?  I'd really prefer to not add
another level.

Oh, and cc:ing the pci maintainer might be nice next time :)

thanks,

greg k-h
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
