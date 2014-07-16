From: Helge Deller <deller@gmx.de>
Subject: Re: Implementing 64bit atomic gcc built-ins
Date: Wed, 16 Jul 2014 21:37:39 +0200
Message-ID: <53C6D483.3000903@gmx.de>
References: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be> <CAE2sS1hY-XB60MiBxguJgUCAFwJ8bxMuFHNqE40vW=OBafzwjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>,
	Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1hY-XB60MiBxguJgUCAFwJ8bxMuFHNqE40vW=OBafzwjg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/16/2014 04:24 PM, Carlos O'Donell wrote:
> On Wed, Jul 16, 2014 at 8:40 AM, Guy Martin <gmsoft@tuxicoman.be> wrote:
>> In the case of a 32 bit kernel, I'm not sure if it's possible to implement
>> an atomic CAS that would work on two registers at once. If it's possible,
>> most probably a lws_compare_and_swap_dword or so LWS should be created as I
>> can't see the current ABI working in this scenario. As far as I understand
>> the code in syscall.S, it would just be a matter of adding a ldw/stw
>> instruction pair in cas_action to have 64bit operations (on top of changing
>> the ABI).
> 
> It is *absolutely* possible and very easy.
> 
> For a 32-bit kernel to do a 64-bit atomic operation it needs to do
> everything in two steps while holding the lws_cas locks.

I agree this would work if userspace only modifies the atomic dword through the new lws call.
But is it still "atomic" if some other thread modifies the 64bit value not through the lws?
I mean, isn't there a possibility, that the upper or lower 32bit may be changed unexpectedly and out-of-sync?

Helge
