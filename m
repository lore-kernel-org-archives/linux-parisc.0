Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id FAA27465
	for <parisc-linux@sod.res.cmu.edu>; Tue, 20 Apr 1999 05:45:25 -0400
Message-Id: <199904200945.LAA31742@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Tue, 20 Apr 1999 11:45:03 +0200
In-Reply-To: Alex deVries <adevries@redhat.com>
       "[parisc-linux] CVS has moved!" (Apr 19, 22:24)
To: Alex deVries <adevries@redhat.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CVS has moved!
List-ID: <linux-parisc.vger.kernel.org>

On Apr 19, 22:24, Alex deVries wrote:
>For hopefully the last time, the parisc-linux CVS server has moved.  It is
>now at:
>
>:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
>(for anonymous read only access)
[..]

I was just about to ask on the list what was going on, thanks :-)
Now a problem: 
cvs server: failed to create lock directory in repository `/home/cvs/parisc/linux/arch/parisc/hp/kernel': Permission denied
cvs server: failed to obtain dir lock in repository `/home/cvs/parisc/linux/arch/parisc/hp/kernel'
cvs [server aborted]: read lock failed - giving up

I built a cross compiler on Irix a couple of weeks ago and assembed one
complete model 715 from a bunch of cannibalised ones.  I'm not sure if
I'll ever get time to contribute much, or anything at all (he says while 
looking at the too long powered-off MIPS Magnum clone under his desktop), 
so I won't make much noise on this list I think.  The next thing I wanted 
to do when I get some hours free however is to figure out how you guys 
intended to run the boot stuff.

`make depend' seems to work fine now with that little fix you made to the 
Makefile btw.

- Tor
