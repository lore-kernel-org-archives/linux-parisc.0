From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] NFS problems : kernel panic
Date: Fri, 13 May 2005 11:32:30 +0200
Message-ID: <4282FEEC000008EE@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Guy Martin" <gmsoft@gentoo.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello GMsoft,

:-)

>
> Many users are reporting me problems with kernel after 2.6.10-pa11. I'v=
e
> had the problem myself on both my C3600 and my B180L.
> When you upload or download big files via NFS, the kernel crash with no=

> more message than :
> Kernel panic - not syncing
>
> The nfs share can be either udp or tcp. That doesn't matter.
>
> Is this a know problem ? Is there a workaround (don't tell me samba :)
?
>
mmm upload/download BIG files that sounds like file transfer?
Isn't it more secure to use scp or sftp for such case?

btw I use regulary such kind of ft:
cd /CVS/hppa; tar -cslp linux-2.6 | tar -C /usr/src -xslpf;
(/CVS being a nfs mp)
So that looks like a file of 200Mb (at about 350k/s on a 10M-half dusplex=

;-)
without pb?

Any way, that remember me vaguely that at a moment I also encountered nfs=

pb during such operation.
It seems that I find a work-around by removing nfs-v4 support from my ker=
nel?
(but I am very not sure: very very vague souvenir)
Just in case, here is my nfs config:
#
# Network File Systems
#
CONFIG_NFS_FS=3Dy
CONFIG_NFS_V3=3Dy
# CONFIG_NFS_V4 is not set
# CONFIG_NFS_DIRECTIO is not set
CONFIG_NFSD=3Dy
CONFIG_NFSD_V3=3Dy
# CONFIG_NFSD_V4 is not set
CONFIG_NFSD_TCP=3Dy
CONFIG_ROOT_NFS=3Dy
CONFIG_LOCKD=3Dy
CONFIG_LOCKD_V4=3Dy
CONFIG_EXPORTFS=3Dy
CONFIG_SUNRPC=3Dy

> Feel free to ask if you want more info or if you want me to do some
> tests.
>
Sorry not enough clue to track this.

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
