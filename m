From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Wed, 19 Jan 2005 15:42:14 +0100
Message-ID: <41DE92B500003C5A@mail-3-bnl.tiscali.it>
References: <20050119134545.GA25940@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050119134545.GA25940@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> Subject: Re: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workque=
ue.c:132
> 
> 
> On Wed, Jan 19, 2005 at 09:21:22AM +0100, Joel Soete wrote:
> > Just by curiosity: is that 4 cpus or 2 dual core?
> 
> It's two sockets, each with a dual-die processor.  I deduced this from
> the rp4440 claiming 8 processors and knowing the zx1 chipset only suppo=
rts
> 4 sockets.
> 
thanks

in fact  I was confused by the boot server message:
Booting... 
Boot IO Dependent Code (IODC) revision 3


HARD Booted.
palo ipl 1.5 root at c3k Fri May 14 16:17:38 MDT 2004
                            ^^^^^

sorry,
    Joel


-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
