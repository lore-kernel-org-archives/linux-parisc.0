Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3D8304829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 15:02:32 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Yves Bodack" <bodack@stud.fh-heilbronn.de>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Sun, 22 Sep 2002 23:01:17 +0200
References: <03ab01c26266$2416dea0$1f96078d@acid>
In-Reply-To: <03ab01c26266$2416dea0$1f96078d@acid>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="windows-1252"
Message-Id: <200209222301.17581.deller@gmx.de>
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

Hi Yves,

On Sunday 22 September 2002 20:30, Yves Bodack wrote:
> 2nd problem is I can't start X. I'm using Helge Deller's XFConfig-4 from
> ftp.p-l.org and just changed Depth from 8 to 24 bpp.
>
> (EE) FBDev(0): FBIOPUT_VSCREENINFO: Invalid argument

and your dmesg says:

STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f8000000, hpa at f8000000
STI id 26d148ee-40a00499, conforms to spec rev. 8.02
STI device: HPA1439A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 26d148ee, mmio: 0xf8100000

So you should use 8bpp, and might try 32bpp.

Greetings,
Helge
