Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6860F482A
	for <parisc-linux@parisc-linux.org>; Sat, 18 Aug 2001 16:37:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15YEiC-0005j9-00; Sat, 18 Aug 2001 23:37:00 +0100
Date: Sat, 18 Aug 2001 23:37:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@ldl.fc.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Turn off CONFIG_PCI
Message-ID: <20010818233700.A14486@parcelfarce.linux.theplanet.co.uk>
References: <E15Xdn8-0000kt-00@chrysl> <20010818193908.2DE79482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010818193908.2DE79482A@dsl2.external.hp.com>; from deller@gmx.de on Sat, Aug 18, 2001 at 09:37:06PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Aug 18, 2001 at 09:37:06PM +0200, Helge Deller wrote:
> I tested your patch sucessfully on my c3k and my 715/64.
> I've only added a small security check to setup.c to prevent PA2.x machines
> from booting without CONFIG_PCI and to print a small panic-message
> at bootup instead of just HPMC'ing.

> +#ifndef CONFIG_PCI
> +	/* security check: PA2.x processor machines won't detect their main
> +	 * PCI-based devices (screen, serial, SCSI, ...), so it's better to
> +	 * stop them from booting right here. If we would continue we would
> +	 * only get a HPMC without any other information. */
> +	if (boot_cpu_data.cpu_type >= pcxu) { /* >=PA8000 (PCX-U) CPU ? */
> +		/* switch back to PDC console for panic */
> +		pdc_console_restart();
> +		panic("This system will not boot without PCI-support in the kernel !\n");
> +	}
> +#endif

I don't believe this is appropriate.  Cxxx / Jxxx machines use Lasi for
their serial port, so it's theoretically possible to boot one without
CONFIG_PCI.  If the user wants to turn it off, let them.  It's not like
any other architecture does anything like this.

-- 
Revolutions do not require corporate support.
