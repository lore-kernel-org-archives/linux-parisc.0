From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] parport_gsc unuseable
Date: Wed, 7 Dec 2005 22:34:18 +0100
Message-ID: <200512072234.19116.deller@gmx.de>
References: <20051206205902.4cb1290d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: Guy Martin <gmsoft@tuxicoman.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051206205902.4cb1290d.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 06 December 2005 20:59, Guy Martin wrote:
> Since 2.6.12, the parport_gsc driver is not useable due to some changes in the parport driver.
> A 'select PARPORT_NOT_PC' line in the Kconfig was added to every non-pc driver but the gsc one.
> Patching the kernel with the attached fix makes the parport driver working again.

Thanks !
Applied to 2.6.15-rc5-pa3.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
