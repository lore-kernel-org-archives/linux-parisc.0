Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from olsztyn.ken.pl (unknown [212.244.122.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3EBA483B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Jun 2002 16:18:35 -0600 (MDT)
Received: from h1 (pe113.olsztyn.sdi.tpnet.pl [213.76.233.113])
	by olsztyn.ken.pl (8.11.6/8.9.3) with SMTP id g5OMQCT05791
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 00:26:13 +0200
Message-ID: <000001c21bd6$66eaa440$8501a8c0@pl>
From: "Robert Boehm" <robertb@olsztyn.ken.pl>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] serial on hp712/80 buggy?
Date: Tue, 25 Jun 2002 01:22:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
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

roh wrote:
[...]
>i just played around with my machine and stated that setting the baudrate
>on the serial(rs232) to 57600(8n1) didnt work...
>using 9600baud works ok
[...]

 I have na my 710 certain inconvenience with serial ports too.
In kernel-source the initial baud_base is 727272/16 = 454545.
It works up to 19200.

By many tests I can set baud_rate beetwen 46000 and 570000.
In this range serials works, ( with errors in ppp connection, but works up
to 115200).

In 710 parallel and two serials are in WDC 16C552 with external freq gen
7.3728 Mhz
div 16 (i suppose). It gives 460800.

Now, with correct baud_base 460800 minicom works up to 115200,
pppd works with errors at the same baudrate.

Still don't work serial mouse with gpm and serial driver in X.


                                                        Robert Boehm

What is baud_base on ttyS?  ?, You can test it by:
setserial -a /dev/ttyS?
