Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F2A54829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 18:25:05 -0600 (MDT)
Message-ID: <3D8281F4.F03A2007@gmx.at>
Date: Sat, 14 Sep 2002 02:25:24 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
References: <3D825FDF.CD6E8CE2@gmx.at> <1031962399.930.17.camel@beavis>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: MUX driver on E55
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

Hello,

if it is possible, send the code to me (perhpas I can
have a look @ week end.

Is it possible to geht the HP-UX driver codes for those
to things ? MUX + SCSI ?

I was offered to sign a NDA, but then nothing happens ...
It would be more easy for me to read such original HP-UX
code. Perhaps you see a possibility to send it also.

Have a nice week end

Christoph



Ryan Bradetich wrote:
> 
> On Fri, 2002-09-13 at 15:59, Christoph Plattner wrote:
> > Hallo Ryan !
> >
> > Congratulation, your MUX driver on port 0 is really
> > working on my machine !!
> 
> Glad to hear that!
> 
> > What do you miss to support the other lines ?
> 
> I am not sure, I've never tried to hook up additional
> lines.  I do have an 8-port MDP somewhere, I'll look
> for it here shortly, and see if I can hook it up.
> 
> > Have you already knowledge of the data structure ?
> 
> Just what I have added into the driver.  If there is
> something that we are obviously missing, I can go back
> and reference the HP-UX mux driver and see what is
> missing.
> 
> > Can I help you here in the code ?
> 
> Please! :)  I do not use multiple lines currently ...
> I only use the line 0, so any testing, optimizing, etc
> is greatly appreciated!
> 
> > Another point: you mentioned the skeleton of the
> > SCSI SPIFI driver. Where can I find that ? I only
> > found a NetBSD code, which I will use as functional
> > template, but I do not know, if this would be enough.
> > Can you give me a hint in this point ?
> 
> I have it on my local system.  It is _very_ ugly at this
> point.  I have got enough to query information from the
> spifi chip, register an interrupt, etc... but currently
> I can not get the spifi chip to actually generate an
> interrupt.
> 
> I would be happy to send you a copy when I get back next
> monday (unless you catch my in the next hour or so), but
> I'm not ready to check it into CVS yeah until I get rid
> of the some ugly hardcoded hacks, global variables, etc.
> Right now the driver is really coded to gather info from
> the ESIEE E35 that I have been testing on.  Once again,
> I do not have any docs on the chipset, I am using both
> the NetBSD and HP-UX drivers as reference. :(
> 
> The driver should be easy to modify for your specific E55,
> but not sure if you are interested in that level of work,
> messyness now.  I promise it will get much better :)
> 
> Thanks,
> 
> - Ryan
> 
> > Christoph
> >
> >
> > --
> > -------------------------------------------------------
> > private:      christoph.plattner@gmx.at
> > company:      christoph.plattner@alcatel.at
> >

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
