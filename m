From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 4 Dec 2005 12:52:01 -0500
Message-ID: <20051204175201.GA20053@quicksilver.road.mcmartin.ca>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051204103338.GA16791@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 04, 2005 at 10:33:38AM +0000, Russell King wrote:
> Do you know why it's broken?
>

I'll have to defer to James Bottomley. He was the one who committed
the fixes (I believe he's using pcmcia on a parisc machine for wireless)
originally, I'm just passing along the patches.
 
Cheers,
	Kyle

> The memory probing works by mapping the CIS into memory and then trying
> to read it.  If you're saying it's broken, that implies that we can't
> read the CIS, and therefore we can't use the addresses being probed.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
