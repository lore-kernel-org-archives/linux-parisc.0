Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 7D4AD4859
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 09:27:51 -0600 (MDT)
Message-ID: <3EF5CB2E.9080701@bluehash.de>
Date: Sun, 22 Jun 2003 17:28:46 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem during dselect with 2.5.72-pa1
References: <3EF5C964.1040208@bluehash.de>
In-Reply-To: <3EF5C964.1040208@bluehash.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

Sorry, but I have to reply myself. Apart from the error dselect worked 
further on and it gave me the following message:

------------SNIP-----------

    Vorbereiten zum Ersetzen von tetex-extra 1.0.2+20011202-3 (durch
    .../tetex-extra_2.0.2-4_all.deb) ...
    Entpacke Ersatz für tetex-extra ...
    texhash: Updating /var/lib/texmf/ls-R...
    texhash: Done.
    Vorbereiten zum Ersetzen von netbase 4.09 (durch
    .../archives/netbase_4.10_all.deb) ...
    Entpacke Ersatz für netbase ...
    E: Sub-process /usr/bin/dpkg received a segmentation fault.
    Some errors occurred while unpacking. I'm going to configure the
    packages that were installed. This may result in duplicate errors
    or errors caused by missing dependencies. This is OK, only the errors
    above this message are important. Please fix them and run [I]nstall
    again
    Press enter to continue.

------------SNAP-----------

And another error message appeared on the serial console:

------------SNIP------------

    kernel BUG at mm/memory.c:1440!
    Kernel addresses on the stack:
     [<10124f20>] .L1612+0x0/0x38
     [<10105adc>] dump_stack+0x10/0x1c
     [<1014a798>] do_file_page+0x124/0x134
     [<1014a85c>] .L2265+0x0/0x40
     [<10157b20>] do_sync_write+0x7c/0x88
     [<101248a8>] .L1377+0x0/0x3c
     [<10104a20>] .L918+0x10/0x4c
     [<10157be4>] .L1432+0x0/0x64
     [<10128c48>] .L919+0x10/0x24
     [<101062f0>] .L1040+0x0/0x40
     [<10157d60>] .L1447+0x4c/0x5c
     [<10107268>] do_cpu_irq_mask+0x90/0xf0
     [<1010afe8>] syscall_exit+0x0/0x28
     [<1010a088>] intr_check_sig+0x0/0xc

----------SNAP-------------

Rüdiger
