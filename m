From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] I/O MMU @ fffffffffed20000 is out of mapping
	resources: re-occured
Date: Sat, 26 Feb 2005 14:44:01 +0000
Message-ID: <42208B31.1060900@tiscali.be>
References: <420B30A200004C1D@mail-1-bnl.tiscali.it>
	<20050223220055.GD26124@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050223220055.GD26124@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Tue, Feb 22, 2005 at 09:30:59AM +0100, Joel Soete wrote:
> 
>>Hi all,
>>
>>Sorry but this pb:
>>Kernel panic - not syncing: /CAD/linux-2.6.11-rc4-pa2-050221/drivers/parisc/sba_iommu.c:
>>I/O MMU @ fffffffffed20000 is out of mapping resources
>>
>>just re-occured while an apt-get update again.
>>(I wrongly though it disappeared because hiden last week eventhought
>>I re-mirrored the slice containing deb 'depot')
> 
> 
> This is a non-trivial issue that has been around since pci_dma mapping
> interface was introduced. Two things need to happen:
> 1) parisc implements support for dma_mapping_error()
> 2) drivers use dma_mapping_error() to verify the mapping
>    resource they asked for was available.
> 
> Sorry, I've been ignoring the issue since I don't see it on my boxes.
too bad (well for me)

> I'm not sure why you are seeing it and I'm not.
fwiw the pb appeared just after the moment I finaly take the time to mirror my boot disk (a 9gb) with the data one (a 36Gb one) and 
specialy during an 'apt-get update' apprently during the gunzip phase.
that said when I mark one slice failed (either sda10 or sbd10 here, where I put my local debian archives) the pb disappear.
Do you also use raid1 to mirror your disk?

> Likely you have less RAM installed than I (normally 2-4 GB).
> 
Only 256Mb (this was just a low cost ws to monitor systems with VPO and unfortunately linux is not an 'official' proj in my company 
to get more budget for my test; I can only thanks some colleagues to help me recover some used hw ;-)

> Can you try changing sba_mem_ratio to 4 or 2 in drivers/parisc/sba_iommu.c:
> /* Ratio of Host MEM to IOV Space size */
> static unsigned long sba_mem_ratio = 8;
> 
Obviously, I will let you know asap ;-)

> I'll even take a patch that makes this a commandline parameter :^)
> (ie used by both ccio and sba drivers).
> 
> sorry,
No no, I was just convience that pb was solved, as it wasn't I would just like to remember it (as you asked ;-)

Thanks a lot for all,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
