Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D72A48B3
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 09:04:03 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17UTrs-0005nf-00
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 17:04:00 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <1026831840.3d3435e0d908a@webmail.tiscalinet.be>
Date: Tue, 16 Jul 2002 17:04:00 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] gcc-3.2 bootstrap?
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

Hi all,

Exploring another stuff (gcc bootstrap), I found:
http://www-124.ibm.com/developer/opensource/linux/tools/gcc/ia64cross.tar.gz

to build an ia64 xcompiler (which allow also to build a bootstrap)

I just modify to match my develop env and mainly I added --host=hppa-linux (I am
building gcc-3.2 on a b2000) in the configure:
'$GCC_SRC/gcc/configure --prefix=$TOOLS --enable-languages=c --host=hppa-linux'

Should I had to prefer --target=hppa-linux to build a native bootstrap?

Well this produce well a gcc (bootstrap?).

but when I try to use it to compile kernel-2.4.18-pa54 I got following error:
`gcc -print-libgcc-file-name`
/Develop/parisc-linux/src/linux-2.4.18-pa54/arch/parisc/lib/lib.a
/Develop/parisc-linux/src/linux-2.4.18-pa54/lib/lib.a  \
        --end-group \
        -o vmlinux
arch/parisc/kernel/kernel.o(__ksymtab+0x258): undefined reference to `$$mulU'  
make: *** [vmlinux] Error 1

(after a make distclean; make oldconfig)

What is it wrong?

Or would it be better to continue with xcompiler hppa->hppa?

Many thanks for all,
    Joel





-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
