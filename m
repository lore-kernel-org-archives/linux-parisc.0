Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 7F636482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Jul 2002 04:36:47 -0600 (MDT)
Date: Fri, 26 Jul 2002 13:39:09 +0300
From: "Stephan Trajkoff" <stephan@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020726103647.7F636482B@dsl2.external.hp.com>
Subject: [parisc-linux] unable to compile kernel
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

Hello,
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
I got this message when compiling 2.4.18-pa56 na pa58
2.4.18-pa54 was compiled without errors

-------------------------------------------------------------------
-->> Add WEB ACCESS to your POP email accounts with
-->> FREE Perl CGI scripts! Download today! http://www.adjeweb.com
-------------------------------------------------------------------
