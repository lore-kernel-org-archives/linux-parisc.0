From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Wierd code in Entry.S
Date: Wed, 15 Jul 2009 00:40:46 -0600
Message-ID: <20090715064046.GB26739@lackof.org>
References: <20090709225511.GE10979@lackof.org> <20090710001506.A2C43507E@hiauly1.hia.nrc.ca> <20090710153620.GB28778@lackof.org> <4A576837.70501@stromasys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Artem Alimarine <artem.alimarine@stromasys.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A576837.70501@stromasys.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 10, 2009 at 06:11:35PM +0200, Artem Alimarine wrote:
> Hi Grant,
>
> Bit 44 falls into the access_id area. So, access id get corrupted. As  
> far as I understand we should get interrupt 18 (access check trap) on  
> such TLB  entries. However we do not. The bug can go unnoticed when the  
> access id is smaller than 31 bits. The PA2.0 manual says in the IDTLBT  
> description: If smaller than 31-bit access IDs are implemented, only the  
> appropriate number of the
> rightmost bits of GR[r]{32..62} are stored in the TLB. Obviously, bit 44  
> is not among the stored bits.

Ok - thanks for looking that up. CPU specific ERS would contain the
details that describe access ID implementations.

> Actually, I have no idea on how many bits are used by the hardware.  
> Myself I have rp2470.

Yeah, that's Astro/Elroy and not ZX1. So should not be affected
by the U-bit being mis-set.

thanks,
grant
