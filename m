From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] J3515 100Bas-T LAN HSC single port NIC: supported
	on a D380/C110?
Date: Thu, 7 Apr 2005 19:21:20 +0200
Message-ID: <4208898700017E6E@mail-4-bnl.tiscali.it>
References: <20050406163328.GE16157@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050406163328.GE16157@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthew,

> 
> On Wed, Apr 06, 2005 at 06:27:53PM +0200, Joel Soete wrote:
> > I find a spare (antistaic pakage still sealed :-) ) J3515 hsc (iirc g=
sc)
> > nic.
> > 
> > I know I could plug in the d380 I get for additional test but could i=
t
> also
> > be compatible in a C110 model (I try to have a look in hw db and C110=

owner's
> > guide but not find this info)?
> > 
> > Any way would it be supported on the D with a parisc-linux kernel?
> 
> It's a Tulip + Dino on a card.  It ought to work, but I've had trouble
with
> it on a K-class.  Please try it ;-)
> 
I installed it and tryied to boot with my c110 2.6.12-rc-pa config but it=

doesn't seems to see it (only eth0 in the boot logs).
I presume that I would need to add some more nic support to my kernel con=
fig
because otc the sarge d-i netinstall cd presents me well two nic:
eth0 Digital ...
eth1 lasi...

unfortunately when this cd install was finished, the reboot on the main d=
isk
hung when loading the tulip module :-(
...
Checking root file system...
fsck 1.35 (28-Feb-2004)
/: clean, 10962/783360 files, 240240/1566306 blocks
EXT3 FS on sda5, internal journal
System time was Thu Apr  7 16:39:26 UTC 2005.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Thu Apr  7 16:39:28 UTC 2005.
Cleaning up ifupdown...done.
Calculating module dependencies... done.
Loading modules...
    lasi700
    lasi_82596
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 08 00 09 D2 89 15 IRQ 87.
    sd_mod
    sr_mod
    tulip

Was it the kind of pb which you encountered?

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
