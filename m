Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 20 Sep 2003 18:27:33 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
Message-ID: <20030921002733.GE31268@dsl2.external.hp.com>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk> <1063989244.2834.48.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1063989244.2834.48.camel@sisko.scot.redhat.com>
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

On Fri, Sep 19, 2003 at 05:34:04PM +0100, Stephen C. Tweedie wrote:
> > > But when I use the raw interface I get garbage. For instance please
> > > look at the output below. I am reading the 1st sector of the disk,
> > > which is the boot sector, When I use the block device /dev/sda I get
> > > my expected output, whereas when I use the raw interface I get
> > > garbage. Can any one explain? The machine I am using is an L Class. 
> 
> Do you _ever_ get valid output, or is raw always failing?  There may
> well be a cache coherency point being missed.

I was able to consistently reproduce this problem on a c3000 (400Mhz
PA8500). That's running 2.4.22 kernel.

> The key places are rw_raw_dev(), where we set up the virtual address to
> physical page mappings, and brw_kiovec(), where the actual physical page
> IO is done.

ok - I should try again with 2.6 kernel and look again.
But I'm certainly no vm/cache expert.

grant
