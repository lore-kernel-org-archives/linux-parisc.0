Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA24311
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 17:34:10 -0600
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id RAA18896
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 17:34:57 -0600 (MDT)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id RAA11884 for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 17:34:56 -0600 (MDT)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id RAA24091
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 17:34:56 -0600
Message-Id: <199910222334.RAA24091@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 22 Oct 1999 17:34:56 -0500
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] hack to use HPUX boot loader
List-ID: <linux-parisc.vger.kernel.org>


Ok prumpf, here's the hack I suggested.  I didn't check it into CVS
anywhere (maybe arch/parisc/boot?).  It appears to work quite well
even without any changes to head.S

For those not privy to our conversation, this little tool munges
your SOM vmlinux file so that it can be loaded by the normal hpux
boot loader.  I'm not suggesting this is a great long-term strategy,
but it might make life easier for someone.

	-Paul Bame


#!/bin/sh
# This is a shell archive (produced by GNU sharutils 4.2).
# To extract the files from this archive, save it to some FILE, remove
# everything before the `!/bin/sh' line above, then type `sh FILE'.
#
# Made on 1999-10-22 17:33 MDT by <bame@fc.hp.com>.
# Source directory was `/users/bame/puffin/parisc/linux/arch/parisc/boot'.
#
# Existing files will *not* be overwritten unless `-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#   2197 -rw-r--r-- som_relocate.c
#   5425 -rw-r--r-- copy-of-som.h
#
save_IFS="${IFS}"
IFS="${IFS}:"
gettext_dir=FAILED
locale_dir=FAILED
first_param="$1"
for dir in $PATH
do
  if test "$gettext_dir" = FAILED && test -f $dir/gettext \
     && ($dir/gettext --version >/dev/null 2>&1)
  then
    set `$dir/gettext --version 2>&1`
    if test "$3" = GNU
    then
      gettext_dir=$dir
    fi
  fi
  if test "$locale_dir" = FAILED && test -f $dir/shar \
     && ($dir/shar --print-text-domain-dir >/dev/null 2>&1)
  then
    locale_dir=`$dir/shar --print-text-domain-dir`
  fi
done
IFS="$save_IFS"
if test "$locale_dir" = FAILED || test "$gettext_dir" = FAILED
then
  echo=echo
else
  TEXTDOMAINDIR=$locale_dir
  export TEXTDOMAINDIR
  TEXTDOMAIN=sharutils
  export TEXTDOMAIN
  echo="$gettext_dir/gettext -s"
fi
touch -am 1231235999 $$.touch >/dev/null 2>&1
if test ! -f 1231235999 && test -f $$.touch; then
  shar_touch=touch
else
  shar_touch=:
  echo
  $echo 'WARNING: not restoring timestamps.  Consider getting and'
  $echo "installing GNU \`touch', distributed in GNU File Utilities..."
  echo
fi
rm -f 1231235999 $$.touch
#
if mkdir _sh24082; then
  $echo 'x -' 'creating lock directory'
else
  $echo 'failed to create lock directory'
  exit 1
fi
# ============= som_relocate.c ==============
if test -f 'som_relocate.c' && test "$first_param" != -c; then
  $echo 'x -' SKIPPING 'som_relocate.c' '(file already exists)'
else
shar: Saving som_relocate.c (text)
  $echo 'x -' extracting 'som_relocate.c' '(text)'
  sed 's/^X//' << 'SHAR_EOF' > 'som_relocate.c' &&
