From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils 2.15?
Date: Mon, 14 Jun 2004 00:09:16 -0400 (EDT)
Message-ID: <200406140409.i5E49HYi003897__6877.78140786595$1416624453$gmane$org@hiauly1.hia.nrc.ca>
References: <40BDA020000074B9@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: jakub@redhat.com,
 binutils@sources.redhat.com,
 parisc-linux@parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BDA020000074B9@ocpmta3.freegates.net> from "Joel Soete" at Jun
	13, 2004 01:39:28 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I read that now many arch try to update their toolchain to a new release;
> I so try to rebuild toolchain starting from binutils-2.15 (.0.91... from
> ftp.kernel.org)
> it build well but when I launch to rebuild gcc with those new binutil configure
> crashes immediately with:
> "/usr/bin/ld: .got section not immediately after .plt section"

The following change appears to have introduced this problem:

CVSROOT:        /cvs/src
Module name:    src
Changes by:     jakub@sourceware.org    2004-05-11 17:08:32

Modified files:
	bfd            : ChangeLog 
	include        : ChangeLog 
	binutils       : ChangeLog 

Log message:
	bfd/
	* elflink.c (elf_bfd_final_link): Don't output STT_SECTION symbol
	into .dynsym if elf_section_data (sec)->dynindx <= 0.
	Adjust counting of last_local.
	(_bfd_elf_link_renumber_dynsyms): Don't assign dynindx to sections
	other than SHT_PROGBITS/SHT_NOBITS and neither for .got/.got.plt/.plt
	created by the linker nor !SHF_ALLOC.
										
	* elf32-i386.c (elf_i386_finish_dynamic_sections): Point
	DT_PLTGOT to the start of the .got.plt section instead of the
	.got output section.  Set sh_entsize for .got section in addition
	to .got.plt.
	...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
