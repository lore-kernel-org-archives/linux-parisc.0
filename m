Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zabbadoz.net (mail.zabbadoz.net [195.2.176.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30C1648EE
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 01:43:19 -0600 (MDT)
Date: Sun, 30 Sep 2001 09:43:17 +0200 (CEST)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
To: <parisc-linux@lists.parisc-linux.org>
Cc: <thunder7@xs4all.nl>
Message-ID: <Pine.BSF.4.30.0109300915230.69485-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] puffin.external.hp.com,... unreachable through quest
List-ID: <linux-parisc.vger.kernel.org>

Hi,

after a report on nanog I tired to help to figure out why
puffin.external.hp.com, www.parisc-linux.org and others are not
reachable for some people out there.

It seems there is a problem with QUEST/HP in Atlanta or behind.

Traces to HP seem to be prevented by filters but even ping does not
work if I check this directly from QUEST router in Atlanta via
looking glass ( http://stat.qwest.net/flash/lg.cfm ).

--- trace from quest router in atlanta ---
traceroute to puffin.external.hp.com (192.25.206.4), 30 hops max, 40 byte packets
 1  atl-edge-17.inet.qwest.net (205.171.21.190)  0.514 ms  0.475 ms 0.469 ms
 2  65.112.33.30 (65.112.33.30)  1.460 ms  1.436 ms  1.425 ms
 3  * * *
--- ping from quest router in atlanta ---
PING puffin.external.hp.com (192.25.206.4): 56 data bytes
--- puffin.external.hp.com ping statistics ---
3 packets transmitted, 0 packets received, 100% packet loss
--- snipp ---

I do not directly see this problem because at the momenet I am comming
in via uunet but two other upstreams I checked here in Germany use
kpn/quest and thus cannot reach anything in parisc related in
192.25.206.0 :( (and most likely more).

All those who use kpn/quest or have it as an upstream seem to be
cut off from mailing lists/web/cvs ?? :((

It seems the problem has been there since Sep 25th.

Can anybody please try to solve the problem/get information about this
from other side (HP internal etc. ;) because even email-contacts from
whois do not work from what I got told :( and this seems to be one of
the bigger problems (when taking 5 days).

Trace back from puffin or www.parisc-linux.org to 65.112.33.30 might
help to better localize the problem (if there are no internal filters
in hp bbn that prevent traces)

Thanks in advance.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
