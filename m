Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C1104866
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  1 Jan 2004 08:42:21 -0700 (MST)
Message-ID: <3FF44024.8010605@tiscali.be>
Date: Thu, 01 Jan 2004 15:43:32 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: James Bottomley <James.Bottomley@steeleye.com>,
	Paul Bame <bame@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
References: <20031230175546.E6A60494280@palinux.hppa>
	<3FF1F0C3.9070907@tiscali.be>
In-Reply-To: <3FF1F0C3.9070907@tiscali.be>
Content-Type: multipart/mixed; boundary="------------090507060504010807030902"
Cc: 
Subject: [parisc-linux] Re: [parisc-linux-cvs] palo bame
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090507060504010807030902
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul, James,

Joel Soete wrote:
> Hi Paul,
> 
> Nice ;)
> 
> I just noticed a small detail (versus patch Bjoern and I sent in june:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2003-June/020098.html
> http://lists.parisc-linux.org/pipermail/parisc-linux/2003-June/020120.html): 
> 
> 
> before 'goto restart;' you didn't set interactive (I mean 'interactive=1;')
> but for instance we can reach :
> [snip]
> @@ -427,6 +446,7 @@
>          if (f.kern32_sz == 0)
>          {
>              die("Error: can't find a 32-bit kernel here");
> +        goto restart;
>          }
>          kernfd = offset_open(bootdev, f.kern32_offset, f.kern32_sz);
>      }
> [snip]
> 
> from a non-interactive session (as I frequently encouter the pb, I 
> install a kernel with palo and later to free space, I remove this kernel 
> :( ) then imho ipl will loop definitively?
> 
> hmm isn't it the same
> @@ -268,9 +269,13 @@
>      puts("alo ipl " PALOVERSION " ");
>      puts(bld_info);
>      puts("\n");
> -    if (Debug) printf("iplmain(%d, started %s)\n", is_interactive,
> +    interactive = is_interactive;
> +    if (Debug) printf("iplmain(%d, started %s)\n", interactive,
>      started_wide ? "wide" : "narrow");
>      if (Debug) printf("initial-sp %p\n", initialstackptr);
> +
> + restart:
> +
>      blocked_bootdev = pdc_bootdev_open();
>      bootdev = byteio_open(blocked_bootdev);
> 
> [snip]
> @@ -312,6 +322,7 @@
>      if (f.cmdline[0] == '\0')    /* no command line specified */
>      {
>      die("ERROR: No command line on boot media\n");
> +    goto restart;
>      }
> 
> As we don't find the cmd line on media, imho we would never have any 
> chance to interact?
> Well I still have to check in more detail but may be simply added a flag 
> 'interact:' just before test if (interactive); and replace all goto 
> restart; by (interactive=1; goto interact; )
> 
> Appologies if I've missed some other change that make my though false,
>     Joel
> 
> Paul Bame wrote:
> 
>> CVSROOT:    /var/cvs
>> Module name:    palo
>> Changes by:    bame    03/12/30 10:55:46
>>
>> Modified files:
>>     ipl            : ipl.c
>> Log message:
>> typo
>>
>> _______________________________________________
>> parisc-linux-cvs mailing list
>> parisc-linux-cvs@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs
>>
> 
> 
What do think about this draft of patch:
=========><=========
--- ipl.c       2004-01-01 16:25:47.339568000 +0100
+++ ipl.c.new   2004-01-01 16:24:48.429568000 +0100
@@ -278,8 +278,6 @@
         started_wide ? "wide" : "narrow");
      if (Debug) printf("initial-sp %p\n", initialstackptr);

- restart:
-
      blocked_bootdev = pdc_bootdev_open();
      bootdev = byteio_open(blocked_bootdev);

@@ -326,7 +324,8 @@
      if (f.cmdline[0] == '\0')  /* no command line specified */
      {
         die("ERROR: No command line on boot media\n");
-       goto restart;
+        interactive=1;
+       goto interactive_loop;
      }

      /* add the right console= if there isn't one yet */
@@ -393,9 +392,18 @@
         }
      }

