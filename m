Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 081FA4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 13:59:13 -0600 (MDT)
Date: Wed, 25 Sep 2002 23:00:40 +0200
From: Stephan <stephan@itp.bg>
To: <parisc-linux@lists.parisc-linux.org>
Reply-To: Stephan <stephan@itp.bg>
Content-Type: text/html; charset="iso-8859-1";
MIME-Version: 1.0
Message-Id: <20020925195914.081FA4829@dsl2.external.hp.com>
Subject: [parisc-linux] netacct-mysql compilation problem
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

<P>hello, today I downloaded CVS of netacct-mysql, it perfect working na x86
linux, but not on Debian HPPA. It is good software for traffic accounting
written by another bulgarian, like me:)<BR>When I start this program, these
errors appears:</P>
<P>Sep 25 22:54:02 obzor kernel: do_page_fault() pid=25917 command='nacctd'
type=15 address=0x00000000<BR>Sep 25 22:54:02 obzor kernel: <BR>Sep 25
22:54:02 obzor kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI<BR>Sep 25 22:54:02 obzor kernel: PSW:
00000000000001001111111100001111 Not tainted<BR>Sep 25 22:54:02 obzor
kernel: r00-03&nbsp; 00000000 0002a1d8 00018293 00000000<BR>Sep 25 22:54:02
obzor kernel: r04-07&nbsp; bff03f10 0002a9d8 0002a9d8 0002a9d8<BR>Sep 25
22:54:02 obzor kernel: r08-11&nbsp; 0002a9d8 0002a9d8 00018800
000d9e08<BR>Sep 25 22:54:02 obzor kernel: r12-15&nbsp; 00000000 000d8d28
000dd7c8 000e3ce8<BR>Sep 25 22:54:02 obzor kernel: r16-19&nbsp; 00000000
000d2470 0009e800 00000000<BR>Sep 25 22:54:02 obzor kernel: r20-23&nbsp;
00001000 400515e0 0002d6c0 0000208d<BR>Sep 25 22:54:02 obzor kernel:
r24-27&nbsp; 0000208d 00000000 00000000 0002a1d8<BR>Sep 25 22:54:02 obzor
kernel: r28-31&nbsp; bff03f10 00000020 bff04180 40252ff3<BR>Sep 25 22:54:02
obzor kernel: sr0-3&nbsp;&nbsp; 000024e0 000024e0 00000000 000024e0<BR>Sep
25 22:54:02 obzor kernel: sr4-7&nbsp;&nbsp; 000024e0 000024e0 000024e0
000024e0<BR>Sep 25 22:54:02 obzor kernel: <BR>Sep 25 22:54:02 obzor kernel:
IASQ: 000024e0 000024e0 IAOQ: 00017c83 00017c87<BR>Sep 25 22:54:02 obzor
kernel:&nbsp; IIR: 0e60109c&nbsp;&nbsp;&nbsp; ISR: 000024e0&nbsp; IOR:
00000000<BR>Sep 25 22:54:02 obzor kernel:&nbsp;
CPU:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp; CR30: 1c2c8000
CR31: f7feefca<BR>Sep 25 22:54:02 obzor kernel:&nbsp; ORIG_R28: bff03f10</P>
<P>where can be the problem, please help!</P>
<P>the source of netacct-mysql can be found
netacct-mysql.sourceforge.net</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>Regards</P><br>
<br>
________________________________________________<br>
This mail was sent by Godzilla 1.0<br>
