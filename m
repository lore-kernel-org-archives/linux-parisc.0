From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 06 Dec 2005 08:36:48 -0500
Message-ID: <1133876209.3267.2.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
	<20051206093643.GA1706@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Russell King <rmk+pcmcia@arm.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051206093643.GA1706@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2005-12-06 at 09:36 +0000, Russell King wrote:
> I don't think you've fully understood what I've been saying.
> When we try to do memory probing, we setup a mapping in the same
> way that we setup a mapping to read the CIS from the card.

Yes, I do.  On PARISC, memory I/O ranges are directed.  If you program
the CIS to respond outside the directed range of its parent, the I/O
transaction will never get through because the direction is done by the
parent bus (which you aren't programming).  This then causes a HPMC
because no entity on the runway bus responds to the memory read.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
