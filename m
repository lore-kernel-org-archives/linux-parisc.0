From: Kurt Roeckx <kurt@roeckx.be>
Subject: Re: HPPA and Squeeze
Date: Fri, 3 Jul 2009 20:57:56 +0200
Message-ID: <20090703185756.GA323@roeckx.be>
References: <4A3B2AC4.90105@debian.org> <20090619151526.GA30984@roeckx.be> <20090619154324.GA26579@durotan.0x539.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Debian Release <debian-release@lists.debian.org>
To: Philipp Kern <pkern@debian.org>
Return-path: <bounce-debian-release=debian-release=m.gmane.org@lists.debian.org>
In-Reply-To: <20090619154324.GA26579@durotan.0x539.de>
Resent-Message-ID: <r0NIKWyC49I.A.FR.CTlTKB@liszt>
List-Post: <mailto:debian-release@lists.debian.org>
List-Help: <mailto:debian-release-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-release-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-release-request@lists.debian.org?subject=unsubscribe>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 19, 2009 at 05:43:24PM +0200, Philipp Kern wrote:
> On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
> > Here is a list of packages that failed to build because of instability
> > on the buildds today:
> > package     | buildd   | error
> > qgit        | penalosa | make: *** [install] Segmentation fault
> > acpica-unix | peri     | make: *** [install] Segmentation fault
> 
> I had those random segfaults in make on paer too, until we switched to the
> UP kernel, at least from what I saw.

Did something change to peri?  I'm currently only seeing them on
penalosa.

Failed logs the past few days:
Jun 22 | wesnoth                | penalosa | quilt segfaults
Jun 22 | gitg                   | penalosa | quilt segfaults
Jun 23 | zita-convolver         | penalosa | quilt segfaults
Jun 25 | autodocksuite          | penalosa | make segfaults
Jun 26 | mpd                    | penalosa | find segfaults?
Jun 30 | scorched3d             | penalosa | make segfaults
Jun 30 | libtext-bibtex-perl    | penalosa | make segfaults
Jun 30 | gnome-chemistry-utils  | penalosa | libtool segfaults
Jul 01 | openmsx-catapult       | penalosa | make segfaults
Jul 01 | prima                  | penalosa | make segfaults
Jul 01 | fvwm                   | penalosa | gcc says as had a segfault
Jul 01 | cherokee               | penalosa | quilt segfaults
Jul 03 | vflib3		        | penalosa | make segfaults
Jul 03 | rpy2		        | penalosa | make segfaults
Jul 03 | debian-installer-utils | penalosa | make segfaults

On other that looks weird is, all also on penalosa:
- scid, seems to have been stuck in a "cp".
- postgresql-8.3, not sure what the error is
- building gnome-system-monitor, openssh-client failed to install
  in it's postinst script calling update-alternatives

And then there is glob2 that fails with:
/usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot reach 0000f9bf_memcpy@@GLIBC_2.2+0, recompile with -ffunction-sections
/usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot handle R_PARISC_PCREL17F for memcpy@@GLIBC_2.2
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status


Kurt
