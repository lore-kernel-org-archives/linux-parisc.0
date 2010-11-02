From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Mon, 1 Nov 2010 23:00:01 -0600
Message-ID: <20101102050001.GA14166@lackof.org>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca> <20101031180214.GA7501@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101031180214.GA7501@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 31, 2010 at 02:02:15PM -0400, John David Anglin wrote:
> On Sun, 31 Oct 2010, John David Anglin wrote:
> 
> > Attached hpmc dumps.  It appears that struct pci_hba_data *l is
> > causes the hpmc.  Maybe defining some of the DEBUG_LBA* macros
> > would provide more info.
> 
> The PCI component errors seem USB related:

Hi Dave!
I wonder if this is same problem that we saw on the Astro platforms:
Firmware left USB active while we reprogram the IOMMU.

See "sba_hw_init() in drivers/parisc/sba_iommu.c.
Off hand, I don't know what the details to fix this would be.
The outline given in the comments sound right.

cheers,
grant


> 
> dave@mx3210:~/linux/linux-2.6.36.y/drivers/parisc$ lspci -nn
> 00:01.0 USB Controller [0c03]: NEC Corporation USB [1033:0035] (rev 41)
> 00:01.1 USB Controller [0c03]: NEC Corporation USB [1033:0035] (rev 41)
> 00:01.2 USB Controller [0c03]: NEC Corporation USB 2.0 [1033:00e0] (rev 02)
> 00:02.0 IDE interface [0101]: Silicon Image, Inc. SiI 0649 Ultra ATA/100 PCI to ATA Host Controller [1095:0649] (rev 02)
> 20:01.0 SCSI storage controller [0100]: LSI Logic / Symbios Logic 53c1010 66MHz  Ultra3 SCSI Adapter [1000:0021] (rev 01)
> 20:01.1 SCSI storage controller [0100]: LSI Logic / Symbios Logic 53c1010 66MHz  Ultra3 SCSI Adapter [1000:0021] (rev 01)
> 20:02.0 Ethernet controller [0200]: Broadcom Corporation NetXtreme BCM5701 Gigabit Ethernet [14e4:1645] (rev 15)
> e0:01.0 Communication controller [0780]: Hewlett-Packard Company Auxiliary Diva Serial Port [103c:1290] (rev 01)
> e0:01.1 Serial controller [0700]: Hewlett-Packard Company Diva Serial [GSP] Multiport UART [103c:1048] (rev 03)
> e0:02.0 VGA compatible controller [0300]: ATI Technologies Inc Radeon RV100 QY [Radeon 7000/VE] [1002:5159]
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
