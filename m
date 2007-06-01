From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: [parisc-linux] -pie is broken on hppa
Date: Fri, 01 Jun 2007 08:19:11 +0200
Message-ID: <465FBA5F.2010909__6685.40670671991$1416624380$gmane$org@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

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
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
