From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 22:17:29 -0600
Message-ID: <20040713041729.GB27696@colo.lackof.org>
References: <20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
	<20040712033752.GA10163@sal.ucc.ie>
	<20040712160534.GA12046@colo.lackof.org>
	<20040712183943.GA11805@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Grant Grundler <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040712183943.GA11805@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 12, 2004 at 07:39:44PM +0100, M. Grabert wrote:
> OOOooOOoooopps!
> This isse was resolved by Randolph, back in March, 9th:
...
> Those patches obviously made it into the CVS a couple the same day:
> http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-March/033894.html
> NS87415 onboard IDE + hard drivers worked since then, starting with the
> (stock) 2.6.4-rc3-pa6 kernel.

yes - I remember those. But I thought that was just to get the
 controller working without DMA.

> That's where I misunderstood you: I thought you patch was trying
> to fix DMA.

Well, it clearly using DMA on the C3600 I was testing.
Using PIO modes I only got 1MB/s. With DMA I was getting ~2.4MB/s.
(using a 32X CD-ROM reading a Debian hppa-linux install CD).

> I hope my bug report was not the only reason what inspired you
> to make this patch, otherwise it would have been an awful waste of
> time :-/

No - I don't think it was. My hack suggests the ns87415 driver
is incomplete in it's support for ATAPI vs other IDE devices.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
