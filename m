Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 6B1FB4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Sep 2002 14:31:29 -0600 (MDT)
Date: Fri, 27 Sep 2002 23:33:06 +0200
From: Stephan <stephan@itp.bg>
To: <parisc-linux@lists.parisc-linux.org>
Reply-To: Stephan <stephan@itp.bg>
Content-Type: text/plain; charset="iso-8859-1";
MIME-Version: 1.0
Message-Id: <20020927203129.6B1FB4829@dsl2.external.hp.com>
Subject: [parisc-linux] LASI Ethernet problems!
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

eth0: link ok.
eth0: i596 interrupt, exit timeout, status a040, cmd a100.
eth0: i596 interrupt, timeout, status e040, cmd a100.
eth0: i596 interrupt, timeout, status e040, cmd a100.
eth0: i596 interrupt, exit timeout, status e040, cmd e100.
eth0: i596 interrupt, exit timeout, status 4040, cmd 4000.
eth0: i596_add_cmd timed out, status 4040, cmd 4000.
eth0: i596 interrupt, timeout, status 4040, cmd 0100.
eth0: i596 interrupt, timeout, status 4040, cmd 0100.
eth0: i596 interrupt, exit timeout, status 4040, cmd 4000.
eth0: command unit timed out, status resetting.
eth0: link ok.



Why is this error appeared?

Today when this error appeared, my LAN connection was broken

after ifdown and ifup

all is OK, I tried another UTP cable. I am using HP Switch 10/100


________________________________________________
This mail was sent by Godzilla 1.0
