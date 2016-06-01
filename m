From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: invalid printk time during boot on PA-RISC
Date: Thu, 2 Jun 2016 00:36:28 +0300
Message-ID: <20160601213628.GC5218@raspberrypi.musicnaut.iki.fi>
References: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
 <20160601211248.GA15061@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160601211248.GA15061@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Wed, Jun 01, 2016 at 11:12:48PM +0200, Helge Deller wrote:
> It fixes the problem mostly for me, there is just one little glitch
> left, which is that the lines "FP[x] enabled" will still print an
> invalid time. I assume it's because when this text is printed, the
> clock/interrupts for the just booted CPU aren't enabled yet.
> 
> I'm not sure it's worth trying to fix that. 
> One could print out that info at a later time, or just disabled it.
> 
> Helge
> 
> [    5.720014] Enabling PDC_PAT chassis codes support v0.05
> [    6.644542] Releasing cpu 1 now, hpa=fffffffffe781000
> [    0.196000] FP[1] enabled: Rev 1 Model 20
> [    7.088432] CPU(s): 2 out of 2 PA8800 (Mako) at 900.000000 MHz online

Some tools that analyze boot time based on dmesg might get confused.

A.
