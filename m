Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Graham Donaldson <Graham_Donaldson@psl-dist.co.uk>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Graphics support 
In-Reply-To: Message from Graham Donaldson <Graham_Donaldson@psl-dist.co.uk>
   of "Thu, 31 Jan 2002 17:59:04 GMT." <3765AD6E3C88D211A92400A0C9A4F70E0119D735@lawrence.psl-dist.co.uk>
References: <3765AD6E3C88D211A92400A0C9A4F70E0119D735@lawrence.psl-dist.co.uk> 
Date: Thu, 31 Jan 2002 11:04:03 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020131180403.86D6F482A@dsl2.external.hp.com>
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

Graham Donaldson wrote:
> Hi,
> 
> 	I notice PA-RISC Linux has X11 working now, but I gather that is via
> the STI?  Is that correct?  Would that make it pretty slow?

STI is just the interface to present text on the graphics head.
Frame Buffer driver actually, iirc.

> 	I just wondered if you could give me any information on the status
> of a proper graphics driver for PARISC Linux, it seems HP is being funny
> about letting people have the docs for their chipsets maybe?

Funny? That's a very polite way of putting it.
TCD doesn't seem to be interested in publishing those docs.

grant

> Also though I
> wanted to consider whether use would be made of HP's colour recovery
> technology?  From what I have read, currently in HPUX you must compile your
> apps to support the Colour Recovery extension.  However, would it be
> possible for this to be inbuilt somehow into the XServer when a proper
> driver exists for it?  Many of the lower end workstations only have an 8bit
> framebuffer but do support Colour Recovery, and with apps like gnome and gtk
> making extensive use of high colour graphics, it seems a shame to not use
> this probably under utilised HP technology.
> 
> Thanks for reading,
> 
> Graham Donaldson
> Technical Consultant
> 
> Email: 	graham_donaldson@psl-dist.co.uk
> Tel:      01706 898285
> Fax: 	01706 898200
> 
> PSL - Partner Services 
> 'The partner of choice for the provision of quality IT services to UK and
> Ireland channel partners'
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
