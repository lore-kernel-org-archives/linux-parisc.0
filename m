From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] New Zalon driver pb.
Date: Thu, 21 Oct 2004 18:52:54 +0200
Message-ID: <4161748000005857@mail-4-bnl.tiscali.it>
References: <4161748000005826@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: PARISC list <parisc-linux@parisc-linux.org>
To: "James Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161748000005826@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry for self reply first,
> 
> 
> Hello James,
> 
> I read the great job you did around scsi stuff and try to implement it
for
> my c110 specialy for 53c700 (narrow se scsi interface).
> 
> All seems to compile fine but it failed to build the kernel because:
>   ld   -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds arch/parisc/k=
ernel/head.o
>   init/built-in.o --start-group  usr/built-in.o
>  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o  arch/parisc/=
math-emu/built-in.o
> arch/parisc/kernel/init_task.o  kernel/bu
> ilt-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-=
in.o
>  crypto/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `gc
> c -print-libgcc-file-name`  lib/built-in.o  arch/parisc/lib/built-in.o
`gcc
> -print-libgcc-file-name`  drivers/built-in.o  sound/buil
> t-in.o  net/built-in.o --end-group
> drivers/built-in.o(.init.text+0x7e2c): In function `zalon7xx_init':
> : undefined reference to `ncr53c8xx_init'
> drivers/built-in.o(.init.text+0x7e54): In function `zalon7xx_init':
> : undefined reference to `ncr53c8xx_exit'
> 
And please accept my appologies: I missed a merge pb:
patching file drivers/scsi/ncr53c8xx.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
105 out of 105 hunks ignored -- saving rejects to file drivers/scsi/ncr53=
c8xx.c.rej
patching file drivers/scsi/ncr53c8xx.h
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
2 out of 2 hunks ignored -- saving rejects to file drivers/scsi/ncr53c8xx=
.h.rej
patching file drivers/scsi/nsp32.c

Oops I just need more work.

Sorry again for inconvenience,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
