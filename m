Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96AB94867
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Mar 2004 17:37:23 -0700 (MST)
Message-ID: <405CE3BE.7060503@tiscali.be>
Date: Sun, 21 Mar 2004 00:37:18 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.5-rc1-pa1 hung on C110
References: <405CD7B7.6090007@tiscali.be>
	<20040321002457.GA31600@colo.lackof.org>
In-Reply-To: <20040321002457.GA31600@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Grant Grundler wrote:
> On Sat, Mar 20, 2004 at 11:45:59PM +0000, Joel Soete wrote:
> 
>>I just rebuild 2.6.5-rc1-pa1 kernel on my c110 with b180 config (minus hil 
>>kbd and mouse support).
> 
> 
> c110 requires ccio driver. B180 does not.
> Is that included in the b180 config?
> 
Yes.
Here is the config part:
[snip]
#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
CONFIG_GSC=y
CONFIG_HPPB=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_EISA=y
CONFIG_EISA_NAMES=y
# CONFIG_ISA is not set
CONFIG_PCI=y
CONFIG_PCI_LEGACY_PROC=y
CONFIG_PCI_NAMES=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_SUPERIO=y
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y

the same as 2.6.3-rc1:
#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
CONFIG_GSC=y
CONFIG_HPPB=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_EISA=y
CONFIG_EISA_NAMES=y
# CONFIG_ISA is not set
CONFIG_PCI=y
CONFIG_PCI_LEGACY_PROC=y
CONFIG_PCI_NAMES=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_SUPERIO=y
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y
# CONFIG_HOTPLUG is not set

Thanks,
	Joel
