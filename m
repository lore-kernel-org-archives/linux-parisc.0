Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 3A2F84846
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 18:22:29 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 16 Apr 2002 02:18:38 +0200
References: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com> <200204151232.46311.helge.deller@sap.com> <20020415173544.GO4971@sleepie.demon.co.uk>
In-Reply-To: <20020415173544.GO4971@sleepie.demon.co.uk>
MIME-Version: 1.0
Message-Id: <200204160218.38885.deller@gmx.de>
Subject: [parisc-linux] WARNING: Kernel 2.4.18-pa20 is experimental !
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

> On Mon, Apr 15, 2002 at 12:32:46PM +0200, Helge Deller wrote:
> > Older kernels just didn't reported it, but all had this problem.
> > We're not freeing the memory yet, since we still have one or more
> > __init or __initdata too much in our kernel. Just ignore it for now.

FYI, I've re-enabled the freeing of boot memory in the CVS version
of kernel 2.4.18-pa20 and am very interested in getting your feedback.
But, since this change _could_ do anything to your system, please don't use 
it if you have important data on your disks (or at least without having 
a backup somewhere).

In case you see any boot-related or other strange problems with this kernel, 
please let me know as soon as possible and remember to attach your .config file.
I've tested this kernel on all my machines and haven't had any problems yet, so
I personally think it's safe to use this kernel. But in any case: You've been warned :-)

Thanks,
Helge
