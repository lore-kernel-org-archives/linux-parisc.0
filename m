Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA15033
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 03:30:57 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id AC9F6968
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 05:32:20 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id DAA21612 for parisc-linux@thepuffingroup.com; Tue, 31 Oct 2000 03:32:20 -0700 (MST)
Date: Tue, 31 Oct 2000 03:32:20 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010311032.DAA21612@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Elf Header change proposal
List-ID: <linux-parisc.vger.kernel.org>

In looking at how to support 32 bit parisc linux binaries on the 64 bit
kernel, I realized that we need to eventually have a way to differentiate
between three different elf executable types: 32 bit parisc linux, 64 bit
parisc linux and 64 bit parisc HP-UX.  Right now we are only concerned
with 32 bit parisc linux, but we eventually plan to support the other
types, and I think it makes sense to put the infrastructure in place now
for two reasons:

    1) It can affect object code compatibility, so lets make the changes
    now while the pain level is low.

    2) It makes it easier to do the right thing in terms of coding now,
    even if the primary goal is 32 bit parisc linux binaries on 64 bit
    parisc linux kernel, we can code with the other possibilities in mind.

This article is kind of long.  It explains in detail the changes I would
like to see made, and why.  Here is the short version.  If you don't
disagree, you don't have to read the rest (unless it really interests
you).

    1) The ONLY change I would like to see made for 32 bit parisc linux
    binaries is to set the e_ident[EI_OSABI] field to 3 (currently set to
    0).  This is the value defined in the IA64 ABI for Linux, and I think
    we should leverage it.  HP-UX puts a 1 in this field (ELFOSABI_HPUX).

    2) 64 bit parisc binaries (currently just vmlinux) are currently using
    the Elf32_hdr type.  They should be changed to use the Elf64_hdr type.

    3) As in #1 above, the e_ident[EI_OSABI] field should be set to 3 for
    64 bit parisc linux binaries.

    4) The e_flags field should be changed to 0x80214 (EF_PARISC_WIDE|
    EFA_PARISC_2_0) for 64 bit parisc linux binaries.  Currently it is set
    to 0x20b which indicates a parisc 1.0 binary (which is really strange,
    since the 32 bit binaries have 0x210 which correctly identifies a
    parisc 1.1 binary).

John Marvin
jsm@fc.hp.com

The detailed explanation and rationale follows:

I looked at how some other architectures differentiated binaries, and some
of them are using different machine types.  But after talking to Cary
Coutant, and looking at how IA64 binaries are differentiated between Linux
and HP-UX, I believe the right answer is to use the same machine type
(EM_PARISC = 15), and differentiate based on other architected fields in
the elf headers.  This means that some fields need to change in our
currrent parisc linux elf headers.  The following paragraphs discuss each
change.

The ELF standard supports two different header types:  Elf32_hdr and
Elf64_hdr.  The Elf64_hdr expands some of the fields that are in the
Elf32_hdr to 64 bits wide.  The first few fields are common, and the
e_ident[EI_CLASS] field can be used to determine which header is being
used.  Note, the header type does not have to correlate to the type of
binary contained (i.e. 32/64 bit).  If a 64 bit binary doesn't have any
file offsets or virtual offsets that overflow a 32 bit field, the
executable could use the Elf32_hdr.  For IA64 relocatable files, this is
allowed by the ABI.  However, for an executable file, the IA64 ABI
requires that the header type correspond, i.e.  Elf32_hdr is used for 32
bit binaries, and Elf64_hdr is used for 64 bit binaries.  HP-UX also
enforces this for parisc (there is no 32 bit elf for HP-UX, but 64 bit
binaries must use the Elf64_hdr type).  This makes sense.

In order to support multiple types on Linux, the other architectures
(mips/ia64/sparc) have a .c file that defines a set of macros, constants,
etc. for a certain elf format, and then it includes binfmt_elf.c.  Note
that the code in binfmt_elf.c doesn't check the class field, so you must
define which header type you want statically.  This means that for a
certain elf type, using the above method (and unless we have a real good
reason to do something different, I would prefer to do what the other
ports do) you cannot support for Elf32_hdr's and Elf64_hdr's.  When I talk
about a "certain elf type" I am referring to 32 bit parisc linux vs. 64
bit parisc linux vs. 64 bit parisc HP-UX.  So we can support Elf32_hdr's
for 32 bit parisc linux, and Elf64_hdr's for 64 bit parisc linux.  We
cannot support both Elf32_hdr's and Elf64_hdr's for one type, e.g. 64 bit
parisc linux.  So if we ever want to support a 64 bit parisc executable
that requires at least one 64 bit field we should make that header type
mandatory now.  And since we want to use the same tools to compile the
kernel as we use to create user programs, that means that the tools should
change now to use Elf64_hdr's for vmlinux (so that if things like palo,
etc. need to change we can fix them now, rather than break things in the
future when the transition will be more difficult).

