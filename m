Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 689AC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 10:08:43 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id MAA32053
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 12:08:25 -0400
Message-Id: <200109281608.MAA32053@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] puffin, parisc-linux.org slow/dead? 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 28 Sep 2001 12:08:24 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> I'm trying to do a CVS update of my kernel source, but puffin is
> decidedly non-responsive (or is the CVS repository perhaps mirrored
> somewhere else?).
> 
> From my own machine:
> 
> PING puffin.external.hp.com (192.25.206.4): 56 data bytes
> 64 bytes from 192.25.206.4: icmp_seq=0 ttl=239 time=17262.6 ms
> 64 bytes from 192.25.206.4: icmp_seq=1 ttl=239 time=17236.5 ms
> 64 bytes from 192.25.206.4: icmp_seq=2 ttl=239 time=17231.7 ms
> 64 bytes from 192.25.206.4: icmp_seq=3 ttl=239 time=17246.6 ms
> 
> I don't get any response from via my SourceForge account. Is NIMBA
> bogging down HP or something? :-)
> 
> Regards,
> 
> Albert

Hi Albert and others!

For the last 4 days I was unable to traceroute www.parisc-linux.org and
puffin, not talking about downloading something from them. Tracerout
dies somewhere in Qwest:

16  atl-edge-17.inet.qwest.net (205.171.21.186)  132.280 ms  131.226 ms  131.866 ms
17  65.112.33.30 (65.112.33.30)  134.950 ms  134.708 ms  137.191 ms
18  * * *

It is very annoying and I am not sure, whether I can do anything about it.

Best regards,

Jurij.
