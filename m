Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24F344838
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Jul 2002 05:12:41 -0600 (MDT)
Message-ID: <3D300BA1.8000304@freebel.net>
Date: Sat, 13 Jul 2002 11:14:41 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem in X with keyboard and problem with LAN
 and telnetd
References: <20020712203010.59C8D488D@dsl2.external.hp.com>
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

Hi Stephan,

Can you give us more detail on release your are running for Xfree86, 
KDE, kernel (cvs date eventualy) or last tine you made an apt-get 
dist-upgrade?

Stephan Trajkoff wrote:
> -------------------------------------------------------------------
> -->> FREE Perl CGI scripts add WEB ACCESS to your POP email accounts!
> -->> Download today!! http://www.adjeweb.com
> -------------------------------------------------------------------
> 
> I have 3 problems
> 1. when I run Xfree86 with KDE, my ps/2 keyboard won't work, I sait 
> to XFREE that I have us keyboard, pc104 and that is ps/2.
> 2. my LAN lasi 82596 says that I have timeout non stop with
> connection
> 3. When I connect from Windows and Linux to my server, and when I run 
> command that display many rows, automatically linux closing my 
> connection and _|_.

It sounds like an old problem (telnetd on cd-0.9.3?) which could be 
solved (IIRC) with an apt-get dist-upgrade.

> With SSH all is working. For example try to run 
> dmesg or ps axuw.


Good luck,
	Joel
