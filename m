From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Purge existing TLB entries in
 =?UTF-8?Q?set=5Fpte=5Fat=20and=20ptep=5Fset=5Fwrprotect?=
Date: Sun, 13 Jan 2013 23:35:49 +0100
Message-ID: <6d698ab99e1a7e2f2dded89b5dbd836d@sf-mail.de>
References: <BLU0-SMTP6386DBEA3C99F954FD63F7972F0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP6386DBEA3C99F954FD63F7972F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 13.01.2013 22:52, schrieb John David Anglin:
> This patch goes a long way toward fixing the minifail bug, and it  
> significantly
> improves the stability of SMP machines such as the rp3440.  When
> write  protecting
> a page for COW, we need to purge the existing translation.  
> Otherwise,  the COW
> break doesn't occur as expected.
>
> The patch assumes the kernel will flush page when it does copy.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

CC stable?
