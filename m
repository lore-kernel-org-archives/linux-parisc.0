From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3600 install
Date: Sun, 13 Jun 2004 14:19:53 -0600
Message-ID: <20040613201953.GA28264@colo.lackof.org>
References: <20040612173138.GC19250@tausq.org> <26521.1087071140@www66.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matej Martini <calibrator@gmx.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <26521.1087071140@www66.gmx.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 12, 2004 at 10:12:20PM +0200, Matej Martini wrote:
> > This is actually a kernel problem; I also see this.... I talked to Grant
> > about this a bit, but we haven't reached a good conclusion. If you can
> > find a 2.6 based install, it should work.....

We need to shut down any devices the PDC has left in a state
where it might do DMA *Before* reprogramming the IOMMU.
Knowing which devices to shutdown this early and how to access
then is non-trivial.

> > 
> > this is the bit that needs fixing, in arch/parisc/kernel/inventory.c...
> > with this it should boot.
> > 
> > -       pdc_suspend_usb();
> > +/*     pdc_suspend_usb(); */

Yeah - this is a "trivial" fix for a difficult problem.
An alternative solution would be to disconnect all USB devices.
I'm hoping firmware doesn't enable DMA for USB ports if it doesn't find
anything.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
