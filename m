From: j.raspe@t-online.de (Johannes Raspe)
Subject: No keyboard repeat (was: [parisc-linux] No "#/'" and "<>|" keys with german HIL-keyboard)
Date: Sun, 31 Oct 2004 21:25:22 +0100
Message-ID: <200410312125.22181.j.raspe@t-online.de>
References: <200410311421.17271.j.raspe@t-online.de> <200410311835.53401.j.raspe@t-online.de> <200410311920.33777.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <j.raspe@t-online.de>
In-Reply-To: <200410311920.33777.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

great work! The keys are working fine now. Many thanks for the fast help! J=
ust=20
one other little problem: the keypresses are not repeated (console and X). =
I=20
tried "kbdrate" but this does nothing.
Is this a kernel related or a configuration problem?

Regards Johannes

Am Sonntag, 31. Oktober 2004 19:20 schrieb Helge Deller:
> On Sunday 31 October 2004 18:35, Johannes Raspe wrote:
> > > On Sunday 31 October 2004 14:21, Johannes Raspe wrote:
> > > > after successfully moving to kernel 2.6.x-series with great help fr=
om
> > > > Helge Deller I'd like to report a problem wich is also present in
> > > > 2.4.x-kernels: with my german HIL-keyboerd on a 735/125 the keys for
> > > > "#/'" (between left shift-key and the "y"-key) and "<>|" (between
> > > > Return and the german "=E4"-key) give absolutely no response to the=
 OS.
> > > > I tried "showkey" on a text-console and nothing happens when pressi=
ng
> > > > these two keys. Every other key gives an output.
> > >
> > > please apply the following patch and send me the documented
> > > console-output for the corresponding keys.
> >
> > Output for "<"-key:
> > HIL_POL_CHARTYPE_SET1: 118
> >
> > Output for "#"-key:
> > HIL_POL_CHARTYPE_SET1: 116
>
> please try the attached patch.
> Helge

=2D-=20
Johannes Raspe - j.raspe@t-online.de
GnuPG-Key ID: D342E105
=46ingerprint: D681 F800 FB2D 913E D14C 1F17 C3DB B1F1 D342 E105
