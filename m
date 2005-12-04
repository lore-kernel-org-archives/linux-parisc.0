From: Russell King <rmk+pcmcia@arm.linux.org.uk>
Subject: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 4 Dec 2005 10:33:38 +0000
Message-ID: <20051204103338.GA16791@flint.arm.linux.org.uk>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 04, 2005 at 01:04:23AM -0500, Kyle McMartin wrote:
> PCMCIA port and memory probing is broken on parisc, disabling both
> allows the PCMCIA subsystem to work on parisc systems.

Do you know why it's broken?

The memory probing works by mapping the CIS into memory and then trying
to read it.  If you're saying it's broken, that implies that we can't
read the CIS, and therefore we can't use the addresses being probed.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
