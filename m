Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from iut-lannion.fr (alba.iut-lannion.fr [192.70.33.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17A484841
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 02:26:34 -0600 (MDT)
Received: from pcp91 (PCP91.iutlan.univ-rennes1.fr [129.20.233.91])
          by iut-lannion.fr (8.11.0/jtpda-5.3.1) with SMTP id g5J8QYS31181
          for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 10:26:34 +0200
Message-Id: <200206190826.g5J8QYS31181@iut-lannion.fr>
Date: Wed, 19 Jun 2002 10:24:44 +0200
To: parisc-linux@lists.parisc-linux.org
From: Bruno =?iso-8859-1?Q?L=E9on?= <nonolemono@yahoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Only serial console for B1000 (64bits) ?
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

I'm currently trying to install the Woody on a B1000 computer (64bits
architecture). 
I'm using a CD to boot - that worked fine on a B180L (32bits) - and I'm
telling palo to use the vmlinux64 instead of the simple vmlinux. This part
is done using a screen connected to the B1000 station.
My problem is that when the computer starts to boot, the screen move to
stand by mode.
Is it that only serial console is supported? I'm wondering coz I connect a
vt100 to the serial port, and I didn't get any signal on it :(

Hope you'll be able to help ;)
