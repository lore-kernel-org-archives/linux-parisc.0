From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.31-rc1: parisc: multiple PCI BAR collisions
Date: Fri, 26 Jun 2009 11:03:04 -0600
Message-ID: <20090626170304.GA20871@lackof.org>
References: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 26, 2009 at 12:58:22PM +0400, Alexander Beregalov wrote:
> Hi
> 
> Hardware is HP j6000.
> It cannot initialize many PCI devices (sym53c8xx, tulip, STI,
> usb(onci)) and cannot boot (no root device).
> Messages like this:
> sym53c8xx 0:0:0f.0: device not available because of BAR 1 [0xf4005000
> - 0xf40053ff] collisions.

Yup - I found that out yesterday too. Console output is here:
http://iou.parisc-linux.org/~grundler/console/j6000-2.6.30-parisc_2.6_parenting_failed-01
http://iou.parisc-linux.org/~grundler/console/j6000-2.6.30-parisc_2.6_parenting_failed-02

but in an IRC conversation it' clear I only dumped the "elmmio" and not
the regular "lmmio" resource request. Need to dump both.

I'm pretty sure this is a problem of the root bus resources not getting
setup correctly. I'm not clear on what's wrong. jejb and willy are looking
at it now as well.

thanks,
grant
