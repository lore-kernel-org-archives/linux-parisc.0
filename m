Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B8BE4844
	for <parisc-linux@parisc-linux.org>; Tue, 15 Jul 2003 11:35:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19cTi1-0003DL-Bi; Tue, 15 Jul 2003 18:35:25 +0100
Date: Tue, 15 Jul 2003 18:35:25 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: parisc-linux@parisc-linux.org, gmsoft@gentoo.org
Subject: Re: [parisc-linux] E35 boots gentoo hppa beta04 into kernel fault
Message-ID: <20030715173525.GX23808@parcelfarce.linux.theplanet.co.uk>
References: <20030715165758.GA10544@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030715165758.GA10544@nikita.ath.cx>
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

On Tue, Jul 15, 2003 at 06:57:58PM +0200, Alexander Gabert wrote:
> here i got something for you to investigate:
> 
> http://nikita.ath.cx/users/pappy/hppa/e35/boot/gentoo-beta04.txt

console=ttyB0, not ttyS0

> notice the different scsi cards in it, Grant and Thibaut, did you get
> into something regarding that?

need docs.  ryan's the most interested in those.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
