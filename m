Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx05.cluster1.charter.net (dc-mx05.cluster1.charter.net [209.225.8.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id E656C4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 21:32:24 -0600 (MDT)
Message-ID: <3D5F157A.7070207@charter.net>
Date: Sat, 17 Aug 2002 23:33:14 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200
 machine.
References: <3D5EB2D6.9090403@charter.net> <20020817223713.GA25852@gate450.dyndns.org> <3D5EFFF7.30008@charter.net> <20020818031227.GA32603@gate450.dyndns.org>
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

Yes I made a monolithic kernel, so it rebuilt eepro100.c

Prior, I was using a stock Debian vmlinux-2.4.18-32 kernel
so there is a good chance that the Debian packager had made
the same modification to the source.



Andreas Seltenreich wrote:
> * B. Douglas Hilton <bdhilton@charter.net> [2002-08-18 04:01]:
> 
>>I tried your suggestions and built a new kernel, but
>>it still behaves as it did prior to the modification.
> 
> 
> Just to be sure, you did rebuild the eepro100 module too?
> 
> I'm using the nic for hours now and it is working perfectly.
> 

Hmmm....

> 
>>To summarize (with eepro100 in PCI slot ):
>>
>> - can ping using a dotted quad
>> - cannot ping using dns
>> - can ftp login to another machine on my LAN
>> - when I try to list files or download it locks up.
> 
> 
> With the original module (2.4.19-pa2) I wasn't able to receive ip packets
> larger than approx 150 bytes. For example a ping -s 100  went through
> while ping -s 200 didn't. 
> 
> 
>>This is a major headache. I don't believe that the Debian 3.0
>>cdrom will boot on the C200, and without network I can't
>>upgrade the 0.9.3 cdrom. Its a catch-22!
> 
> 
> Btw. the diff was from 2.4.19-pa2. Maybe there have been other changes
> if you are using an older kernel.
> 

I guess I will try that one then. Thanks.

> The address of the maintainer Andrey V. Savochkin <saw@saw.sw.com.sg>
> seems to be broken. So no help from there.
> 
> regards
> andreas
> 
