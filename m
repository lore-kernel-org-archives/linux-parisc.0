Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DF524829
	for <parisc-linux@parisc-linux.org>; Mon, 13 Jan 2003 08:59:10 -0700 (MST)
Date: Mon, 13 Jan 2003 16:58:33 +0100
Message-ID: <3E1AA7C100001093@ocpmta7.freegates.net>
In-Reply-To: <20030112083733.GE1177@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Re: floating point exception error
To: "Randolph Chung" <randolph@tausq.org>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jim.hull@hp.com, parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>> I think that you probably should always use a 3-bit extract.  If the
>> value is greater than 3 on a PA 1.1 FPU, then the operation is undefin=
ed.
>> 4 is also undefined for PA 2.0.
>
>I guess that'll work, altho there are also some paths that are pcx-s and=

>pcx-t specific, so we probably still need to determine what processor we=

>are running on
>
>> The above assumes that the kernel doesn't provide PA 2.0 emulation
>> on PA 1.1 machines.
>
>yup, that should be a reasonable assumption.
>
>anyway, here's what i'm considering to commit to our kernel tree. it 
>has been tested to work with the fcnv code posted earlier. haven't 
>tested the other cases yet. it's very much a hack. comments?
>
Hi all,

I just update my kernel to -pa21 release do a 'make distclean' recover my=

previous .config then do 'make menuconfig' and finaly 'make dep; make vml=
inux'.

And it failled with following message:
`gcc -print-libgcc-file-name` /usr/src/linux-2.4.20-pa21/arch/parisc/lib/=
lib.a
/usr/src/linux-2.4.20-pa21/lib/lib.a  \
        --end-group \
        -o vmlinux
arch/parisc/math-emu/math.o(.text.handle_fpe+0x80): In function `handle_f=
pe':
: undefined reference to `printbinary'
arch/parisc/math-emu/math.o(.text.handle_fpe+0xcc): In function `handle_f=
pe':
: undefined reference to `printbinary'
make: *** [vmlinux] Error 1

What do I wrong?

Thanks in advance,
    Joel

*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
