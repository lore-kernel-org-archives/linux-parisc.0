Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Yasholomew Yashinski <yashy@mail.yashy.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000 
In-Reply-To: Message from Yasholomew Yashinski <yashy@mail.yashy.com>
   of "Sun, 10 Feb 2002 18:53:54 EST." <20020210184529.Y48612-100000@mail.yashy.com>
References: <20020210184529.Y48612-100000@mail.yashy.com> 
Date: Sun, 10 Feb 2002 21:43:31 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020211044331.71711482A@dsl2.external.hp.com>
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

Yasholomew Yashinski wrote:
> 
>  I recently purchased an HP 9000/785/B1000. I tried to use the
> pasrisc*.iso as I've been using on my 712/*'s, however there appears to be
> issues using 32-bit as default.

32-bit kernel is preferred. B1000 can run both 32 or 64-bit kernels.

> Setting up a serial console for this
> machine will not be a trivial task, due to its location.

Is the machine difficult to access or is a *second* machine
with an available serial port hard to find? No old laptops about?

> Is there anyone
> on the list that has such a beast, I could discuss installation with?

B1000 is basically a slower (CPU), "smaller" (fewer DIMM/PCI slots) C3000.
Several people on list (including myself) have C3000.

>  My next attempt will be to setup an install using rbootd, however it
> appears I will require serial console access.

Yes.  Viz-EG PCI *may* get some support pretty soon. A few people are
playing with it right now.

But don't expect a new ISO anytime soon with Viz-EG PCI support.
Install 0.9.3, apt-get update/dist-upgrade,  and pull a kernel from
ftp.parisc-linux.org/kernels/32. Then you'll ready to grab bits
as soon as it works.


grant
