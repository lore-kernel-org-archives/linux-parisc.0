From: "Adam J. Richter" <adam@yggdrasil.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Fri, 8 Nov 2002 20:51:28 -0800
Message-ID: <200211090451.UAA26160__34000.7244878963$1416621889$gmane$org@baldur.yggdrasil.com>
Cc: andmike@us.ibm.com, hch@lst.de, James.Bottomley@steeleye.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: willy@debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:
>Actually I think the generic device model is crap. [...]

My patch is a net deletion of 57 lines and will allow simplification
of parisc DMA allocation.

Although I agree with most of your criticisms about the generic device
model, most of the problems with it are the way people use it (the
first thing everyone wants to do is a driverfs file system) and some
conventions that I disagree with, such as the idea that drivers that
embed struct device and struct device_driver should not initialize
those fields directly, but should have xxx_register_device copy them
in.  parisc can use the generic driver API without getting fat.

Problems specific to the generic device API can be incrementally
improved and nobody is treating it as set in stone.  I think the
generic device API is close enough already so that it's worth porting
to, even if future clean-ups will then require some small changes to
the code that is ported to it.

Please do not throw the baby out with the bath water.  The generic
driver interface in its present form really can make parisc smaller
and cleaner.

Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Miplitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."
