Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4CBE4830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jul 2003 09:12:57 -0600 (MDT)
Message-ID: <3F117AA5.6090402@tiscali.be>
Date: Sun, 13 Jul 2003 15:28:37 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Cc: Helge Deller <deller@gmx.de>, Randolph Chung <tausq@debian.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Xfree-server and Xhp ?
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

I just discover some days ago (when trying to rebuild 4.3) that in XFree-4.2 still exists (not anymore
in 4.3?) the sources of a Xhp server supporting the builtin gfx of my testing b180 (into build-tree/xc/programs/Xserver/hw/hp/).

Juliusz Chroboczek <jch@pps.jussieu.fr <mailto:jch@pps.jussieu.fr>> kindly explain me:
> Please note that Xhp is not supported by XFree86, and most probably
> doesn't build.
> 
> Try adding a file xc/config/cf/host.def with the following line:
>
>  #define XhpServer YES
>
> Then make World as usual.

It doesn't build :-(

But I also found some additional patch which HP supplied for suport of X11R6.3 into mklinux project.
It would be helpful as this patch supplied (among other things) the asm src of an object supplying requested ngleDepth8_CopyAreaFromToScreen() and ngleDepth24_CopyAreaFromToScreen() functions.
Into mklinux sources I also find back <machine/asm.h> it would be easy with the help of kernel documentation to 'reverse' it for parisc linux (seems to be trivial).
My only pb is that src seems to be writen for 'som' env:
>#include <machine/asm.h>
>
>       .space  $TEXT$
>       .subspa $CODE$
>
>       .import ngleScreenPrivIndex,data
>
>       .export ngleDepth8_CopyAreaFromToScreen
>       .proc
>       .callinfo
>
>ngleDepth8_CopyAreaFromToScreen
>       ldo 0x40(sp),sp
>       stw arg0,-0x64(sp)
>       stw arg1,-0x68(sp)
>       stw arg2,-0x6c(sp)
>       stw arg3,-0x70(sp)
>       ldw -0x68(sp),r1
[...]
>       stw t3,0xb00(t4)
>       bv r0(rp)
>       ldo -0x40(sp),sp
>
>       .procend
>
[...]+
>       .end

(arg[0..3], r[0..], t[1..4] beeing labels defined <machine/asm.h>)

Does it exist some doc or tips to do this kind of obj translation 'som' -> 'elf'?

Thanks in advance for advises,
	Joel
