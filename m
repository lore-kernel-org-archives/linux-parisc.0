Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92003482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 09:33:21 -0600 (MDT)
Sender: d036493@sap-ag.de
Message-ID: <3B56FDBF.9B22DA1C@sap.com>
Date: Thu, 19 Jul 2001 17:33:19 +0200
From: Helge Deller <helge.deller@sap.com>
MIME-Version: 1.0
To: Damm <Damm@maico.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715/64 wide mode problem
References: <364340662789D31198FC006094B958C5A19B56@maicoexs>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi,

The 715/64 has a 32bit CPU and can't run wide mode (64bit) kernels. 
Get the 32bit ISO image and install that one.
Since I have the same box, I know that the 1.6 firmware is up-to-date
and that your box should run without any problems.
(And: your p75 isn't that bad compared with the 715/64) :-)

Greetings,

Helge

Damm wrote:
> 
> i'm trying to install pa-risc linux on a hp 9000/715/64 box via an
> internal cdrom drive.  the kernel boots up but then reports
> 
>   "firmware does not allow selection of default wide mode.
>    are you trying to boot a 64bit kernel on a pa1.1 box?"
> 
> the processor revision is 2.4 (guess that pa1.1 refers to this) and
> bootrom is reported to be 1.6 (another guess: means firmware version
> is 1.6--which according to hp's site is the most 'recent' revision).
> i scanned the archives but got lost in the myriads of weird tech
> stuff.  if anyone can help me with this, that would be cool (otherwise
> i'd have to install linux on a crappy old p75).  thanks in advance.
> 
> -rene

-- 
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Helge Deller                            email: helge.deller@sap.com
SAP AG Walldorf/Baden, Germany         
LinuxLab                               

SAP LinuxLab support address: linux@sap.com
