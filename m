Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E7BE4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 09:19:52 -0600 (MDT)
Date: Mon, 5 Aug 2002 11:18:39 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Alex Green <alexdgreen@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compiling 2.4.19-pa0
Message-ID: <20020805151839.GD31773@systemhalted>
References: <OE232NqFJ3sl3xbYiMC00003f35@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE232NqFJ3sl3xbYiMC00003f35@hotmail.com>
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

On Mon, Aug 05, 2002 at 04:17:45PM +0200, Alex Green wrote:
> Hi,
> 
> I'm trying to compile the latest kernel source from the parisc-linux ftp,
> 2.4.19-pa0 I belive and I get the following errors while doing the "make
> vmlinux":
> 

Please include a list of the following:

1. Compiler version.
2. Binutils version.
3. Modutils version.
4. Last time you ran "apt-get update; apt-get dist-upgrade;".
5. Running kernel version.
6. How you got the kernel source tree.
        - Did you 'cvs co' ontop of a 2.4.18 tree?
7. What steps you took to compile the kernel.
        - Did you try runnig 'make mrproper' first?

c.
