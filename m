Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 481504831
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 05:53:48 -0700 (MST)
Subject: Re: [parisc-linux] 755/125 problems
From: Ryan Bradetich <ryan_bradetich@uswest.net>
To: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <a05100318b81dbd449750@[129.64.46.46]>
References: <a05100316b81d8d1c41f3@[129.64.46.46]>
	<1006107893.4898.5.camel@beavis>  <a05100318b81dbd449750@[129.64.46.46]>
Content-Type: text/plain
Date: 18 Nov 2001 22:18:51 -0700
Message-Id: <1006147131.4898.7.camel@beavis>
Mime-Version: 1.0
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

On Sun, 2001-11-18 at 12:34, Aaron Macks wrote:
> Ok, so the Root pw of HPUX has been fixed, thanks.  I was able to 
Glad to hear it :)

> unconfigure the ATM card and remove it from the eisa cage, but the 
> system still seems not to see the 10baseT AUI adaptor, no lights are 
> lit, not even the power one.
Hm... that doesn't seem right.  Have you tried a different AUI adapter?
sounds like faulty hardware somewhere :(

> As for SCSI, I have HPUX on a FW, but a N for Linux.  Will it be a 
> problem to have the FW drive installed, or Linux just ignore it?
> Aaron

Linux will just detect the Outfield Card, but non of the scsi drivers/
disks below it will be probed/detected.  Linux will safely ignore it.

- Ryan
