From: dann frazier <dannf@dannf.org>
Subject: Re: HPPA and lenny (ruby1.9 build problems)
Date: Mon, 5 Jan 2009 21:13:28 -0700
Message-ID: <20090106041327.GA22965@colo.lackof.org>
References: <20081215193025.GP20002@anguilla.noreply.org> <20081215200749.GA30169@colo.lackof.org> <4949787B.9070003@gmx.de> <20081217222540.GB13477@colo.lackof.org> <4950B3AD.1020200@gmx.de> <20081223102356.GF19873@anguilla.noreply.org> <4950C0CA.1040804@gmx.de> <20090105180823.GC877@colo.lackof.org> <20090105190209.GI932@anguilla.noreply.org> <49629BDA.4030904@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matt Taggart <taggart@debian.org>,
	Christoph Martin <martin@uni-mainz.de>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	team@security.debian.org, debian-admin@lists.debian.org,
	lucas@lucas-nussbaum.net,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49629BDA.4030904@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jan 06, 2009 at 12:46:34AM +0100, Helge Deller wrote:
> CC: linux-paric mailing list
> 
> Peter Palfrader wrote:
> > On Mon, 05 Jan 2009, dann frazier wrote:
> > 
> >> On Tue, Dec 23, 2008 at 11:43:22AM +0100, Helge Deller wrote:
> >>> Peter Palfrader wrote:
> >>>> Helge Deller schrieb am Dienstag, dem 23. Dezember 2008:
> >>>>
> >>>>> Patch in parisc git tree:
> >>>>> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=378fe7c4cc619b561409206605c723c05358edac;hp=6c4dfa8f8bcf032137aacb3640d7dd9d75b2b607
> >>>> So just using an SMP kernel should also work?
> >>> Probably yes, since some other developers tried initially to reproduce
> >>> the problem, but they couldn't (as it seems they were running on newer
> >>> SMP machines). But I don't have a SMP server which is why I can't test
> >>> myself...
> >> Unfortunately, it looks like we're still having problems on the
> >> buildds w/ 2.6.26 SMP kernels:
> >>   http://buildd.debian.org/build.php?&pkg=ruby1.9&ver=1.9.0.2-9&arch=hppa&file=log
> >>
> >> The build doesn't take the system down, but does still hang
> >> indefinitely while running miniruby - though the hang location varies.
> >>
> >> I'll prepare a UP kernel for one of the buildds w/ the
> >> up-optimization-removal patch just to see if it improves things. I
> >> don't see why it would, other than it seemed to solve the problem on
> >> my test box when I first tested the patch.
> 
> It seemed to fix the problem for me as well.

fyi, I tested w/ a 2.6.26 32-bit UP kernel w/ the
up-optimization-removal patch, and received another hang:
 http://buildd.debian.org/fetch.cgi?pkg=ruby1.9;ver=1.9.0.2-9;arch=hppa;stamp=1231212073

> In principle looking at the logs it looks more like a userspace bugs
> due to threading functions.
> Anyway, I'll try to reproduce it here as well.
> FWIW, I had some additional irq locking code in load_context(), maybe 
> this helps...?

I'd be happy to test it if you can point me to a changeset.

> > Yeah, penalosa got stuck again today, this was on the console:
> 
> Does panalosa has the patched kernel (same one as the one on peri) ?

Both machines were running an unpatched SMP 2.6.26 until I upgraded
penalosa for the test I refer to above. The thinking being that -
though these machines are single CPU - the SMP version should avoid
the UP optimization code.

> The protection ID traps shouldn't happen any longer, and from the buildd
> logs on peri it does seem like that the ProtID traps don't happen there.

There were no protection trap messages in penalosa's dmesg after the
above hang. In fact, it contains nothing other than bootup messages.

> Helge

Thanks for all your help so far - its really appreciated.

-- 
dann frazier

