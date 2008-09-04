From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: dhcp problems in cupertino
Date: Wed, 3 Sep 2008 18:56:10 -0600
Message-ID: <20080904005610.GB22774@colo.lackof.org>
References: <1220463337.3254.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220463337.3254.23.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 03, 2008 at 12:35:37PM -0500, James Bottomley wrote:
> It looks like the old dhcp server was converted to dhcp3 without pulling
> across all of the dhcp entries.

I suspect I "upgraded" the switchs and never realized I needed to add the IP
to DHCP.

> I've added the gig-e network and
> entry for ion (which I needed to get it to come up).  However, there are
> evidently still machines out there trying and failing to get IP
> addresses:
> 
> Sep  3 10:24:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:17:08:c8:75:40 via eth11: network 192.168.1/24: no free leases

ProCurve Switch 2848#

Just "telnet 192.168.1.131".

> Sep  3 10:36:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:04:ea:b1:cf:80 via eth10: network 192.168.0/24: no free leases

HP J4813A ProCurve Switch 2524

thanks,
grant
