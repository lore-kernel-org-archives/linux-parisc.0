From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Suspend lockup detectors before system halt
Date: Tue, 25 Jul 2017 21:55:58 +0200
Message-ID: <d015022e-2ecd-889f-7466-348fa2c230a6@gmx.de>
References: <20170725194141.GA14760@p100.box>
 <5403864.sYzayCyLUt@daneel.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5403864.sYzayCyLUt@daneel.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25.07.2017 21:47, Rolf Eike Beer wrote:
> Helge Deller wrote:
>> Some machines can't power off the machine, so disable the lockup detectors
>> to avoid this watchdog BUG to show up every few seconds:
>> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-shutdow:1]
> 
> I don't think HPPA is the only architecture that has this problem,

Maybe.
I haven't heard of others yet, probably because most other architectures
do power off themselves, so they won't see this problem.

> so isn't there a generic solution? Or: is it time to add one?

Sure, you are welcome to test, post and discuss patches upstream if you like.
It's not a very critical issue, so I can wait with pushing my patch.

Helge
