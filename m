Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natpost.webmailer.de [192.67.198.65])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26A58482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 02:10:10 -0700 (MST)
Received: from computer (pec-160-68.tnt9.b2.uunet.de [149.225.160.68])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id KAA05111
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 10:10:06 +0100 (MET)
Date: Mon, 17 Dec 2001 11:21:42 +0100
From: Joerg Hartmann <J.Hartmann@reinarts.de>
Reply-To: Joerg Hartmann <J.Hartmann@reinarts.de>
Message-ID: <771295508933.20011217112142@reinarts.de>
To: PARISC Linux List <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] what is palo/lifimage for ?
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

Hello ,

yesterday i installed a new kernel for my 720.
And now it works :)
But there are some questions left ...

The "Building the Kernel" webpage at
http://www.parisc-linux.org/kernel/index.html says
after "make palo" you have your new kernel in the file palo/lifimage.
But there is no pointer what to do after this :(
After some reading in the mailinglist archive i installed
palo/lifimage in /boot, edited /etc/palo.conf and run palo.

Then i booted my 720 just to see the message
"Couldn't grok your kernel executable format
ERROR: failed to load kernel" .

Half an hour later i found (with the help of "file")
that palo/lifimage is not the kenel image to boot,
it is vmlinux in the kernel-source dir.

So here comes the question: What is palo/lifimage for, or what
am i supposed to do with it ?
Is there another how-to for making/installing new kernels ?

-- 
Best regards,
 Joerg                          J.Hartmann@reinarts.de
