Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72CCB4840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 30 Jan 2004 12:49:37 -0700 (MST)
Date: Fri, 30 Jan 2004 12:49:36 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] sti & b2k: doesn't work?
Message-ID: <20040130194936.GA14621@colo.lackof.org>
References: <20040130160958.GB12688@colo.lackof.org>
	<4015306100003890@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4015306100003890@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 30, 2004 at 06:31:31PM +0100, Joel Soete wrote:
> I so have a look:
> in 2.4
> CONFIG_USB_HID=y
> CONFIG_USB_HIDINPUT=y
> 
> Is what I have to use (I also encounter CONFIG_USB_KBD and CONFIG_USB_MOUSE
> but not see how to select with menuconfig?)

I don't have USB_KBD or USB_MOUSE set in my linux-2.4/.config file.
You also have USB_OHCI?

> in 2.6 it is not yet a default: should I also used CONFIG_USB_HID=y; CONFIG_USB_HIDINPUT=y?

yes, among others. See the ftp://ftp.parisc-linux.org/kernels/c3000
for config files and kernels that work on c3000 with STI/USB console.
All the .tgz files have: vmlinuz, .config, System.map, /lib/modules

grant
