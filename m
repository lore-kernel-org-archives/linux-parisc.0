Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from silly.cloud.net.au (c20042.eburwd1.vic.optusnet.com.au [203.164.66.244])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DFC6482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 14:35:14 -0700 (MST)
Date: Thu, 13 Dec 2001 08:35:11 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Install on a D370!
Message-ID: <20011213083511.B17000@silly.cloud.net.au>
References: <5.1.0.14.0.20011212111857.0263d110@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.0.20011212111857.0263d110@mail.magma.ca>; from herbr@magma.ca on Wed, Dec 12, 2001 at 12:01:45PM -0500
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

On Wed, Dec 12, 2001 at 12:01:45PM -0500, Herb Radford wrote:
> Yesterday I downloaded the 0.9.3-rc6.iso (it has the same md5sum as the 
> official version so I assume congruency) and have had exactly the same results!
> There is a FWSCSI card in the box with 6 drives attached and another card, 
> a "Remote Management/Access Port" card in HSC 0 Slot 0.
> I've seen a couple of messages about D350's which say all this stuff worked!
> 
> Does anyone have any suggestions?

I pulled out the access port card to get the D350 working; otherwise
I never saw any messages after the branching to kernel entry point
message, as you're seeing.

Unfortunately I never got a chance to get all the debug info that
Matthew wanted to sort this out.. the machine has been repossessed
for real work and is running HP-UX again.

On a completely different topic, I assume it's safe to apt-get upgrade
these days? All the tool chain problems etc have been solved?
I still have a 715/80 running fine.

cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
