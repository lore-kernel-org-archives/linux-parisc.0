Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BCC54829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jun 2003 00:26:09 -0600 (MDT)
Date: Sun, 29 Jun 2003 23:30:26 -0700
From: Randolph Chung <randolph@tausq.org>
To: Mark Mestdagh <Mark.Mestdagh@Icon-Europe.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600
Message-ID: <20030630063026.GC4714@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1056953609.3effd509f3f5f@wiebel.dommel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1056953609.3effd509f3f5f@wiebel.dommel.com>
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

> I'm trying to enable an usb mouse/keyboard on a J5600. I followed the 
> instructions described on the parisc-linux website but was unable to get them 
> working. I suspect there are some special options to enable for USB but which 
> ones? As this is a SMP system I cannot use the prebuild kernels. So if someone 
> can outline the options to enable usb, that would be great ;)

Why can't you use the prebuilt kernels? kernel-image-2.4.20-32-smp
supports SMP (and the corresponding 64-bit version too...)

parisc machines use the OHCI driver, which is enabled by default in the
debian kernels.

CONFIG_USB=y
CONFIG_USB_DEVICEFS=y
CONFIG_USB_OHCI=y
CONFIG_USB_STORAGE=m
CONFIG_USB_HID=y
CONFIG_USB_HIDINPUT=y

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
