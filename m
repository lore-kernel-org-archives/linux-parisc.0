Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D09B34845
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 22:45:51 -0700 (MST)
Date: Wed, 3 Dec 2003 22:45:50 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: northern snowfall <dbailey27@ameritech.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.23 PCI source inconsistency
Message-ID: <20031204054550.GB31404@colo.lackof.org>
References: <3FCE5AAE.6080104@ameritech.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FCE5AAE.6080104@ameritech.net>
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

On Wed, Dec 03, 2003 at 04:50:38PM -0500, northern snowfall wrote:
> Hey all,
>    I compiled 2.4.23 from kernel.org for 32bit PA-RISC today
> and found that the PA-RISC specific PCI code seems to be out-
> of sync with the generic pci code.

As carlos said, use kernels from ftp.parisc-linux.org or pull
sources directly from cvs.parisc-linux.org.

> pci.c: In function `pcibios_init_bus':
> pci.c:310: structure has no member named `bridge_ctl'

I added this field to clean up FBB and VGA routing support.
"bridge_ctl" is a PCI-PCI Bridge register that controls
both of those behaviors. Ivan K. (ex PCI Maintainer) and I had it
working for parisc/ia32/alpha but apperently it never got
submitted/accepted into any official tree.

Russell King (ARM maintainer) found it useful anyway
and submitted it

	http://www.ussg.iu.edu/hypermail/linux/kernel/0208.0/0723.html

and later:
	http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2003-October/017459.html

Darn...looks like bridge_ctl didn't get pushed into 2.6 either. :^(
I'll follow up a bit offline.

grant
