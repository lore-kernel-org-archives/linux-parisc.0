From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Mon, 2 Jul 2007 21:58:45 -0400 (EDT)
Message-ID: <200707030158.l631wkrg003150__24151.0430969813$1416624406$gmane$org@hiauly1.hia.nrc.ca>
References: <4689855B.1000404@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: seb@frankengul.org (=?ISO-8859-1?Q?S=E9bastien_Bernard?=)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <4689855B.1000404@frankengul.org> from "=?ISO-8859-1?Q?S=E9bastien_Bernard?=" at Jul 3, 2007 01:08:11 am
Resent-Message-ID: <HDQRJD.A.lTE.9EbiGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> Here is the readelf of the broken build :
> seb@hpnux:~/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a ./libc.so 
> |grep multiple_threads
>    1230: 0013e328     4 OBJECT  GLOBAL DEFAULT   32
> __librt_multiple_threads@@GLIBC_PRIVATE
>    2737: 0013e328     4 OBJECT  LOCAL  HIDDEN   32 __libc_multiple_threads
>    3961: 0013e328     4 OBJECT  GLOBAL DEFAULT   32 __librt_multiple_threads
> 
> seb@hpnux:~/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a
> librt_pic.a |grep multiple_threads
>      18: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __librt_multiple_threads
>       6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
>       6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
> 
> I don't see anything wrong. Moreover, the readelf on the correct library 
> gives exactly the same result.

The error in bug 428509 is:

...
/home/seb/dev/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_timedreceive.os):(.text+0x20): more undefined references to `__librt_multiple_threads' follow
/usr/bin/ld: /home/seb/dev/glibc-2.5/build-tree/hppa-libc/rt/librt.so: hidden symbol `__librt_multiple_threads' isn't defined
/usr/bin/ld: final link failed: Nonrepresentable section on output

Looking at gcc PR 20218, it's clear that there are some very subtle
issues here.  So, it's not clear to me where the problem lies.  It
could be in glibc (hppa sysdep-cancel.h), binutils or gcc.  The handling
of the visibility attribute was broken prior to HJL's change, so it
could have exposed bugs in other packages.

Because of this, it was a mistake for Debian to backport this change.
The change is only in the unreleased gcc trunk.

Since the problem was introduced by a gcc change, I'd start with
a gcc PR and mention the patch that introduced the regression.

Could you do glibc builds with the gcc trunk before and after the change?
It's best to base the PR on an unmodified version of gcc.

It would help to know the exact details of the linker command that
fails, the assembler code generated for mq_timedreceive, and the
__librt_multiple_threads symbols in __librt_multiple_threads librt.so.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
