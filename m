Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.brnt.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD8214829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 13:58:06 -0700 (MST)
Date: Fri, 3 Jan 2003 20:49:06 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030103204906.GJ24337@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Preparation of Boot-Floppies release 3.0.24, testers wanted
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

There will be a new boot-floppies release for woody 3.0r2; I've built
CVS head, using kernel 2.4.19 from unstable, and tested on B180 serial
and graphical console, 715 serial console, and C360 serial and graphical
console.  Would be good if someone else could test, especially on 64
bit, as I am not able to do that at the moment.

Available at <http://people.debian.org/~blade/bf3024/>

Thanks,
  Richard

On Wed, Dec 18, 2002 at 07:55:46PM +0100, Eduard Bloch wrote:
> ( first semi-official call-for-helpers, see also:
> http://people.debian.org/~blade/bf3024/ )
> 
> Preparation of Boot-Floppies release 3.0.24
> ===========================================
> 
> I volunteered to prepare the next release of Debian's Boot-Floppies
> tree. The next release of Debian Woody, 3.0r2 was planned for about two
> months after r1, so we have at least this period from now. There are
> known outstanding problems that will be fixed in Woody by this release:
>  
>  - potential security risks using old kernel versions
>  - miscellaneous glitches on m68k
>  - outdated kernel on i386, not supporting large harddisks
>  - various bugfixes on s390
>  - and many others, including better documentation
> 
> So my prefered schedule is:
> 
>  - everyone responsible for a certain architecture should update to
>    latest CVS HEAD and make test builds (one week)
>  - Test builds are distributed for testing, netinst images are created,
>    announcing on DP, DWN, etc. (2 weeks)
>  - Final release, buildin on all architectures and uploading
> 
> Since we are building for 11 architectures this time, I prefer having a
> bit more coordination: http://people.debian.org/~blade/bf3024/ will
> contain a simple overview and links to testing builds.
> 
> So, my fellow b-f developers, come out whereever you are, spend few
> hours[1], report problems and fix them where needed. You know the rules.
> 
>  - Do not break stuff intentionaly
>  - Do not risc changing something if you cannot predict the consequences
>  - Build in a Woody chroot ("debootstrap" helps), do not risc messing up
>    something because of Sid's problem of the day.
> 
> When I have spare time, I will hang around on the #debian-boot on
> Freenode network. If there is no reaction from me, better send an /msg.
> 
> Happy Hacking,
> Eduard.
> -- 
> User Error: replace user and press any key to continue.
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-boot-request@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
