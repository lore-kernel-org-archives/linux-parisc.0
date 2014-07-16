From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Implementing 64bit atomic gcc built-ins
Date: Wed, 16 Jul 2014 10:24:24 -0400
Message-ID: <CAE2sS1hY-XB60MiBxguJgUCAFwJ8bxMuFHNqE40vW=OBafzwjg@mail.gmail.com>
References: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 16, 2014 at 8:40 AM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> It seems that gcc on hppa currently doesn't support 64 bit atomic built-ins
> such as __sync_compare_and_swap().
>
> Looking at the current implementation, glibc calls the LWS CAS in the kernel
> to do the compare and swap operation in an atomic way.
> The current implementation of lws_compare_and_swap64 works only with 64 bit
> kernel.

This doesn't do what you want.

IIRC both swaps, the swap32 and swap64 operate only on a 32-bit quantity

However swap32 operates using 32-bit operands e.g. addresses and values.

While swap64 operates using 64-bit operands allowing you to access
64-bit addresses, but still doing only a 32-bit swap. The upper-half
of the 64-bit "new value" should be all zeros or the swap will never
succeed. I expect the loaded 32-bit value will be sign extended so you
have to take that into account. The truth is that I don't remember
ever testing the 64-bit entry point, but it's there fore 64-bit
processes.

This is what I intended when I wrote the ABI.

> In the case of a 32 bit kernel, I'm not sure if it's possible to implement
> an atomic CAS that would work on two registers at once. If it's possible,
> most probably a lws_compare_and_swap_dword or so LWS should be created as I
> can't see the current ABI working in this scenario. As far as I understand
> the code in syscall.S, it would just be a matter of adding a ldw/stw
> instruction pair in cas_action to have 64bit operations (on top of changing
> the ABI).

It is *absolutely* possible and very easy.

For a 32-bit kernel to do a 64-bit atomic operation it needs to do
everything in two steps while holding the lws_cas locks.

For a 64-bit kernel you can simply use load double-word.

> If we are running a 64bit kernel, I guess it might be possible to call
> lws_compare_and_swap64 from userspace, but it means that we would have to
> switch to wide mode in userspace prior to perform the call.
> Again, I'm not sure that this is doable as it seems that to do so, the RSM
> instruction needs to be used while it's a privileged level instruction.
> Another option is to create lws_compare_and_swap_dword with a different ABI
> that would take 64bit integers stored in two '32bit' registers, merge the
> registers into a single one and call lws_compare_ans_swap64.

I would avoid switching to wide mode in userspace because you can
still take a signal between the switch and entering the kernel and
that would be catastrophic since you'd be running 32-bit code in wide
mode without having taken the appropriate precautions.

I would suggest creating lws_compare_and_swap_dword with a distinct ABI.

You will need two return registers for the 32-bit ABI, high and low.

> For me, the best course of action here is to create
> lws_compare_and_swap_dword. Provided we can perform the CAS operation on two
> registers at once, it would solve the problem for 32bit userspace CAS to
> either kernel word size.

Agreed.

> Would this approach work or is it a dead end ?

It is not a dead end, it's quite a nice project and enables 64-bit or
N-bit atomics using LWS CAS.

> Any comments/advices ?

Cheers,
Carlos.
