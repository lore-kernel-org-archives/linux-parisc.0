From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 15:16:43 -0400
Message-ID: <20091029191642.GA21129@hiauly1.hia.nrc.ca>
References: <20091028221827.1B7774E38@hiauly1.hia.nrc.ca> <4AE8C918.8060908@gmx.de> <4AE8CCE3.1030503@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE8CCE3.1030503@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 28 Oct 2009, Helge Deller wrote:

> On 10/28/2009 11:43 PM, Helge Deller wrote:
>> On 10/28/2009 11:18 PM, John David Anglin wrote:
>>>>> and whether it follows inb in its .o. From my understanding of things,
>>>>> it shouldn't be necessary to remove the unwind info for unused weak
>>>>> symbols if they aren't garbage collected. A simple testcase would
>>>>> be helpful.
>
> Attached is a testcase (t1.c and t2.c):
> t1.c contains weak function f().
> t2.c contains non-weak function f().
>
> hppa-linux-gcc -c t1.c t2.c
> hppa-linux-ld -r -o all.o t1.o t2.o

Attached is a patch for gas that seems to produce reasonable
unwind info for the testcase when all.o is linked into a final
executable.  I think it will fix the linux unwind problem.

Still need to look at readelf -u on .o's.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tc-hppa.c.d"

Index: config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.145
diff -u -3 -p -r1.145 tc-hppa.c
--- config/tc-hppa.c	24 Jul 2009 11:45:00 -0000	1.145
+++ config/tc-hppa.c	29 Oct 2009 18:37:39 -0000
@@ -5961,13 +5961,41 @@ pa_build_unwind_subspace (struct call_in
   subsegT save_subseg;
   unsigned int unwind;
   int reloc;
-  char *p;
+  char *name, *p;
+  symbolS *symbolP;
 
   if ((bfd_get_section_flags (stdoutput, now_seg)
        & (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
       != (SEC_ALLOC | SEC_LOAD | SEC_READONLY))
     return;
 
+  /* Replace the start symbol with a local symbol that will be reduced
+     to a section offset.  This avoids problems with weak functions with
+     multiple definitions, etc.  */
+  name = xmalloc (strlen ("L$\001start_")
+		  + strlen (S_GET_NAME (call_info->start_symbol))
+		  + 1);
+  strcpy (name, "L$\001start_");
+  strcat (name, S_GET_NAME (call_info->start_symbol));
+
+  /* If we have a .procend preceded by a .exit, then the symbol will have
+     already been defined.  In that case, we don't want another unwind
+     entry.  */
+  symbolP = symbol_find (name);
+  if (symbolP)
+    {
+      xfree (name);
+      return;
+    }
+  else
+    {
+      symbolP = symbol_new (name, now_seg,
+			    S_GET_VALUE (call_info->start_symbol), frag_now);
+      gas_assert (symbolP);
+      S_CLEAR_EXTERNAL (symbolP);
+      symbol_table_insert (symbolP);
+    }
+
   reloc = R_PARISC_SEGREL32;
   save_seg = now_seg;
   save_subseg = now_subseg;
@@ -5993,7 +6021,7 @@ pa_build_unwind_subspace (struct call_in
   /* Relocation info. for start offset of the function.  */
   md_number_to_chars (p, 0, 4);
   fix_new_hppa (frag_now, p - frag_now->fr_literal, 4,
-		call_info->start_symbol, (offsetT) 0,
+		symbolP, (offsetT) 0,
 		(expressionS *) NULL, 0, reloc,
 		e_fsel, 32, 0, 0);
 

--gKMricLos+KVdGMg--
