From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Tue, 03 Jul 2007 01:08:11 +0200
Message-ID: <4689855B.1000404__12619.8503691286$1416624406$gmane$org@frankengul.org>
References: <200707022128.l62LSHVo028664@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: doko@cs.tu-berlin.de,
 parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200707022128.l62LSHVo028664@hiauly1.hia.nrc.ca>
Resent-Message-ID: <GfuPuC.A.mU._VYiGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

John David Anglin a écrit :
> Looking at this some more, I don't think there's a missing backport
> for hppa.
> 
>> There was no reaction on either site.
> 
> The comment was too vague and will be ignored since you are modifying
>  the gcc tree.  If a gcc bug is identified, then a new gcc PR is
> needed.

Well, it was a pr on a backport. I though  it was appropriate to add the
problem to the long thread.


> 
> Looking at http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=428509, I
> don't see that gcc is doing anything wrong.  Currently, I see the 
> following with readelf for __librt_multiple_threads in librt-2.5.so 
> and libc-2.5.so on testing, respectively:
> 
> 44: 00000000     4 OBJECT  GLOBAL DEFAULT  UND
> __librt_multiple_threads@GLIBC_PRIVATE (10)
> 
> 1230: 0013e328     4 OBJECT  GLOBAL DEFAULT   32
> __librt_multiple_threads@@GLIBC_PRIVATE
> 
> The link error suggests that __librt_multiple_threads is hidden in
> libc-2.5.so. This will only occur if the symbol is defined with the
> .hidden attribute. If that's the case, the link error is expected.
> So, either the symbol shouldn't be hidden or it needs to be defined
> in librt as well.  This is a glibc issue.

Here is the readelf of the broken build :
seb@hpnux:~/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a ./libc.so 
|grep multiple_threads
   1230: 0013e328     4 OBJECT  GLOBAL DEFAULT   32
__librt_multiple_threads@@GLIBC_PRIVATE
   2737: 0013e328     4 OBJECT  LOCAL  HIDDEN   32 __libc_multiple_threads
   3961: 0013e328     4 OBJECT  GLOBAL DEFAULT   32 __librt_multiple_threads

seb@hpnux:~/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a
librt_pic.a |grep multiple_threads
     18: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __librt_multiple_threads
      6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
      6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads

I don't see anything wrong. Moreover, the readelf on the correct library 
gives exactly the same result.

To me, the gcc is the bad boy of this story.

I wonder if the gcc sees the first hidden symbol and stop there the
linking with an error without trying to go further the table to see if
another match is possible.
In this case, the problem is in the linker.

Since I don't really know the details, I'm limited to high level 
conjectures.


> 
> I should note that pa gcc backend doesn't do anything special wrt 
> .hidden.  .hidden support is handled completely by the middle-end. 
> Thus, any problem wrt .hidden in gcc is likely to apply to all
> targets that support this attribute.
> 
> Dave

Hum, so this PR is unhiding a bug in the glibc ?

Why then other arch don't seem to be impacted ?

	Seb


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
