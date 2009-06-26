From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.31-rc1: parisc: multiple PCI BAR collisions
Date: Fri, 26 Jun 2009 14:37:40 +0000
Message-ID: <1246027060.3925.18.camel@mulgrave.site>
References: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2009-06-26 at 12:58 +0400, Alexander Beregalov wrote:
> Hardware is HP j6000.
> It cannot initialize many PCI devices (sym53c8xx, tulip, STI,
> usb(onci)) and cannot boot (no root device).
> Messages like this:
> sym53c8xx 0:0:0f.0: device not available because of BAR 1 [0xf4005000
> - 0xf40053ff] collisions.

This tends to indicate a problem with resource parenting ... could you
post the full boot output?  That might indicate why.

James


