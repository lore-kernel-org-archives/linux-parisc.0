From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix TLB related boot crash with PA8000-PA8700
 CPUs
Date: Wed, 7 Dec 2016 17:17:02 -0500
Message-ID: <9b2176a9-5f07-da7f-975b-a3ae2ead10ee@bell.net>
References: <20161207205240.GA5917@ls3530>
 <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-12-07 4:34 PM, Aaro Koskinen wrote:
> On Wed, Dec 07, 2016 at 09:52:40PM +0100, Helge Deller wrote:
>> Machines with PA8000-PA8700 CPUs crash during startup while we measure
>> and calculate a good threshold for the TLB flush.
> I haven't seen any crashed on HP c3700 (PA8700)...
I believe the issue only affects SMP machines.  My c3750 also boots okay.

Dave

-- 
John David Anglin  dave.anglin@bell.net

