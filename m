From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Implementing 64bit atomic gcc built-ins
Date: Wed, 16 Jul 2014 14:40:53 +0200
Message-ID: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,


It seems that gcc on hppa currently doesn't support 64 bit atomic 
built-ins such as __sync_compare_and_swap().

Looking at the current implementation, glibc calls the LWS CAS in the 
kernel to do the compare and swap operation in an atomic way.
The current implementation of lws_compare_and_swap64 works only with 64 
bit kernel.

In the case of a 32 bit kernel, I'm not sure if it's possible to 
implement an atomic CAS that would work on two registers at once. If 
it's possible, most probably a lws_compare_and_swap_dword or so LWS 
should be created as I can't see the current ABI working in this 
scenario. As far as I understand the code in syscall.S, it would just be 
a matter of adding a ldw/stw instruction pair in cas_action to have 
64bit operations (on top of changing the ABI).

If we are running a 64bit kernel, I guess it might be possible to call 
lws_compare_and_swap64 from userspace, but it means that we would have 
to switch to wide mode in userspace prior to perform the call.
Again, I'm not sure that this is doable as it seems that to do so, the 
RSM instruction needs to be used while it's a privileged level 
instruction.
Another option is to create lws_compare_and_swap_dword with a different 
ABI that would take 64bit integers stored in two '32bit' registers, 
merge the registers into a single one and call lws_compare_ans_swap64.



For me, the best course of action here is to create 
lws_compare_and_swap_dword. Provided we can perform the CAS operation on 
two registers at once, it would solve the problem for 32bit userspace 
CAS to either kernel word size.

Would this approach work or is it a dead end ?

Any comments/advices ?


Thanks,
   Guy

