From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 11:47:17 -0400 (EDT)
Message-ID: <20101023154718.9C2344D30@hiauly1.hia.nrc.ca>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mikulas@artax.karlin.mff.cuni.cz (Mikulas Patocka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> from "Mikulas Patocka" at Oct 22, 2010 04:07:17 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I have a C8000 workstation with one PA8800 900MHz CPU (the motherboard has 
> two sockets), I installed Linux via serial console on it and it seems to 
> be running quite fine (I had to plug a PCI serial card because Linux 
> doesn't recognize the on-board serial ports or videocard).
> 
> When I inserted anober PA8800 900MHz CPU (taken from another workstation) 
> to the second socket on the motherboard, the boot firmware writes a 
> warning "Too many CPUs for this system.", drops into the boot menu and 
> refuses to load an operating system.

It looks like it should be possible to add a second processor.  See
Technical Reference Guide HP workstation c8000, Document Part Number:
5969-3188.

Did you install second CPU power module?

> Do you have some idea how to solve it? I.e. switch something in the 
> firmware, load new firmware (I have FW 2.13 BMC 02.32), or get some tool 
> from HP that can allow the second processor on this workstation?

I don't have any specific knowledge about the c8000.  It appears CPUs
are configured in the BCH configuration menu with the CPUconfig command.
Based on my experience with rp3440, you have to do a hard reboot
after configuring a CPU.  If a CPU gets deconfigured or it doesn't appear
when you type CPUconfig, there is probably a hardware problem.

2.13 seems to be latest firmware.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
