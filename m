Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CA014829
	for <parisc-linux@parisc-linux.org>; Sat,  1 Feb 2003 22:49:16 -0700 (MST)
Message-Id: <200302020549.h125nFpE025091@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiler switches
To: tausq@debian.org
Date: Sun, 2 Feb 2003 00:49:14 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <20030202051940.GR20940@tausq.org> from "Randolph Chung" at Feb 1, 2003 09:19:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Lamont still saw some function-section failures with Debian gcc 
> 3.2.2-pre7 (20030128)

If this is building C++ code, then the problem is likely in the linker.
Try this:

Index: emultempl/hppaelf.em
===================================================================
RCS file: /cvs/src/src/ld/emultempl/hppaelf.em,v
retrieving revision 1.24
diff -u -3 -p -r1.24 hppaelf.em
--- emultempl/hppaelf.em	30 Nov 2002 08:39:46 -0000	1.24
+++ emultempl/hppaelf.em	2 Feb 2003 05:41:38 -0000
@@ -50,7 +50,7 @@ static int need_laying_out = 0;
 /* Maximum size of a group of input sections that can be handled by
    one stub section.  A value of +/-1 indicates the bfd back-end
    should use a suitable default size.  */
-static bfd_signed_vma group_size = 1;
+static bfd_signed_vma group_size = -1;
 
 /* Stops the linker merging .text sections on a relocatable link,
    and adds millicode library to the list of input files.  */

This reduces the stub pressure by about 50%.  I also installed this
yesterday to fix a related problem:

2003-01-31  John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

	* pa.c (pa_output_function_prologue, pa_output_function_epilogue): Move
	updating of total_code_bytes from prologue to epilogue.

The updating of total_code_bytes in the prologue changed caused the call
sizes to change in a function that spanned the 240000 byte boundary.  This
caused the branch distance of any branch over a call to increase, and
sometimes exceed the range of the branch.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
