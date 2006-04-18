From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Tue, 18 Apr 2006 14:46:52 -0400
Message-ID: <119aab440604181146s19bf0013t985abf0853601aa2@mail.gmail.com>
References: <1145329883.24150.17.camel@localhost.localdomain>
	<200604181436.k3IEaG06004632@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604181436.k3IEaG06004632@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/18/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> I think what is needed is a SYSV PS ABI for PA-RISC.  It probably shouldn=
't
> be an LSB document.  Typically, the LSB only adopts a subset of any
> particular specification, and in the case of the PS ABIs, references
> the documents for the various processors currently specified by the
> LSB.  The IA64 document is probably the closest to what's needed for
> PA-RISC although it can be simplified.  It was written jointly by HP
> and Intel.

The SYSV psABI for HP PA-RISC is going to be a very messy thing to start wi=
th.
I whole heartedly recommend that Jeff begin work by writing the ELF
psABI for hppa and perhaps after that moving towards the SYSV psABI.
The LSB documentation will then be a reference to the SYSV psABI and
the ELF psABI documents.

So Jeff, care to whip up a document that is a copy of the elf-pa.pdf and
we can start commenting on what's wrong with the document?

What document format are you going to use? I recommend openoffice or tex.

List of the relocs we handle:
binutils/include/elf/hppa.h
  This file lists our relocs and their values. With comments about
their processing.
binutils/bfd/elf-hppa.h
  This file contains the relocs howto showing if some are unimplemented.
  (elf_hppa_final_write_processing): Contains flag settings for the elf hea=
der.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
