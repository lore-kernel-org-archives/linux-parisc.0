Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14463482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 16:04:19 -0700 (MST)
Message-ID: <3BF98FEE.CC8F4EB3@gmx.at>
Date: Tue, 20 Nov 2001 00:04:14 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Thomas Marteau <marteaut@esiee.fr>,
	grundler@puffin.external.hp.com, ryan_bradetich@uswest.net,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status - ADDENDUM TO DRIVER
References: <3B4396D8.9A33414F@gmx.at> <3BF4E38C.D59603FE@esiee.fr> <3BF98AD5.9BCB6861@gmx.at>
Content-Type: text/plain; charset=us-ascii
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

Here a thing to note ....

The PDC tty driver should never be used as module, this would not make
any sense. So the `init_module' routines at the end should be deleted.

The driver was never tested as MODULE !!
The console is further nedded, before any module can be loaded !!

Bye
Christoph 


Christoph Plattner wrote:
> 
> Hallo Thomas,
> hallo Grant,
> 
> finally the CVS was working again.
> 
> I have no login for your CVS so I will send the `cvs diff -u' and the
> newly
> added file `drivers/char/pdc_drv.c'.
> 
> Some notes here:
> 
> * In my console drivers (serial and PDC) I always added code, that the
> machine
> can be resetted via `^\' (Ctrl-\) for development (especially for
> machines
> without reset button as the E55 server). I removed this code for sending
> the
> CVS diffs.
> 
> * There is no CONFIG_ stuff for the PDC console, the console is
> initialised
>         in `arch/kernel/pdc_cons.c' (EARLY_BOOTUP_DEBUG) and the tty driver
>         has a __init constructor routine.
> 
>   ATTENTION: It is very important to have the init code in the
> pdc_cons.c
>         executed before the ttyBn driver is used, otherwise the first access
>         to the PDC driver (echo hallo > /dev/ttyB0) leads to a blocking
>         machine ....
> 
>   The driver can also be used on machines running true serial console,
>         by `echo hallo > /dev/ttyB0'. But the mix on the serial console
>         of ttyS0 driver and ttyB0 driver is not recommended !!
> 
> * The driver as console is only tested on the server E55 (model
> 9000/856)
>         and the HP apollo 700 series (9000/720/50), in both cases the
>         machine was configured to use the serial line.
>         Further I tested the kernel on a 712/60 machine, having PDC console
>         on STI device. Here the PDC console is used correctly, but then
>         the console switches to the colored frame buffer (and the text is
>         completly BLUE (!) and is overwriting the poor TUX !
>         I think here is a bug in the console handling not staying on the
>         configured device (has nothing to do with my stuff) or it is a
>         feature ti have full STI support if it possible ...
>         But /dev/ttyB0 is never used together with an STI able machine .. :-)
> 
> * I added the `CP:' to my modules or `XXX CP:' if there is something to
> do ...
> 
> * As I cannot checkin, I have no way to give change logs, so I will do
> here
> a short list:
> 
> - pdc_drv.c: Added file, PDC console tty driver for linux, /dev/ttyBn,
>         n=0 (only)
> 
> - pdc_cons.c: Added keyboard polling routine, added an function entry to
> get
>         an device entry for the console driver to "connet" the pdc_cons
>         driver to the PDC tty driver
> 
> - pdc.h: Added prototypes used for console and LEDs
> 
> - firmware.c: Added reading access to the PDC console (was former used
> for
>         waiting on a keypress), readded the pdc_chassis_disp () (was removed
>         in the meantime, but at the current state I use it for the E55 LEDs).
> 
> - led.c: Added a "trial" version of a LED controlling. Only RUN and
> ATTENTION
>         LED is supported. RUN/ATTENTION stated derived from state of the
>         HEART-BEAT LED (flashing->RUN, off->ATTENTION), and so the LEDs are
>         also accessable via PROC-FS. The LED activation of my routines is
>         derived from the model name (hard coded 9000/856) for my tests.
>         How to deal with this in the future ?
> 
> - major.h: Added free major 30 (character device) for PDC console
> (ttyBn).
> 
> - drivers/char/Makefile: pdc_drv.o added (per hack) to arch PARISC
> dependent code.
> 
> The code builds warning-free.
> 
> Again to test:
> 
> 1. Compile and have a look that the pdc_drv.o is included in
> drivers/char/Makefile
> 2. dev entry /dev/ttyB0 c 30 0
> 3. /etc/inittab, have a login at ttyB0
> 4. Added the `ttyB0' device to /etc/securetty, if you want login as
> `root' on the
>         console
> 5. kernel line parameter with `console=ttyB0'
> 
> (ad 1): In the future (if somebody can help me) we want to have a config
> item in
> the kernel configuration for the PDC console.
> 
> I attch two files:
>         - linux-cvs.diff-20011119.log
>                 Diffs displayed by `cvs -z9 diff -u .'
>         - pdc_drv.c
>                 The new file (simple displayed as `? drivers/char/pdc_drv.c')
>                 The file has to be checked in at `drivers/char'
> 
> I hope you can use it and will add it to the mainstream kernel ...
> 
> Bye
> Christoph P.
> 
> Thomas Marteau wrote:
> >
> > Hi Christoph,
> >
> >         I am updating our list of working hardware. Could you tell me if you
> > know something about the status of PA/Linux on E55?
> >
> > Thanks for your answer, Thomas.
> > ESIEE Team
> 
> --
> -------------------------------------------------------
> private:        christoph.plattner@gmx.at
> company:        christoph.plattner@alcatel.at
> 
>   ------------------------------------------------------------------------
-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
