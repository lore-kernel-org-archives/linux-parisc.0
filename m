Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from daedalus.cs.brandeis.edu (daedalus.cs.brandeis.edu [129.64.3.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DC6D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 11:52:57 -0700 (MST)
Received: (from aaronm@localhost)
	by daedalus.cs.brandeis.edu (8.9.3/8.9.3) id NAA28219
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Dec 2001 13:52:56 -0500
Date: Sun, 30 Dec 2001 13:52:56 -0500
From: Aaron Macks <aaronm@cs.brandeis.edu>
To: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Graphics support on 755?
Message-ID: <20011230135256.B28207@daedalus.cs.brandeis.edu>
References: <20011229182132.A23862@daedalus.cs.brandeis.edu> <3C2F42C5.6040004@interaccess.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C2F42C5.6040004@interaccess.com>; from bheadley@interaccess.com on Sun, Dec 30, 2001 at 10:37:25AM -0600
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

> Kernel source. ./arch/parisc/kernel/hardware.c
> 
> The kernel supports display adapters that are supported by the pdc BIOS. 
> I assume it's an HP card, which means HPUX supports it, which strongly 
> infers it's supported by pdc BIOS.
> 
> What I don't know is, if you get something like an nVidia card, stick it 
> into the EISA bus, that such will work...
> 
> -- 
> ____               .:.                 ____
> Bryan W. Headley - bheadley@interaccess.com
it's an HP card, not in the EISA slots, but in the big slots on the
backplane.  Is there anything like lspci, but for the HP slots?
Aaron

-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
