Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B398482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Apr 2002 07:23:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16sPCC-0004gk-00; Tue, 02 Apr 2002 15:23:36 +0100
Date: Tue, 2 Apr 2002 15:23:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node
Message-ID: <20020402152336.D31497@parcelfarce.linux.theplanet.co.uk>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CA9BB50.1FCEBDF4@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Tue, Apr 02, 2002 at 04:08:16PM +0200
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

On Tue, Apr 02, 2002 at 04:08:16PM +0200, Bruno Vidal wrote:
> 	Hi all.
> I'm still looking for the HPA/SPA of the SCSI/IDE controler of a disk.
> I've found, and able to write the system tree (like ioscan). The starting
> point is "root". Now my problem is to find which controler for which disk.
> The pointer of the disk (/dev/sd??) is the node. Example:
> /dev/sda2 ->> sda2 -> 0x802 -> major:0x8 -> driver "sd" with minor:0x02
> Now how can I link 0x802 to hardware path "2/0/1"
> So where is the link between both ????? Do you have any idea ?????

Hmm.  If you can get to the pci_dev or parisc_device for a scsi disc,
we have functions for returning the hwpath:

print_pci_hwpath
get_pci_node_path
print_pa_hwpath
get_node_path

I'm not sure how to get from `sda2' to the pci_dev of the controlling device.

-- 
Revolutions do not require corporate support.
