Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85814482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 08:17:26 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 375DCE6
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 16:17:24 +0200 (METDST)
Message-ID: <3CE50F7B.771EC8B8@admin.france.hp.com>
Date: Fri, 17 May 2002 16:11:07 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> <20020402164417.6C6B6482A@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------FB195AF423A22A20EE99BF6B"
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

This is a multi-part message in MIME format.
--------------FB195AF423A22A20EE99BF6B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I've finally found enought time to continu my long way to the HPA.
So now I've build a function in sd.c in order to retrieve the scsi_host.
But as it has been said, the pointer pci_dev in the structure scsi_host
is not always pointing to a pci_dev. For my poor 712/100, it point
to NULL :-( (it is normal, my scsi host is not a PCI one). So I'm still
stuck at this point, now I'm able to retrieve the scsi_host and scsi_dev
structures, but I'm still unable to go the parisc_device. Any idea ?

	Thanks.

Grant Grundler wrote:
> 
> Bruno Vidal wrote:
> > The pointer of the disk (/dev/sd??) is the node. Example:
> > /dev/sda2 ->> sda2 -> 0x802 -> major:0x8 -> driver "sd" with minor:0x02
> > Now how can I link 0x802 to hardware path "2/0/1"
> > So where is the link between both ????? Do you have any idea ?????
> 
> Well, there is a link. It's just not as obvious as the iotree.
> 
> drivers/scsi/sd.c:sd_open() finds the device:
> 
>         target = DEVICE_NR(inode->i_rdev);
>         if (target >= sd_template.dev_max || !rscsi_disks[target].device)
>                 return -ENXIO;  /* No such device */
> 
> And sd.h has the definition for Scsi_Disk:
> typedef struct scsi_disk {
>         unsigned capacity;      /* size in blocks */
>         Scsi_Device *device;
>         unsigned char ready;    /* flag ready for FLOPTICAL */
>         unsigned char write_prot;       /* flag write_protect for rmvable dev */
>         unsigned char sector_bit_size;  /* sector_size = 2 to the  bit size power */
>         unsigned char sector_bit_shift;         /* power of 2 sectors per FS block */
>         unsigned has_part_table:1;      /* has partition table */
> } Scsi_Disk;
> 
> Scsi_Device is *private*. It contains the ptr to Scsi_Host (defined
> in hosts.h), an instance of a SCSI controller driver. And finally,
> Scsi_Host has a pointer to pci_dev.
> 
> Since several of the data structures are intended to be private,
> I suggest adding a function to sd.c (or scsi.c) that finds and returns
> the pci_dev pointer:
> 
> struct pci_dev *sd_get_pci_dev(struct inode *inode)
> {
>         int target = DEVICE_NR(inode->i_rdev);
>         Scsi_Device scsidev = rscsi_disks[target].device;
> 
>         if (target >= sd_template.dev_max || !scsidev)
>                 return NULL;  /* No such device */
> 
>         return (scsi_dev->host->pci_dev);
> }
> 
> It would be nice if SCSI were part of the IO tree but I can understand
> reasons for not doing it. In particular, SCSI over FC doesn't lend
> itself to an IO Tree arrangement since it's really a "net". Put a SAN,
> additional FC controllers from the same host, and a few thousand
> LUNs out there and the IO tree can become an ugly mess to.
> 
> hth,
> grant
> 
> ps. I had no clue how this worked until I tracked this down starting
>     at sd_open().
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------FB195AF423A22A20EE99BF6B
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="bruno_vidal.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Bruno Vidal
Content-Disposition: attachment;
 filename="bruno_vidal.vcf"

YmVnaW46dmNhcmQgCm46QnJ1bm87VklEQUwKdGVsO2ZheDowMS02OS04Mi02MC0xNAp0ZWw7
d29yazowMS02OS0yOS00Mi03MQp4LW1vemlsbGEtaHRtbDpUUlVFCnVybDp3d3cuZnJhbmNl
LmhwLmNvbQpvcmc6U29sdXRpb24gQ2VudGVyCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0
OmJydW5vX3ZpZGFsQGhwLmNvbQp0aXRsZTpFeHBlcnQgTG9naWNpZWwgRW52aXJvbm5lbWVu
dCBIYXV0ZSBEaXNwb25pYmlsaXTpCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7SFAgRnJhbmNl
PTBEPTBBO1ouQSBkZSBDb3VydGFib2V1ZjsxIEF2LiBkdSBDYW5hZGE7OTE5NDcgTGVzIFVs
aXMgY2VkZXg7RnJhbmNlCngtbW96aWxsYS1jcHQ6OzI2MjA4CmZuOlZJREFMIEJydW5vCmVu
ZDp2Y2FyZAo=
--------------FB195AF423A22A20EE99BF6B--
