Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 7AA504829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 04:24:24 -0600 (MDT)
Message-ID: <3D89A5D4.8050306@itp.bg>
Date: Thu, 19 Sep 2002 13:24:20 +0300
From: Stephan Trajkoff <stephan@itp.bg>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------060604040603010400060207"
Subject: [parisc-linux] PPPD+PPTPD
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

This is a multi-part message in MIME format.
--------------060604040603010400060207
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello, please see the attachment.
I use 2.4.18-pa61 kernel and enabled PPP support
PPPD version is 2.4.1, PPTPD is 1.1.3

--------------060604040603010400060207
Content-Type: text/plain;
 name="ppp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp"

Sep 19 13:22:41 obzor pppd[17190]: read: Resource temporarily unavailable
Sep 19 13:22:41 obzor pppd[17190]: read /dev/ppp: Resource temporarily
unavailable
Sep 19 13:22:41 obzor pppd[17190]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>
<auth pap> <magic 0x2479cb91> <pcomp> <accomp>]
Sep 19 13:22:41 obzor pppd[17190]: sent [LCP EchoReq id=0x0
magic=0x2479cb91]
Sep 19 13:22:41 obzor pppd[17190]: rcvd [PAP AuthReq id=0x1 user="kpematop"
password=<hidden>]

--------------060604040603010400060207--
