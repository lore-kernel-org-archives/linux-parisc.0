Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B7B4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 10:06:46 -0600 (MDT)
To: carlos@baldric.uwo.ca
Subject: Re: [parisc-linux] kdb patches for -pa23 ... moooo!
Message-ID: <1020787573.3cd7fb75053c7@webmail.tiscalinet.be>
Date: Tue, 07 May 2002 18:06:13 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <1020756305.3cd7815151303@webmail.tiscalinet.be>
In-Reply-To: <1020756305.3cd7815151303@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hey,

in fact, I find that it is missing following files in include/linux:
kdb.h; kallsyms.h; dis-asm.h; kdbprivate.h.

Never the less, after ( make dep; make clean ; make vmlinux ) this last still
failled with message:

`gcc -print-libgcc-file-name`
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/lib/lib.a
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/lib/lib.a
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o  \
	--end-group \
	-o vmlinux
arch/parisc/kernel/kernel.o: In function `.L202':
arch/parisc/kernel/kernel.o(.text.die_if_kernel+0x110): undefined reference to `kdb'
arch/parisc/kernel/kernel.o: In function `.L223':
arch/parisc/kernel/kernel.o(.text.handle_break+0xd8): undefined reference to `kdb'
arch/parisc/kernel/kernel.o: In function `.L396':
arch/parisc/kernel/kernel.o(.text.handle_interruption+0x4e8): undefined
reference to `kdb'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `bt_print_one':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.bt_print_one+0xc):
undefined reference to `kdb_symbol_print'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_bt_stack':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bt_stack+0x34):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L111':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bt_stack+0xd0):
undefined reference to `kdbnearsym'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bt_stack+0x120):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_db_trap':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x0):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x30):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L149':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x44):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L150':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x6c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x74):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x78):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L152':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x88):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x8c):
undefined reference to `kdb_breakpoints'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x9c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0xa0):
undefined reference to `kdb_breakpoints'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0xa4):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L157':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0xd0):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L165':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0xfc):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x100):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x10c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x118):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x124):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x12c):
more undefined references to `kdb_state' follow
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L187':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x154):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x164):
undefined reference to `kdb_symbol_print'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x16c):
undefined reference to `kdb_id1'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x174):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x17c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1a0):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L188':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1a8):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L162':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1c8):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1cc):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1f0):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L189':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x1f8):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x224):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L190':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x230):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L191':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_db_trap+0x23c):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_bp_trap':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x4):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x14):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L194':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x20):
undefined reference to `kdb_breakpoints'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x2c):
undefined reference to `kdb_breakpoints'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x70):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0x78):
undefined reference to `kdb_id1'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_bp_trap+0xa0):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_handle_bp':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x20):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x28):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L209':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x3c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x40):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x48):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L207':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x70):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L212':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_handle_bp+0x78):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_printbpreg':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_printbpreg+0x10):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_printbp':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_printbp+0x10):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L216':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_printbp+0x54):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_parsebp':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_parsebp+0x88):
undefined reference to `kdbgetularg'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_parsebp+0x114):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_parsebp+0x1a0):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_parsebp+0x1a4):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L237':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_parsebp+0x1d8):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_installbp':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x0):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x2c):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L269':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x50):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L270':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x90):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L288':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x9c):
undefined reference to `kdb_getarea_size'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0xb8):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0xd4):
undefined reference to `kdb_putarea_size'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0xe4):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L289':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x120):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L290':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x148):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x16c):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L291':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_installbp+0x180):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_removebp':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x0):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x20):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L294':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x34):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L297':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x94):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L310':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x9c):
undefined reference to `kdb_flags'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L299':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0xf8):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L311':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_removebp+0x110):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `get_serial_char':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.get_serial_char+0x84):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L116':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.get_serial_char+0x9c):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L143':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.get_kbd_char+0x148):
undefined reference to `kdb_printf'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.get_kbd_char+0x1b0):
more undefined references to `kdb_printf' follow
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_setpc':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_setpc+0xc):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_setpc+0x18):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_setpc+0x20):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_main_loop':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_main_loop+0xc):
undefined reference to `kdb_main_loop'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `.L189':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_adjust_ip+0x18):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_adjust_ip+0x1c):
undefined reference to `kdb_state'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_printaddress':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_printaddress+0x48):
undefined reference to `kdbnearsym'
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o:
In function `kdba_dis_getmem':
/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kdb/kdba.o(.text.kdba_dis_getmem+0x10):
undefined reference to `kdb_getarea_size'
make: *** [vmlinux] Error 1
Tue May  7 17:38:12 CEST 2002

And, excepted usual fpu warning, I do not see any additional warning explaining
this.

Any idea?

Thanks,
    Joel

Quoting joel.soete@freebel.net:

> Hi Carlos,
> 
> Well I well get your patch which I apply successfully against pa23.
> 
> On the other hand, I also reach to rebuild a toolchain with gcc-3.1
> (some
> difficulties with 3.2).
> 
> So to try to figure out what the problem is with kernel IP compile with
> gcc >
> 3.1, I try to compile kernel 2.4.18-pa23-kdb with gcc 3.1. But without
> any
> experience with kdb the operation failled with following message:
> 
> gcc -D__KERNEL__
> -I/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/include
> -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
> -fno-strict-aliasing
> -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
> -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
> -mschedule=7100   -DKBUILD_BASENAME=traps  -c -o traps.o traps.c
> traps.c:50:23: linux/kdb.h: No such file or directory
> traps.c: In function `die_if_kernel':
> traps.c:310: warning: implicit declaration of function `kdb'
> traps.c:310: `KDB_REASON_OOPS' undeclared (first use in this function)
> traps.c:310: (Each undeclared identifier is reported only once
> traps.c:310: for each function it appears in.)
> traps.c: In function `handle_break':
> traps.c:383: `KDB_BREAK_ENTER_INSN' undeclared (first use in this
> function)
> traps.c:384: `KDB_REASON_ENTER' undeclared (first use in this function)
> traps.c:387: `KDB_BREAK_BREAK_INSN' undeclared (first use in this
> function)
> traps.c:388: `KDB_REASON_BREAK' undeclared (first use in this function)
> traps.c: In function `handle_interruption':
> traps.c:657: `KDB_REASON_DEBUG' undeclared (first use in this function)
> /GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/include/asm/irq.h:
> At
> top level:
> traps.c:130: warning: `dump_stack' defined but not used
> make[1]: *** [traps.o] Error 1
> make[1]: Leaving directory
> `/GNU-Dev/parisc-linux/src/linux-2.4.18-pa23-kdb-20020502/arch/parisc/kernel'
> make: *** [_dir_arch/parisc/kernel] Error 2
> Mon May  6 20:52:40 CEST 2002
> 
> Hmm the patch put kdb.h in include/asm-parisc but all #include refer to
> linux/kdb.h?
> 
> There should be also some problem with my .config where I select 
> CONFIG_KDB=y
> CONFIG_KDB_MODULES=y
> # CONFIG_KDB_OFF is not set
> CONFIG_KALLSYMS=y
> 
> (the rest is obtain for a common make oldconfig for PA7000 processor
> type)
> 
> Thanks in advance for additionnal help,
>     Joel
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
