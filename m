Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f128.law4.hotmail.com [216.33.149.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1B37482B
	for <parisc-linux@parisc-linux.org>; Thu, 25 Oct 2001 02:07:27 -0600 (MDT)
From: "Kenneth Westelinck" <kennywest1@hotmail.com>
To: parisc-linux@parisc-linux.org
Date: Thu, 25 Oct 2001 08:07:26 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F128WXpA1DHstgNogS400011dde@hotmail.com>
Subject: [parisc-linux] very odd problem
List-ID: <linux-parisc.vger.kernel.org>

Hi all,


I've recently installed the test-release of woody on my 712/60. I've also 
compiled a recent kernel available from the parisc-linux site. All works 
well, except from a very strange problem. The start-stop-daemon call, which 
is used throughout the init scripts, doesn't seem to work. So, executing the 
inetd script results in nothing, not even an error. Starting inetd on the 
command line (/usr/sbin/inetd) works great. Is there a known bug in the 
start-stop-daemon program? Can this be solved, or will I have to rewrite my 
init scripts?

Many thanks in advance.


regards,

Kenneth

_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp
