Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id B96CF4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 13:15:51 -0600 (MDT)
Message-ID: <3D823979.9CA0117E@gmx.at>
Date: Fri, 13 Sep 2002 21:16:09 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>,
	smithjames@comcast.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: OT HP-UX Formatting Scsi disks
References: <20020913062639.20473.qmail@web12503.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii
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

I hope the status will change soon. I also have an E55
and I use it under HP-UX. But I want to switch as fast
as possible to linux.

I can use the E55 now as diskless server (!), SCSI is
not working yet. But as I mentioned, I hope this will
change very soon !!

Christoph


Derek Engelhaupt wrote:
> 
> > try zeroing out the first few blocks:
> >
> > dd if=/dev/zero of=/dev/offending_scsi_drive bs=512 count=4
> 
> I've decided to load HP-UX on the E55 I've been playing with since
> Debian doesn't work very well on it right now.  I'm sending this OT
> because I need to know where dd lives on an HP-UX 11.11 box.  I'm in a
> limited shell and need an absolute path to dd to get it to accomplish
> the above.  It's so limited it won't even give me the ls command.  Any
> of you HP-UX guys out there?  Since I'm at home I don't have access to
> an HP-UX box at work.  Thanks.
> 
> derek
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! News - Today's headlines
> http://news.yahoo.com
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
