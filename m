From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Sun, 08 Jul 2007 14:44:18 +0200
Message-ID: <4690DC22.1070307__24108.4212706939$1416624408$gmane$org@aurel32.net>
References: <200707051728.l65HSg7S008597@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: jbailey@raspberryginger.com,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200707051728.l65HSg7S008597@hiauly1.hia.nrc.ca>
Resent-Message-ID: <cBHGEB.A.Rt.txNkGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

John David Anglin a écrit :
>> On the other hand, the LinuxThreads build on other architectures are
>> still fine even with the latest gcc in Debian.
> 
> Is the __librt_multiple_threads symbol defined, undefined or not
> used in librt.so?
> 

On both hppa and m68k I get:
00000000      DO *UND*  00000004  GLIBC_PRIVATE __librt_multiple_threads

On hurd-i386, kfreebsd-i386 and kfreebsd-amd64, __librt_multiple_threads
is not present in librt.so

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
