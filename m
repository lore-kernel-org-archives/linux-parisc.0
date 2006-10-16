From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] GCC versions on hppa for etch
Date: Sun, 15 Oct 2006 22:03:32 -0600
Message-ID: <20061016040332.GC28382__11612.8706060865$1416624611$gmane$org@colo.lackof.org>
References: <17701.39824.601717.433929@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <17701.39824.601717.433929@gargle.gargle.HOWL>
Resent-Message-ID: <mVuKzD.A.EfB.WSwMFB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Fri, Oct 06, 2006 at 01:56:00AM +0200, Matthias Klose wrote:
> Can gcc-4.0-hppa64 and gcc-4.0 be dropped for etch?

I don't recall seeing any other opinions on this one: Yes

>  My current plan is
> to keep gcc-4.1-hppa64 and gcc-3.4-hppa64. we can drop gcc-3.4-hppa64
> as well, but will have to keep the other compilers from the GCC-3.4
> package anyway.

I'm pretty comfortable with gcc-4.1-hppa64 for kernel builds.
I haven't tested any kernels built in the past couple of weeks
but I know it worked for me in August.

thanks
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
