Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 704C3482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 15:50:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 151xZ0-0007qT-00
	for parisc-linux@parisc-linux.org; Mon, 21 May 2001 22:50:06 +0100
Date: Mon, 21 May 2001 22:50:06 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010521225006.I23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] More unaligned references
List-ID: <linux-parisc.vger.kernel.org>

This is in apache-ssl.

$ gdb ./apache 
This GDB was configured as "hppa2.0-unknown-linux-gnu"...
(gdb) run
Starting program: /home/willy/test/apache-ssl-1.3.19.1+1.42/build-tree/apache_1.3.19/src/./apache 

Program received signal SIGBUS, Bus error.
0x00020224 in Letext ()
(gdb) bt
#0  0x00020224 in Letext ()
#1  0x0001cf40 in create_server_config (p=0x85040, s=0x85068)
    at http_config.c:186
#2  0x0001f444 in init_server_config (p=0x85040) at http_config.c:1625
#3  0x0001f518 in ap_read_config (p=0x85040, ptemp=0x89080, 
    confname=0x7c97c "/etc/apache-ssl/httpd.conf") at http_config.c:1657
#4  0x00029be0 in main (argc=1, argv=0x7ff00258) at http_main.c:5114

(gdb) x/12i $pc-20
0x20210 <Letext+1552>:  addil 4800,dp,%r1
0x20214 <Letext+1556>:  ldw 154(sr0,r1),r21
0x20218 <Letext+1560>:  bv r0(r21)
0x2021c <Letext+1564>:  ldw 158(sr0,r1),r19
0x20220 <Letext+1568>:  addil 4800,dp,%r1
0x20224 <Letext+1572>:  ldw fb(sr0,r1),r21
0x20228 <Letext+1576>:  bv r0(r21)
0x2022c <Letext+1580>:  ldw ff(sr0,r1),r19
0x20230 <Letext+1584>:  addil 4800,dp,%r1
0x20234 <Letext+1588>:  ldw 21c(sr0,r1),r21
0x20238 <Letext+1592>:  bv r0(r21)
0x2023c <Letext+1596>:  ldw 220(sr0,r1),r19

so we seem to be in the middle of a jump table here.

init_server_config looks like this, btw:

static void *create_server_config(pool *p, server_rec *s)
{
    void **conf_vector = (void **) ap_pcalloc(p, sizeof(void *) * (total_modules
 + DYNAMIC_MODULE_LIMIT));
    module *modp;

    for (modp = top_module; modp; modp = modp->next) {
        if (modp->create_server_config)
            conf_vector[modp->module_index] = (*modp->create_server_config) (p, 
s);
    }

    return (void *) conf_vector;
}

Which fits the jump table explanation.  So something's getting trashed
and I really don't know where.  This is with matt's newcompilers-20010520
debs; binutils 2.11.90.0.8 plus modra's patch, gcc 3.0.ds5-0pre010427
with an hppa patch and glibc 2.2.3-2 with an hppa patch.  fwiw, the same
problem happened with binutils 2.11.90.0.1 from the baseplus-0404 tarball.

-- 
Revolutions do not require corporate support.
