From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: gcc-hppa64 compilers
Date: Sat, 7 Jan 2006 16:27:24 +0100
Message-ID: <7d01f9f00601070727l24ae2c79h75c8a4a4d38b4e89__26853.7990552888$1416623980$gmane$org@mail.gmail.com>
References: <17341.56304.198509.175260@gargle.gargle.HOWL>
	 <20060106192746.GA3782@tachyon.int.mcmartin.ca>
	 <200601071606.24320.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
 Matthias Klose <doko@cs.tu-berlin.de>,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200601071606.24320.deller@gmx.de>
Resent-Message-ID: <QUQrY.A.D7E.u6-vDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On 1/7/06, Helge Deller <deller@gmx.de> wrote:
>
> BTW, what does it take to drop hppa64-compiler in favour of a "-m64" comp=
iler flag (as on x86_64) to hppa-gcc as well ?

This is probably impossible for the simple reason that the 64bit
flavour of hppa gcc can only build kernels: we don't have a 64bit
userland and thus the 64bit gcc is very limited in its features...
This is not a full-featured compiler:

Reading specs from /usr/lib/gcc/hppa64-linux-gnu/3.4.5/specs
Configured with: ../src/configure --enable-languages=3Dc --prefix=3D/usr
--libexecdir=3D/usr/lib --disable-shared --disable-nls --disable-threads
--with-as=3D/usr/bin/hppa64-linux-gnu-as
--with-ld=3D/usr/bin/hppa64-linux-gnu-ld
--includedir=3D/usr/hppa64-linux/include --host=3Dhppa-linux-gnu
--build=3Dhppa-linux-gnu --target=3Dhppa64-linux-gnu
Thread model: single
gcc version 3.4.5 (Debian 3.4.5-1)

HTH

T-Bone

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
