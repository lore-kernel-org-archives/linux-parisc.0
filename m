Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id A12E54843
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Oct 2003 05:02:48 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157011121.dialin.heagmedianet.de [213.157.11.121])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.10/8.12.7) with ESMTP id h91B2MeY019726
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Wed, 1 Oct 2003 13:02:37 +0200
Message-ID: <3F7AB450.4000209@hrzpub.tu-darmstadt.de>
Date: Wed, 01 Oct 2003 13:02:40 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Missing functions ?
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

Hi there,

lastest kernel from CVS didn't compile for me. I get the following error 
messages:

    --------><------------
      CHK     include/linux/compile.h
      CC      arch/parisc/kernel/parisc_ksyms.o
    arch/parisc/kernel/parisc_ksyms.c:72: error: `__flush_dcache_page'
    undeclared here (not in a function)
    arch/parisc/kernel/parisc_ksyms.c:72: error: initializer element is
    not constant
    arch/parisc/kernel/parisc_ksyms.c:72: error: (near initialization
    for `__ksymtab___flush_dcache_page.value')
    arch/parisc/kernel/parisc_ksyms.c:75: error: `flush_cache_all_local'
    undeclared here (not in a function)
    arch/parisc/kernel/parisc_ksyms.c:75: error: initializer element is
    not constant
    arch/parisc/kernel/parisc_ksyms.c:75: error: (near initialization
    for `__ksymtab_flush_cache_all_local.value')
    make[1]: *** [arch/parisc/kernel/parisc_ksyms.o] Fehler 1
    make: *** [arch/parisc/kernel] Fehler 2
    ruediger@gandalf:/usr/src/linux-2.6$
    --------><------------

It seems that in include/asm/cache.h these two function 
flush_cache_all_local and flush_dcache_page are missing, which are 
defined as symbols in parisc_ksyms. Can I just disable/comment the 
regarding EXPORT_SYMOBOL calls?

Greeting,
    Ruediger
