Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEA2249F6
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 12:31:04 -0600 (MDT)
Date: Fri, 28 Sep 2001 18:31:01 +0000
From: Richard Allen <ra@hp.is>
To: Nathan Neulinger <nneul@umr.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
Message-ID: <20010928183101.A30103@hp.is>
References: <3BB4B4DE.8080608@umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BB4B4DE.8080608@umr.edu>; from nneul@umr.edu on Fri, Sep 28, 2001 at 12:35:26PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 28, 2001 at 12:35:26PM -0500, Nathan Neulinger wrote:
> I just started looking at PA-RISC linux 0.9.2 on a J210 (which installed 
> great on a narrow scsi drive, but didn't see the internal fw). Only 
> problem I've seen so far is that it is spitting out ip_local_deliver bad 
> loopback skb: PRE_ROUTING LOCAL_IN messages on the console for the lo 
> device.
> 

I got rid of that message by killing the dhcp client daemon.


-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
