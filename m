From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re:[parisc-linux] crash without pim info
Date: Fri, 12 Aug 2005 17:56:19 +0200
Message-ID: <IL49LV$B7B9D6A0708F34916FC37BB7E17057B0@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "b.gunreben" <b.gunreben@web.de>
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

> 
> Hi,
> 
> when trying to setup a chroot system for compiling packages, my C3600 j=
ust
crashes with 
> 
> Kernel panic - not syncing: BUG!
> 
> when I try to use the SysRq, I just do not get any output:
> 
> SysRq : HELP : loglevel0-8 reBoot tErm Full kIll saK showMem Nice showP=
c unRa
> w Sync showTasks Unmount 
> SysRq : Show State
> SysRq : Show Memory
> SysRq : Show Regs
> SysRq : Resetting
> 
Sorry no clue about SysRq...

> What i do then, is reboot and check the pim info: All fields are just 0=
.
Afaik piminfo fields are only fill in when a hpmc (High Priority Machine
Check) occures (on hpux generaly when an unexpected hw failure occures) o=
r you
 trigger a TOC (Transfer Of Control). So all zero would just mean that no=
 hpmc
occures.

> The problem seems to be related to a newly compiled glibc (glibc from C=
VS,
built with gcc4 (gcc version 4.0.2 20050720))
Yes it seems to be confirmed (eventhought with a kernel 2.6.11 it works
without pb???)

> that I want to use in the chroot system. I already upgraded the kernel =
to
kernel 2.6.13-rc6-pa1 (compiled with gcc version 3.3.5).
> 
> Does anyone have a hint, how I possibly could get some more information=

about this problem? 
> 
No idea, sorry?

Joel=0A=0A---------------------------------------------------------------=
=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore=
 info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
