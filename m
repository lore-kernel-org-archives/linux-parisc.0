Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 678A5483C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 04:57:31 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Stephan Trajkoff" <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE
Date: Sun, 14 Jul 2002 12:56:29 +0200
References: <20020714065104.DF333484C@dsl2.external.hp.com>
In-Reply-To: <20020714065104.DF333484C@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200207141256.29759.deller@gmx.de>
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

Hi Stephan,

On Sunday 14 July 2002 08:52, Stephan Trajkoff wrote:
> STI GSC/PCI graphics driver version 0.9
> STI word mode ROM at f0060000, hpa at f4000000
> STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04

#define S9000_ID_ARTIST         0x2B4DED6D      /* Artist (Gecko/712 & 715) onboard Graphics */

> STI device: HPA208LC1280
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio:
> 0xf4100000
> I have this shit, can anyone help me to run XFREE in 15,16,24 or 32
> bit color?

The Artist card is limited by hardware to 8bpp only. Sorry.

> my HP is 819/K210
> Another problem how I can run PINE?
> I have downloaded with apt-get pine 4.44
> ./build lnx and ./build slx don't work
> there is an error in PINE
> before compiling pine, I did apt-get dist-upgrade

No idea.

Greetings,
Helge