Although we could probably figure out the difference between an HP-UX 64
bit elf binary and a parisc linux 64 bit elf binary via various other
fields (like text start, etc.) that would be fragile and ugly.  I would
prefer to have a clearly defined field, and the ELF standard provides such
a field, so let's use it.  That field is the e_ident[EI_OSABI] field.  So,
what should we put in it?  This field is machine dependent, so we could
decide just about anything.  However, IA64 Linux and HP-UX binaries have
already set a precedent, and barring a good reason to do otherwise, I
think we should follow it.  The Intel IA64 ABI defines a whole variety of
values for that field.  The three that concern us are:

	#define ELFOSABI_HPUX           1
	#define ELFOSABI_LINUX          3
	#define ELFOSABI_OPENBSD       12

Note that HP-UX is also using ELFOSABI_HPUX already for elf 64 bit HP-UX
parisc binaries.  So I propose we put a 3 in this field for both 32 bit
and 64 bit elf binaries.  For 32 bit it is not necessarily important,
since HP-UX doesn't support elf for 32 bit parisc binaries.  However, it
couldn't hurt to set it the same, and I did think of one possible reason
to do it.  I am not familiar with the OpenBSD port to parisc, but perhaps
they are using elf for 32 bit (my guess is that they are probably using
SOM, but I really have no idea).  If they are, perhaps some day they may
want to run parisc linux binaries, or perhaps we may want to run parisc
OpenBSD binaries, and we could use this field to differentiate them.  Of
course, this would mean that OpenBSD would need to put a different value
in this field.  If anyone from the parisc OpenBSD port is reading this,
and this makes any sense, you may want to consider putting a 12 in this
field (same as OpenBSD for IA64).

The e_flags field is machine dependent.  Currently we are already partly
following the precedent set by HP-UX by using this field to indicate the
parisc architecture level (1.0,1.1 or 2.0).  Right now we are setting this
field to 0x210 for 32 bit binaries, which indicates a 1.1 binary, which
seems correct to me.  However, for 64 bit binaries we are currently
setting this field to 0x20b, which indicates a 1.0 binary.  This is
clearly wrong, since the code within contains many parisc 2.0 specific
instructions.  The value of 0x214 should be used to indicate a parisc 2.0
binary.  Also, since the Elf header type (Elf32_hdr or Elf64_hdr) doesn't
have to correspond to whether or not the binary is a 64 bit or 32 bit
binary, HP-UX was a bit (EF_PARISC_WIDE = 0x80000) to indicate whether or
not the binary is a 64 bit binary.  We should set this bit also to be
consistant.  However, since I am also proposing that we do require the
header type to correspond, I plan to differentiate the width based on the
header type (otherwise you have to decode the EI_CLASS field before you
can find the e_flags field, which is a pain).  Note again that HP-UX also
requires 64 bit binaries to use Elf64_hdr.

Below is a table containing the current values for various executables (I
got all of the values by dumping the headers of each executable, with the
exception of IA64 Linux, which I got the values from the Intel IA64 ABI,
and which Cary Coutant confirmed are what IA64 Linux is using).

Below the table are the proposed new values for 32 and 64 bit parisc
Linux executables. below that are more details regarding each field,
including defines extracted from Linux's /usr/include/elf.h, the
Intel IA64 ABI and HP-UX's /usr/include/elf_parisc.h.

			ELF Header Fields

			      (Decimal)                              (Hex)
Current             ELF   Data    ELF   ABI    ABI    ELF     ELF     ELF
Description        Class Format Version type Version  Type  Machine  Flags
---------------------------------------------------------------------------
32 bit parisc linux  1     2      1     0      0      2      15    00000210
64 bit parisc linux  1     2      1     0      0      2      15    0000020b
64 bit parisc HP-UX  2     2      1     1      0      2      15    00080214
64 bit IA64   HP-UX  2     1      1     1      1      2      50    00000018
64 bit IA64   linux  2     1      1     3      ?      2      50           ?

Proposed:

32 bit parisc linux  1     2      1     3      0      2      15    00000210
64 bit parisc linux  2     2      1     3      0      2      15    00080214

