From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] Sort generic PCI fixups after specific ones
Date: Tue, 5 Oct 2004 16:29:59 +0100
Message-ID: <20041005152959.GX16153__25141.5134560832$1416624490$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20040922214304.GS16153@parcelfarce.linux.theplanet.co.uk> <20040923172038.GA8812@kroah.com> <20040923173151.GX16153@parcelfarce.linux.theplanet.co.uk> <20040924023357.A2526@jurassic.park.msu.ru> <20040930174155.GT16153@parcelfarce.linux.theplanet.co.uk> <20041002014817.A24292@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Matthew Wilcox <matthew@wil.cx>,
 Greg KH <greg@kroah.com>,
 Linus Torvalds <torvalds@osdl.org>,
 Andrew Morton <akpm@zip.com.au>,
 linux-kernel@vger.kernel.org,
 linux-pci@atrey.karlin.mff.cuni.cz,
 parisc-linux@parisc-linux.org
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Return-Path: <linux-kernel-owner+deller=40gmx.de-S269144AbUJEPaZ@vger.kernel.org>
In-Reply-To: <20041002014817.A24292@jurassic.park.msu.ru>
List-Id: linux-parisc.vger.kernel.org

On Sat, Oct 02, 2004 at 01:48:17AM +0400, Ivan Kokshaysky wrote:
> On Thu, Sep 30, 2004 at 06:41:55PM +0100, Matthew Wilcox wrote:
> > Allow prioritising PCI fixups.  "How it works" is covered in the comment
> > in pci.h.  The patch to superio.c may well only apply with fuzz to the
> > current Linux tree; I include it only to show an example.
> 
> No, you missed my point.
> What we need is yet another PCI fixup *pass*, not prioritizing fixups
> inside *one* pass - see appended patch (compile tested only).

Boot tested.  Works fine for my problem child.  Greg, can you apply
Ivan's patch, please?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
