From: "M. Grabert" <xam@cs.ucc.ie>
Subject: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Sun, 11 Jul 2004 23:48:34 +0100
Message-ID: <20040711224834.GA9503@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040711221829.GA27835@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 11, 2004 at 04:18:29PM -0600, Grant Grundler wrote:

> [ Note the date! sorry...finally got around to this...]
>
> On Tue, Mar 09, 2004 at 03:26:00PM +0000, M. Grabert wrote:
> ...

No problem, as long as it's not forgotten ;)

> > But NOW I have some very weird problem for you!
> ...
> > Anyway, the IDE hard drive works with the onboard IDE controller of the C3000!
> > ... Well, not 100%. Let me explain. The mystery is:
> > 
> > IDE works fine (without DMA support, like in the 2.4 kernels), as long as
> > I interrupt the automatic boot up and to a "sea" followed by a "bo pri".
> 
> I looked at what the firmware is doing "out of the ordinary"
> and it's only writing three config space registers at 0x40-0x42 offset
> of the suckyio IDE. I appended a patch that does the same thing.
> Well, almost. We don't want to mask interrupts in CTRL2.

Great (investigative) work!

[...]

> Can you (or anyone else) test this patch with IDE disk drive on C3000?
> If this works, I can get rid of the magic numbers (define constants)
> and commit the code.

Will try it asap and post the result on the list.

Thanks alot,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
