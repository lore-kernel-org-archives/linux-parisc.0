From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Wed, 22 Sep 2004 19:21:08 +0200
Message-ID: <41501936000007AF__29326.7899695367$1416624479$gmane$org@mail-7-bnl.tiscali.it>
References: <20040922163708.GD4766@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>,
 parisc-linux@parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040922163708.GD4766@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello Grant,

> On Wed, Sep 22, 2004 at 12:41:21PM +0200, Joel Soete wrote:
> > Hello Grant, Bartlomiej and *,
> >
> > I test this patch:
> > --- arch/parisc/kernel/pci.c.Orig	2004-09-22 09:47:02.000000000 +0200=

> > +++ arch/parisc/kernel/pci.c	2004-09-22 11:26:02.104187784 +0200
> > @@ -146,6 +146,9 @@
> >  	return str;
> >  }
> > 
> > +/* Used in drivers/pci/quirks.c */
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415,
superio_fixup_pci);
> 
> Uhm...any clue why this works?
No more clue sorry; I just notived that boot message of 2.6.8.1-pa7:
lba version TR4.0 (0x5) found at 0xfffffffffed30000
PCI: Enabled native mode for NS87415 (pif=3D0x8f)

became with 2.6.9-rc2:
lba version TR4.0 (0x5) found at 0xfffffffffed30000
PCI: Ignoring BAR0-3 of IDE controller 0000:00:0e.0
PCI: Enabled native mode for NS87415 (pif=3D0x8f)

(so PCI: Enabled native mode for NS87415 precede by a weird 'ignoring ...=

IDE controler)

I so just try to move back the pcibios_fixups initialisation at its previ=
ous
place and the message ''ignoring ... IDE controler" disapear ?)
 
> The same entry in drivers/parisc/superio.c should work too but it doesn=
't.
> I'd rather fix that than just blindly moving it.
> 
no pb

> > That fix the NS87415 pb on my c2k model :)
> > Can somebody check it with some c3k model?
> 
> I expect c3k also to work. I'm not going to test it.
> 
> 
> BTW, I've prepared a patch which moves IDE knowledge
> out of superio.c driver and into drivers/ide/pci/ns87415.c.
> I've not submitted it yet because I haven't successfully tested it
> and it still contains debug printk's.
> It builds and anyone curious is welcome to look at it:
>     ftp://ftp.parisc-linux.org/patches/diff-2.6.9-rc2-ns87415_suckyio_c=
leanup-01
> 
I will also try it :)

> Moving the DECLARE_PCI_FIXUP_HEADER() around is probably the clue
> I needed to resolve this.
> 
I am curious to find an expalnation too.

Thanks,
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
