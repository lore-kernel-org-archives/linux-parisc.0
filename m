Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA1EC4857
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 31 Jan 2004 15:28:09 -0700 (MST)
Date: Sat, 31 Jan 2004 17:28:33 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20040131222832.GB19840@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in hppa's glibc.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


jda,

The following patch is required in gcc to add another byte check for the
new TRAMPOLINE_TEMPLATE that has profile fixes added in glibc 2.3.2.
I've added comments in glibc to indicate that TRAMPOLINE_TEMPLATE
changes are bad things to do. AFAIK this is the last change *ever* since
we now have working profile support :)

I'm not quite sure what the "-4" is intended to accomplish, I figure I
could have prefixed the TREAMPOLINE_TEMPLATE with another jump that
gives the right address? That still makes for an extra jump, and I'd
rather have gcc just look in the right place first.

Thoughts on this?

c.


2004-01-31  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* gcc/config/pa/fptr.c (__canonicalize_funcptr_for_compare): Add
	extra offset check for new glibc TRAMPOLINE_TEMPLATE.

Index: gcc/config/pa/fptr.c
===================================================================
RCS file: /cvs/gcc/gcc/gcc/config/pa/fptr.c,v
retrieving revision 1.2
diff -u -p -r1.2 fptr.c
--- gcc/config/pa/fptr.c	9 Dec 2002 19:16:14 -0000	1.2
+++ gcc/config/pa/fptr.c	31 Jan 2004 22:18:27 -0000
@@ -35,7 +35,7 @@ Boston, MA 02111-1307, USA.  */
    the template should it be necessary to change the current branch
    position.  */
 #define NOFFSETS 2
-static int fixup_branch_offset[NOFFSETS] = { 32, -4 };
+static int fixup_branch_offset[NOFFSETS] = { 36, 32, -4 };
 
 #define GET_FIELD(X, FROM, TO) \
   ((X) >> (31 - (TO)) & ((1 << ((TO) - (FROM) + 1)) - 1))
