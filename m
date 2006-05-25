From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: HPMC in ppa_init()
Date: Thu, 25 May 2006 08:33:05 -0700
Message-ID: <1148571185.8070.4.camel@mulgrave.il.steeleye.com>
References: <20060525121929.DWFD5348.web2@localhost.localdomain>
	<20060525150250.GA6616@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyjung@datatek.co.kr,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 ?????? <jyson@datatek.co.kr>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060525150250.GA6616@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2006-05-25 at 09:02 -0600, Grant Grundler wrote:
> You will have to disable SCSI_PPA driver from your config.
> It might be easiest to manually remove the driver from
> the initrd.img file and from the /lib/modules on the root disk.
> 
> I looked at ppa_init() and it looks quite broken for hppa.
> The problem is stuff like this:
> static int ppa_byte_in(unsigned short base, char *buffer, int len)

> "base" needs to be u32 (unsigned int).
> parisc-linux needs more than 16 bits to represent an IO port address.
> This _could_ work if the parallel port were under PCI Bus 0 _and_
> no other garbage is in the top 16 bits of the register.

It's not just this.  ppa and imm are pretty broken even on x86:   they
don't use kmap to access the pio data, so they only work in memory from
ZONE_NORMAL ... this probably doesn't affect parisc since we don't have
a ZONE_HIGHMEM, however any READ_ command will go into the kernel's view
of the memory without cache flushing, so it's probable we'd get nasty
cache coherency issues.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
