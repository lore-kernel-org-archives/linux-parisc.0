Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 4D5D2482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 00:50:37 -0600 (MDT)
Date: Tue, 23 Jul 2002 09:52:46 +0300
From: "Stephan Trajkoff" <stephan@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020723065037.4D5D2482C@dsl2.external.hp.com>
Subject: [parisc-linux] cannot make kernel
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

-------------------------------------------------------------------
-->> FREE Perl CGI scripts add WEB ACCESS to your POP email accounts!
-->> Download today!! http://www.adjeweb.com
-------------------------------------------------------------------

`gcc -print-libgcc-file-name` /usr/src/linux/arch/parisc/lib/lib.a
/usr/src/linux/lib/lib.a  \
        --end-group \
        -o vmlinux
drivers/video/video.o: In function `.L1581':
drivers/video/video.o(.init.text 0x23e8): undefined reference to
`fbcon_sti'
drivers/video/video.o: In function `.L1639':
drivers/video/video.o(.init.text 0x25d0): undefined reference to
`fbcon_sti'
make: *** [vmlinux] Error 1

I tried to compile pa56
I made make oldconfig from pa54