#include <stdio.h>
#include <sys/time.h>
#include <assert.h>
#include "copy-of-som.h"
X
/* You'll need "copy-of-som.h" to compile this.  If you don't have it,
X * grab a copy from include/linux/som.h and remove the #include directive.
X *
X * Compile with gcc -o som_relocate som_relocate.c
X *
X * Run this on your parisc SOM kernel (vmlinux) and then you can use
X * the hpux boot loader to load it.  Here's what it looks like
X * when interacting with the boot ROM:
X *
X * ISL>					# the normal HP-UX boot prompt
X *
X * ISL> hpux /boot/vmlinux		# Use your path to vmlinux here
X *
X *
X * You can run this over and over without ill effect on the same
X * kernel image.
X *
X * Enjoy,
X *
X *				-Paul Bame
X */
X
/* relocate address to where it'll live physically */
#define RELOCATE(x)		x &= ~0xC0000000
X
int
main(int argc, char *argv[])
{
X    FILE *f;
X    struct som_hdr sh;
X    struct som_exec_auxhdr aux;
X
X    if (argc != 2)
X    {
X	fprintf(stderr, "Usage: %s <SOM-vmlinux>\n", argv[0]);
X	return 2;
X    }
X
X    if ((f = fopen(argv[1], "rb+")) == NULL)
X    {
X	perror(argv[1]);
X	return 3;
X    }
X
X    /* read the SOM header */
X    fread(&sh, sizeof sh, 1, f);
X
X    /* hack it */
X    printf("entry_space 0x%08x\n", sh.entry_space);
X    printf("entry_subspace 0x%08x\n", sh.entry_subspace);
X    printf("RELOCATE entry_offset 0x%08x\n", sh.entry_offset);	/********/
X    RELOCATE(sh.entry_offset);
X    printf("aux_header_location 0x%08x\n", sh.aux_header_location);
X    printf("aux_header_size %d\n", sh.aux_header_size);
X
X    /* write it */
X    rewind(f);
X    fwrite(&sh, sizeof sh, 1, f);
X
X    /* read the aux header */
X    fseek(f, sh.aux_header_location, SEEK_SET);
X    fread(&aux, sizeof aux, 1, f);
X    printf("RELOCATE aux.exec_tmem 0x%08x\n", aux.exec_tmem);
X    RELOCATE(aux.exec_tmem);
X    printf("aux.exec_tsize %d\n", aux.exec_tsize);
X    printf("RELOCATE aux.exec_dmem 0x%08x\n", aux.exec_dmem);
X    RELOCATE(aux.exec_dmem);
X    printf("aux.exec_dsize %d\n", aux.exec_dsize);
X    printf("RELOCATE aux.exec_entry 0x%08x\n", aux.exec_entry);
X    RELOCATE(aux.exec_entry);
X
X    /* write it */
X    fseek(f, sh.aux_header_location, SEEK_SET);
X    fwrite(&aux, sizeof aux, 1, f);
X
X    fclose(f);
X    return 0;
}
SHAR_EOF
  $shar_touch -am 102217281999 'som_relocate.c' &&
  chmod 0644 'som_relocate.c' ||
  $echo 'restore of' 'som_relocate.c' 'failed'
  if ( md5sum --help 2>&1 | grep 'sage: md5sum \[' ) >/dev/null 2>&1 \
  && ( md5sum --version 2>&1 | grep -v 'textutils 1.12' ) >/dev/null; then
    md5sum -c << SHAR_EOF >/dev/null 2>&1 \
    || $echo 'som_relocate.c:' 'MD5 check failed'
e5852faf2501dcc23a129c99abd1f7e1  som_relocate.c
SHAR_EOF
  else
    shar_count="`LC_ALL= LC_CTYPE= LANG= wc -c < 'som_relocate.c'`"
    test 2197 -eq "$shar_count" ||
    $echo 'som_relocate.c:' 'original size' '2197,' 'current size' "$shar_count!"
  fi
fi
# ============= copy-of-som.h ==============
if test -f 'copy-of-som.h' && test "$first_param" != -c; then
  $echo 'x -' SKIPPING 'copy-of-som.h' '(file already exists)'
else
shar: Saving copy-of-som.h (text)
  $echo 'x -' extracting 'copy-of-som.h' '(text)'
  sed 's/^X//' << 'SHAR_EOF' > 'copy-of-som.h' &&
