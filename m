From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: New HIL drivers
Date: Sun, 13 Feb 2005 01:07:41 +0100
Message-ID: <200502130107.42267.deller@gmx.de>
References: <200502062245.42392.dtor_core@ameritech.net>
	<20050212191453.GA8952@ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-input@atrey.karlin.mff.cuni.cz,
 Dmitry Torokhov <dtor_core@ameritech.net>,
 parisc-linux@parisc-linux.org
To: Vojtech Pavlik <vojtech@suse.cz>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050212191453.GA8952@ucw.cz>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

- dropped from CC: "Brian S. Julin" <bri@calyx.com> (he is not very active on the HIL drivers any longer)
- added to CC: parisc-linux@parisc-linux.org (main parisc development mailing list)

Hi Vojtech,
Hi Dmitry,

First of all thanks a lot that you added the parisc HIL drivers to the linux-input tree.
Since the main development of the parisc tree happens in CVS at http://cvs.parisc-linux.org/linux-2.6 and since we usually stay in sync with Linus' latest bk tree, not all of the changes of the current linux-input tree are available for us as long as you didn't pushed your changes to him yet.
Additionally, the HIL sources you added are from november last year. Some of the problems have been fixed in the parisc cvs tree in the meantime.

On Saturday 12 February 2005 20:14, Vojtech Pavlik wrote:
> On Sun, Feb 06, 2005 at 10:45:42PM -0500, Dmitry Torokhov wrote:
> > I noticed that several new drivers for HP-PA have been added to the input
> > tree. I looked them over and have some concerns:
> > 
> > - hil_kbd and hil_ptr will not compile because now connect() methods
> >   return error codes, not void. Also, drivers should define ID table,
> >   and MODULE_DEVICE_TABLE, otherwise serio core will not consider them.

Yes, but only in your tree, not in Linus' yet. As soon as you push your tree up, I'll fix the issues and send you the diffs.

> > - there is no more serio->private, please use serio_get/set_drvdata.

Will do.

> > - using del_timer in drivers' exit routines is not safe (del_timer_sync
> >   should be used).

Will do.

> > - as far as I can see there is no need to do tasklet_disable before calling
> >   tasklet_kill.

Ok.

> > - having "return" after BUG() is pointless.
> > 
> > - what exactly the following fragment supposed to do?
> >
> > > static unsigned int hp_sdc_rtc_poll(struct file *file, poll_table *wait)
> > > {
> > >         unsigned long l;
> > > 
> > >         l = 0;
> > >         if (l != 0)
> > >                 return POLLIN | POLLRDNORM;
> > >         return 0;
> > > }

nothing :-)
Please just drop the hp_sdc_rtc.c driver for now - it's not working anyway.
We'll keep it in our parisc tree until it does something useful.

> > - formatting - according to CodingStyle functions' opening braces should
> >   be on the next line.

Will fix.

> I'm CC:ing Helge, who might know more, and tell us, when the issues will
> be fixed.

As soon as you push upstream, I'll fix the issues in our tree and send you the diffs. Would this be OK for you ?

Regards,
Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
