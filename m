Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA05138
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jan 2000 08:40:19 -0700
Message-Id: <200001041543.KAA01712@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Trouble to generate vmlinux
To: t.simonnet@esiee.fr (Thierry SIMONNET)
Date: Tue, 4 Jan 2000 10:43:06 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <007101bf56c1$0c5a13d0$0a14d793@esiee.fr> from "Thierry SIMONNET" at Jan 4, 0 03:36:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

It looks as if you are trying to do a cross-compile which is not supported.
Currently, you must build with gcc and HP's ld under hpux 10.20 (or possibly,
9.X).

> 
> I work on a HP712/60 workstation under HPUX 10.20.
> I compile with cc, gcc or aCC.
> 
> I can't generate vmlinux; I have some Unsatisfied symbols :
> 
> ......
> 
> parisc-linux-ld -R 0xc0010000 -N -e '$START$' arch/parisc/real/realexe.o
> arch/parisc/kernel/init_task.o init/main.o init/version.o \
>        arch/parisc/boot/ramdisk.o arch/parisc/kernel/kernel.o
> arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
>        fs/filesystems.a \
>        net/network.a \
>        drivers/block/block.a drivers/gsc/gsc.a drivers/char/char.a
> drivers/net/net.a drivers/pci/pci.a \
>        /linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a
> /linux/linux/arch/parisc/lib/lib.a \
>        -o vmlinux
> parisc-linux-ld: Unsatisfied symbols:
>    _R_iodc_cons_call (code)
>    _R_fault_vector (code)
>    _R_pdc_call (code)
> make[1]: *** [vmlinux-real] Error 1
> make[1]: Leaving directory `/linux/linux'
> make: *** [vmlinux] Error 2
> 
> I try to modify convert.c without success.
> 
> Could you help me?
> 
> Thanks
> 
> =========================================================
> Thierry SIMONNET
> Responsable du Service des Moyens Informatiques Généraux
> Groupe ESIEE - CCIP
> Cité Descartes - BP 99 - 2 Bd Blaise Pascal
> 93162 NOISY le Grand cedex
> tel: 01 45 92 66 24  fax: 01 45 92 67 99 e-mail:  t.simonnet@esiee.fr
> =========================================================
> 
> 
> 
> 
> 
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
