From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: debootstrap failure?
Date: Sun, 19 Sep 2004 21:35:25 -0400
Message-ID: <20040920013524.GL17238__24423.7548592084$1416624477$gmane$org@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: LaMont Jones <lamont@debian.org>,
 Randolph Chung <tausq@debian.org>
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <a7ujoC.A.HiB.sPjTBB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>


Anyone else using debootstrap recently to get a sid chroot?

carlos@churchill:~/src$ mkdir sid_chroot
carlos@churchill:~/src$ sudo debootstrap sid sid_chroot/
I: Retrieving debootstrap.invalid_dists_sid_Release
I: Validating debootstrap.invalid_dists_sid_Release
I: Retrieving debootstrap.invalid_dists_sid_main_binary-hppa_Packages
I: Validating debootstrap.invalid_dists_sid_main_binary-hppa_Packages
I: Checking adduser...
I: Checking apt...
...
I: Retrieving fdutils
I: Validating fdutils
I: Retrieving findutils
I: Validating findutils
E: Couldn't download gcc-3.0-base
carlos@churchill:~/src$ 

carlos@churchill:~/src$ apt-cache search gcc-3.0-base
gcc-3.0-base - The GNU Compiler Collection (base package)

It's there.

Thoughts from the guru's?

I need a chroot for my experimental glibc packages for jda :)
(we have a missing "memory" clobber for syscalls!)

c.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
