Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from melanieb.vtt.fi (melanieb.vtt.fi [130.188.1.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91828482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 07:12:55 -0700 (MST)
Received: from elemail.ele.vtt.fi (localhost [127.0.0.1])
	by melanieb.vtt.fi (8.9.3/8.9.3) with ESMTP id QAA17281
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 16:12:53 +0200 (EET)
Received: from ele8120 (ele8120.ele.vtt.fi [130.188.98.120])
	by elemail.ele.vtt.fi (8.9.1a/8.9.1) with SMTP id QAA20225
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 16:12:52 +0200 (EET)
Message-ID: <000b01c184a9$3f00a1b0$7862bc82@ele.vtt.fi>
From: "Tommi Aihkisalo" <tommi.aihkisalo@vtt.fi>
To: "parisc" <parisc-linux@parisc-linux.org>
References: <1008318270.3c19b73ecfadb@nyepost.start.no>
Date: Fri, 14 Dec 2001 16:11:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Network bootproblem with 712/80
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

Hello all!

I am having a problem with my 712/80 when booting with bootp/tftp. With some
effort I got it requesting kernel image (lifimage) over the network. The
download starts but almost the same time it ends and it retries it over and
over again. With Weird-solution's bootp and tftp server I can see that the
download starts many times but all of them results error. When using the
RedHat's bootp/tftp, the tcpdump shows (what I have understood from the
output) that the HP is querying a file of name '.' (dot), this is quite
strange...

Have I understood correctly that the lifimage (from the 0.9.3 installation
cd) is the correct kernel image?

Tommi Aihkisalo
VTT Electronics @ Raahe

- ERROR 406: file corrupt: config.earth --- reboot universe? (Y/N)
