From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Tue, 10 Jul 2007 06:11:09 +0200
Message-ID: <469306DD.807__3306.61730045012$1416624410$gmane$org@aurel32.net>
References: <200707081504.l68F47s9007180@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: jbailey@raspberryginger.com,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200707081504.l68F47s9007180@hiauly1.hia.nrc.ca>
Resent-Message-ID: <DjtNtD.A.SL.ncwkGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

John David Anglin a écrit :
>>>> On the other hand, the LinuxThreads build on other architectures are
>>>> still fine even with the latest gcc in Debian.
>>> Is the __librt_multiple_threads symbol defined, undefined or not
>>> used in librt.so?
>>>
>> On both hppa and m68k I get:
>> 00000000      DO *UND*  00000004  GLIBC_PRIVATE __librt_multiple_threads
> 
> So, it would seem m68k is also broken if the definition
> in libc-2.5.so is hidden.

Well it is not hidden on m68k and also not on hppa. The symbol is
defined the same way on both architectures in libc.so:

0013e328 g    DO .bss   00000004  GLIBC_PRIVATE __librt_multiple_threads



-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
