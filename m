From: Helge Deller <deller@gmx.de>
Subject: Re: ptrace interface does not permit modification of syscall return
Date: Tue, 19 Jan 2016 16:11:02 +0100
Message-ID: <569E5206.8020309@gmx.de>
References: <20151221175558.GA11489@vapier.lan> <5679BC60.5090107@gmx.de>
 <20151228180307.GI25803@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: linux-parisc@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20151228180307.GI25803@vapier.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 28.12.2015 19:03, Mike Frysinger wrote:
> On 22 Dec 2015 22:10, Helge Deller wrote:
>> On 21.12.2015 18:55, Mike Frysinger wrote:
>>> i have a ptrace program that watches for specific syscalls and when
>>> matched, will:
>>>  - on entry change the syscall nr to -1 (so the kernel will skip it)
>>>  - on exit change the return to -EPERM so the userspace sees a denial
>>>
>>> i have this working on most arches (x86, x86_64, arm, alpha, ia64, etc...).
>>> on parisc, the kernel (using 3.18.7 currently) appears to be wrong.  in my
>>> tests, if i don't mess with the syscall nr, i can change the return value
>>> fine (to EPERM or whatever).  but the syscall executed which i do not want.
>>> if i change the syscall to -1, then i can't change the return value (so the
>>> child sees ENOSYS), but the kernel still executes the original syscall.
>>>
>>> i have a simple test case attached to show the issue.  the code does:
>>>  - spawn a child with the parent tracing it
>>>  - child will do:
>>>   - dupe stderr to another fd
>>>   - unlink a file named ".test.flag"
>>>   - write a message through the new fd
>>>   - close a magic # so the parent knows to start denying
>>>     - should see EPERM but it sees ENOSYS
>>>   - close the new fd
>>>     - should see EPERM but it is closed!
>>>   - write to the new fd
>>>     - should work, but the fd is closed
>>>   - call create on ".test.flag"
>>>     - should see EPERM, but the file is created!
>>>  - parent will do:
>>>   - log the syscalls until child runs close(-12345)
>>>   - the parent will then try to deny all close/creat calls
>>>   - uses PTRACE_POKEUSER w/PT_GR20 to set syscall to -1
>>>   - uses PTRACE_POKEUSER w/PT_GR28 to set return to -EPERM
>>>
>>> you can run the test case by doing:
>>> $ gcc test.c && ./a.out
>>
>> I agree, something is fishy :-)
>>
>> I did some tests with your testcase.
>> First problem I had was, that compiling failed since it didn't found the asm/offset.h header file.
>> Which one did you used? I know it usually should come with the kernel headers, but there it is asm-offsets.h.
> 
> hmm, looks like it got installed by hand at some point (Jul 2004 datestamp!)
> and never cleaned up.
> 
>> First problem: I had to install the 64bit header file. PT_GR20 in this one was much higher than it should be for 32bit userspace.
>>
>> So, I used those defines (taken from the strace source package):
>> #define PT_GR20 (20*4)
>> #define PT_GR26 (26*4)
>> #define PT_GR28 (28*4)
>> #define PT_IAOQ0 (106*4)
>> #define PT_IAOQ1 (107*4)
> 
> these are the values in my local asm/offset.h, and what i was using
> in my original code -- the register # multiplied by 4.
> 
>> With that I got those output:
> 
> looks like you're seeing the same as me.  i'm only testing 32bit user
> and 32bit kernel currently as we don't have a 64bit userspace :).

Mike, can you please test the patch I just posted:
https://patchwork.kernel.org/patch/8063301/

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWnlIGAAoJEKGDlV8wpRJB01AP/1e5cO5DfF2UtDGAC8SNqB1x
4uCIEyCrKyAkNbrfy3HSQ2OVdenuZnxq/z5LiQeY9k8j4IfZgpU8v7fADZz76L1z
CsVyIAwi7BQqUUeV6otWo5o1mAZ1F9dvS4jPFpxROotgmBCkhDcAYP6xGpoKbAET
VDhgwjgsZLXOuONoxfONaveZGRMjZGbm5nrvra30kfQhzilew5EmWGchWvv5QFAE
scukm0Prfi9roefagIllvZrLjGLenQ7Wa/opWrH/KxbkN3t8cQprXUv8ejEEUG8v
mCrUQRfHdbgVpzMFyCbdtoRVBRRtRl3Z9Ht8DqgYiuaW34iDA6Una/ntBC/Z0SdD
WySBINwuG6VL8gLrS7zMuKyBrhY37PV+eeo+GC0C6bNr37oPgJ1HLqOj8B2tlHU+
/EJYaLSDMXHsrukF+XSOzq9pbiCpPvU3ApzpZnPcypNMid3/6LKf6fIvu/4P/8xK
09gCZrHRXI5J65Qya6oQHP2N1YJYRJzHUct1N6hEJ01DEDfUZxkHun8EDYHC879f
RZ7UE2jNJlBAMXTel0HGthgXrqPyM18ePlA4yv5YVK1Z7Ai+wT7j+CL5hnI46x9X
71PugI5vMzZZQ+N9alW9KG2E/RAzcx1Mu/SjntoXBD7jdv1u+DiQtbhD/ahP61Pt
+4I+Icqo62/Ql3Y2r8Ia
=2LNU
-----END PGP SIGNATURE-----
