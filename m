Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18C474A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 02:47:36 -0700 (MST)
Sender: plattner@dns2.dot.at
Message-ID: <3A7D2523.FEAB88F3@dot.at>
Date: Sun, 04 Feb 2001 10:47:15 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: zhao <qzhao@nc.rr.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 712/100 problem
References: <39F1CE0C.B9C2A9A2@nc.rr.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Do you have a wrong DATE on your machine !!

Don't worry about the long time of having a bloack screen !
Two point have to be considered.
(1) On my 720/50 it takes near one minute, before the monitor began to
show the three basic colors red/green/blue as test, before text is
comming.
On reason for such a long time is the memory test....

(2) If your machine is configured using the serial console and if it
does not automatic boot, then you will never see any output on the
screen.
For this connect a terminal (emulation) like `minicom' or 'hyper
terminal'
to the first serial port with 9600,8,n,1 and wait, if there is coming an
output,
but this can also take up to one minute...

I hope this helps
	Christoph


zhao wrote:
> 
> I am a newbie to HP world.  Just bought a
> HP 712/100. I connected it with a standard PC keyboard & mouse, 17" HP
> Ultra 1280 monitor.
> I didn't see anything on the screen, and the power led flashs
> at about twice a second.
> BTW, I used a 3.2G quantum internal SCSI drive, no floppy.
> 
> I got linux runing on sparc & Dec machines, realy want to explore
> another platform.
> Please help me.
> 
> Thanks,
> 
> zhao
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
