Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id BDA78482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Dec 2001 12:01:04 -0700 (MST)
Date: Fri, 14 Dec 2001 13:58:03 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Matthew Wilcox <willy@debian.org>, Tom <palinux@alaskatech.org>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console
 problem)
In-Reply-To: <1008253261.495.4.camel@beavis>
Message-ID: <Pine.LNX.4.33.0112141351590.31282-100000@bob.ncssm.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 13 Dec 2001, Ryan Bradetich wrote:

> On Wed, 2001-12-12 at 22:20, Matthew Wilcox wrote:
> > On Wed, Dec 12, 2001 at 07:41:57PM -0900, Tom wrote:
> > > By all means, feel free to post corrections, either here or direct to
> > > me, and I'll update it. Also, if someone can think of something else
> > > useful for it, just ask... (Perhaps the minimum kernel revision needed?)
> >
> > E, F, G, H, I class aren't supported straight off the CD; they require
> > additional changes, AIUI.  Not to mention no support for their SCSI
> > adapters.  K mostly works... similar problems to E.  D & R should work
> > fine (problem with D class with remote management console).  735's FWDiff
> > scsi doesn't work.
>
> 755 has the same FWDiff as the 735 (outfield) so it doesn't work either.


So that would explain why none my 735's can detect hard drives.

I can boot off a CD on the regular scsi, and even though the boot_admin
will detect my disks debian won't.

so has _anyone_ gotten a 735 working or anything? I have 7 of them that
are taking up space in my dorm room, and two 755's under the desk that
server the same purpose...

-phil






>
> - Ryan
>
> > --
> > Revolutions do not require corporate support.
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

-- 
===============================================================================

Phil Anderson
UNIX Systems Administrator
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
