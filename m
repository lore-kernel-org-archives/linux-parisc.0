From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Wed, 22 Sep 2004 10:37:08 -0600
Message-ID: <20040922163708.GD4766__100.024246103381$1416624478$gmane$org@colo.lackof.org>
References: <200409170243.06449.bzolnier@elka.pw.edu.pl>
	<4150193600000506@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4150193600000506@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 22, 2004 at 12:41:21PM +0200, Joel Soete wrote:
> Hello Grant, Bartlomiej and *,
>
> I test this patch:
> --- arch/parisc/kernel/pci.c.Orig	2004-09-22 09:47:02.000000000 +0200
> +++ arch/parisc/kernel/pci.c	2004-09-22 11:26:02.104187784 +0200
> @@ -146,6 +146,9 @@
>  	return str;
>  }
> 
> +/* Used in drivers/pci/quirks.c */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, superio_fixup_pci);

Uhm...any clue why this works?
The same entry in drivers/parisc/superio.c should work too but it doesn't.
I'd rather fix that than just blindly moving it.

> That fix the NS87415 pb on my c2k model :)
> Can somebody check it with some c3k model?

I expect c3k also to work. I'm not going to test it.


BTW, I've prepared a patch which moves IDE knowledge
out of superio.c driver and into drivers/ide/pci/ns87415.c.
I've not submitted it yet because I haven't successfully tested it
and it still contains debug printk's.
It builds and anyone curious is welcome to look at it:
    ftp://ftp.parisc-linux.org/patches/diff-2.6.9-rc2-ns87415_suckyio_cleanup-01

Moving the DECLARE_PCI_FIXUP_HEADER() around is probably the clue
I needed to resolve this.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
