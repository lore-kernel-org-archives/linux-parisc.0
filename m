From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: a fix for NS87415 on C3K broken
Date: Fri, 24 Sep 2004 18:09:16 +0200
Message-ID: <4152E882000003C5@mail-7-bnl.tiscali.it>
References: <20040922163708.GD4766@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
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

> It builds and anyone curious is welcome to look at it:
>     ftp://ftp.parisc-linux.org/patches/diff-2.6.9-rc2-ns87415_suckyio_c=
leanup-01
> 
I test it with Matthew's patches about DECLARE_FIXUP_... and upstream roc=
k
iso fs and seems to works fine on b2k:)

hth,
    Joel

PS: Don't think it's patch related but I observe a weird behaviour: when
I boot with a cd into the drive and try to mount it I got message: "cdrom=
:
open failed.". I just have to "eject /cdrom; eject -t /cdrom" to mount an=
d
use the same cd without pb?



-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
