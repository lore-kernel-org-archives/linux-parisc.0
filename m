Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA03906
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 20:57:32 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Oct 2000 02:59:06 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA06746;
	Sat, 28 Oct 2000 13:55:13 +1100
Date: Sat, 28 Oct 2000 13:55:13 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Mark Mitchell <mark@codesourcery.com>
cc: Grant Grundler <grundler@cup.hp.com>, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0010281302510.2559-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] __FUNCTION__ broken
List-ID: <linux-parisc.vger.kernel.org>

Hi Mark,
  Your 2000-09-16 change doesn't clear c_function_name_declared_p
anywhere, resulting in empty strings for __FUNCTION__ and the like.

eg. testcase
cat > funcname.c <<EOF
extern int printf (__const char *__restrict __format, ...);

int foo (int x)
{
  return x+1;
}

int main (void)
{
  printf ("%s\n", __FUNCTION__);
  return 0;
}
EOF


The following little patch seems to fix the problem, but please check
whether other cleaning up is required.

--- gcc/c-decl.c~	Thu Oct 26 16:20:36 2000
+++ gcc/c-decl.c	Sat Oct 28 12:10:56 2000
@@ -6733,6 +6733,7 @@ finish_function (nested)
 	 function.  For a nested function, this value is used in
 	 pop_c_function_context and then reset via pop_function_context.  */
       current_function_decl = NULL;
+      c_function_name_declared_p = 0;
     }
 }
 

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
