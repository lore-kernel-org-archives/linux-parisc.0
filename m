Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE818482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 01:50:25 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "James P. Kinney III" <jkinney@localnetsolutions.com>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] console switching with C160 Hyperdrive option card
Date: Tue, 11 Dec 2001 09:50:21 +0100
References: <1008039310.31094.29.camel@archimedes.localnetsolutions.com>
In-Reply-To: <1008039310.31094.29.camel@archimedes.localnetsolutions.com>
MIME-Version: 1.0
Message-Id: <E16DicI-0000Xi-00@linuxlab.wdf.sap-ag.de>
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

On Tuesday 11 December 2001 03:55, James P. Kinney III wrote:
> I loaded up the 0.9.3-rc6 iso. Loaded great onto a C160. I have a
> Hyperdrive optional graphics card that my A4033A monitor is attached to.
> The main Gecko GSC core graphics is not used. I can get a serial console
> with no problem.
>
> How do I tell palo to use the Hyperdrive card?
>
> I tried telling it console=fb0, but never got anything. I tried telling
> it sti=1, no luck there. Tried both.
>
> Suggestions welcome !

Hi James,

sti=1 should be the right value if the stifb driver detects and supports your 
hyperdrive. Maybe you could post the boot-messages regarding your 
graphic cards (`dmesg | grep sti`) ?

Helge
