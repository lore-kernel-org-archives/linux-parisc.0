Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA22661
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 May 2000 04:26:24 -0600
Message-ID: <20000522102603.29296.qmail@web509.mail.yahoo.com>
Date: Mon, 22 May 2000 03:26:03 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] 715/50 hang - more info
To: Richard Hirst <rhirst@linuxcare.com>, Chris Snow <csnow@julian.uwo.ca>
Cc: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard,

great work: for the first time I was now able to boot
using a NFSROOT filesystem on my 715/33. Everything
works well until the sash shell prompt.

So device support for my 715/old is nearly complete:
serial console works well and SCSI has been tested
using a HP DAT drive. Putting a real ext2 fs on a SCSI
disk is a bit complicated for me because I do not have
direct access to a Linux PC with a SCSI board. But I
will test this real soon and report back.

Ulrich 


--- Richard Hirst <rhirst@linuxcare.com> wrote:
> Hi,
>   I have just committed changes to
> drivers/net/lasi_82596.c and
> drivers/gsc/lan.c.  Fairly big changes to
> lasi_82596.c, partly
> just tidyup, partly improvements to cache handling. 
> It is still
> not perfect but is a _lot_ better than it was.  The
> change to
> lan.c was to use a different probe function on older
> h/w (like
> my 715/75), where we need to swap the MPU_PORT, as
> per the message
> from prumpf.  If the driver seems completely dead
> for you, try
> enabling/disabling that word swap, and please let me
> know that
> you needed to.
> 
> All success or failure reports welcome :-)
> 
> Richard
> 
> 
> On Thu, May 18, 2000 at 08:31:56AM -0400, Chris Snow
> wrote:
> > > I had the same problem on my 715/33 with
> lasi_82596.c.
> > > I emailed Helge Deller who made the last changes
> to
> > > this driver and he told me that there seems to
> be the
> > > problem that not all interrupts from the i82596
> are
> > > delivered to the interrupt routine. The result
> of this
> > > is that all 16 xmit buffers will get filled and
> then
> > > the kernel hangs.
> > 
> > That's what I came up with as well.
> > 
> > > He also told me that he will have no time until
> 23rd
> > > of May (approx.) to find the reason for this and
> to
> > > correct it. So right now there is no way to use
> > > NFSROOT on a 715/old.
> > 
> > Well, I'm going to keep playing with it over the
> next few days, although
> > I'm not sure if I'll have any success...
> > 
> > If I succeed in fixing anything, I'll be sure to
> let everyone know.
> > 
> > 
> > Thanks,
> > 
> > 
> >      Chris
> > 
> >
>
---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.
> > 
> > 
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
