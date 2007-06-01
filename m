From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: -pie is broken on hppa
Date: Fri, 01 Jun 2007 08:19:11 +0200
Message-ID: <465FBA5F.2010909__30209.9019325853$1416624380$gmane$org@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <pDTdYB.A.FM.Tp7XGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi,
I discovered that the breakage of portmap on hppa is related to the
-pie linkage.
Every program linked with the -pie option segfaults at start.
Unfortunately, portmap is unconditionnaly built with this option.
I suspect nscd is in the same case.

How can I go further in investigation ?
I would like to identify the responsible component between the toolchain 
and the glibc.

Any hint is welcome.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
