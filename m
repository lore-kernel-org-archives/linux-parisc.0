From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] [PATCH] Sort generic PCI fixups after specific ones
Date: Thu, 23 Sep 2004 18:03:23 +0200
Message-ID: <4152E6450000003B__46728.0476041653$1416624479$gmane$org@mail-3-bnl.tiscali.it>
References: <20040922214304.GS16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: linux-pci@atrey.karlin.mff.cuni.cz,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>,
 "Linus Torvalds" <torvalds@osdl.org>,
 "Andrew Morton" <akpm@zip.com.au>
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


> -- Original Message --
> Date: Wed, 22 Sep 2004 22:43:04 +0100
> From: Matthew Wilcox <matthew@wil.cx>
> To: Linus Torvalds <torvalds@osdl.org>,
> 	Andrew Morton <akpm@zip.com.au>
> Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org,
> 	parisc-linux@parisc-linux.org
> Subject: [parisc-linux] [PATCH] Sort generic PCI fixups after specific
ones
> 
> 
> 
> The recent change that allowed PCI fixups to be declared everywhere
> broke IDE on PA-RISC by making the generic IDE fixup be applied before
> the PA-RISC specific one.  This patch fixes that by sorting generic fix=
ups
> after the specific ones.  It also obeys the 80-column limit and reduces=

> the amount of grotty macro code.
> 
> I'd like to thank Joel Soete for his work tracking down the source of
> this problem.
>
Thanks (but too much honor)

That said, I apply your patch against 2.6.9-rc2-pa7 and it boot fine :)

Thanks a lot for great job,
Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
