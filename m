Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D2EDD482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Feb 2002 02:31:08 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Yasholomew Yashinski <yashy@mail.yashy.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000
Date: Sat, 23 Feb 2002 10:26:28 +0100
References: <20020223013935.D3685-100000@mail.yashy.com>
In-Reply-To: <20020223013935.D3685-100000@mail.yashy.com>
MIME-Version: 1.0
Message-Id: <200202231026.28084.deller@gmx.de>
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

On Saturday 23 February 2002 07:50, Yasholomew Yashinski wrote:
> How do I switch from stifb to sticon (I just apt-get'd xfree86)?

stifb supersedes sticon and you won't be able to run X11 on sticon -
so stifb is what you want and if you see TUX at bootup your
kernel stifb driver is active.

In your .config you'll find:		for:
CONFIG_FB_STI=y			-> stifb
CONFIG_FBCON_STI=y		-> stifb
CONFIG_STI_CONSOLE=y	-> sticon
Leave all enabled and you will get the best graphics support which
we currently support on your system.

>  I'd just like to confirm:
> eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
>  is correct?

It's OK, you are just connected to a hulf-duplex partner.

Helge
