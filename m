Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id F34C84879
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 03:03:33 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Tue, 9 Mar 2004 11:03:28 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
In-Reply-To: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403091103.29310.deller@gmx.de>
Cc: Andy Walker <andy@puszczka.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Montag, 8. März 2004 12:28, Andy Walker wrote:
> I've a B132L running Gentoo. With 2.4 I had the PS/2 keyboard working fine
> throught a Raritan Compuswitch KVM, but the mouse (wireless Intellimouse
> clone - 2 buttons pluss roller/middle) was dead. Decided to try out 2.6
> partly to excercise udev, but mostly in the hope that all the input layer
> work and PS/2 changes would bring the mouse to life. I should probably add
> that there are two PCs on the KVM - one running 2.6.3 and one running
> 2.4.24. Both run the mouse and keyboard flawlessly.
> 
> To the point. I grabbed 2.6.3-pa0 from Gentoo hppa-dev-kernel, configured
> and compiled it. The keyboard and mouse are both dead. I downloaded
> 2.6.4-rc1-pa2 from cvs.parisc-linux.org but the result is exactly the same.
> Some info below. Clues anybody?
....
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ATKBD is not set

Please enable this one (CONFIG_KEYBOARD_ATKBD), and....

> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> CONFIG_KEYBOARD_HIL=y
> CONFIG_INPUT_MOUSE=y
> # CONFIG_MOUSE_PS2 is not set

this one too.

In the latest 2.6 kernel series, we switched from a parisc-only
PS/2 mouse/keyboard driver to the standard linux kernel PS/2
mouse keyboard drivers.

Helge
