From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: dhcp problems in cupertino
Date: Wed, 3 Sep 2008 18:50:01 -0600
Message-ID: <20080904005001.GA22774@colo.lackof.org>
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
> across all of the dhcp entries.  I've added the gig-e network and and
> entry for ion (which I needed to get it to come up).  However, there are
> evidently still machines out there trying and failing to get IP
> addresses:
> 
> Sep  3 10:24:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:17:08:c8:75:40 via eth11: network 192.168.1/24: no free leases
> Sep  3 10:36:29 gsyprf11 dhcpd: DHCPDISCOVER from 00:04:ea:b1:cf:80 via eth10: network 192.168.0/24: no free leases

gsyprf11 intentionally has no free leases. I plan was gsyprf11 should
only serve IP's for the systems that can/should netboot from it.
ie other parisc systems.

> So whoever's systems these are will need to add an entry for them.

I don't know offhand which systems they represent but can probably
work that out. I just add those to the dhcp server running on gsyprf10.

I suspect it's a FC switch or something like that.

thanks,
grant

> 
> James
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
