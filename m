Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC74C4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Jun 2003 09:45:17 -0600 (MDT)
Message-ID: <3EF72408.6030103@tiscali.be>
Date: Mon, 23 Jun 2003 16:00:08 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge
 pb?[was: Re: HP C180 video card]
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be> <20030615161948.GA12995@dsl2.external.hp.com> <3EF46AA9.7040703@tiscali.be> <20030623050450.GA449@dsl2.external.hp.com> <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Matthew Wilcox wrote:

>On Sun, Jun 22, 2003 at 11:04:50PM -0600, Grant Grundler wrote:
>  
>
>>AFAICT, eqnx driver doesn't call pci_enable_device().  The bug I'd be
>>looking for is a PCI "resource" (BAR) to be accessed before it was enabled.
>>Try adding a pci_enable_device() to eqnx_init() or eqx_pci_buspresent().
>>[ *gag* I'm surprised this code even works on x86. ]
>>    
>>
>
>x86 typically doesn't need to call pci_enable_device, so people who've
>never tried their driver on any other box may have missed it.
>
>  
>
 From the very last relase 4.05 (dated April 7 iirc) it support also 
"Intel IA-64 platforms".
But I will have a look in more details and also post the toc analyse.

Thanks for help and attention,
    Joel
