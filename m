From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Implementing 64bit atomic gcc built-ins
Date: Wed, 16 Jul 2014 14:16:23 -0700
Message-ID: <1405545383.3165.34.camel@dabdike.int.hansenpartnership.com>
References: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2014-07-16 at 14:40 +0200, Guy Martin wrote:
> Hi all,
> 
> 
> It seems that gcc on hppa currently doesn't support 64 bit atomic 
> built-ins such as __sync_compare_and_swap().
> 
> Looking at the current implementation, glibc calls the LWS CAS in the 
> kernel to do the compare and swap operation in an atomic way.
> The current implementation of lws_compare_and_swap64 works only with 64 
> bit kernel.
> 
> In the case of a 32 bit kernel, I'm not sure if it's possible to 
> implement an atomic CAS that would work on two registers at once. If 
> it's possible, most probably a lws_compare_and_swap_dword or so LWS 
> should be created as I can't see the current ABI working in this 
> scenario. As far as I understand the code in syscall.S, it would just be 
> a matter of adding a ldw/stw instruction pair in cas_action to have 
> 64bit operations (on top of changing the ABI).

Atomic operations are only done at the natural width of the binary
architecture.  That means even on 32 bit x86 there's no natural atomic
64 bit swap and no expectation of one.  Glibc can emulate one, but it
shouldn't assume there's any natural machine op.

This should mean that a 32 bit kernel has no need at all for the 64 bit
ops to be implemented in kernel.

> If we are running a 64bit kernel, I guess it might be possible to call 
> lws_compare_and_swap64 from userspace, but it means that we would have 
> to switch to wide mode in userspace prior to perform the call.
> Again, I'm not sure that this is doable as it seems that to do so, the 
> RSM instruction needs to be used while it's a privileged level 
> instruction.
> Another option is to create lws_compare_and_swap_dword with a different 
> ABI that would take 64bit integers stored in two '32bit' registers, 
> merge the registers into a single one and call lws_compare_ans_swap64.

Same rule applies.  Until we have a 64 bit userspace, we have no use for
64 bit atomic swaps.

James


