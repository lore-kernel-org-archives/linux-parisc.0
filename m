Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id IAA30231
	for <parisc-linux@sod.res.cmu.edu>; Tue, 20 Apr 1999 08:10:08 -0400
Message-ID: <19990420081006.O24095@cmu.edu>
Date: Tue, 20 Apr 1999 08:10:06 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: Tor Arntsen <tor@spacetec.no>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CVS has moved!
References: <adevries@redhat.com> <199904200945.LAA31742@pallas.spacetec.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199904200945.LAA31742@pallas.spacetec.no>; from Tor Arntsen on Tue, Apr 20, 1999 at 11:45:03AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Apr 20, Tor Arntsen wrote:
> Now a problem: 
> cvs server: failed to create lock directory in repository `/home/cvs/parisc/linux/arch/parisc/hp/kernel': Permission denied
> cvs server: failed to obtain dir lock in repository `/home/cvs/parisc/linux/arch/parisc/hp/kernel'
> cvs [server aborted]: read lock failed - giving up

I've fixed this for now, and I see why it happened.  Thanks for
letting us know.

-Phil

------------------------------------------------------------------
"In film you will find four basic story lines. Man versus man, man
versus nature, nature versus nature, and dog versus vampire."
        - Steven Spielberg
