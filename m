Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin3.email.bigpond.com (mailin3.bigpond.com [139.134.6.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07878482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Oct 2001 08:33:29 -0700 (MST)
Received: from bubble.local ([144.135.24.84]) by
          mailin3.email.bigpond.com (Netscape Messaging Server 4.15) with
          SMTP id GM2U6J00.CZK for <parisc-linux@lists.parisc-linux.org>;
          Thu, 1 Nov 2001 01:39:55 +1000
Date: Thu, 1 Nov 2001 02:03:19 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: binutils@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20011101020319.Z25115@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] elf32-hppa fix for new ld.so
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

Fixes a mismatch between elf32_hppa_size_dynamic_sections, where .plt
relocs aren't counted in the total reloc count, and finish_dynamic_sections,
where the default elf scheme counts 'em.  Things sort-of worked previously
due to various bugs in ld.so cancelling out.  

bfd/ChangeLog
	* elf32-hppa.c (elf32_hppa_finish_dynamic_sections): Don't count
	.plt relocs in DT_RELASZ.

This means glibc/sysdeps/hppa/dl-machine.h should no longer define
ELF_MACHINE_PLTREL_OVERLAP.

-- 
Alan Modra
 
Index: bfd/elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.56
diff -u -p -r1.55 elf32-hppa.c
--- elf32-hppa.c	2001/10/31 14:58:14	1.56
+++ elf32-hppa.c	2001/10/31 15:22:53
@@ -4273,6 +4273,19 @@ elf32_hppa_finish_dynamic_sections (outp
 		dyn.d_un.d_val = s->_cooked_size;
 	      else
 		dyn.d_un.d_val = s->_raw_size;
+	      break;
+
+	    case DT_RELASZ:
+	      /* Don't count procedure linkage table relocs in the
+		 overall reloc count.  */
+	      if (htab->srelplt != NULL)
+		{
+		  s = htab->srelplt->output_section;
+		  if (s->_cooked_size != 0)
+		    dyn.d_un.d_val -= s->_cooked_size;
+		  else
+		    dyn.d_un.d_val -= s->_raw_size;
+		}
 	      break;
 	    }
 
