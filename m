From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.9-rc2-pa9 data page fault in free_block()
Date: Mon, 27 Sep 2004 11:50:08 -0600
Message-ID: <20040927175008.GE27091@colo.lackof.org>
References: <20040927053355.GB12024@colo.lackof.org>
	<20040927113415.GP16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040927113415.GP16153@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Sep 27, 2004 at 12:34:15PM +0100, Matthew Wilcox wrote:
> It's worth turning on Debug memory allocations (DEBUG_SLAB).  That should
> catch this problem earlier.

It changes the problem only slightly...last output is now:

Initializing: /etc/network/ifstate.
Starting hotplug subsystem:
   input   
   input    [success]
   isapnp  
   isapnp   [success]
   net     
   net      [success]
   pci     
     tulip: already loaded
Fusion MPT base driver 3.01.16
Copyright (c) 1999-2004 LSI Logic Corporation
mptbase: Initiating ioc0 bringup
ioc0: 53C1030: Capabilities={Initiator}
mptbase: Initiating ioc1 bringup
ioc1: 53C1030: Capabilities={Initiator}
mptbase: Initiating ioc1 recovery
<end of output>

And I lost the chassis code that gets logged.
I also wonder why we aren't getting HPMC or panic
output from the kernel. :^/

In any case, I'm pretty sure fusion driver is fubarred.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
