From: Helge Deller <deller@gmx.de>
Subject: Re: gcc-hppa64 compilers
Date: Sat, 7 Jan 2006 16:06:22 +0100
Message-ID: <200601071606.24320.deller__40016.3476042964$1416623977$gmane$org@gmx.de>
References: <17341.56304.198509.175260@gargle.gargle.HOWL> <20060106192746.GA3782@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
 parisc-linux@lists.parisc-linux.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060106192746.GA3782@tachyon.int.mcmartin.ca>
Resent-Message-ID: <_c8guD.A.Yb.1j9vDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Friday 06 January 2006 20:27, Kyle McMartin wrote:
> On Fri, Jan 06, 2006 at 03:54:40AM +0100, Matthias Klose wrote:
> > Which gcc-X.Y-hppa64 variants are still needed for Debian sid/etch?
> > Currently compilers are built for 3.3, 3.4, 4.0 and 4.1, the latter
> > one for experimental. Is it time to drop some of these?
> >
> 
> Please don't remove gcc-3.4-hppa64. I use it on many machines
> for kernel builds. 3.3 and 4.0 can go, imnsho, but I'll defer to the
> experts. 

I'm for removing 3.3 and 4.0 as well.

BTW, what does it take to drop hppa64-compiler in favour of a "-m64" compiler flag (as on x86_64) to hppa-gcc as well ?

Helge


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
