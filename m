Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Fri, 17 May 2002 16:11:07 +0200." <3CE50F7B.771EC8B8@admin.france.hp.com>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> <20020402164417.6C6B6482A@dsl2.external.hp.com>  <3CE50F7B.771EC8B8@admin.france.hp.com> 
Date: Fri, 17 May 2002 09:36:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020517153647.41BAD482A@dsl2.external.hp.com>
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
> But as it has been said, the pointer pci_dev in the structure scsi_host
> is not always pointing to a pci_dev. For my poor 712/100, it point
> to NULL :-( (it is normal, my scsi host is not a PCI one).

The best idea we came up with was to require the dump partition be
on boot device and pull the HPA from page zero. Matthew Wilcox was
mentioning that this problem will be solved in 2.5 kernel
since it will get an IO tree similar to HPUX's.

TBH, I'm personally not interested in chasing down solutions
for boxes that don't have PCI.

hth,
grant
