Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA20789
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Oct 1999 12:52:05 -0600
From: dkennedy@thepuffingroup.com
Received: from grasshopper.thepuffingroup.com by mrelay.bellglobal.com
 (PMDF V5.1-12 #26722) with ESMTP id <0FJT00AAPB3K0O@mrelay.bellglobal.com> for
 parisc-linux@thepuffingroup.com; Mon, 18 Oct 1999 14:52:36 -0400 (EDT)
Date: Mon, 18 Oct 1999 14:59:34 -0400 (EDT)
Subject: Re: [parisc-linux] lasi Serial support
In-reply-to: <199910180537.WAA20422@rock.cup.hp.com>
To: Grant Grundler <grundler@rock.cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Message-id: 
 <Pine.LNX.4.10.9910181450550.14265-100000@grasshopper.thepuffingroup.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 17 Oct 1999, Grant Grundler wrote:

> But I mainly write to question the location of LASI serial port code.
> I don't know if it's "right" to have this code in lasi.c.  I'd like
> to understand if it is and why. I'm confused because Lasi SCSI support
> is in lasi7xx.c.  Is it reasonable to create a lasi_RS232.c (or whatever)?

The reason why it is in lasi7xx.c is because it is called from the
SCSI code and not from anywhere else.  There is no serial code which
goes through a possible list of serial device drivers trying each one.
It was placed in lasi.c to get it working.  I'm not sure exactly where
it is supposed to be either.

We had to do a nasty hack to get the serial console to work.  The
serial console is initialized much before the lasi initialization code
is called.  This should be fixed.  My suggestion was in the serial
console to mark the fact there is supposed to be a serial console, and
then in lasi.c actually initialize it.  I don't know any other way
around the fact that you have to initialize lasi before lasi serial
stuff.

The other idea I had was to create a function which would be called to
check if lasi is initialized.  This function would just return wether or
not it is.  From there, lasi initialization would be called.  The
reason why I think this is because we have a lot of lasi code which
isn't called from the lasi initialization routine (serial console,
scsi) and it would be nice to ensure that lasi is initialized before
_ANY_ of lasi gets used.  Having an implicit requirement that
lasi_init is called before the scsi code is, in my opinion, bad.
Explicitly checking to ensure that the lasi is initialized is better.

> And I'm thinking keeping the lasi.c/h files smaller is a good thing.
> One can also modularize the support better (ie put the ifdef in the
> Makefile instead).  Other thoughts on this?
> If it's the "right" thing to do, any volunteers?

Breaking it out into separate files sounds good to me.  The
initialization routine in lasi.c should call a function call for
initialize of each component of lasi one after another with ifdefs
around each function call.

Does anyone else have any other suggestions?

-- 
David Kennedy
The Puffin Group
