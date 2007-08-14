From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] preliminary strace patch
Date: Tue, 14 Aug 2007 23:01:34 +0200
Message-ID: <200708142301.34895.deller__32003.9670951248$1416624428$gmane$org@gmx.de>
References: <200708122325.07259.deller@gmx.de>
	<119aab440708140646m496a74f0r9d3425ccc3e4df30@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440708140646m496a74f0r9d3425ccc3e4df30@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 14 August 2007, Carlos O'Donell wrote:
> > Below is a patch against strace-4.5.15 source package from sourceforge.
> > Maybe it's useful to some people here, although it's not cleaned up/correct at all yet.
> > Feedback/corrections (esp. for the new syscalls >= 295) are welcome, because I only focused on statfs64()/fstatfs64() at this moment.
> 
> That's awesome! Please send it upstream, even it they ignore you,
> atleast the patch will appear in the archives. I'm sure debian would
> take a half-clean patch against strace as long as it only effected
> hppa.

FYI - I've just submitted a more correct version of my patch upstream:

- upstream version of strace (syscall table patch):
http://sourceforge.net/tracker/index.php?func=detail&aid=1774308&group_id=2861&atid=302861

- upstream version of strace (shmat() syscall patch):
http://sourceforge.net/tracker/index.php?func=detail&aid=1774313&group_id=2861&atid=302861

- debian:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=437928

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
