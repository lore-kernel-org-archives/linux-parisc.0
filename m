From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Suspend lockup detectors before system halt
Date: Tue, 25 Jul 2017 22:00:35 +0200
Message-ID: <73bd7969-af81-daa2-781e-5ff580311dbe@gmx.de>
References: <20170725194141.GA14760@p100.box>
 <5403864.sYzayCyLUt@daneel.sf-tec.de>
 <d015022e-2ecd-889f-7466-348fa2c230a6@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d015022e-2ecd-889f-7466-348fa2c230a6@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25.07.2017 21:55, Helge Deller wrote:
> On 25.07.2017 21:47, Rolf Eike Beer wrote:
>> Helge Deller wrote:
>>> Some machines can't power off the machine, so disable the lockup detectors
>>> to avoid this watchdog BUG to show up every few seconds:
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-shutdow:1]
>>
>> I don't think HPPA is the only architecture that has this problem,
> 
> Maybe.
> I haven't heard of others yet, probably because most other architectures
> do power off themselves, so they won't see this problem.
> 
>> so isn't there a generic solution? Or: is it time to add one?
> 
> Sure, you are welcome to test, post and discuss patches upstream if you like.

By the way, I still see another lockup once (workqueue lockup) even after this patch.
In general it seems most lockup detectors don't unregister themselves in the
poweroff/shutdown phase (which might be intentional):  

[  123.664431] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 36s!
[  123.857429] Showing busy workqueues and worker pools:
[  123.917919] workqueue events: flags=0x0
[  123.963830]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256                 
[  123.967817]     pending: vmstat_shepherd                                         
[  124.082949] workqueue events_freezable: flags=0x4                                
[  124.139364]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256                 
[  124.143350]     pending: pci_pme_list_scan                                       
[  124.260448] workqueue events_power_efficient: flags=0x80
[  124.324059]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256
[  124.328045]     pending: neigh_periodic_work
[  124.447237] workqueue mm_percpu_wq: flags=0x8
[  124.499488]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256
[  124.510543]     pending: vmstat_update
[  124.616432] workqueue mpt_poll_1: flags=0x8
[  124.666595]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256
[  124.673079]     pending: mpt_fault_reset_work

Helge
