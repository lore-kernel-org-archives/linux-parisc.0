From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Thu, 23 Mar 2006 09:38:48 +0100
Message-ID: <IWKO0O$128C4158D0A4D8C575A7AB0E1AE3EAAC@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "dave" <dave@hiauly1.hia.nrc.ca>,
 "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

> On Thursday 23 March 2006 00:49, John David Anglin wrote:
> > > > That's why I said I need to fix STIfb.... :-)
> > > 
> > > It's fixed now in CVS (2.6.16-pa2).
> > > Even X11 on stifb with 64bit kernel works...
> > 
> > Did this bug also affect 32bit kernels?  The reason I ask is I
> > had to back out using 2.6.16-pa0 on my c3k.  The most obvious
> > symptoms were fsck failures on reboot, iptables error messages
> > and unreliable behavior of gnome teminal.
> 
> The fixes I did was only related to virtually-mapped vs.
physically-addressed memory regions.
> So I don't think I changed anything special for a 32bit kernel if you d=
idn't
set CONFIG_HPPA_IOREMAP.
> 
> But I did booted yesterday the latest CVS 32bit Kernel on my c3k and it=

worked fine, so I assume you shouldn't see any problems either...
> 
mmm, just about gnome (i don't yet tested iptables) since midle of last d=
ec,
after an apt-get dist-upgrade, sudenly many gnome based app (firefox,
gftp-gtk, d4x, gnome-terminal, ...) running on a debian unstable _i386_ d=
id
segv (not yet fixed ;-( ). Fwiw, this seems to be an 'orphan' pb (i.e. ra=
re):
for me it only occures when the X server is the one of hpux-1100 and not =
with
another linux one (iirc X.org) (or even the solaris one :/).
Otoh, that give me the opportunity to test kde brotherhood tools (even
konqueror ;-) runing fine with a Ubuntu (drapper) installed actualy as a
vserver on my d380.

Hth,
    Joel
  =0A=0A---------------------------------------------------------------=0A=
A free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore in=
fo on http://www.scarlet.be/
