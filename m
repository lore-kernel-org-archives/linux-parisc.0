Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 18 Sep 2003 10:39:37 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] debian installation problem - ERROR: Read from boot device failed
Message-ID: <20030918163937.GB26681@dsl2.external.hp.com>
References: <42687877064.20030918111617@kti.ae.poznan.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <42687877064.20030918111617@kti.ae.poznan.pl>
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

On Thu, Sep 18, 2003 at 11:16:17AM +0200, Jacek Chmielewski wrote:
> I want to install Debian on my HP 9000 J200 box and I encountered a problem
> with booting the installation procedure:
> 
> Selected kernel: /vmlinux32 from partition 0
> Selected ramdisk: /ramdiski from partition 0
> ELF32 executable
> Entry 00100098 first 00100000 n 6
> Segment 0 load 00100000 size 2196688 mediaptr 0x1000
> Segment 1 load 0031a000 size 467792 mediaptr 0x21a000
> Segment 2 load 00390000 size 255656 mediaptr 0x28d000
> Segment 3 load 003d0000 size 8192 mediaptr 0x2cc000
> Segment 4 load 003d8000 size 32768 mediaptr 0x2ce000
> Segment 5 load 00402048 size 110832 mediaptr 0x2d6048
> 
> ERROR: Read from boot device failed (status = -13).

if palo is reporting -13 as the IODC return code, that means:
-13     Protocol error
        A protocol violation was encountered on the module-device
	connection while transferring data to or from the device.
	CONDITIONAL. Must be used if the implementation can detect
	             a protocol error.

This would suggest some device is misconfigured.

> byteio_read: seekread() returned -1 expected 2195456
> ERROR: segment 0 read() failed
> Fatal error loading kernel executableERROR: failed to load kernel 
> 
> I tried the Debian binary-1 CD and netinstall CD. Both with almost same
> results ('status = -7' for Debian CD, and 'status = -13' for netinstall
> CD).

-7	Nonexistent device
	The device address specified by ID_addr is a valid device address.
	However, it points to either a device that is not installed or a
	device that does not respond. Returned only by options ARG1=0
	through ARG1=4.
	CONDITIONAL. Must be used if nonexistent devices can be identified.

IIRC, io_ars.pdf describes these errors...I found them in a different document.

> What could be wrong? Do you know any possible source of this problem?


Misconfigured or flakey device. If you can setup a DHCP server
and boot the netinstall lifimage over the LAN, that might work better.

grant