Notes:
    ELF Class: value in e_ident[EI_CLASS] field of Elf{32,64}_hdr

	This field tells you whether or not the header is a Elf32_hdr or
	Elf64_hdr.

	#define EI_CLASS        4               /* File class byte index */
	#define ELFCLASSNONE    0               /* Invalid class */
	#define ELFCLASS32      1               /* 32-bit objects */
	#define ELFCLASS64      2               /* 64-bit objects */
	#define ELFCLASSNUM     3

    Data Format: value in e_ident[EI_DATA] field of Elf{32,64}_hdr

	This field tells you whether the data in the headers is little
	endian or big endian.

	#define EI_DATA         5               /* Data encoding byte index */
	#define ELFDATANONE     0               /* Invalid data encoding */
	#define ELFDATA2LSB     1               /* 2's complement, little endian */
	#define ELFDATA2MSB     2               /* 2's complement, big endian */
	#define ELFDATANUM      3

    Elf Version: value in e_ident[EI_VERSION] field of Elf{32,64}_hdr

	Elf version #. Right now, everyone puts a 1 in here.

	#define EI_VERSION      6               /* File version byte index */

    ABI Type: value in e_ident[EI_OSABI] field of Elf{32,64}_hdr

	This field in machine type dependent. However, some types are
	standard across machines. The following defines come from the
	Gnu/Linux elf.h. The Intel IA-64 ABI also defines ELFOSABI_LINUX
	which is defined to be 3 (The Intel IA-64 ABI also defines a
	bunch of others, which don't concern us, with the possible
	exception of ELFOSABI_OPENBSD which is defined to be 12). I think
	we should use ELFOSABI_LINUX (3) for parisc also.

	#define EI_OSABI        7               /* OS ABI identification */
	#define ELFOSABI_SYSV           0       /* UNIX System V ABI */
	#define ELFOSABI_HPUX           1       /* HP-UX */
	#define ELFOSABI_ARM            97      /* ARM */
	#define ELFOSABI_STANDALONE     255     /* Standalone (embedded) application */

    ABI Version: value in e_ident[EI_ABIVERSION] field of Elf{32,64}_hdr

	Version number for the ABI (see above). Might as well stick with
	0 for now.

	#define EI_ABIVERSION   8               /* ABI version */

    Elf Type: value in e_type field of Elf{32,64}_hdr

	/* Legal values for e_type (object file type).  */

	#define ET_NONE         0               /* No file type */
	#define ET_REL          1               /* Relocatable file */
	#define ET_EXEC         2               /* Executable file */
	#define ET_DYN          3               /* Shared object file */
	#define ET_CORE         4               /* Core file */
	#define ET_NUM          5               /* Number of defined types */
	#define ET_LOPROC       0xff00          /* Processor-specific */
	#define ET_HIPROC       0xffff          /* Processor-specific */


    Elf Machine: value in e_machine field of Elf{32,64}_hdr

	Denotes the processor/machine type. Sparc seems to do the wrong
	thing here by having lots of them. I think we should stick to
	one value, and differentiate using the other fields, as is done
	for IA64.

	Excerpted from elf.h:

	#define EM_PARISC       15              /* HPPA */
	#define EM_IA_64        50              /* Intel Merced */

    Elf Flags: value in e_flags field of Elf{32,64}_hdr

	These flags are processor specific. Here are the ones that HP
	has defined for parisc (for HP-UX, but we might as well share
	them). Right now, the only ones that should apply for Linux
	are EL_PARISC_WIDE, EFA_PARISC_1_1 and EFA_PARISC_2_0.

	#define EF_PARISC_TRAPNIL       0x00010000 /* Trap nil pointer dereferences */
	#define EF_PARISC_EXT           0x00020000 /* Program uses arch. extensions */
	#define EF_PARISC_LSB           0x00040000 /* little-endian                 */
	#define EF_PARISC_WIDE          0x00080000 /* 64-bits                       */
	#define EF_PARISC_NO_KABP       0x00100000 /* kernel assisted branch pred.  */
	#define EF_PARISC_LAZYSWAP      0x00400000 /* lazy swap for dyn prog segs   */
	#define EF_PARISC_ARCH          0x0000FFFF /* Architecture version mask */
	#define EFA_PARISC_1_0          0x020b /* PA-RISC 1.0 */
	#define EFA_PARISC_1_1          0x0210 /* PA-RISC 1.1 */
	#define EFA_PARISC_2_0          0x0214 /* PA-RISC 2.0 */
