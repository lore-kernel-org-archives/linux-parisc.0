Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (pD955D0F8.dip.t-dialin.net [217.85.208.248])
	by dsl2.external.hp.com (Postfix) with ESMTP id A26954829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 21:12:42 -0600 (MDT)
Date: Sun, 18 Aug 2002 05:12:28 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine.
Message-ID: <20020818031227.GA32603@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net> <20020817223713.GA25852@gate450.dyndns.org> <3D5EFFF7.30008@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D5EFFF7.30008@charter.net>
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

* B. Douglas Hilton <bdhilton@charter.net> [2002-08-18 04:01]:
> I tried your suggestions and built a new kernel, but
> it still behaves as it did prior to the modification.

Just to be sure, you did rebuild the eepro100 module too?

I'm using the nic for hours now and it is working perfectly.

> To summarize (with eepro100 in PCI slot ):
> 
>  - can ping using a dotted quad
>  - cannot ping using dns
>  - can ftp login to another machine on my LAN
>  - when I try to list files or download it locks up.

With the original module (2.4.19-pa2) I wasn't able to receive ip packets
larger than approx 150 bytes. For example a ping -s 100  went through
while ping -s 200 didn't. 

> This is a major headache. I don't believe that the Debian 3.0
> cdrom will boot on the C200, and without network I can't
> upgrade the 0.9.3 cdrom. Its a catch-22!

Btw. the diff was from 2.4.19-pa2. Maybe there have been other changes
if you are using an older kernel.

The address of the maintainer Andrey V. Savochkin <saw@saw.sw.com.sg>
seems to be broken. So no help from there.

regards
andreas
