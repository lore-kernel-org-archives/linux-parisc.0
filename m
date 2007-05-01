From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Tue, 01 May 2007 22:09:46 +0200
Message-ID: <46379E8A.8080705__12770.2615144246$1416624345$gmane$org@aurel32.net>
References: <20070501194214.GB4309@amd64.aurel32.net>
	<119aab440705011255q81be693v5166a6a984735e06@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705011255q81be693v5166a6a984735e06@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos O'Donell a écrit :
> On 5/1/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
>> We have just switched to a glibc 2.5 using LT + TLS in Debian. This
>> causes unaligned memory access when using bash:
>>
>> bash(19279): unaligned access to 0x000e1bb2 at ip=0x407cb76b
> 
> Why doesn't this ip match the runtime disassembly you have below?

Well I don't really now. The address return by the kernel is not
aligned, so that's strange. Note that this does not correspond to the
same execution. I run it once to get the entry in the kernel log, and
once with unaligned=signal to get the SIGBUS in gdb.

The address (computed using the contents of r1) matches.

>> Using prctl to trap on aligned access and gdb, the unaligned access
>> seems to be in closedir() (a glibc function), at the point marked by
>> a '*'.
> 
> Is this a dump from disassemble in gdb at runtime?

Yes, running in prctl --unaligned=signal

> What is the value of r19, r2, and r30 at the point of the unaligned access?

rp             0x40bcb753       1086109523
r19            0xe05c6  918982
sp             0xc04b4c00       3226160128

>> The problem does not look obvious (at least to me). Any idea?
> 
> Yes, but I need answers to my three questions :-)

Thanks for your help.

Cheers,
Aurelien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
