From: rray@tcmail.mstc.state.ms.us
Subject: [parisc-linux] 2.6.10-rc2-pa2 build failing
Date: Fri, 3 Dec 2004 15:55:54 -0600 (CST)
Message-ID: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I got cvs.parisc-linux.org/download/linux-2.6/linux-2.6.10-rc2-pa2.tar.bz2
and attempted to compile it with standard options set.
It fails with

drivers/built-in.o: In function `sti_select_fbfont':
drivers/built-in.o(.init.text+0x2eb4): undefined reference to `find_font'
drivers/built-in.o(.init.text+0x2fd4): undefined reference to `get_default_font'
make: *** [.tmp_vmlinux1] Error 1

I'm building this on a K200.
Any suggestions?

Thanks
Richard Ray

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
