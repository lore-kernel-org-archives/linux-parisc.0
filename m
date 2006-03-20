From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A sti 2.6.16-rc5-pa2 build failure?
Date: Mon, 20 Mar 2006 21:46:01 +0100
Message-ID: <IWG1OP$EFF6BC6280873F13190EC29AE9C4990D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

> Hi Joel,
> 
> it builds for me...
> 
Strange but ...
> Helge
> 
> On Monday 20 March 2006 19:47, Helge Deller wrote:
> > Hi Joel,
> > 
> > did you tried a "make distclean", and "make oldconfig" ?
I just did a make clean (to save my .config) then the make oldconfig.
I just need to test again with distclean or from a clean dir (will advise=
).

> > And, are all your files up-to-date (cvs -z3 -q up) ?
No more cvs access but I grab the latest tarball 
(mmm but have the same pb at home with cvs src tree)

> > I'm wondering, since this header file does not do any IO...
> > 
though, I use to build my kernels into a output dir with KBUILD_OUPUT opt=
ion,
could it make the difference?

Thanks (I will come back asap),
    Joel
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/
