Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: =?iso-8859-1?Q?Ant=F3nio_Ribeiro?= <antonio.ribeiro@kpnqwest.pt>
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] PA-RISC Linux + FC60
In-Reply-To: Message from =?iso-8859-1?Q?Ant=F3nio_Ribeiro?= <antonio.ribeiro@kpnqwest.pt>
   of "Mon, 12 Aug 2002 16:27:49 BST." <000b01c24214$d2c8f680$a52efea9@kpnqwest.com>
References: <000b01c24214$d2c8f680$a52efea9@kpnqwest.com> 
Date: Mon, 12 Aug 2002 10:41:57 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020812164157.754614829@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

=?iso-8859-1?Q?Ant=F3nio_Ribeiro?= wrote:
> I would like to know if the Linux version for HP PA-RISC servers suppors
> FC60 Disk arrays.

I've not tried the qlogic card/driver yet. Only the Agilent based HP cards.

Jes Sorensen posted a cpqfc patch for HP's 5100/5166 Agilent HBAs.
(ftp://ftp.parisc-linux.org/patches/cpqfc_jes.patch)
It seems to work with FC10.  If it's not in 2.4.19, I'll commit and
resubmit in the next couple of days.  And unless someone tells me
otherwise, I'm going to believe the comments in cpqfc which indicate
cpqfc only supports arbitrated loop and not a switched fabric.

cpqfc also does not (yet) support the HP's Agilent XL2 (2GB FC) HBA.
With newer PCI subsystem in place, another patch is required
(ftp://ftp.parisc-linux.org/patches/cpqfc-03.diff) to run on A500.
The NVRAM isn't found and the "GBIC" not recognized on A500.
The patch is not fully cooked yet.

If someone has extra funding, the right folks are interested in
porting the HPUX tachlite driver to linux (supports switched fabric).
Unfortunately, HP has chosen to not fund the port to date.
I'm under the impression the result can be published under GPL.

grant
