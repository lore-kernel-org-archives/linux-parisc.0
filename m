From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [parisc-linux] Re: [PATCH] missing exports
Date: Sat, 10 Jul 2004 11:09:34 +0200 (MEST)
Message-ID: <Pine.GSO.4.58.0407101107240.10242@waterleaf.sonytel.be>
References: <200310192126.23242@smurf.noris.de>
	<3F956F6D.9080803@linux-m68k.org>
	<1066936308.3338.16.camel@kars.perseus.home>
	<1066944872.3338.30.camel@kars.perseus.home>
	<Pine.LNX.4.44.0310240032470.17548-100000@serv>
	<1067083687.3876.17.camel@kars.perseus.home>
	<Pine.LNX.4.44.0310251514190.17548-100000@serv>
	<1067091946.3876.42.camel@kars.perseus.home>
	<Pine.LNX.4.44.0310252030410.17548-100000@serv>
	<1067288209.3591.1.camel@kars.perseus.home>
	<1085155984.5069.10.camel@kars.perseus.home>
	<Pine.LNX.4.58.0405230227360.10291@scrub.local>
	<1085347402.3690.1.camel@kars.perseus.home>
	<Pine.GSO.4.58.0405241034430.17985@waterleaf.sonytel.be>
	<1085517198.6880.26.camel@kars.perseus.home>
	<Pine.GSO.4.58.0405261015580.28417@waterleaf.sonytel.be>
	<1085597752.2373.6.camel@kars.perseus.home>
	<1089405759.2674.14.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Kars de Jong <jongk@linux-m68k.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1089405759.2674.14.camel@kars.perseus.home>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 9 Jul 2004, Kars de Jong wrote:
> On Wed, 2004-05-26 at 20:55, Kars de Jong wrote:
> > On Wed, 2004-05-26 at 10:16, Geert Uytterhoeven wrote:
> > > On Tue, 25 May 2004, Kars de Jong wrote:
> > > > the input device layer HIL keyboard driver working, etc... :-(
> > >
> > > Aren't some PARISC people working on that as well?
> >
> > Hmm, yes, apparently there is a PARISC patch for 2.6 which has a port of
> > the HP300 HIL driver to the input device layer.
> >
> > They also have a far more extensive HIL driver which handles the mouse
> > as well, but I'm not sure if the HIL in the later PARISC models is the
> > same as the HIL in the HP300 series on a device driver level. I'd have
> > to study the driver a little better.
>
> I have ported the PARISC HIL stuff to the HP300. Basically only the SDC
> driver needed to be changed a bit, all the rest was generic already.
>
> My kernel crashes if loadkeys is used (which I don't understand yet) but
> otherwise it seems to work a bit. The keyboard and mouse are properly
> detected, but when I read /dev/input/mice I don't get any events.
>
> What should I do with these files? Just add them to our repository, and
> worry about merging with the PARISC people later?

What about posting the patches to the Linux/m68k and Linux/PA-RISC lists?

> Oh, all of these are already present in the m68k-2_4 branch, although
> some of them have moved. How does that work in CVS?

CVS doesn't do move. You have to delete the file in the old place, and add it
at the new place.

> The following files are new for the HIL stuff:
>
> drivers/input/keyboard/hil_kbd.c
> drivers/input/keyboard/hilkbd.c
> drivers/input/misc/hp_sdc_rtc.c
> drivers/input/mouse/hil_ptr.c
> drivers/input/serio/hil_mlc.c
> drivers/input/serio/hp_sdc.c
> drivers/input/serio/hp_sdc_mlc.c
> include/linux/hil.h
> include/linux/hil_mlc.h
> include/linux/hp_sdc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
