Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id EAF22482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Apr 2002 09:56:59 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "kenneth westelinck" <kennywest1@hotmail.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Sat, 20 Apr 2002 17:51:27 +0200
References: <F124jLDxo1dHkLl0atJ00008874@hotmail.com> <OE54mEB4HGXAwxXSXI3000037e7@hotmail.com>
In-Reply-To: <OE54mEB4HGXAwxXSXI3000037e7@hotmail.com>
MIME-Version: 1.0
Message-Id: <200204201751.27272.deller@gmx.de>
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

Hi Kenneth,

I think the problem is your 712/60, which (maybe) doesn't support 
soft-power-off. 
Please look into your dmesg, there you should see one of:
1. Gecko-style soft power switch enabled,
2. Soft power switch support not available.
3. Soft power switch enabled, polling @ 0x<addr>

I suppose your 712/60 will give you #2 and that's why it will not work.

Helge

On Saturday 20 April 2002 15:48, kenneth westelinck wrote:
> Hi again,
>
> Okay, I had a busy week and didn't get any chance to compile a new kernel.
> Today I've managed to get the 2.4.18-pa20 up and running, but the power
> button is still not working as expected. Pressing the button with "Software
> power switch support: enabled" powers down the machine instantly (as
> before). When I disable the powerswitch with "sysctl -w kernel/power=0" I'm
> having the same result. Am I missing something?
> Attached to this mail you can find my .config - file
> Thanks.
>
>
> regards,
>
> Kenneth
