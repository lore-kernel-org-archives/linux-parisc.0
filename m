Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA04234
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 12:30:17 -0600
Message-Id: <199906251829.OAA10213@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] make dep not working on HP-UX
To: Ulrich.Strelow@Schering.DE
Date: Fri, 25 Jun 1999 14:29:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <C125679B.00577445.00@BE2314.schering.de> from "Ulrich.Strelow@Schering.DE" at Jun 25, 99 05:55:04 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Change the Makefile to use ./include instead of $(TOPDIR)/include for
the FINDPATH.  This shortens the arg list and make dep will work.

> 
> 
> 
> I have had a similar problem on our production HP-UX systems. Running ls *
> on a directory with a lot of files gives
> ksh: /usr/bin/ls: arg list too long
> 
> To solve this problem you need to set the HP-UX kernel parameter
> large_ncargs_enabled  1
> and rebuild the HP-UX kernel.
> 
> Here is the information from HP Electronic Support Center:
> 
> Problem Description
> 
> What is the impact of changing the kernel parameter
> "large_ncargs_enabled" from 0 to 1?
> 
> What is the meaning of this parameter?
> 
> Configuration Info
> 
> Operating System - HPUX
> Version-
> Hardware System - HP 9000
> Series -
> 
> Solution
> When large_ncargs_enabled is set to "1", it increases the default
> "environment size" (the memory set aside to be your login
> environment - to hold your PATH variable, etc.) from 20478 to
> 2048000. SAM doesn't have any info about this parm or any max/minvalue.
> 
> If you have been having trouble using an "rm *" on really big
> directories (it was running out of environment space), the command
> will work when you set it to 1.  Regarding system performance, it
> will eat up extra memory (2 M vs. 20 K), but if you don't have too
> many users and you have plenty of RAM, it shouldn't be a problem.
> 
> Ulrich
> ---------------------------------------------
> Ulrich Strelow
> <ulrich.strelow@schering.de or
> ulrich_strelow@yahoo.com>
> Berlin, Germany
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
