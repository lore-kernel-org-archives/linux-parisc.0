Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id C858A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 08:46:16 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 79BADB007; Fri,  8 Jun 2001 15:42:29 +0100 (BST)
Date: Fri, 8 Jun 2001 15:42:29 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Michael S . Zick" <mszick@pflash.com>
Cc: Mike Werneke <mikewerneke@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Message-ID: <20010608154229.S16532@linuxcare.com>
References: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com> <01060809135000.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060809135000.00472@wolf01.my.home>; from mszick@pflash.com on Fri, Jun 08, 2001 at 09:05:56AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 09:05:56AM -0500, Michael S . Zick wrote:
> Hi Mike
> & Everyone
> 
> Try this:
> 
> Do a manual boot - so that you: boot xxxxxx IPL
> 
> Using the command line editor built into IPLBOOT -
> Change the:: console=tty0 entry
> To: console=ttyB
> Proceed with boot.
> 
> Expect: Boot should proceed normally, until -
> you get a message about "unable to open initial terminal"
> 
> If such is the case, then your model 735 is affected by a
> problem reported for other models.  
> Please post your results - the more model specfic
> information availabe for the people working the problem,
> the better.
> 
> At this point, kernel should be running and responding to
> other points of access (such as over the network).

I don't see how this helps at all for people trying to install
from the ISOs.  True the kernel might continue to boot it you set
console=ttyB, but it is hardly going to respond to the network.
It hasn't been given an IP address, isn't running inetd, etc.

If you were to create a configured system somehow (on nfsroot
perhaps) you might be able to boot and access the system via
the network.

Richard
