Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AC44485A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 10:59:03 -0700 (MST)
Received: from r6.petescaff.com ([192.168.0.3])
	by smtp.petescaff.com with esmtp (Exim 3.33 #1)
	id 16db1A-0005Yt-00
	for parisc-linux@lists.parisc-linux.org; Wed, 20 Feb 2002 18:59:00 +0100
Date: Wed, 20 Feb 2002 18:59:00 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.33.0202200815060.13804-100000@goliath.alaskatech.org>
Message-ID: <Pine.LNX.4.42.0202201833210.8367-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Strange serial behaviour on C160
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

I am seeing weird serial behaviour on my C160......

Before upgrading from HP-UX to Linux I had two perfectly functioning
serial ports on my C160. I now appear to have THREE serial ports -
ttyS[0-2].

ttyS0 works perfectly
ttyS1 goes somewhere - not found where yet
ttyS2 goes to my second serial port but does not work at all well. A
simple cat of a file to the device results in the file appearing on a
terminal just a few characters at a time & incredibly slowly. All serial
ports have the same settings & ttyS0 has no problems (I use it for the
console).

I checked a C110 & found no problems there - just 2 perfect serial ports.

Anyone have any ideas?

TIA
PeteM
