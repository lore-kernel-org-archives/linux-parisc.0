Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id ABBFE4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 07:43:55 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
Date: Sun, 1 Jun 2003 15:44:17 +0200
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
In-Reply-To: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Message-Id: <200306011543.59335.deller@gmx.de>
Content-Type: text/plain;
  charset="iso-8859-1"
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

On Sunday 01 June 2003 15:04, Bjoern A. Zeeb wrote:
> is there a chance that one can recover from s.t.h like this ?
>
> Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
> palo_kernel=3/boot/vmlinux-2.5.60-pa1' Selected kernel:
> /boot/vmlinux-2.5.60-pa1 from partition 3
> ERROR: open /boot/vmlinux-2.5.60-pa1 from partition 3 failed

You could boot a good kernel via tftp. That's how I test different kernels...

Helge
