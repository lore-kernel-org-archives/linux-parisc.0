Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA19261
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Oct 1999 12:10:36 -0600
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id MAA17879
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Oct 1999 12:11:39 -0600 (MDT)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id MAA24168 for <parisc-linux@thepuffingroup.com>; Wed, 27 Oct 1999 12:11:38 -0600 (MDT)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id MAA17359
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Oct 1999 12:11:38 -0600
Message-Id: <199910271811.MAA17359@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader 
In-reply-to: Your message of "Tue, 26 Oct 1999 09:50:37 CDT."
             <199910261550.JAA13603@debian.fc.hp.com>
Date: Wed, 27 Oct 1999 12:11:37 -0500
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


= 
= Has anyone confirmed that the kernel which is started is getting good
= data (stack, etc...) or are my kernels booting purely by accident?
= 

Phillip looked over some boot messages after being booted with the
hpux boot loader and blessed them, so things appear to be working well.

How about a COMMAND LINE?

If anyone wants to investigate a bit and work on head.S, it looks like
when launched from the current hpux boot loader that the args
passed to the kernel are

	int argc, char *argv[], char *envp[],

with some slightly bizzare stuff in the "environment", of possible
interest:

	env[2] - load address *of the boot loader itself*
	env[3] - size *of the boot loader itself*

argc will always be a low number >= 1.  If you had told ISL:

	ISL> hpux /boot/vmlinux a b c

then argc would supposedly be 4 and argv[2], for example, would be "b".
I suspect the argv[] should be copied to somewhere safe.

Note that this is very different from the statment in head.S:

         *      %arg3(=%r23) holds HALF(!) of the size of the BSS-Segment

			    -Paul Bame
