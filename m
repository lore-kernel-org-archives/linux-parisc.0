Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AAEF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 13:49:42 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0SL40p00410
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 13:04:00 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0SKmuF00966
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 12:48:56 -0800
Date: Tue, 28 Jan 2003 12:48:56 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] kernel hang.
In-Reply-To: <20030128050823.57726.qmail@web12507.mail.yahoo.com>
Message-ID: <Pine.LNX.4.33.0301281242350.235-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Ok, I could only wait 15 minutes or so before I bailed last night,   It
apparently came up though since it was at a screen saver {blank screen}
though the system wouldn't respond...

I rebooted it and watched, it did take about 20 minutes, and it did hang
afterwards here are the last few lines:

sr0: scsi-1 drive
Unifrom CD-ROM driver Revision 3.12
mice: PS/2 mouse common for all mice
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC: MLC: Registering the System Domain Controller HIL MLC.
HP i8042 SDC + MSM-58321 RTC support loaded (RTC v 1.10d)
Net 4: Linux TCP/IP 1.0 for NET 4.0

I had to type that by hand so please excuse any mispellings.

Should I have not added something {Maybe the RTC Supprt?} when I setup my
kernel?

On Mon, 27 Jan 2003, Derek Engelhaupt wrote:

>
> How long did you let it wait?  Some of the machines prior to the C200 (my C360 doesn't do it either) seem to hang, but after 20 mins take off.  It's a bus walk issue that takes forever.  There was a patch for this that was posted recently to see if it resolved this issue.  Let it sit there for awile and see if it eventually starts booting.
> derek
>  Sir Ace <chandler@nateng.com> wrote:
> I compiled 2.4.20, and set it up to boot from the new kernel.
> Unfortunately it hung, at the
> 'if this the last message you see' part...
> I can't find anything in the FAQ, and I didn't find anything in the bug
> liste... The machine is a J210, any ideas? Or what kind of info should I
> send?
>
> On Mon, 27 Jan 2003, Sir Ace wrote:
>
> >
> > Duh, I forgot that vmlinux gets dropped in /usr/src/linux...
> > my bad...
> >
> > On Mon, 27 Jan 2003, Sir Ace wrote:
> >
> > >
> > > Does vmlinuz work on hp?
> > >
> > > On Mon, 27 Jan 2003, Randolph Chung wrote:
> > >
> > > > > make boot doesn't work, and make vmlinux doesn't seem to be right
> > > > > either...
> > > > >
> > > > > What is the target for a kernel build?
> > > >
> > > > make vmlinux is the right target for harddisk boot. for network boot you
> > > > want make palo
> > > >
> > > > randolph
> > > >
> > >
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
> ---------------------------------
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now
