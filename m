Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 27 Aug 2003 17:09:25 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and IDE DMA support
Message-ID: <20030827230925.GH31311@dsl2.external.hp.com>
References: <Pine.LNX.4.44.0308271731570.14906-100000@sal.ucc.ie> <1062019396.23493.8.camel@dhcp23.swansea.linux.org.uk> <20030827214409.GE31311@dsl2.external.hp.com> <1062022973.23531.45.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1062022973.23531.45.camel@dhcp23.swansea.linux.org.uk>
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

On Wed, Aug 27, 2003 at 11:22:54PM +0100, Alan Cox wrote:
> Nod.. I'm trying to fathom the 3Mbyte/second behaviour while hdparm
> claims DMA is on

I thought each PIO READ costs something like 400 or 500 cycles on c3k
(400Mhz CPU).  400/3 == 133 cycles/byte.

Either doing very slow DMA or 32-bit (4*133 == 532) reads.
Then it would make sense.

grant
