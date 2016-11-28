From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Aw: Re: parsic: strange boot crash on a500
Date: Mon, 28 Nov 2016 12:30:07 -0500
Message-ID: <cbdcebba-4768-da10-9ebf-69a244d244f6@bell.net>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
 <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
 <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
 <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
 <alpine.LRH.2.20.1611280013540.19497@math.ut.ee>
 <trinity-e31b21fb-9eb0-43ac-9d20-c8882740e7d6-1480347397040@3capp-gmx-bs03>
 <trinity-2cc16b5d-53b2-4332-8a92-566526865345-1480347604360@3capp-gmx-bs71>
 <alpine.LRH.2.20.1611282036240.11649@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611282036240.11649@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-11-28 1:37 PM, Meelis Roos wrote:
> Old binutils, but here is my vmlinux that does not boot (slightly larger
> than vmlinux-4.8.0):
Maybe compare ELF PHDRS and sections with working and non working 
kernels.  I think Helge
may have changed the placement of some stuff.

Dave

-- 
John David Anglin  dave.anglin@bell.net

