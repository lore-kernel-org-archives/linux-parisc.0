From: Meelis Roos <mroos@linux.ee>
Subject: compile failure: pacache.S and .size
Date: Sun, 13 Mar 2011 00:08:25 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is todays 2.6.38-rc8+git on hppa64 with
(GNU Binutils for Debian) 2.21.0.20110302. Have not tried to build an 
earlier kernel with this binutils so I do not knwo if this is a 
regression but it looks more like a problem found by new binutils.

  AS      arch/parisc/kernel/pacache.o
arch/parisc/kernel/pacache.S: Assembler messages:
arch/parisc/kernel/pacache.S:1071: Error: .size expression does not evaluate to a constant

pacache.S line 1071 ends procedure disable_sr_hashing_asm and does seem 
to do it in normal way and without typos.

        .procend
ENDPROC(disable_sr_hashing_asm)

        .end

This preprocesses to

 .procend
.size disable_sr_hashing_asm, .-disable_sr_hashing_asm

 .end

and this seems fully normal to me. Other functions assemble fine here 
but the last one in file.

-- 
Meelis Roos (mroos@linux.ee)
