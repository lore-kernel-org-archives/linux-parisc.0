From: "Jim Hull" <jim.hull@hp.com>
Subject: RE: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.pdf?
Date: Thu, 12 Aug 2004 10:41:53 -0700
Message-ID: <200408121741.KAA29481@lucy.cup.hp.com>
References: <40FB9ACA0000BB69@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: "'Joel Soete'" <soete.joel@tiscali.be>,
 "'List Parisc'" <parisc-linux@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <40FB9ACA0000BB69@ocpmta1.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel:

No.  SHRD and SHRW are not the same operations as SHRPD and SHRPW.  SHRD and
SHRW are not "real" machine instructions - they are pseudo-ops that the
assembler is supposed to recognize and convert to the appropriate "real"
instructions, in this case, EXTRD and EXTRW, respectively.  These pseudo-ops
exist solely for the convenience of the assembly programmer.  Rather than having
to remember that to do a right-shift operation, you need to code an EXTR[DW],
and figure out the correct pos and len arguments, you just write SHR[DW].

Similarly, SHLD (see notes on DEPD page), and SHLW (see notes on DEPW page) are
pseudo-ops for doing left-shifts.

Does the PA2.0 gnu assembler not recognize these (and other) pseudo-ops?  I'll
be the first to admit that we didn't do a very good job of documenting all the
PA2.0 pseudo-ops.  You might have expected a nice summary table in Appendix J,
but although the PA1.1 to PA2.0 pseudo-ops are there, the regular PA2.0 ones
aren't.  The only good way to find them all is to do a search for "pseudo" in
the PDF.

Here's what my search of:

 
http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_7_inst_descriptions
.pdf

found:

PDF Page  Page Number  Pseudo-Op           Real Instruction
-----------------------------------------------------------------------
13        7-11         B,n target          B,L,n target,%R0
                       CALL,n target       B,L,n target,%R2

23        7-21         CALL,n (b)          BVE,L,n (b),%R2
                       RET,n               BE,n (%R2)

41        7-39         SHLD,cond r,sa,t    DEPD,Z,cond r,63-sa,64-sa,t
                       SHLW,cond r,sa,t    DEPW,Z,cond r,31-sa,32-sa,t

51        7-49         SHRD,S,cond r,sa,t  EXTRD,S,cond r,63-sa,64-sa,t
                       SHRD,U,cond r,sa,t  EXTRD,U,cond r,63-sa,64-sa,t

53        7-51         SHRW,S,cond r,sa,t  EXTRW,S,cond r,31-sa,32-sa,t
                       SHRW,U,cond r,sa,t  EXTRW,U,cond r,31-sa,32-sa,t

85        7-83         LDI i,t             LDO i(0),t
                       COPY r,t            LDO 0(r),t

100       7-98         MTSAR r             MTCTL r,%SAR

105       7-103        NOP                 OR %R0,%R0,%R0

 -- Jim Hull
    PA-RISC/Itanium Processor Architect

> -----Original Message-----
> From: parisc-linux-bounces@lists.parisc-linux.org 
> [mailto:parisc-linux-bounces@lists.parisc-linux.org] On 
> Behalf Of Joel Soete
> Sent: Wednesday, August 11, 2004 10:35 AM
> To: List Parisc
> Subject: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in 
> parisc2.pdf?
> 
> Hi all,
> 
> About parisc 2.0 insn set at pages 7-49 and 7-51 I read 
> SHRD,S,cond ...
> and SHRW,S,cond ... but I don't find this mnemonic elsewhere 
> in this book;
> should I better read SHRPD and SHRPW respectively (mnemonic 
> well defined)?
> 
> Thanks in advance for help,
>     Joel
> 
> --------------------------------------------------------------
> -------------
> Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le 
> moment de faire
> le pas!
> http://reg.tiscali.be/default.asp?lg=fr
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
