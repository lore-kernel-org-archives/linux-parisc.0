From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 2 Apr 2009 04:16:40 GMT
Message-ID: <200904020416.n324Ge5t000944@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit b609308e1415efebdf79ebd553f4dd47b0ff2722
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sun Mar 15 16:49:55 2009 -0400

    parisc: move dereference_function_descriptor to process.c
    
    Commit deac93df26b20cf8438339b5935b5f5643bc30c9 fixed up printing
    of %pF on parisc, but added the dereference_function_descriptor
    prototype to module.c... this isn't a particularly wise idea as
    module.c might not always be compiled.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit bf589a349b9a41ea202ddb8115b18f543b944bfd
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sun Mar 15 16:44:25 2009 -0400

    parisc: Move kernel Elf_Fdesc define to <asm/elf.h>
    
    elf.h probably won't be exported to userspace, but play it safe
    and cram it in a #ifdef __KERNEL__ guard.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

