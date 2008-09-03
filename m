From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: dhcp problems in cupertino
Date: Wed, 03 Sep 2008 12:35:37 -0500
Message-ID: <1220463337.3254.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

It looks like the old dhcp server was converted to dhcp3 without pulling
across all of the dhcp entries.  I've added the gig-e network and and
entry for ion (which I needed to get it to come up).  However, there are
evidently still machines out there trying and failing to get IP
addresses:

Sep  3 10:24:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:17:08:c8:75:40 via eth11: network 192.168.1/24: no free leases
Sep  3 10:36:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:04:ea:b1:cf:80 via eth10: network 192.168.0/24: no free leases

So whoever's systems these are will need to add an entry for them.

James


