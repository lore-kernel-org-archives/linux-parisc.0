Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BD924835
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Apr 2002 07:29:27 -0600 (MDT)
Message-ID: <3CC2B3F2.8000101@freebel.net>
Date: Sun, 21 Apr 2002 12:43:30 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] linux-2.4.18-pa19 fpu problem
References: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be> <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------060402020006040004050201"
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

This is a multi-part message in MIME format.
--------------060402020006040004050201
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Here is attached a patch to avoid 'implicit' warning at compile time.
It is mainly a lk-math-emu.h file collecting math-emu functions 
prototype and also some try to unify the declaration of functions.

Please let me know your opinion.

Humm some other type of warning appear so:
driver.c: In function `handle_fpe':
driver.c:105: warning: passing arg 1 of `decode_fpu' from incompatible 
pointer type
driver.c:105: warning: passing arg 2 of `decode_fpu' makes pointer from 
integer without a cast
...

fpudispatch.c: In function `decode_0c':
fpudispatch.c:372: warning: passing arg 1 of `dbl_fsqrt' from 
incompatible pointer type
fpudispatch.c:372: warning: passing arg 3 of `dbl_fsqrt' from 
incompatible pointer type
fpudispatch.c:384: warning: passing arg 1 of `dbl_frnd' from 
incompatible pointer type
fpudispatch.c:384: warning: passing arg 3 of `dbl_frnd' from 
incompatible pointer type
fpudispatch.c:413: warning: passing arg 3 of `sgl_to_dbl_fcnvff' from 
incompatible pointer type
fpudispatch.c:416: warning: passing arg 1 of `dbl_to_sgl_fcnvff' from 
incompatible pointer type
fpudispatch.c:427: warning: passing arg 3 of `sgl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:430: warning: passing arg 1 of `dbl_to_sgl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:433: warning: passing arg 1 of `dbl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:433: warning: passing arg 3 of `dbl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:442: warning: passing arg 3 of `sgl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:445: warning: passing arg 1 of `dbl_to_sgl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:448: warning: passing arg 1 of `dbl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:448: warning: passing arg 3 of `dbl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:457: warning: passing arg 3 of `sgl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:460: warning: passing arg 1 of `dbl_to_sgl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:463: warning: passing arg 1 of `dbl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:463: warning: passing arg 3 of `dbl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:472: warning: passing arg 3 of `sgl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:475: warning: passing arg 1 of `dbl_to_sgl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:478: warning: passing arg 1 of `dbl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:478: warning: passing arg 3 of `dbl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:487: warning: passing arg 3 of `sgl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:490: warning: passing arg 1 of `dbl_to_sgl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:493: warning: passing arg 1 of `dbl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:493: warning: passing arg 3 of `dbl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:502: warning: passing arg 3 of `sgl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:505: warning: passing arg 1 of `dbl_to_sgl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:508: warning: passing arg 1 of `dbl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:508: warning: passing arg 3 of `dbl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:552: warning: passing arg 1 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:552: warning: passing arg 2 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:583: warning: passing arg 1 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:583: warning: passing arg 2 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:629: warning: passing arg 1 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:629: warning: passing arg 2 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:629: warning: passing arg 3 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:641: warning: passing arg 1 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:641: warning: passing arg 2 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:641: warning: passing arg 3 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:653: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:653: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:653: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:665: warning: passing arg 1 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:665: warning: passing arg 2 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:665: warning: passing arg 3 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:677: warning: passing arg 1 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c:677: warning: passing arg 2 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c:677: warning: passing arg 3 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c: In function `decode_0e':
fpudispatch.c:783: warning: passing arg 1 of `dbl_fsqrt' from 
incompatible pointer type
fpudispatch.c:783: warning: passing arg 3 of `dbl_fsqrt' from 
incompatible pointer type
fpudispatch.c:795: warning: passing arg 1 of `dbl_frnd' from 
incompatible pointer type
fpudispatch.c:795: warning: passing arg 3 of `dbl_frnd' from 
incompatible pointer type
fpudispatch.c:822: warning: passing arg 3 of `sgl_to_dbl_fcnvff' from 
incompatible pointer type
fpudispatch.c:825: warning: passing arg 1 of `dbl_to_sgl_fcnvff' from 
incompatible pointer type
fpudispatch.c:836: warning: passing arg 3 of `sgl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:839: warning: passing arg 1 of `dbl_to_sgl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:842: warning: passing arg 1 of `dbl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:842: warning: passing arg 3 of `dbl_to_dbl_fcnvxf' from 
incompatible pointer type
fpudispatch.c:851: warning: passing arg 3 of `sgl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:854: warning: passing arg 1 of `dbl_to_sgl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:857: warning: passing arg 1 of `dbl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:857: warning: passing arg 3 of `dbl_to_dbl_fcnvfx' from 
incompatible pointer type
fpudispatch.c:866: warning: passing arg 3 of `sgl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:869: warning: passing arg 1 of `dbl_to_sgl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:872: warning: passing arg 1 of `dbl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:872: warning: passing arg 3 of `dbl_to_dbl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:881: warning: passing arg 3 of `sgl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:884: warning: passing arg 1 of `dbl_to_sgl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:887: warning: passing arg 1 of `dbl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:887: warning: passing arg 3 of `dbl_to_dbl_fcnvuf' from 
incompatible pointer type
fpudispatch.c:896: warning: passing arg 3 of `sgl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:899: warning: passing arg 1 of `dbl_to_sgl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:902: warning: passing arg 1 of `dbl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:902: warning: passing arg 3 of `dbl_to_dbl_fcnvfu' from 
incompatible pointer type
fpudispatch.c:911: warning: passing arg 3 of `sgl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:914: warning: passing arg 1 of `dbl_to_sgl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:917: warning: passing arg 1 of `dbl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:917: warning: passing arg 3 of `dbl_to_dbl_fcnvfut' from 
incompatible pointer type
fpudispatch.c:958: warning: passing arg 1 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:958: warning: passing arg 2 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:990: warning: passing arg 1 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:990: warning: passing arg 2 of `dbl_fcmp' from 
incompatible pointer type
fpudispatch.c:1027: warning: passing arg 1 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1027: warning: passing arg 2 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1027: warning: passing arg 3 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1036: warning: passing arg 1 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:1036: warning: passing arg 2 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:1036: warning: passing arg 3 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:1071: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1071: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1071: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1081: warning: passing arg 1 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:1081: warning: passing arg 2 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:1081: warning: passing arg 3 of `dbl_fdiv' from 
incompatible pointer type
fpudispatch.c:1090: warning: passing arg 1 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c:1090: warning: passing arg 2 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c:1090: warning: passing arg 3 of `dbl_frem' from 
incompatible pointer type
fpudispatch.c: In function `decode_06':
fpudispatch.c:1143: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1143: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1143: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1146: warning: passing arg 1 of `dbl_to_sgl_fcnvfxt' from 
incompatible pointer type
fpudispatch.c:1152: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1152: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1152: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1155: warning: passing arg 1 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1155: warning: passing arg 2 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1155: warning: passing arg 3 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1167: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1167: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1167: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1170: warning: passing arg 1 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1170: warning: passing arg 2 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c:1170: warning: passing arg 3 of `dbl_fadd' from 
incompatible pointer type
fpudispatch.c: In function `decode_26':
fpudispatch.c:1278: warning: passing arg 1 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1278: warning: passing arg 2 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1278: warning: passing arg 3 of `dbl_fmpy' from 
incompatible pointer type
fpudispatch.c:1280: warning: passing arg 1 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:1280: warning: passing arg 2 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c:1280: warning: passing arg 3 of `dbl_fsub' from 
incompatible pointer type
fpudispatch.c: In function `decode_2e':
fpudispatch.c:1360: warning: passing arg 1 of `dbl_fmpynfadd' from 
incompatible pointer type
fpudispatch.c:1360: warning: passing arg 2 of `dbl_fmpynfadd' from 
incompatible pointer type
fpudispatch.c:1360: warning: passing arg 3 of `dbl_fmpynfadd' from 
incompatible pointer type
fpudispatch.c:1360: warning: passing arg 5 of `dbl_fmpynfadd' from 
incompatible pointer type
fpudispatch.c:1363: warning: passing arg 1 of `dbl_fmpyfadd' from 
incompatible pointer type
fpudispatch.c:1363: warning: passing arg 2 of `dbl_fmpyfadd' from 
incompatible pointer type
fpudispatch.c:1363: warning: passing arg 3 of `dbl_fmpyfadd' from 
incompatible pointer type
fpudispatch.c:1363: warning: passing arg 5 of `dbl_fmpyfadd' from 
incompatible pointer type

What do you suggest for those (let like this or submit to HP (see Paul 
comment) to improve their code)?

Matthew Wilcox wrote:
> On Wed, Apr 17, 2002 at 11:02:54AM +0200, joel.soete@freebel.net wrote:
> 
>>Here is some trace I get from the kernel (2.4.18-pa19) make (after a make
>>oldconfig):
> 
> ...
> 
>>I do think that lacks a header to define some function.
> 
> 
> this code is crufty old HPUX stuff... the warnings have been there
> basically forever, and nobody's bothered to fix them.  Nobody's found a
> problem either :-) If you want to eliminate these warnings by declaring
> everything properly, feel free to send a patch, but I don't think it's
> very important.
> 


--------------060402020006040004050201
Content-Type: application/gzip;
 name="math-emu.patch.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="math-emu.patch.gz"

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
XG5jLmYRU/4BGrMeQ5E3AAA=
--------------060402020006040004050201--
