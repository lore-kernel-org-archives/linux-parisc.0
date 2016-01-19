From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix ptrace: syscall number and return value
 modification
Date: Tue, 19 Jan 2016 21:13:24 +0100
Message-ID: <569E98E4.5010304@gmx.de>
References: <20160119150849.GA22546@p100.box>
 <20160119194707.GE14840@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160119194707.GE14840@vapier.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 19.01.2016 20:47, Mike Frysinger wrote:
> On 19 Jan 2016 16:08, Helge Deller wrote:
>> Mike Frysinger reported that his ptrace testcase showed strange
>> behaviour on parisc: It was not possible to avoid a syscall and the
>> return value of a syscall couldn't be changed.
>>
>> To modify a syscall number, we were missing to save the new syscall
>> number to gr20 which is then picked up later in assembly again.
>>
>> The effect that the return value couldn't be changed is a side-effect of
>> another bug in the assembly code. When a process is ptraced, userspace
>> expects each syscall to report entrance and exit of a syscall.  If a
>> syscall number was given which doesn't exist, we jumped to the normal
>> syscall exit code instead of informing userspace that the (non-existant)
>> syscall exits. This unexpected behaviour confuses userspace and thus the
>> bug was misinterpreted as if we can't change the return value.
>>
>> This patch fixes both problems and was tested on 64bit kernel with
>> 32bit userspace.
> 
> thanks, i'll give it a spin on my box too
> 
> on a related note, can you check if arg reloading works too ?
> i.e. i should also be able to mung syscall args on the fly.
> e.g. if the tracee does open("/foo", O_RDWR), the tracer should
> be able to munge it to do open("/foo", O_RDONLY).

I didn't tested it, but from looking at the assembly the user args get
reloaded from the task struct after having called do_syscall_trace_enter().
So, in theory it should work.

Helge
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWnpjkAAoJEKGDlV8wpRJB5G4P/3FgRUNuPKs/zfTKMuvM7o4e
WX6dyBGGUJAghRLaqX9nrCTsE78Bg2BNT3sPOZ13Zac6hjxoxhCAJz0J0iuVkTpY
dTiZAgqLzErsTQr5WpQCVrbCE5qF09/7HGItOWAFn4GRurqIehId0k7vRmHDmb24
L5/lJzoTTll+8UO6k5MyOfHXyOLRiK+Ci0BMCXsi8b5NCCPBuMQoErwowrVyMSz9
2YFIbdWdHjUwwFruodn9rOQ+tNzeVL2uQbPCj6tyy7iIx7rEiYutrc3bz3SDl7in
MoFRurF6hjeRl38EjgkwgD52V5y9P2mJkhiTj3hxnUvKbTiE7Dhm7dxeGyRlMJ3L
TJIHhOhbO8GaPkeDrxhwCJV89oTHKN7l2YxTHjadgiJA9rSyR9R93cC9ltqy/5we
+y/JmUy+zohD9A12hwPfdU7srkMfHML/Uphu/R4D/LALOmWDm1U7+gistvRl1qhk
wECzweYw34nRXDsXxdI/Ey2YmdPVOfLxHtWtTokdNGNCwHsObDbOJ/lG2dx68qwA
b0w/IasML7ziqdtgUxsYePjG+IKynlS1qTqbFiGTxYa9vXUP3u4qSEIk0MDoMdxb
98CQYCG625gbMbqh8TSMgdh8qTt/1LMGh8Oh8QugWec+g7IpViHoFpkkrX4StGt+
GHHaM53rPq0Os65vAL67
=S6Ir
-----END PGP SIGNATURE-----
