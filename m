From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] [hppa cross compiler]
Date: Mon, 14 Feb 2005 09:45:36 +0100
Message-ID: <20050214084536.EC000365908__30700.0106819489$1416624533$gmane$org@mail.esiee.fr>
References: <20050214074841.GB3123@SteX>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: SteX <stefano.melchior@fastwebnet.it>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050214074841.GB3123@SteX>
Resent-Message-ID: <6PJtkC.A.eFB.3UGECB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

> Hi all,
> are there any cross compilers for hppa in Debian bundle? what do you
use to
> x-compile from non-hppa to hppa?
> Thank you in advance

apt-cache search is used to look for packages. Alternatively you can
use packages.debian.org. Use toolchain-source to build cross
compilers.

OTOH, looking at the official website would have showed you this:
http://www.parisc-linux.org/software/index.html

Please avoid cross-posting when it's not necessary. debian-hppa is
meant to discuss Debian hppa related matters (userland), parisc-linux
is meant to discuss parisc linux *kernel* stuff.

Thx

Thibaut VARENE
PA/Linux ESIEE Team
http://www.pateam.org/
