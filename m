From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Wed, 22 Sep 2004 18:41:20 +0100
Message-ID: <20040922174120.GO16153__35571.2755154402$1416624479$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20040922163708.GD4766@colo.lackof.org>
	<41501936000007AF@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41501936000007AF@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 22, 2004 at 07:21:08PM +0200, Joel Soete wrote:
> > Moving the DECLARE_PCI_FIXUP_HEADER() around is probably the clue
> > I needed to resolve this.
> >
> I am curious to find an expalnation too.

Yep, that's it.  That moves it to be the first entry on the list, and
it handles the suckyio IDE cotroller before the quirk_ide_bases does.

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
