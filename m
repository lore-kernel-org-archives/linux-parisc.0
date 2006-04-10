From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [parisc-linux] B2000 PCI resource problem
Date: Mon, 10 Apr 2006 09:57:26 +0200
Message-ID: <wrpbqv9982h.fsf@wild-wind.fr.eu.org>
References: <wrp7j62jz7e.fsf@wild-wind.fr.eu.org>
	<20060410023456.GA25141@colo.lackof.org>
Reply-To: maz@misterjones.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060410023456.GA25141@colo.lackof.org> (Grant Grundler's
	message of "Sun, 9 Apr 2006 20:34:56 -0600")
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>>>>> "Grant" == Grant Grundler <grundler@parisc-linux.org> writes:

Grant,

>> PCI: resource not parented! [2000-2fff]
>> PCI: resource not parented! [fb000000-fb5fffff]

Grant> Which kernel version?

Sorry. This is 2.6.17-rc1-pa1, but I saw this problem with 2.6.16 and
late 2.6.15-rc* as well.

Grant> Wow! 2M? That's a fair chunk of space for a NIC.  Any special
Grant> about that RAM or what it's used for?  (Just curious)

Cassini looks like ad odd beast. RAM seems to be used at least to
download filters to the card, so the NIC can parse complete packets
and do a lot of ugly things, none of them being supported on Linux at
the moment (and probably won't ever). Have a look at
driver/net/cassini.[ch] if you really want to know... ;-)

>> 0000:02:02.0 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
Grant> ...
>> Region 0: I/O ports at 12100 [size=256]
>> Region 1: Memory at fb405000 (64-bit, non-prefetchable) [size=1K]
>> Region 3: Memory at fb402000 (64-bit, non-prefetchable) [size=8K]

Grant> Is CONFIG_SCSI_SYM53C8XX_MMIO enabled in your kernel?
Grant> (again just curious)

Indeed:

maz@ashes:~$ zgrep SYM53C8XX /proc/config.gz
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y

If there's anything you want me to test, feel free to ask. This is an
expandable box, and I can reboot it remotely.

Thanks,

	M.
-- 
And if you don't know where you're going, any road will take you there...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
