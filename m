Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id 56BE6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 19:26:10 -0700 (MST)
Date: Thu, 10 Jan 2002 21:24:23 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: Sorin Ghinescu <sghinesc@columbus.rr.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712/80 - 7cdroms - scsi prbl 
In-Reply-To: <20020110184532.9876E37D2B@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.33.0201102123200.22257-100000@bob.ncssm.edu>
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


I've had this happen too, but it was on a Sun Ultra 30. The problem was
that the computer didn't recognize the CDROM correctly. Trying a different
cdrom may fix the problem... It did for me.

-phil




On Thu, 10 Jan 2002, Matt Taggart wrote:

>
> "Sorin Ghinescu" writes...
>
> > Hi guys,
> > I'm trying to install parisc-linux on 712/80.
> > I don't know if this is actually an OS problem or a hardware problem but
> > you may have experienced it and could help me.
> > I'm booting from my external cd-rom but it seems that the kernel is
> > fooled by something because it creates 7 cd-rom devices for all the scsi
> > targets available leaving no room for the hd. If I switch the cd-rom off
> > then I get 7 hds!
> > Has anyone experienced this?
>
> Check and make sure that none of your scsi ids are conflicting, don't
> forget the controller is at id 7. Also check your cables and termination.
> If it still doesn't work try a different hard drive.
>
>

-- 
===============================================================================

Phil Anderson
UNIX Systems Administrator
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