+ interactive_loop:
+
      if (interactive)
         interact(&f);

+    if (f.cmdline[0] == '\0')  /* no command line specified */
+    {
+       die("ERROR: No command line on boot media\n");
+        interactive=1;
+       goto interactive_loop;
+    }
+
      strcpy(commandline,
             parse(f.cmdline, &kern_part, kern_name, &rd_part, rd_name));

@@ -439,14 +447,16 @@
      {
         printf("ERROR: Requesting kernel from partition %d "
                     "on unpartitioned media!\n", kern_part);
-       while(1);
+        interactive=1;
+       goto interactive_loop;
      }

      if (rd_part != -1 && rd_part != kern_part)
      {
         die("ERROR:: palo does not support ramdisk on different"
                 " partition than kernel\n");
-       goto restart;
+        interactive=1;
+       goto interactive_loop;
      }

      if (kern_part == 0)
@@ -461,7 +471,8 @@
             if (f.kern32_sz == 0)
             {
                 die("Error: can't find a 32-bit kernel here");
-               goto restart;
+                interactive=1;
+                goto interactive_loop;
             }
             kernfd = offset_open(bootdev, f.kern32_offset, f.kern32_sz);
         }
@@ -470,7 +481,8 @@
             if (f.kern64_sz == 0)
             {
                 die("Error: can't find a 64-bit kernel here");
-               goto restart;
+                interactive=1;
+                goto interactive_loop;
             }
             kernfd = offset_open(bootdev, f.kern64_offset, f.kern64_sz);
         }
@@ -502,7 +514,8 @@
                 else
                 {
                     die("No kernels found.");
-                   goto restart;
+                    interactive=1;
+                    goto interactive_loop;
                 }
             }

@@ -523,7 +536,8 @@
         if (!load_kernel(kernfd, &entry, &wide))
         {
             die("ERROR: failed to load kernel\n");
-           goto restart;
+            interactive=1;
+            goto interactive_loop;
         }

         if (rd_part != -1)
@@ -548,7 +562,8 @@
             (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id != 0xfd && partition[kern_part - 1].id != 0xf0) )
         {
             printf("ERROR: Partition %d must be ext2\n", kern_part);
-           while(1);
+            interactive=1;
+            goto interactive_loop;
         }

         pp = &partition[kern_part - 1];
@@ -565,14 +580,16 @@
         {
             printf("ERROR: open %s from partition %d failed\n",
                 kern_name, kern_part);
-           while(1);
+            interactive=1;
+            goto interactive_loop;
         }

         bkern_fd = byteio_open(kern_fd);
         if (!load_kernel(bkern_fd, &entry, &wide))
         {
             die("ERROR: failed to load kernel\n");
-           goto restart;
+            interactive=1;
+            goto interactive_loop;
         }

         if (rd_part != -1)
@@ -593,8 +610,10 @@

      /* FIXME!!! need to pass command line to kernel */
      /* could theoretically use a function pointer, but they're ugly on PA */
-    if(pdc_default_width(wide))
-           goto restart;
+    if(pdc_default_width(wide)) {
+        interactive=1;
+       goto interactive_loop;
+    }
      printf("Branching to kernel entry point 0x%08x.  If this is the last\n"
            "message you see, you may need to switch your console.  This is\n"
            "a common symptom -- search the FAQ and mailing list at parisc-linux.org\n\n",
=========><=========

I still have to work on because if I go into interactive mode with an empty cmdline, I couldn't yet added anything to this cmdline :(

Please let me know your opinion,
Joel

--------------090507060504010807030902
Content-Type: text/plain;
 name="Ipl.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Ipl.diff"

--- ipl.c	2004-01-01 16:25:47.339568000 +0100
+++ ipl.c.new	2004-01-01 16:24:48.429568000 +0100
@@ -278,8 +278,6 @@
 	started_wide ? "wide" : "narrow");
     if (Debug) printf("initial-sp %p\n", initialstackptr);
 
