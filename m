Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailrx.uk.wmmercer.com (unknown [193.131.189.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7313C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jul 2001 09:55:51 -0600 (MDT)
Message-ID: <99F41EF55D11D511818600D0B74749C496F42B@wchrntms01.uk.wmmercer.com>
From: "Scammell, David" <David.Scammell@uk.wmmercer.com>
To: 'Richard Hirst' <rhirst@linuxcare.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 715/33 disk and kernel make dep problems
Date: Wed, 25 Jul 2001 16:52:54 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Will try that tonight.

I managed to compile 2.4.6-pa21 out of cvs a few days ago,
same problem. A new version of make came down from debian
a few days ago which may of helped the make dep problems,
however it still stops, the scsi problems may affect make
dep possibly, even though i'm compling over nfs.

I've not had time to change the sync speed between crashes
but i'll get there.

Sorry there is no oops yet, I'm using an X terminal with
the serial line plugged in for the console.

BTW 2.4.6-pa21 does not appear to listen for console input,
at least not during the interactive fsck phase following a
crash, did that break recently?

regards
Dave

> -----Original Message-----
> From: Richard Hirst [mailto:rhirst@linuxcare.com]
> Sent: 25 July 2001 16:27
> To: Scammell, David
> Cc: 'parisc-linux@lists.parisc-linux.org'
> Subject: Re: [parisc-linux] 715/33 disk and kernel make dep problems
> 
> 
> On Thu, Jul 19, 2001 at 03:22:18PM +0100, Scammell, David wrote:
> > 
> > Hi,
> > 
> > I installed with 9.2, no problems, updated with apt-get.
> > 
> > I'd like to build my own kernel to test out a disk problem I have.
> > 
> > When I attempt anything which would fill the scsi disk 
> queue with pending
> > writes
> > (e.g. tar xf kernel.tar), then machine hangs, I get some 
> messages on the
> > serial
> > console which I've not got them written down yet, but these 
> include a mount
> > read
> > only message. I'm using an old 2Gb disk (info not to hand, 
> I'm at work), but
> > no so
> > old it shouldn't handle tagged writes. I'd like to change 
> the queue depth
> > and bus
> > sync speed (looks like its set at 20Mhz, not 10Mhz) to see 
> if this makes a
> > difference.
> 
> Could you try with disconnect/reselect turned off?  Should be able
> to do that by booting with "sim700=nodisc:0xff".
> 
> Richard
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 


*************************** IMPORTANT NOTE **************************
The above information is confidential to the addressee and may be
privileged.  Unauthorised access and use is prohibited.  William M.
Mercer Limited is regulated by IMRO and the Personal Investment
Authority. Registered in London No. 984275 Registered Office: Telford
House, 14 Tothill Street, London SW1H 9NB
