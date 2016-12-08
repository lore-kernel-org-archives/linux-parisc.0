From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix TLB related boot crash with PA8000-PA8700
 CPUs
Date: Thu, 8 Dec 2016 20:58:17 +0100
Message-ID: <53d038e2-a697-8e20-4225-48034af5aaf4@gmx.de>
References: <20161207205240.GA5917@ls3530>
 <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Aaro,

On 07.12.2016 22:34, Aaro Koskinen wrote:
> On Wed, Dec 07, 2016 at 09:52:40PM +0100, Helge Deller wrote:
>> Machines with PA8000-PA8700 CPUs crash during startup while we measure
>> and calculate a good threshold for the TLB flush.
> 
> I haven't seen any crashed on HP c3700 (PA8700)...

Thanks for the feedback!
I did some additional analysis today, and it happens only on SMP machines.
I could reproduce the crash on a A500-44 and a J5000, both are 2-way boxes.

Helge
