Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0ABD8485F
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 24 Apr 2004 16:31:34 -0600 (MDT)
Message-ID: <408AEAD4.9050605@tiscali.be>
Date: Sat, 24 Apr 2004 22:31:48 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
References: <40711E5500008F1F@ocpmta2.freegates.net>
	<408AD395.4060909@tiscali.be>
	<20040424221944.GD7422@colo.lackof.org>
In-Reply-To: <20040424221944.GD7422@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Grant Grundler wrote:
> On Sat, Apr 24, 2004 at 08:52:37PM +0000, Joel Soete wrote:
> 
>>Hello Grant,
>>
>>Sorry in advance to disturbe you with this c110 pb but if I well understand 
>>the physical connection (fine doc find on openpa.net :) and better 
>>understand what james means, otc I past the full last week to study more 
>>ccio-dma and ncr53c8xx but I don't reach to locate the part of code making 
>> the link between those 2 part (i mean where ncr call ccio and visversa). 
>> Could you help me a bit more.
> 
> 
> Yup. Using 2.6.5-pa8 source tree, ncr53c8xx.c calls DMA services from
> ncr_scatter():
> 
> ncr53c8xx.c:7594:	u_long baddr = map_scsi_single_data(np, cmd);
> 
> sym53c8xx_comm.h:699:static int __map_scsi_sg_data(struct device *dev, Scsi_Cmnd *cmd)
> ...
> sym53c8xx_comm.h:708:	use_sg = dma_map_sg(dev, cmd->buffer, cmd->use_sg, dma_dir);
> 
> 
> asm/dma-mapping.h:91:static inline int
> asm/dma-mapping.h:92:dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> asm/dma-mapping.h:93:           enum dma_data_direction direction)
> asm/dma-mapping.h:94:{
> asm/dma-mapping.h:95:        return hppa_dma_ops->map_sg(dev, sg, nents, direction);
> asm/dma-mapping.h:96:}
> 
> Then search for hppa_dma_ops in arch/parisc/kernel/* and drivers/parisc/*.c
> to locate the various platform/chipset DMA support:
> 
> grundler <553>fgrep -n hppa_dma_ops arch/parisc/kernel/*c drivers/parisc/*
> arch/parisc/kernel/drivers.c:30:struct hppa_dma_ops *hppa_dma_ops;
> arch/parisc/kernel/drivers.c:31:EXPORT_SYMBOL(hppa_dma_ops);
> arch/parisc/kernel/pci-dma.c:492:struct hppa_dma_ops pcxl_dma_ops = {
> arch/parisc/kernel/pci-dma.c:533:struct hppa_dma_ops pcx_dma_ops = {
> arch/parisc/kernel/setup.c:96:          hppa_dma_ops = &pcx_dma_ops;
> arch/parisc/kernel/setup.c:101:         hppa_dma_ops = &pcxl_dma_ops;
> drivers/parisc/ccio-dma.c:1009:static struct hppa_dma_ops ccio_ops = {
> drivers/parisc/ccio-dma.c:1545: hppa_dma_ops = &ccio_ops;
> drivers/parisc/ccio-rm-dma.c:183:       hppa_dma_ops = &ccio_ops;
> drivers/parisc/sba_iommu.c:1177:static struct hppa_dma_ops sba_ops = {
> drivers/parisc/sba_iommu.c:1809:        hppa_dma_ops = &sba_ops;
> 
> Ideally, "make" would detect when support for only one chipset is
> needed and just do away with hppa_dma_ops completely (ie directly
> call into the chipset specific function).
> 
> 
>>Thanks in advance,
>>	Joel
>>
>>PS: btw I noticed that ncr_attach() is still prefix by __init where 
>>sym_attach() is now prefix by __devinit. I trust it is important but could 
>>it be the simple reason of pb encounter?
> 
> 
> IIRC, the difference is for hotplug.
> __devinit section is preserved when CONFIG_HOTPLUG is enabled.
> See linux/Documentation/pci.txt for the real description.
> 
> grant
> 
Great.

Many thanks,
	Joel
