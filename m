From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [CFT 10/29] Add parisc_bus_type probe and remove
	methods
Date: Thu, 5 Jan 2006 11:46:45 -0700
Message-ID: <20060105184645.GX19769__18131.2187029564$1416624581$gmane$org@parisc-linux.org>
References: <20060105142951.13.01@flint.arm.linux.org.uk>
	<20060105142951.13.10@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Greg K-H <greg@kroah.com>,
 LKML <linux-kernel@vger.kernel.org>,
 parisc <parisc-linux@parisc-linux.org>
To: Russell King <rmk@arm.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060105142951.13.10@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 05, 2006 at 02:34:38PM +0000, Russell King wrote:
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Works fine, Acked-by: Matthew Wilcox <matthew@wil.cx>

> diff -up -x BitKeeper -x ChangeSet -x SCCS -x _xlk -x *.orig -x *.rej -x .git linus/arch/parisc/kernel/drivers.c linux/arch/parisc/kernel/drivers.c
> --- linus/arch/parisc/kernel/drivers.c	Sun Nov  6 22:14:46 2005
> +++ linux/arch/parisc/kernel/drivers.c	Sun Nov 13 16:08:49 2005
> @@ -173,8 +173,6 @@ int register_parisc_driver(struct parisc
>  	WARN_ON(driver->drv.probe != NULL);
>  	WARN_ON(driver->drv.remove != NULL);

I wonder if you want to delete the two WARN_ONs here too.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
