Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailrx.uk.wmmercer.com (unknown [193.131.189.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9323C482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jul 2001 09:07:19 -0600 (MDT)
Message-ID: <99F41EF55D11D511818600D0B74749C496F43A@wchrntms01.uk.wmmercer.com>
From: "Scammell, David" <David.Scammell@uk.wmmercer.com>
To: 'Richard Hirst' <rhirst@linuxcare.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 715/33 disk and kernel make dep problems
Date: Fri, 27 Jul 2001 16:04:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>


> -----Original Message-----
> From: 'Richard Hirst' [mailto:rhirst@linuxcare.com]
> Sent: 27 July 2001 14:26
> To: Scammell, David
> Cc: 'parisc-linux@lists.parisc-linux.org'
> Subject: Re: [parisc-linux] 715/33 disk and kernel make dep problems
> 
> 
> On Wed, Jul 25, 2001 at 04:52:54PM +0100, Scammell, David wrote:
> > Will try that tonight.
> > 
> > I managed to compile 2.4.6-pa21 out of cvs a few days ago,
> > same problem. A new version of make came down from debian
> > a few days ago which may of helped the make dep problems,
> > however it still stops, the scsi problems may affect make
> > dep possibly, even though i'm compling over nfs.
> > 
> > I've not had time to change the sync speed between crashes
> > but i'll get there.
> > 
> > Sorry there is no oops yet, I'm using an X terminal with
> > the serial line plugged in for the console.
> > 
> > BTW 2.4.6-pa21 does not appear to listen for console input,
> > at least not during the interactive fsck phase following a
> > crash, did that break recently?
> 
> There are some problems with console input atm.  Graphical console
> k/b doesn't work on several machines, and when I tried a 2.4.6 based
> installer the other day with serial console, the k/b was dead at
> the start of stage two install (could have been the installer had
> just crashed, of course).
> 
> I'll be trying to track down the serial console problem with the
> installer next week.
> 

The kernel command option you gave me, simxxxx, appeared to
work last night. Am I switching off disconnects, I've not 
looked at the source?

However it occured to me this morning that
serial console input worked last night at run level 2, using 
the same kernel as above, I never noticed as I typed using it. 

Graphical console has never worked for me over the last two
weeks since getting installed (even with a getty attached to 
tty0 :), keyboard has always appeared dead.

Still having make dep problems, I may investigate which version of make
i'm using this weekend.

The 715/33 is surprisingly spritely with 48MB of ram, not bad for oldie.

regards
Dave

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
