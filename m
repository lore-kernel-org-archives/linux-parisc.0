Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D76294831
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Jan 2003 07:59:58 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18VCFk-0005CH-00; Sun, 05 Jan 2003 14:59:52 +0000
Date: Sun, 5 Jan 2003 14:59:52 +0000
From: Matthew Wilcox <willy@debian.org>
To: Chema <jmpbox@etsin.upm.es>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI video card.
Message-ID: <20030105145952.G19239@parcelfarce.linux.theplanet.co.uk>
References: <20030105215425.4CA8BF126@setsin.etsin.upm.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030105215425.4CA8BF126@setsin.etsin.upm.es>; from jmpbox@etsin.upm.es on Sun, Jan 05, 2003 at 04:54:25PM -0500
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

On Sun, Jan 05, 2003 at 04:54:25PM -0500, Chema wrote:
> I have a spare Geforce4 PCI card. Would it be possible using it in a 712 or a 735 ?
> What about Voodoo >2, vodoo3, voodoo4, etc?
> I would thank URLs about it.

712 & 735 don't have PCI busses.  PCI is only available in machines with
Dino / Cujo / Elroy adapters.  That's B132-B180, C160-C360, J2240, B1000,
C3000, J5000 and up.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
