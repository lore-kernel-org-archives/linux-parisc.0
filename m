Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D38E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 06:39:33 -0600 (MDT)
Date: Wed, 7 Aug 2002 08:38:07 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Alex Green <alexdgreen@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo issues
Message-ID: <20020807123807.GB9966@systemhalted>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE22Aztxc1o8yfogkJX00009958@hotmail.com>
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

> Hi,
> I've just build 2.4.19-pa2 on my c3600 and then I ran palo * I've updated to 1.1 * afterwards, after booting I got an error reporting:
> ENTRY_INIT failed, status = -7: Nonexistent device
> >>Some Hex Entries<<
> Failed to initialize
> What is this... did I do something wrong?
> AG

Yes. Possibly specifying the wrong device.

To quote HP IT Resources:
The device address supplied to ENTRY_INIT is valid, but, 
the target controller or device is not installed or is not responding
ENTRY_INIT -7 Causes:
- Booting from the wrong path or non-existent device.
- Trying to boot from a device that is not responding.

Stop the machine at bootup and try to search for bootable
devices... and see what it returns.

c.
