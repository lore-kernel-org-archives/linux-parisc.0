Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6E41482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 02:21:27 -0700 (MST)
Message-Id: <200111050921.KAA01677@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Christoph Plattner <christoph.plattner@gmx.at>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Old but open problem of Xfree on 2.4.9-pa75
Date: Mon, 5 Nov 2001 10:21:24 +0100
References: <3BE489EB.CBD535AD@gmx.at>
In-Reply-To: <3BE489EB.CBD535AD@gmx.at>
MIME-Version: 1.0
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

Hi Christoph,

I think you will need to limit the XFree-86 screen resolution in
/etc/XF86Config to exactly that resolution and bpp depth which 
sti/stifb tells you. Delete all other resolutions and the warnings should
go away.

Greetings,
Helge 

On Sunday 04 November 2001 01:20, Christoph Plattner wrote:
> Hello !
>
> Starting current Xfree-4.1.0.1 the system reports the already described
>
> FBIOPUT_VSCREENINFO: Invalid argument
>
> (a message not written into the log file !!)
>
> This message is written after
>
> (**) FBDev(0): Using "Shadow Frambuffer"
>
> The resulting reaction is the fatal error with an abort.
>
>
> What is the reason for that ?
> By the way, the server also reports not having
> the PCI stuff, which is perhaps not compiled in my kernel, but that
> seems not
> to be the problem here.
>
> How can this can be solved. My config uses 8 bbp, the STI console driver
> inside
> the kernel also reports 1280x1024-8 ! So this should run ....
>
> Please help
>
> Christoph P.
