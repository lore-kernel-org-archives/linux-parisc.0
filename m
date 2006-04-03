From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Mon,  3 Apr 2006 14:20:28 +0100
Message-ID: <IX5EE4$B82FAF05A54333ABE2C2402D14E4436C@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

> 
> 
> Helge Deller wrote:
> > On Sunday 02 April 2006 13:18, Joel Soete wrote:
> > 
[snip]
> > 
> >>PS: btw, rm CONFIG_DETECT_SOFTLOCKUP in the config doesn't help on th=
is
system ;<(:
> >>still hanging (this time without Softlockup msg) after only:
> >>top - 09:04:58 up 1 day, 16:26,  3 users,  load average: 2.40, 2.26, =
2.20
> > 
> > 
> > I think the softlockups don't really matter.
> > Does your box hangs without SMP as well ?
> > 
> well it did with b2k and n4k runing 64bit kernel with
CONFIG_DETECT_SOFTLOCKUP=3Dy && # CONFIG_SMP is not set
> 
> but I need to verify now without CONFIG_DETECT_SOFTLOCKUP.
> (sorry I couldn't do it now but tomorrow morming; ok?
> 
Unfortunately, this test (kernel 2.6.16-pa10 up and wiythout
CONFIG_DETECT_SOFTLOCKUP) finished earlier then expected: i.e. the system=
 also
hang up after just few hours of build loop ;<(

Joel=0A=0A---------------------------------------------------------------=
=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore=
 info on http://www.scarlet.be/
