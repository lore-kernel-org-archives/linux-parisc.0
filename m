From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-15?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20Re=3A=20Gcc=20bug=20or=20I=20missunderstand=3F=20=5Bftsd=20=25fr22=2C=0956=28=25sr0=2C=20=25r20=29=20failed=20to=20build=3F=5D?=
Date: Wed, 15 Dec 2004 18:25:35 +0000
Message-ID: <418A8131000106D9@mail-7-bnl.tiscali.it>
References: <20041215180436.GD27818@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: dave@hiauly1.hia.nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>,
 "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041215180436.GD27818@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> On Wed, Dec 15, 2004 at 05:18:13PM +0000, Matthew Wilcox wrote:
> > Quick look at page 9-24 of the Kane book indicates that for d between=

+15
> > and -16 we use format 42 and for d outside that range, we use format
3.
> > Looks like nobody bothered to teach binutils about this longer form
yet.
> > Is it possible it's only available for PA2.0 processors?
(mmm I just forget to memtioned that I used -march=3D2.0)
> 
> Yes - that seems to be the case.
> FSTD is PA2.0 Mnemonic. Page J-4 of the same book.
> 
> The two corresponding PA 1.1 ops are FSTDS and FSTDX.
> FSTDS is the short form (5 bits immediate).
> We could use FSTDX but it will require another register in the asm.
> 
> grant

Well ok I want that works for the two arch I had better to incr %0 ?
I will check perf.

Thanks for all advises,
    Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