- restart:
-
     blocked_bootdev = pdc_bootdev_open();
     bootdev = byteio_open(blocked_bootdev);
 
@@ -326,7 +324,8 @@
     if (f.cmdline[0] == '\0')	/* no command line specified */
     {
 	die("ERROR: No command line on boot media\n");
-	goto restart;
+        interactive=1;
+	goto interactive_loop;
     }
 
     /* add the right console= if there isn't one yet */
@@ -393,9 +392,18 @@
 	}
     }
 
+ interactive_loop:
+
     if (interactive)
 	interact(&f);
 
+    if (f.cmdline[0] == '\0')	/* no command line specified */
+    {
+	die("ERROR: No command line on boot media\n");
+        interactive=1;
+	goto interactive_loop;
+    }
+
     strcpy(commandline,
 	    parse(f.cmdline, &kern_part, kern_name, &rd_part, rd_name));
 
@@ -439,14 +447,16 @@
     {
 	printf("ERROR: Requesting kernel from partition %d "
 		    "on unpartitioned media!\n", kern_part);
-	while(1);
+        interactive=1;
+	goto interactive_loop;
     }
 
     if (rd_part != -1 && rd_part != kern_part)
     {
 	die("ERROR:: palo does not support ramdisk on different"
 		" partition than kernel\n");
-	goto restart;
+        interactive=1;
+	goto interactive_loop;
     }
 
     if (kern_part == 0)
@@ -461,7 +471,8 @@
 	    if (f.kern32_sz == 0)
 	    {
 	        die("Error: can't find a 32-bit kernel here");
-		goto restart;
+                interactive=1;
+                goto interactive_loop;
 	    }
 	    kernfd = offset_open(bootdev, f.kern32_offset, f.kern32_sz);
 	}
@@ -470,7 +481,8 @@
 	    if (f.kern64_sz == 0)
 	    {
 	        die("Error: can't find a 64-bit kernel here");
-		goto restart;
+                interactive=1;
+                goto interactive_loop;
 	    }
 	    kernfd = offset_open(bootdev, f.kern64_offset, f.kern64_sz);
 	}
@@ -502,7 +514,8 @@
 		else
 		{
 		    die("No kernels found.");
-		    goto restart;
+                    interactive=1;
+                    goto interactive_loop;
 		}
 	    }
 
@@ -523,7 +536,8 @@
 	if (!load_kernel(kernfd, &entry, &wide))
 	{
 	    die("ERROR: failed to load kernel\n");
-	    goto restart;
+            interactive=1;
+            goto interactive_loop;
 	}
 
 	if (rd_part != -1)
@@ -548,7 +562,8 @@
 	    (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id != 0xfd && partition[kern_part - 1].id != 0xf0) )
 	{
 	    printf("ERROR: Partition %d must be ext2\n", kern_part);
-	    while(1);
+            interactive=1;
+            goto interactive_loop;
 	}
 
 	pp = &partition[kern_part - 1];
@@ -565,14 +580,16 @@
 	{
 	    printf("ERROR: open %s from partition %d failed\n",
 		kern_name, kern_part);
-	    while(1);
+            interactive=1;
+            goto interactive_loop;
 	}
 
 	bkern_fd = byteio_open(kern_fd);
 	if (!load_kernel(bkern_fd, &entry, &wide))
 	{
 	    die("ERROR: failed to load kernel\n");
-	    goto restart;
+            interactive=1;
+            goto interactive_loop;
 	}
 
 	if (rd_part != -1)
@@ -593,8 +610,10 @@
 
     /* FIXME!!! need to pass command line to kernel */
     /* could theoretically use a function pointer, but they're ugly on PA */
-    if(pdc_default_width(wide))
-	    goto restart;
+    if(pdc_default_width(wide)) {
+        interactive=1;
+	goto interactive_loop;
+    }
     printf("Branching to kernel entry point 0x%08x.  If this is the last\n"
 	   "message you see, you may need to switch your console.  This is\n"
 	   "a common symptom -- search the FAQ and mailing list at parisc-linux.org\n\n",

--------------090507060504010807030902--
