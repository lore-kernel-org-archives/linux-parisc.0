Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8092482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Aug 2002 12:47:52 -0600 (MDT)
Message-ID: <3D5FDB3A.4020708@freebel.net>
Date: Sun, 18 Aug 2002 17:36:58 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sources browsing tool?
References: <1023470637.3d00ec2d3a708@webmail.tiscalinet.be> <1023475115.25523.47.camel@irongate.swansea.linux.org.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Just for reminder in this ml


Alan Cox wrote:
  > On Fri, 2002-06-07 at 18:23, joel.soete@freebel.net wrote:
  >
  >>Hi all,
  >>
  >>Can you advise me some browsing tools which would allowing me to find
quickly
  >>where a variable, a function is define; where is used,... in this big
amount
  >>source which represent kernel now (find is not always easy).
  >>
  >>I find well a work of reverse engineering (rigiedit) of the kernel
but not for 2.4.
  >>And unfortunately sources (tcl/tk iirc) do not seems to be available
to port on
  >>hppa.
  >
  >
  > Try the Linux cross reference - http://lxr.linux.no
  >


I try to install it (from src, from tarball, from cvs): no way of
success (install instruction not uptodate)
But on the same 'sf.net' I found my happyness: sourcenav (5.1.0).

An install of the Install:
./configure --prefix=/opt/sn
make
make install

(That is the first time that I had the opportunity to build a package
with so few warning. It is very beautifull and easy to use :)

And the last but not least: it works fine on my own i386 as well as on
my b2k :)
I am now impatient to test it on a big proj as linux-2.4.

Joel
