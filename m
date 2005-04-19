From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] A500: 2.4.18 64bit SMP Kernel Crash
Date: Mon, 18 Apr 2005 21:06:31 -0700
Message-ID: <20050419040631.GD19715@tausq.org>
References: <19310.64.142.78.25.1113877145.squirrel@webmail.sonic.net>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kai Holthaus <kmh@sonic.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <19310.64.142.78.25.1113877145.squirrel@webmail.sonic.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> So, I installed the 2.4.18-hppa kernel sources, and built my own kernel.
> However, the box wouldn't boot that kernel; instead it'd crash right after
> the IPL part of PALO would try to load the kernel image.
> 
> - I used the gcc-hppa64-3.0.4ds9-3-hppa.deb gcc compiler, along with the
> binutils-2.11.90.0.18-o.deb package off
> ftp.parisc-linux.org/unofficial-debs to compile

Can you try a prebuilt a500 kernel? Something from
http://cvs.parisc-linux.org/download/linux-2.6/

Perhaps:
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/a500_defconfig/palinux-a500-defconfig-2.6.12-rc2-pa3_0-2_all.deb

If you want to build it from source, I would suggest that you:
- upgrade to "testing" from woody
- install gcc-3.3-hppa64 and binutils-hppa64 (from Debian, not
  from unofficial-debs)
- Get the sources from
  http://cvs.parisc-linux.org/download/linux-2.6/linux-2.6.12-rc2-pa3.tar.bz2

  Or directly from cvs: http://www.parisc-linux.org/faq/cvs.html

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
