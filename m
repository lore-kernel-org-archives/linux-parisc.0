From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: More questions [Was: [parisc-linux] 2.6.10-rc1-pa11 profile data]
Date: Wed, 1 Dec 2004 19:33:13 +0100
Message-ID: <418A81170000A675@mail-8-bnl.mail.tiscali.sys>
References: <20041201175648.GG5752@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041201175648.GG5752@parcelfarce.linux.theplanet.co.uk>
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
> On Wed, Dec 01, 2004 at 06:44:44PM +0100, Joel Soete wrote:
> > I doubt that's enough because I don't yet find how r0 is set?
> 
> r0 is magic on PA.  Writes are discarded, reads return 0.  It's the
> hardware equivalent of /dev/zero ;-)
> 
Cool that make the stuff so ?
And iirc registers are 64bit wide on pa2.0?

Thanks,
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
