Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA30299
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 04:32:03 -0600
Message-Id: <200008231031.MAA01982@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Wed, 23 Aug 2000 12:31:37 +0200
In-Reply-To: Alan Modra <alan@linuxcare.com.au>
       "Re: Incompatibility of PIC and non-PIC" (Aug 23, 10:49)
To: Alan Modra <alan@linuxcare.com.au>
Subject: Re: Incompatibility of PIC and non-PIC
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
List-ID: <linux-parisc.vger.kernel.org>

On Aug 23, 10:49, Alan Modra wrote:
>On Wed, 23 Aug 2000, Tor Arntsen wrote:
>
>> Which versions of CVS are you using?  CVS used to output diffs without
>> including the directory path in the --- and +++ lines, but that's been
>> fixed long ago.  I don't have any problems with patch anymore.
>
>You will if the diff contains files that exist in the root dir of your
>source tree and in subdirs, eg. Makefile.in and bfd/Makefile.in

No, I do that all the time and has been doing that for almost two years
without problems.  It's true that it used to be a problem.  This is what
I'm working with at this moment:

cvs -q -n upd
M ChangeLog
M tools/ChangeLog
M tools/ts-initdir.c

cvs -q diff -u > dif

The diff looks like this:

Index: ChangeLog
===================================================================
RCS file: /cvs/cvs4/lrdpf/src/libs/lib_lrdpf_table/ChangeLog,v
retrieving revision 1.1.4.2.6.5
diff -u -r1.1.4.2.6.5 ChangeLog
--- ChangeLog   2000/04/01 16:54:01     1.1.4.2.6.5
+++ ChangeLog   2000/08/23 09:57:10
@@ -1,3 +1,73 @@
+Wed Aug 23 00:01:15 2000  tor@deneb.spacetec.no  (Tor Arntsen)
+
+       * TODO: Updated.
+
..
Index: tools/ChangeLog
===================================================================
RCS file: /cvs/cvs4/lrdpf/src/libs/lib_lrdpf_table/tools/Attic/ChangeLog,v
retrieving revision 1.1.2.1.6.2
diff -u -r1.1.2.1.6.2 ChangeLog
--- tools/ChangeLog     1999/05/25 10:54:39     1.1.2.1.6.2
+++ tools/ChangeLog     2000/08/23 09:57:10
@@ -1,3 +1,16 @@
+Wed Aug 23 00:33:48 2000  tor@deneb.spacetec.no  (Tor Arntsen)
+
+       * ts-initdir.c: Removed local copied functions get_table_dir() and
..

I now use that diff as input to patch somewhere else:
patch -p0 < dif
patching file ChangeLog
patching file tools/ChangeLog
patching file tools/ts-initdir.c

The patch is correctly applied.

The problem with older CVS versions was that it used to say just
--- ChangeLog on all the levels.  Patch could handle that, using
the Index line, however only for unique file names.  So people would
use scripts that fixed the ---/+++ lines before they applied the patch.

-Tor
