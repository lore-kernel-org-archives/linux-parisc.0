Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 02 Apr 2002 16:08:16 +0200." <3CA9BB50.1FCEBDF4@admin.france.hp.com>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> 
Date: Tue, 02 Apr 2002 09:44:17 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020402164417.6C6B6482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> The pointer of the disk (/dev/sd??) is the node. Example:
> /dev/sda2 ->> sda2 -> 0x802 -> major:0x8 -> driver "sd" with minor:0x02
> Now how can I link 0x802 to hardware path "2/0/1"
> So where is the link between both ????? Do you have any idea ?????

Well, there is a link. It's just not as obvious as the iotree.

drivers/scsi/sd.c:sd_open() finds the device:

	target = DEVICE_NR(inode->i_rdev);
	if (target >= sd_template.dev_max || !rscsi_disks[target].device)
		return -ENXIO;  /* No such device */

And sd.h has the definition for Scsi_Disk:
typedef struct scsi_disk {
	unsigned capacity;      /* size in blocks */
	Scsi_Device *device; 
	unsigned char ready;    /* flag ready for FLOPTICAL */
	unsigned char write_prot;       /* flag write_protect for rmvable dev */
	unsigned char sector_bit_size;  /* sector_size = 2 to the  bit size power */
	unsigned char sector_bit_shift;         /* power of 2 sectors per FS block */
	unsigned has_part_table:1;      /* has partition table */
} Scsi_Disk; 

Scsi_Device is *private*. It contains the ptr to Scsi_Host (defined
in hosts.h), an instance of a SCSI controller driver. And finally,
Scsi_Host has a pointer to pci_dev.

Since several of the data structures are intended to be private,
I suggest adding a function to sd.c (or scsi.c) that finds and returns
the pci_dev pointer:

struct pci_dev *sd_get_pci_dev(struct inode *inode)
{
	int target = DEVICE_NR(inode->i_rdev);
	Scsi_Device scsidev = rscsi_disks[target].device;

	if (target >= sd_template.dev_max || !scsidev)
		return NULL;  /* No such device */

	return (scsi_dev->host->pci_dev);
}


It would be nice if SCSI were part of the IO tree but I can understand
reasons for not doing it. In particular, SCSI over FC doesn't lend
itself to an IO Tree arrangement since it's really a "net". Put a SAN,
additional FC controllers from the same host, and a few thousand
LUNs out there and the IO tree can become an ugly mess to.

hth,
grant

ps. I had no clue how this worked until I tracked this down starting
    at sd_open().