#ifndef _LINUX_SOM_H
#define _LINUX_SOM_H
X
/* File format definition for SOM executables / shared libraries */
X
#define SOM_PAGESIZE 4096
X
/* this is the SOM header */
struct som_hdr {
X	short		system_id;		/* magic number - system */
X	short		a_magic;		/* magic number - file type */
X	unsigned int	version_id;		/* versiod ID: YYMMDDHH */
X	struct timespec	file_time;		/* system clock */
X	unsigned int	entry_space;		/* space for entry point */
X	unsigned int	entry_subspace;		/* subspace for entry point */
X	unsigned int	entry_offset;		/* offset of entry point */
X	unsigned int	aux_header_location;	/* auxiliary header location */
X	unsigned int	aux_header_size;	/* auxiliary header size */
X	unsigned int	som_length;		/* length of entire SOM */
X	unsigned int	presumed_dp;		/* compiler's DP value */
X	unsigned int	space_location;		/* space dictionary location */
X	unsigned int	space_total;		/* number of space entries */
X	unsigned int	subspace_location;	/* subspace entries location */
X	unsigned int	subspace_total;		/* number of subspace entries */
X	unsigned int	loader_fixup_location;	/* MPE/iX loader fixup */
X	unsigned int	loader_fixup_total;	/* number of fixup records */
X	unsigned int	space_strings_location;	/* (sub)space names */
X	unsigned int	space_strings_size;	/* size of strings area */
X	unsigned int	init_array_location;	/* reserved */
X	unsigned int	init_array_total;	/* reserved */
X	unsigned int	compiler_location;	/* module dictionary */
X	unsigned int	compiler_total;		/* number of modules */
X	unsigned int	symbol_location;	/* symbol dictionary */
X	unsigned int	symbol_total;		/* number of symbols */
X	unsigned int	fixup_request_location;	/* fixup requests */
X	unsigned int	fixup_request_total;	/* number of fixup requests */
X	unsigned int	symbol_strings_location;/* module & symbol names area */
X	unsigned int	symbol_strings_size;	/* size of strings area */
X	unsigned int	unloadable_sp_location;	/* unloadable spaces location */
X	unsigned int	unloadable_sp_size;	/* size of data */
X	unsigned int	checksum;
};
X
/* values for system_id */
X
#define SOM_SID_PARISC_1_0	0x020b
#define SOM_SID_PARISC_1_1	0x0210
#define SOM_SID_PARISC_2_0	0x0214
X
/* values for a_magic */
X
#define SOM_LIB_EXEC		0x0104
#define SOM_RELOCATABLE		0x0106
#define SOM_EXEC_NONSHARE	0x0107
#define SOM_EXEC_SHARE		0x0108
#define SOM_EXEC_DEMAND		0x010B
#define SOM_LIB_DYN		0x010D
#define SOM_LIB_SHARE		0x010E
#define SOM_LIB_RELOC		0x0619
X
/* values for version_id.  Decimal not hex, yes.  Grr. */
X
#define SOM_ID_OLD		85082112
#define SOM_ID_NEW		87102412
X
struct aux_id {
X	unsigned int	mandatory :1;	/* the linker must understand this */
X	unsigned int	copy	  :1;	/* Must be copied by the linker */
X	unsigned int	append	  :1;	/* Must be merged by the linker */
X	unsigned int	ignore	  :1;	/* Discard section if unknown */
X	unsigned int	reserved  :12;
X	unsigned int	type	  :16;	/* Header type */
X	unsigned int	length;		/* length of _following_ data */
};
X
/* The Exec Auxiliary Header.  Called The HP-UX Header within HP apparently. */
struct som_exec_auxhdr {
X	struct aux_id	som_auxhdr;
X	int		exec_tsize;	/* Text size in bytes */
X	int		exec_tmem;	/* Address to load text at */
X	int		exec_tfile;	/* Location of text in file */
X	int		exec_dsize;	/* Data size in bytes */
X	int		exec_dmem;	/* Address to load data at */
X	int		exec_dfile;	/* Location of data in file */
X	int		exec_bsize;	/* Uninitialised data (bss) */
X	int		exec_entry;	/* Address to start executing */
X	int		exec_flags;	/* loader flags */
X	int		exec_bfill;	/* initialisation value for bss */
};
X
/* Oh, the things people do to avoid casts.  Shame it'll break with gcc's
X * new aliasing rules really.
X */
union name_pt {
X	char *		n_name;
X	unsigned int	n_strx;
};
X
/* The Space Dictionary */
struct space_dictionary_record {
X	union name_pt	name;			/* index to subspace name */
X	unsigned int	is_loadable	:1;	/* loadable */
X	unsigned int	is_defined	:1;	/* defined within file */
X	unsigned int	is_private	:1;	/* not sharable */
X	unsigned int	has_intermediate_code :1; /* contains intermediate code */
X	unsigned int	is_tspecific	:1;	/* thread specific */
X	unsigned int	reserved	:11;	/* for future expansion */
X	unsigned int	sort_key	:8;	/* for linker */
X	unsigned int	reserved2	:8;	/* for future expansion */
X
X	int		space_number;		/* index */
X	int		subspace_index;		/* index into subspace dict */
X	unsigned int	subspace_quantity;	/* number of subspaces */
X	int		loader_fix_index;	/* for loader */
X	unsigned int	loader_fix_quantity;	/* for loader */
X	int		init_pointer_index;	/* data pointer array index */
X	unsigned int	init_pointer_quantity;	/* number of data pointers */
};
X
/* The Subspace Dictionary */
struct subspace_dictionary_record {
X	int		space_index;
X	unsigned int	access_control_bits :7;
X	unsigned int	memory_resident	:1;
X	unsigned int	dup_common	:1;
X	unsigned int	is_common	:1;
X	unsigned int	quadrant	:2;
X	unsigned int	initially_frozen :1;
X	unsigned int	is_first	:1;
X	unsigned int	code_only	:1;
X	unsigned int	sort_key	:8;
X	unsigned int	replicate_init	:1;
X	unsigned int	continuation	:1;
X	unsigned int	is_tspecific	:1;
X	unsigned int	is_comdat	:1;
X	unsigned int	reserved	:4;
X
X	int		file_loc_init_value;
X	unsigned int	initialization_length;
X	unsigned int	subspace_start;
X	unsigned int	subspace_length;
X
X	unsigned int	reserved2	:5;
X	unsigned int	alignment	:27;
X
X	union name_pt	name;
X	int		fixup_request_index;
X	unsigned int	fixup_request_quantity;
};
X
#endif /* _LINUX_SOM_H */
SHAR_EOF
  $shar_touch -am 102217001999 'copy-of-som.h' &&
  chmod 0644 'copy-of-som.h' ||
  $echo 'restore of' 'copy-of-som.h' 'failed'
  if ( md5sum --help 2>&1 | grep 'sage: md5sum \[' ) >/dev/null 2>&1 \
  && ( md5sum --version 2>&1 | grep -v 'textutils 1.12' ) >/dev/null; then
    md5sum -c << SHAR_EOF >/dev/null 2>&1 \
    || $echo 'copy-of-som.h:' 'MD5 check failed'
55c72739b33cd9ed3da5dce3a68cdfdb  copy-of-som.h
SHAR_EOF
  else
    shar_count="`LC_ALL= LC_CTYPE= LANG= wc -c < 'copy-of-som.h'`"
    test 5425 -eq "$shar_count" ||
    $echo 'copy-of-som.h:' 'original size' '5425,' 'current size' "$shar_count!"
  fi
fi
rm -fr _sh24082
exit 0
