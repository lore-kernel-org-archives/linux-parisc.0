Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx05.cluster1.charter.net (dc-mx05.cluster1.charter.net [209.225.8.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57B714829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 20:00:41 -0600 (MDT)
Message-ID: <3D5EFFF7.30008@charter.net>
Date: Sat, 17 Aug 2002 22:01:27 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200
 machine.
References: <3D5EB2D6.9090403@charter.net> <20020817223713.GA25852@gate450.dyndns.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I tried your suggestions and built a new kernel, but
it still behaves as it did prior to the modification.


To summarize (with eepro100 in PCI slot ):

  - can ping using a dotted quad
  - cannot ping using dns
  - can ftp login to another machine on my LAN
  - when I try to list files or download it locks up.

Onboard tulip and LASI ethernet devices seem to have died.

This is a major headache. I don't believe that the Debian 3.0
cdrom will boot on the C200, and without network I can't
upgrade the 0.9.3 cdrom. Its a catch-22!



Andreas Seltenreich wrote:
> Hi,
> 
> just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
> I got mine working that way.
> 
> Regards,
> andreas
> 
> * B. Douglas Hilton <bdhilton@charter.net> [2002-08-17 22:32]:
> 
>>Hello list. For some reason my onboard LAN devices
>>all mysteriously died and disappeared from the
>>firmware, so I purchased an eepro100 card to try
>>and get some networking connectivity back.
>>
>>When I modprobe eepro100 it seems to be ok. I can
>>do an 'ifup -a' and then ifconfig lists my eth0
>>and it appears to be configured properly. I can
>>ping other servers in my LAN, and I can do an
>>ftp login, but as soon a I type "ls" it goes out
>>to lunch and locks up.
>>
>>Likewise I can ping numeric ip's on the internet,
>>but name resolution is not working.
>>
>>Could this be an endianness problem? Any ideas?
>>
>>Any tips on how to reactivate the onboard ether
>>devices would be greatly appreciated too.
>>
