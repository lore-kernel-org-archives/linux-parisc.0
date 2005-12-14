From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] B1000 freeze after sym0:
Date: Wed, 14 Dec 2005 11:34:49 -0700
Message-ID: <20051214183449.GY9286@parisc-linux.org>
References: <17461.1134562581@www66.gmx.net>
	<20051214183036.5960e851.heiner991@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Oliver Grafe <heiner991@gmx.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051214183036.5960e851.heiner991@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 14, 2005 at 06:30:36PM +0100, Oliver Grafe wrote:
> I "solved" it: I disconnected keyboard, mice and monitor, now the
> machine boots nicely and i get access via ssh. It's the first time i see
> a connected/disconnected USB-Keyboard got something to do with a
> SCSI driver, but it "works for me" now.
> 
> If someone is still interested in really solving this problem i'm glad
> to give further informations or compiling kernels etc...

I suspect a recent kernel, such as
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/c3000_defconfig/palinux-c3000-defconfig-2.6.15-rc5-pa5_0-2_all.deb
would work.  ISTR a bug was fixed related to having USB keyboards
enabled at boot.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
