Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E92F49F9
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 13:02:31 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F1@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'Richard Allen'" <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Status of hp-ux binary compatibility?
Date: Fri, 28 Sep 2001 14:02:09 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Ah, thanks!... wonder why it got enabled since I told it no on dhcp...
Weird. (I'm not a debian user, so some of it's ways of doing things are a
bit odd to me.)

-- Nathan

> -----Original Message-----
> From: Richard Allen [mailto:ra@hp.is]
> Sent: Friday, September 28, 2001 1:31 PM
> To: Nathan Neulinger
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
> 
> 
> On Fri, Sep 28, 2001 at 12:35:26PM -0500, Nathan Neulinger wrote:
> > I just started looking at PA-RISC linux 0.9.2 on a J210 
> (which installed 
> > great on a narrow scsi drive, but didn't see the internal fw). Only 
> > problem I've seen so far is that it is spitting out 
> ip_local_deliver bad 
> > loopback skb: PRE_ROUTING LOCAL_IN messages on the console 
> for the lo 
> > device.
> > 
> 
> I got rid of that message by killing the dhcp client daemon.
> 
> 
> -- 
> Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX 
> Certified Admin.
>                --  Solaris 7 Certified Systems and Network 
> Administrator.
> Bell Labs Unix --  Reach out and grep someone.
> Those who do not understand Unix are condemned to reinvent it, poorly.
> 
