Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 288B54829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 07:56:50 -0700 (MST)
Date: Mon, 28 Oct 2002 09:56:41 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Nahkola Mikko <mikko.nahkola@nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer depth and other issues ...
Message-ID: <20021028145641.GC4583@systemhalted>
References: <20021028112551.GR15137@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021028112551.GR15137@aurinko.ntc.nokia.com>
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

> 
> And as an aside, how reliable is the disk stuff nowadays? Would it make 
> any sense to run a file server on Linux/hppa yet? I mean, something like 
> a stack of A3312As, software-RAID and NFS ... is it likely to work? How 
> about performance, compared to HP-UX, for example? (yes, I'd expect HP-UX 
> to be somewhat better, but by how much?)
> 

I'm using/testing a C3K as an NFS fileserver for our cluster of
715/50's. A large portion of the nodes run diskless, and performance is
relatively good. Haven't run LADDIS or any other benchmarks. What do
people run these days to test NFS? If only it didn't cost an arm and a 
leg... SPEC SFS97_v3.0

c.
