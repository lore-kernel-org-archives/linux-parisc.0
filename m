Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nsr-temip1.sps.ics.didata.com (unknown [196.38.213.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3374B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 01:48:44 -0600 (MDT)
Received: from za.didata.com (localhost [127.0.0.1])
	by ndx-andrewg.sps.ics.didata.com (SGI-8.9.3/8.9.3) with ESMTP id JAA94395
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 09:48:26 +0200 (SAT)
Message-ID: <3B6662C7.7020705@za.didata.com>
Date: Tue, 31 Jul 2001 09:48:23 +0200
From: Andrew Gaylard <andrew.gaylard@za.didata.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dead keys in X
References: <3B657709.4050201@za.didata.com> <200107301550.RAA00052@sap-ag.de>
Content-Type: text/html; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

<html><head></head><body>Helge Deller wrote:<br>
<blockquote type="cite" cite="mid:200107301550.RAA00052@sap-ag.de"><pre wrap="">On Monday 30 July 2001 17:02, Andrew Gaylard wrote:<br></pre>
  <blockquote type="cite"><pre wrap="">The 'i' and 'o' keys in X are dead.  The 'i'-key at least<br>sends a keycode-224 to X (as viewed in xev), but if I try<br><br>	xmodmap -e "keycode 224 = i"<br><br>I get the error:<br>	xmodmap: commandline:0: bad keycode value (out of range)<br></pre></blockquote>
    <pre wrap=""><!----><br><br>Hi Andrew,<br><br>Just an idea: Does <br>		xmodmap -e "keycode 0xE0 = i"<br>works ?<br><br>Helge<br></pre>
    </blockquote>
Nope, it does exactly the same thing.<br>
    <br>
</body></html>
