Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F8DF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 02:53:36 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Joerg Hartmann <J.Hartmann@reinarts.de>,
	PARISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] what is palo/lifimage for ?
Date: Mon, 17 Dec 2001 10:53:32 +0100
References: <771295508933.20011217112142@reinarts.de>
In-Reply-To: <771295508933.20011217112142@reinarts.de>
MIME-Version: 1.0
Message-Id: <E16FuSj-0004wa-00@linuxlab.wdf.sap-ag.de>
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

On Monday 17 December 2001 11:21, Joerg Hartmann wrote:
> Hello ,
>
> yesterday i installed a new kernel for my 720.
> And now it works :)
> But there are some questions left ...
>
> The "Building the Kernel" webpage at
> http://www.parisc-linux.org/kernel/index.html says
> after "make palo" you have your new kernel in the file palo/lifimage.
> But there is no pointer what to do after this :(
> After some reading in the mailinglist archive i installed
> palo/lifimage in /boot, edited /etc/palo.conf and run palo.
>
> Then i booted my 720 just to see the message
> "Couldn't grok your kernel executable format
> ERROR: failed to load kernel" .
>
> Half an hour later i found (with the help of "file")
> that palo/lifimage is not the kenel image to boot,
> it is vmlinux in the kernel-source dir.
>
> So here comes the question: What is palo/lifimage for, or what
> am i supposed to do with it ?
> Is there another how-to for making/installing new kernels ?

Hi Joerg,

palo/lifimage is the image for netbooting a kernel via tftp/bootp (it contains
parts of the palo bootloader binary).
linux/vmlinux is the kernel image for directly booting with palo from disk (palo
is loaded from your f0 partition and then looks for the kernel image in your
data (/boot) partition).

Greetings,
Helge
