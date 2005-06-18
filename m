From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel panic while mounting a CD-ROM drive
Date: Sat, 18 Jun 2005 16:48:21 -0600
Message-ID: <20050618224821.GD24175__18077.9046299451$1416623805$gmane$org@colo.lackof.org>
References: <1464443473@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Erik Heckers <erik.heckers@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1464443473@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 17, 2005 at 06:05:38PM +0200, Erik Heckers wrote:
> 
> Hello!
> 
> The same happens on my C3000 using the prebuild kernels from parisc-linux.org and
> a IDE cdrom drive.
> [but there is some progress as my USB keyboard works again so I can use the local monitor for login].
> I think the last kernel I tested was version 2.6.12-rc5-pa3
> 
> What 'worries' me is that I can see a message like 'module ide_cd missing' when booting.

Please capture and post the entire console output from firmware prompt
until "login" prompt.

> So far I don't know if that message indicates some error in the kernel (build) or if my configuration tells
> the kernel to load it 'dynamically' afterwards (found nothing in /etc/...)

If the kernel boots at all, you can look in /lib/modules/`uname -r`/kernel/drivers/ide/

> BTW: When I use a serial cable and connect it a PC running minicom I
> get normal console output, but suddenly (during hardware detection if
>  I remember right) it starts to beep a lot  and I get only
> garbage on the screen. After that 'dataquake' is over it works again ...

I expect this is because the suckyio chip gets reset by the
pdc_io_reset_devices() call in sba_iommu.c. And since the serial device
is integrated in suckyio, serial gets pounded as well.

> When I have some time this weekend to test the newest kernel I will try to log the boot message and kernel
> panic again - the last time it was somehow missing from my minicom logfile ...)

that would be good.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
