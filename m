Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6BA04829
	for <parisc-linux@parisc-linux.org>; Wed,  6 Nov 2002 09:12:11 -0700 (MST)
Date: Wed, 6 Nov 2002 17:11:53 +0100
Message-ID: <3DB5755500002451@ocpmta7.be.tiscali.com>
From: jsoe0708@tiscali.be
To: "Matthew Wilcox" <willy@debian.org>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] 2.5.45-pa5 failed to boot [was: gcc-3.3 hppa patch]
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

>Subject: Re: [parisc-linux] Re: gcc-3.3 hppa patch
>
>
>On Wed, Nov 06, 2002 at 08:18:48AM +0100, jsoe0708@tiscali.be wrote:
>> I also try to test a 2.5 (45-pa5) it compiles well (after application
of
>> an old tips [remove $$mulU from parisc_ksyms.c]) but failled to boot
:((
>> (Is somebody already reach to boot a 2.5 pa?)
>
>come on joel, you can give better bug resports than that.
>
You have right but it was not the first object of this mail. (just mentioned
this experince comparing 2.4 kernel).

But as you are interested here is what I do:

I use gcc-snapshot (2002-11-03), the CVS update kernel 2.5.45-pa5 and the
config file config-richard-2.5 from ftp.pl.org (is it the wrong things?).
Then (as usual) after a make menuconfig and change of env var:
LD_LIBRARY_PATH=/usr/lib/gcc-snapshot/lib:$LD_LIBRARY_PATH
PATH=/usr/lib/gcc-snapshot/bin:$PATH,
I run (make dep; make vmlinux; make modules; make modules_install).
Put then the kernel and its system.map in place and try to boot but it failled
just after the palo message:
If it is the last message...

Nothing more: just see "shuting down ...." on LCD of the B2000

Sorry but I remove this stuff so piminfo would not be helpfull right now.
I will try latter last 2.5.46-pa1 but may be now with my working config
file of 2.4.19?

Well it was to compile my merge of 2.4.20-rc1 with 2.4.19-pa24 for which
I try to backport arch/parisc/traps.c. Do you know how can I test it?

Joel
