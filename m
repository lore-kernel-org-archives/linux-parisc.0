Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71641482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 08:52:46 -0600 (MDT)
Message-Id: <200108301452.QAA23603@sap-ag.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>,
	"'Parisc Linux Mailinglist'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
Date: Thu, 30 Aug 2001 16:52:44 +0200
References: <8D4C69676E66D511A1CB00508BBBB19216273B@ranmx1.ran.harris.com>
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB19216273B@ranmx1.ran.harris.com>
MIME-Version: 1.0
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 30 August 2001 15:20, Pedot, Wolfgang wrote:
> Hi,
>
> at last kernel 2.4.9-pa10 worked on my 715/75 but I still can´t use the
> sound-chip although the CVS-Log for harmony.c says
> "- harmony.c: support all kinds of 712/715 machines again" for Revision
> 1.13. Anybody had any luck using the soundchip on a 715 machine?
>
> greetings
> Wolfgang Pedot

Hi Wolfgang,

congrats for your success!

Regarding the harmony sound-driver: please set your output-level with
aumix and play a .mp3 file with mpg123. This worked for me on a 715/64.
If not feel free to send me your dmesg to <deller@gmx.de> so I could try 
to analyze it.

Greetings,
Helge
