Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33BC4482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 14:29:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 163l7b-0001Ah-00; Tue, 13 Nov 2001 21:29:31 +0000
Date: Tue, 13 Nov 2001 21:29:31 +0000
From: Matthew Wilcox <willy@debian.org>
To: Phil Anderson <andersop@neverland.ncssm.edu>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] First Time Install on 712/80i
Message-ID: <20011113212931.C20911@parcelfarce.linux.theplanet.co.uk>
References: <20011113182825.A20911@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.33.0111131610080.9967-100000@bob.ncssm.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0111131610080.9967-100000@bob.ncssm.edu>; from andersop@neverland.ncssm.edu on Tue, Nov 13, 2001 at 04:18:49PM -0500
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

On Tue, Nov 13, 2001 at 04:18:49PM -0500, Phil Anderson wrote:
> I have a copy of pa-risc linux, the ~134MB 0.9.2 ISO file, on a CD. It
> will boot, and all's fine in the debian installation until the "Configure
> Device Driver Modules" step.  When I do this, it claims,
> 
> "No modules were found in /target/lib/modules/2.4.0-32 that could be
> configured. Please install the kernel modules first, bu running the
> "Configure Device Driver Modules" step"

that's fine.  all the drivers you need are built into the kernel.

> Does anyone know what to do? I've heard a serial install works better,
> what does that entail? Also, I believe that this is a 64 bit machine, am I
> right?

No, all the machines you have mentioned are 32-bit machines.

-- 
Revolutions do not require corporate support.
