Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37B0A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 07:07:52 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18LOZX-0004qS-00; Mon, 09 Dec 2002 14:07:47 +0000
Date: Mon, 9 Dec 2002 14:07:47 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tim Kemna <t.kemna@student.utwente.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compilation error
Message-ID: <20021209140747.I20336@parcelfarce.linux.theplanet.co.uk>
References: <000b01c29f8b$554745c0$4fe85982@kabel.utwente.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000b01c29f8b$554745c0$4fe85982@kabel.utwente.nl>; from t.kemna@student.utwente.nl on Mon, Dec 09, 2002 at 03:00:29PM +0100
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

On Mon, Dec 09, 2002 at 03:00:29PM +0100, Tim Kemna wrote:
> Hi,
> 
> I'm trying to compile a kernel on a 712/80, but I get the following error
> when I do 'make vmlinux':
> 
> scsi_merge.c: In function `__count_segments':
> scsi_merge.c:225: warning: implicit declaration of function `page_to_phys'
> scsi_merge.c: In function `initialize_merge_fn':
> scsi_merge.c:1198: `PCI_DMA_BUS_IS_PHYS' undeclared (first use in this
> function)

where did you get your kernel from?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
