Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA25555
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jan 2000 01:55:50 -0700
Received: from [10.1.1.3] (helo=tele02.tunstall.co.uk)
	by gate-isdn.tunstall.co.uk with esmtp (Exim 2.12 #1)
	id 127abu-0002PM-00
	for parisc-linux@thepuffingroup.com; Mon, 10 Jan 2000 08:55:34 +0000
Message-ID: <51C39E66FF96D11194FCAA0004000304933CC5@tele02.localnet>
From: Mark Wild <M_Wild@tunstall.co.uk>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] Thanks...alot
Date: Mon, 10 Jan 2000 08:57:38 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>



> -----Original Message-----
> From: Ross J. Reedstrom [mailto:reedstrm@wallace.ece.rice.edu]
> Sent: Friday, January 07, 2000 5:34 PM
> To: Mark Wild
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Thanks...alot
> 
> 
> On Fri, Jan 07, 2000 at 09:52:30AM -0600, Eric Schnoebelen wrote:
> > 
> > Mark Wild writes:
> > - From: eric@cirr.com [mailto:eric@cirr.com]
> > - > 	You might check to see what interpreter is called out at
> > - > the top of /etc/rc.  If it's still /bin/sh, go verify what
> > - > /bin/sh points to..
> > - 
> > - How can I do that? I'm not familiar with all the options/commands
> > - of the hpux command from the ISL prompt.
> > 
> > 	I was suggesting you do that from a multi-user login
> > (assuming you've got one.. perhaps a rash assumption..)
> 
> Mark, you seem  to be in the same situation I was, witha similarly
> decommissioned 730 (academic leftover): no root, no account at all! It
> booted to a X/OpenVue login screen just fine, however. (Had to take it
> down hard with the toc switch, after that.)

Yep.

> Not knowing any of the HP-UX specific tricks, I fell back on a maxim
> from computer security: 'There is no computer security 
> without physical
> security.'
> 
> I yanked the boot HD, dropped it onto the SCSI chain of my linux box,
> used grep on the 'raw' block device as so:
> 
> grep -ba 'root:[^:]\{13\}:'
> 
> to find all occurences of something that looked like a root 
> passwd entry,
> with crypt()ed password, and fired up lde (Linux Disk Editor) 
> to change
> it to the hash for a password I knew. Worked great!  Strangely enough,
> I found 6 copies, with three different passwords.
> 
> Once logged in as root, I used the standard utilities to 
> change passwords
> again, just in case there was something I missed.

Thanks for that, it worked a treat. I didn't have lde installed
on my linux machine so I used dd to copy it to another hd doing
a search & replace on the root password.

Mark.
