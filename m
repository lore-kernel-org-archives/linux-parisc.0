Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id D8B974862
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Oct 2002 02:27:56 -0700 (MST)
Date: Sun, 27 Oct 2002 11:28:04 +0200
From: "Stephan" <stephan@itp.bg>
To: parisc-linux@lists.parisc-linux.org
Reply-To: "Stephan" <stephan@itp.bg>
Content-Type: text/plain; charset="iso-8859-1";
MIME-Version: 1.0
Message-Id: <20021027092756.D8B974862@dsl2.external.hp.com>
Subject: [parisc-linux] ext3 /
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
/dev/sda1   *         1        15     61814   f0  Linux/PA-RISC boot
/dev/sda2            16       441   1756398   83  Linux
/dev/sda3           442       562    498883   82  Linux swap
/dev/sda4           563      1017   1875965   83  Linux
it is my partitions of my linux
Can I make /dev/sda2 which is / partition ext3 or reiserfs? i.e. journaling
FS
After I made dist-upgrade 1 week ago, my uname don't works, if I write uname
-a there is segmentation fault, any ideas?I am using 2.4.18-pa61, because
this kernel is more stable for me, than 2.4.19-p19 - pa22.

Regards

________________________________________________
Message sent using Godzilla 1.0.1
