Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C74A4829
	for <parisc-linux@parisc-linux.org>; Sat,  4 Jan 2003 15:33:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Uwqj-0005Fa-00; Sat, 04 Jan 2003 22:33:01 +0000
Date: Sat, 4 Jan 2003 22:33:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] modules and 2.5.5X
Message-ID: <20030104223301.B19239@parcelfarce.linux.theplanet.co.uk>
References: <200301020111.48011.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301020111.48011.deller@gmx.de>; from deller@gmx.de on Thu, Jan 02, 2003 at 01:11:47AM +0100
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

On Thu, Jan 02, 2003 at 01:11:47AM +0100, Helge Deller wrote:
> kernel module support for the 2.5 kernel on hppa seems broken due to some missing 
> support for this architecture in the new modutils and module-init-tools debian packages.
> 
> Maybe someone with somewhat more expirience than me with the ELF file format and 
> runtime symbol relocation functions could look into this ? 

rusty's promised to do it when he gets access to a machine...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
