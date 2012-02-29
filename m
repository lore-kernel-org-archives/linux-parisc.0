From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC (take 2)
Date: Tue, 28 Feb 2012 20:28:48 -0500
Message-ID: <BLU0-SMTP2670A16C9E610AE5C81121976F0@phx.gbl>
References: <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl> <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl> <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com> <4F031B1A.4010908@bell.net> <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com> <4F032C4C.10805@bell.net> <1325608972.3185.8.camel@dabdike.int.hansenpartnership.com> <4F034B6B.5020809@bell.net> <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl> <4F4CF28A.5050407@bell.net> <20120228225605.GA24038@glitch>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-35--15589280"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120228225605.GA24038@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-35--15589280
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 28-Feb-12, at 5:56 PM, Domenico Andreoli wrote:

> I applied this patch to v3.3-rc5 and then tried to build eglibc  
> 2.13-27,
> unsuccessfully. Do you have any patch for it?

I have 2.13-26 installed on my home system.  I plan to build 2.13-27  
soon.

Attached are my glibc patch set.  You need to remove hppa/local-stack- 
grows-up.diff with quilt
and then import the changes below in order.  Each patch must be pushed  
after import.

However, there are some pre-dependencies.  I believe that you should  
build the current version
of binutils with the attached two changes.  They are in the upstream  
sources but I don't believe
they are in the debian source yet. You also may need to update gcc to  
the latest unstable version
of 4.4 (build might have switched to 4.6 branch).  I now build almost  
everything else with 4.6.2.

For installation, I believe that perl and some dependent libraries  
need updating.  Otherwise, the
install will break perl.

If you get that far, you will resolve many thread related problems.   
If you use udev, it should
then be possible to update.

If you get in trouble, there are many .debs in my /dave/home/archives  
directory on shirka.esiee.fr.
If you don't have access to this system, possibly Thibaut can provide  
an account.  These can help
you revert or resolve dependencies.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="core-2011-08-31.diff"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="core-2011-08-31.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.13/nptl/allocatestack.c
===================================================================
--- eglibc-2.13.orig/nptl/allocatestack.c	2011-09-04 12:36:29.000000000 -0400
+++ eglibc-2.13/nptl/allocatestack.c	2011-09-04 12:41:22.000000000 -0400
@@ -356,6 +356,15 @@
   if (__builtin_expect (attr->flags & ATTR_FLAG_STACKADDR, 0))
     {
       uintptr_t adj;
+#if _STACK_GROWS_DOWN
+      char * stackaddr = (char *) attr->stackaddr;
+#else
+      /* Assume the same layout as the _STACK_GROWS_DOWN case, 
+	 with struct pthread at the top of the stack block. 
+	 Later we adjust the guard location and stack address 
+	 to match the _STACK_GROWS_UP case.  */
+      char * stackaddr = (char *) attr->stackaddr + attr->stacksize;
+#endif
 
       /* If the user also specified the size of the stack make sure it
 	 is large enough.  */
@@ -365,11 +374,11 @@
 
       /* Adjust stack size for alignment of the TLS block.  */
 #if TLS_TCB_AT_TP
-      adj = ((uintptr_t) attr->stackaddr - TLS_TCB_SIZE)
+      adj = ((uintptr_t) stackaddr - TLS_TCB_SIZE)
 	    & __static_tls_align_m1;
       assert (size > adj + TLS_TCB_SIZE);
 #elif TLS_DTV_AT_TP
-      adj = ((uintptr_t) attr->stackaddr - __static_tls_size)
+      adj = ((uintptr_t) stackaddr - __static_tls_size)
 	    & __static_tls_align_m1;
       assert (size > adj);
 #endif
@@ -379,10 +388,10 @@
 	 the stack.  It is the user's responsibility to do this if it
 	 is wanted.  */
 #if TLS_TCB_AT_TP
-      pd = (struct pthread *) ((uintptr_t) attr->stackaddr
+      pd = (struct pthread *) ((uintptr_t) stackaddr
 			       - TLS_TCB_SIZE - adj);
 #elif TLS_DTV_AT_TP
-      pd = (struct pthread *) (((uintptr_t) attr->stackaddr
+      pd = (struct pthread *) (((uintptr_t) stackaddr
 				- __static_tls_size - adj)
 			       - TLS_PRE_TCB_SIZE);
 #endif
@@ -394,7 +403,7 @@
       pd->specific[0] = pd->specific_1stblock;
 
       /* Remember the stack-related values.  */
-      pd->stackblock = (char *) attr->stackaddr - size;
+      pd->stackblock = (char *) stackaddr - size;
       pd->stackblock_size = size;
 
       /* This is a user-provided stack.  It will not be queued in the
@@ -625,7 +634,7 @@
 	  char *guard = mem + (((size - guardsize) / 2) & ~pagesize_m1);
 #elif _STACK_GROWS_DOWN
 	  char *guard = mem;
-# elif _STACK_GROWS_UP
+#elif _STACK_GROWS_UP
 	  char *guard = (char *) (((uintptr_t) pd - guardsize) & ~pagesize_m1);
 #endif
 	  if (mprotect (guard, guardsize, PROT_NONE) != 0)
@@ -678,9 +687,13 @@
 			prot) != 0)
 	    goto mprot_error;
 #elif _STACK_GROWS_UP
-	  if (mprotect ((char *) pd - pd->guardsize,
-			pd->guardsize - guardsize, prot) != 0)
-	    goto mprot_error;
+	  char *new_guard = (char *) (((uintptr_t) pd - guardsize) & ~pagesize_m1);
+	  char *old_guard = (char *) (((uintptr_t) pd - pd->guardsize) & ~pagesize_m1);
+	  /* The guard size difference might be > 0, but once rounded
+	     to the nearest page the size difference might be zero.  */
+	  if (old_guard - new_guard > 0)
+	    if (mprotect (old_guard, new_guard - old_guard, prot) != 0)
+	      goto mprot_error;
 #endif
 
 	  pd->guardsize = guardsize;
@@ -723,8 +736,10 @@
 #elif _STACK_GROWS_DOWN
   *stack = stacktop;
 #elif _STACK_GROWS_UP
+  /* We don't use stacktop. In _STACK_GROWS_UP the start
+     of the stack is simply stackblock (lowest address of
+     the stored block of memory for the stack).  */
   *stack = pd->stackblock;
-  assert (*stack > 0);
 #endif
 
   return 0;
Index: eglibc-2.13/nptl/pthread_attr_getstack.c
===================================================================
--- eglibc-2.13.orig/nptl/pthread_attr_getstack.c	2011-09-04 12:37:08.000000000 -0400
+++ eglibc-2.13/nptl/pthread_attr_getstack.c	2011-09-04 12:41:22.000000000 -0400
@@ -1,4 +1,4 @@
-/* Copyright (C) 2002 Free Software Foundation, Inc.
+/* Copyright (C) 2002, 2010 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
 
@@ -33,7 +33,11 @@
   iattr = (struct pthread_attr *) attr;
 
   /* Store the result.  */
+#ifdef _STACK_GROWS_DOWN
   *stackaddr = (char *) iattr->stackaddr - iattr->stacksize;
+#else
+  *stackaddr = (char *) iattr->stackaddr;
+#endif
   *stacksize = iattr->stacksize;
 
   return 0;
Index: eglibc-2.13/nptl/pthread_attr_setstack.c
===================================================================
--- eglibc-2.13.orig/nptl/pthread_attr_setstack.c	2011-09-04 12:37:37.000000000 -0400
+++ eglibc-2.13/nptl/pthread_attr_setstack.c	2011-09-04 12:41:22.000000000 -0400
@@ -1,4 +1,4 @@
-/* Copyright (C) 2002, 2003, 2006 Free Software Foundation, Inc.
+/* Copyright (C) 2002, 2003, 2006, 2010 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
 
@@ -48,7 +48,11 @@
 #endif
 
   iattr->stacksize = stacksize;
+#if _STACK_GROWS_DOWN
   iattr->stackaddr = (char *) stackaddr + stacksize;
+#else
+  iattr->stackaddr = (char *) stackaddr;
+#endif
   iattr->flags |= ATTR_FLAG_STACKADDR;
 
   return 0;
@@ -81,7 +85,11 @@
 #  endif
 
   iattr->stacksize = stacksize;
+#if _STACK_GROWS_DOWN
   iattr->stackaddr = (char *) stackaddr + stacksize;
+#else
+  iattr->stackaddr = (char *) stackaddr;
+#endif
   iattr->flags |= ATTR_FLAG_STACKADDR;
 
   return 0;
Index: eglibc-2.13/nptl/pthread_create.c
===================================================================
--- eglibc-2.13.orig/nptl/pthread_create.c	2011-09-04 12:38:04.000000000 -0400
+++ eglibc-2.13/nptl/pthread_create.c	2011-09-04 12:41:22.000000000 -0400
@@ -392,12 +392,25 @@
 #ifdef _STACK_GROWS_DOWN
   char *sp = CURRENT_STACK_FRAME;
   size_t freesize = (sp - (char *) pd->stackblock) & ~pagesize_m1;
-#else
-# error "to do"
-#endif
   assert (freesize < pd->stackblock_size);
   if (freesize > PTHREAD_STACK_MIN)
     madvise (pd->stackblock, freesize - PTHREAD_STACK_MIN, MADV_DONTNEED);
+#else
+  /* Page aligned start of memory to free (higher than or equal 
+     to current sp plus the minimum stack size).  */
+  void *freeblock = (void*)((size_t)(CURRENT_STACK_FRAME 
+				     + PTHREAD_STACK_MIN 
+				     + pagesize_m1) 
+				    & ~pagesize_m1);
+  char *free_end = (char *) (((uintptr_t) pd - pd->guardsize) & ~pagesize_m1);
+  /* Is there any space to free?  */
+  if (free_end > (char *)freeblock)
+    {
+      size_t freesize = (size_t)(free_end - (char *)freeblock);
+      assert (freesize < pd->stackblock_size);
+      madvise (freeblock, freesize, MADV_DONTNEED);
+    }
+#endif
 
   /* If the thread is detached free the TCB.  */
   if (IS_DETACHED (pd))
Index: eglibc-2.13/nptl/pthread_getattr_np.c
===================================================================
--- eglibc-2.13.orig/nptl/pthread_getattr_np.c	2011-09-04 12:38:22.000000000 -0400
+++ eglibc-2.13/nptl/pthread_getattr_np.c	2011-09-04 12:41:22.000000000 -0400
@@ -1,4 +1,5 @@
-/* Copyright (C) 2002, 2003, 2004, 2006, 2007 Free Software Foundation, Inc.
+/* Copyright (C) 2002, 2003, 2004, 2006, 2007, 
+   2010 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
 
@@ -61,7 +62,11 @@
   if (__builtin_expect (thread->stackblock != NULL, 1))
     {
       iattr->stacksize = thread->stackblock_size;
+#ifdef _STACK_GROWS_DOWN
       iattr->stackaddr = (char *) thread->stackblock + iattr->stacksize;
+#else
+      iattr->stackaddr = (char *) thread->stackblock;
+#endif
     }
   else
     {
@@ -110,13 +115,21 @@
 		    {
 		      /* Found the entry.  Now we have the info we need.  */
 		      iattr->stacksize = rl.rlim_cur;
+#ifdef _STACK_GROWS_DOWN
 		      iattr->stackaddr = (void *) to;
 
 		      /* The limit might be too high.  */
 		      if ((size_t) iattr->stacksize
 			  > (size_t) iattr->stackaddr - last_to)
 			iattr->stacksize = (size_t) iattr->stackaddr - last_to;
+#else
+		      iattr->stackaddr = (void *) from;
 
+		      /* The limit might be too high.  */
+		      if ((size_t) iattr->stacksize
+			  > to - (size_t) iattr->stackaddr)
+			iattr->stacksize = to - (size_t) iattr->stackaddr;
+#endif
 		      /* We succeed and no need to look further.  */
 		      ret = 0;
 		      break;
Index: eglibc-2.13/nptl/pthread_mutex_trylock.c
===================================================================
--- eglibc-2.13.orig/nptl/pthread_mutex_trylock.c	2011-09-04 12:38:45.000000000 -0400
+++ eglibc-2.13/nptl/pthread_mutex_trylock.c	2011-09-04 12:41:22.000000000 -0400
@@ -240,7 +240,8 @@
 							  private), 0, 0);
 
 	    if (INTERNAL_SYSCALL_ERROR_P (e, __err)
-		&& INTERNAL_SYSCALL_ERRNO (e, __err) == EWOULDBLOCK)
+		&& ((INTERNAL_SYSCALL_ERRNO (e, __err) == EWOULDBLOCK)
+		    || (INTERNAL_SYSCALL_ERRNO (e, __err) == EAGAIN)))
 	      {
 		THREAD_SETMEM (THREAD_SELF, robust_head.list_op_pending, NULL);
 
Index: eglibc-2.13/nptl/sysdeps/pthread/aio_misc.h
===================================================================
--- eglibc-2.13.orig/nptl/sysdeps/pthread/aio_misc.h	2011-09-04 12:39:12.000000000 -0400
+++ eglibc-2.13/nptl/sysdeps/pthread/aio_misc.h	2011-09-04 12:41:22.000000000 -0400
@@ -51,7 +51,7 @@
 	  {								      \
 	    status = lll_futex_timed_wait (futexaddr, oldval, timeout,	      \
 					   LLL_PRIVATE);		      \
-	    if (status != -EWOULDBLOCK)					      \
+	    if (status != -EWOULDBLOCK && status != -EAGAIN)		      \
 	      break;							      \
 									      \
 	    oldval = *futexaddr;					      \
@@ -66,7 +66,7 @@
 	else if (status == -ETIMEDOUT)					      \
 	  result = EAGAIN;						      \
 	else								      \
-	  assert (status == 0 || status == -EWOULDBLOCK);		      \
+	  assert (status == 0 || status == -EWOULDBLOCK || status == -EAGAIN);\
 									      \
 	pthread_mutex_lock (&__aio_requests_mutex);			      \
       }									      \
Index: eglibc-2.13/nptl/sysdeps/pthread/gai_misc.h
===================================================================
--- eglibc-2.13.orig/nptl/sysdeps/pthread/gai_misc.h	2011-09-04 12:39:40.000000000 -0400
+++ eglibc-2.13/nptl/sysdeps/pthread/gai_misc.h	2011-09-04 12:41:22.000000000 -0400
@@ -52,7 +52,7 @@
 	  {								      \
 	    status = lll_futex_timed_wait (futexaddr, oldval, timeout,	      \
 					   LLL_PRIVATE);		      \
-	    if (status != -EWOULDBLOCK)					      \
+	    if (status != -EWOULDBLOCK && status != -EAGAIN)		      \
 	      break;							      \
 									      \
 	    oldval = *futexaddr;					      \
@@ -67,7 +67,7 @@
 	else if (status == -ETIMEDOUT)					      \
 	  result = EAGAIN;						      \
 	else								      \
-	  assert (status == 0 || status == -EWOULDBLOCK);		      \
+	  assert (status == 0 || status == -EWOULDBLOCK || status == -EAGAIN);\
 									      \
 	pthread_mutex_lock (&__gai_requests_mutex);			      \
       }									      \
Index: eglibc-2.13/nptl/sysdeps/unix/sysv/linux/sem_timedwait.c
===================================================================
--- eglibc-2.13.orig/nptl/sysdeps/unix/sysv/linux/sem_timedwait.c	2011-09-04 12:40:07.000000000 -0400
+++ eglibc-2.13/nptl/sysdeps/unix/sysv/linux/sem_timedwait.c	2011-09-04 12:41:22.000000000 -0400
@@ -90,7 +90,7 @@
       /* Disable asynchronous cancellation.  */
       __pthread_disable_asynccancel (oldtype);
 
-      if (err != 0 && err != -EWOULDBLOCK)
+      if (err != 0 && err != -EWOULDBLOCK && err != -EAGAIN)
 	{
 	  __set_errno (-err);
 	  err = -1;
Index: eglibc-2.13/nptl/sysdeps/unix/sysv/linux/sem_wait.c
===================================================================
--- eglibc-2.13.orig/nptl/sysdeps/unix/sysv/linux/sem_wait.c	2011-09-04 12:40:30.000000000 -0400
+++ eglibc-2.13/nptl/sysdeps/unix/sysv/linux/sem_wait.c	2011-09-04 12:41:22.000000000 -0400
@@ -62,7 +62,7 @@
       /* Disable asynchronous cancellation.  */
       __pthread_disable_asynccancel (oldtype);
 
-      if (err != 0 && err != -EWOULDBLOCK)
+      if (err != 0 && err != -EWOULDBLOCK && err != -EAGAIN)
 	{
 	  __set_errno (-err);
 	  err = -1;
@@ -107,7 +107,7 @@
       /* Disable asynchronous cancellation.  */
       __pthread_disable_asynccancel (oldtype);
     }
-  while (err == 0 || err == -EWOULDBLOCK);
+  while (err == 0 || err == -EWOULDBLOCK || err == -EAGAIN);
 
   __set_errno (-err);
   return -1;

--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="ports-2011-08-31.diff"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="ports-2011-08-31.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.13/ports/ChangeLog.hppa
===================================================================
--- eglibc-2.13.orig/ports/ChangeLog.hppa	2011-09-04 14:13:02.000000000 -0400
+++ eglibc-2.13/ports/ChangeLog.hppa	2011-09-04 14:20:23.000000000 -0400
@@ -1,3 +1,8 @@
+2010-10-29  Carlos O'Donell  <carlos@codesourcery.com>
+
+	* sysdeps/hppa/dl-machine.h: Update copyright year.
+	(ELF_MACHINE_BEFORE_RTLD_RELOC): Call _dl_fptr_init.
+
 2010-06-24  Carlos O'Donell  <carlos@codesourcery.com>
 
 	* sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S: Only create stack 
Index: eglibc-2.13/ports/sysdeps/hppa/configure
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/configure	2011-09-04 14:13:32.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/configure	2011-09-04 14:34:35.000000000 -0400
@@ -1,19 +1,101 @@
+
+# as_fn_set_status STATUS
+# -----------------------
+# Set $? to STATUS, without forking.
+as_fn_set_status ()
+{
+  return $1
+} # as_fn_set_status
+
+# as_fn_exit STATUS
+# -----------------
+# Exit the shell with STATUS, even in a "trap 0" or "set -e" context.
+as_fn_exit ()
+{
+  set +e
+  as_fn_set_status $1
+  exit $1
+} # as_fn_exit
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
+  as_expr=expr
+else
+  as_expr=false
+fi
+
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" = "X/"; then
+  as_basename=basename
+else
+  as_basename=false
+fi
+
+as_me=`$as_basename -- "$0" ||
+$as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
+        X"$0" : 'X\(//\)$' \| \
+        X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+    sed '/^.*\/\([^/][^/]*\)\/*$/{
+           s//\1/
+           q
+         }
+         /^X\/\(\/\/\)$/{
+           s//\1/
+           q
+         }
+         /^X\/\(\/\).*/{
+           s//\1/
+           q
+         }
+         s/.*/./; q'`
+
+
+  as_lineno_1=$LINENO as_lineno_1a=$LINENO
+  as_lineno_2=$LINENO as_lineno_2a=$LINENO
+  eval 'test "x$as_lineno_1'$as_run'" != "x$as_lineno_2'$as_run'" &&
+  test "x`expr $as_lineno_1'$as_run' + 1`" = "x$as_lineno_2'$as_run'"' || {
+  # Blame Lee E. McMahon (1931-1989) for sed's syntax.  :-)
+  sed -n '
+    p
+    /[$]LINENO/=
+  ' <$as_myself |
+    sed '
+      s/[$]LINENO.*/&-/
+      t lineno
+      b
+      :lineno
+      N
+      :loop
+      s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
+      t loop
+      s/-\n.*//
+    ' >$as_me.lineno &&
+  chmod +x "$as_me.lineno" ||
+    { $as_echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2; as_fn_exit 1; }
+
+  # Don't try to exec as it changes $[0], causing all sort of problems
+  # (the dirname of $[0] is not the place where we might find the
+  # original and so on.  Autoconf is especially sensitive to this).
+  . "./$as_me.lineno"
+  # Exit status is that of the last command.
+  exit
+}
+
 # This file is generated from configure.in by Autoconf.  DO NOT EDIT!
 
-{ $as_echo "$as_me:$LINENO: checking for assembler line separator" >&5
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for assembler line separator" >&5
 $as_echo_n "checking for assembler line separator... " >&6; }
-if test "${libc_cv_asm_line_sep+set}" = set; then
+if test "${libc_cv_asm_line_sep+set}" = set; then :
   $as_echo_n "(cached) " >&6
 else
   cat > conftest.s <<EOF
 nop ; is_old_puffin
 EOF
 if { ac_try='${CC-cc} -c $ASFLAGS conftest.s 1>&5'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
   (eval $ac_try) 2>&5
   ac_status=$?
-  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; }; then
   libc_cv_asm_line_sep='!'
 else
   if test -z "$enable_hacker_mode"; then
@@ -25,7 +107,7 @@
 fi
 rm -f conftest*
 fi
-{ $as_echo "$as_me:$LINENO: result: $libc_cv_asm_line_sep" >&5
+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_asm_line_sep" >&5
 $as_echo "$libc_cv_asm_line_sep" >&6; }
 cat >>confdefs.h <<_ACEOF
 #define ASM_LINE_SEP $libc_cv_asm_line_sep
Index: eglibc-2.13/ports/sysdeps/hppa/dl-fptr.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/dl-fptr.h	2011-09-04 14:14:04.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/dl-fptr.h	2011-09-04 14:20:23.000000000 -0400
@@ -22,6 +22,9 @@
 
 #include <sysdeps/generic/dl-fptr.h>
 
+/* Initialize function pointer code. Call before relocation processing.  */
+extern void _dl_fptr_init (void);
+
 /* There are currently 33 dynamic symbols in ld.so.
    ELF_MACHINE_BOOT_FPTR_TABLE_LEN needs to be at least that big.  */
 #define ELF_MACHINE_BOOT_FPTR_TABLE_LEN 64	
Index: eglibc-2.13/ports/sysdeps/hppa/dl-machine.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/dl-machine.h	2011-09-04 14:14:30.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/dl-machine.h	2011-09-04 14:20:23.000000000 -0400
@@ -1,6 +1,5 @@
 /* Machine-dependent ELF dynamic relocation inline functions.  PA-RISC version.
-   Copyright (C) 1995-1997,1999-2003
-	Free Software Foundation, Inc.
+   Copyright (C) 1995-1997,1999-2003, 2010 Free Software Foundation, Inc.
    Contributed by David Huggins-Daines <dhd@debian.org>
    This file is part of the GNU C Library.
 
Index: eglibc-2.13/ports/sysdeps/hppa/dl-tls.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/dl-tls.h	2011-09-04 14:14:57.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/dl-tls.h	2011-09-04 14:20:23.000000000 -0400
@@ -1,5 +1,5 @@
 /* Thread-local storage handling in the ELF dynamic linker.  hppa version.
-   Copyright (C) 2003 Free Software Foundation, Inc.
+   Copyright (C) 2003, 2011 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
 
    The GNU C Library is free software; you can redistribute it and/or
@@ -27,3 +27,6 @@
 
 
 extern void *__tls_get_addr (tls_index *ti);
+
+/* Value used for dtv entries for which the allocation is delayed.  */
+#define TLS_DTV_UNALLOCATED	((void *) -1l)
Index: eglibc-2.13/ports/sysdeps/hppa/elf/configure
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/elf/configure	2011-09-04 14:15:24.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/elf/configure	2011-09-04 14:45:59.000000000 -0400
@@ -1,12 +1,94 @@
+
+# as_fn_set_status STATUS
+# -----------------------
+# Set $? to STATUS, without forking.
+as_fn_set_status ()
+{
+  return $1
+} # as_fn_set_status
+
+# as_fn_exit STATUS
+# -----------------
+# Exit the shell with STATUS, even in a "trap 0" or "set -e" context.
+as_fn_exit ()
+{
+  set +e
+  as_fn_set_status $1
+  exit $1
+} # as_fn_exit
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
+  as_expr=expr
+else
+  as_expr=false
+fi
+
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" = "X/"; then
+  as_basename=basename
+else
+  as_basename=false
+fi
+
+as_me=`$as_basename -- "$0" ||
+$as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
+        X"$0" : 'X\(//\)$' \| \
+        X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+    sed '/^.*\/\([^/][^/]*\)\/*$/{
+           s//\1/
+           q
+         }
+         /^X\/\(\/\/\)$/{
+           s//\1/
+           q
+         }
+         /^X\/\(\/\).*/{
+           s//\1/
+           q
+         }
+         s/.*/./; q'`
+
+
+  as_lineno_1=$LINENO as_lineno_1a=$LINENO
+  as_lineno_2=$LINENO as_lineno_2a=$LINENO
+  eval 'test "x$as_lineno_1'$as_run'" != "x$as_lineno_2'$as_run'" &&
+  test "x`expr $as_lineno_1'$as_run' + 1`" = "x$as_lineno_2'$as_run'"' || {
+  # Blame Lee E. McMahon (1931-1989) for sed's syntax.  :-)
+  sed -n '
+    p
+    /[$]LINENO/=
+  ' <$as_myself |
+    sed '
+      s/[$]LINENO.*/&-/
+      t lineno
+      b
+      :lineno
+      N
+      :loop
+      s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
+      t loop
+      s/-\n.*//
+    ' >$as_me.lineno &&
+  chmod +x "$as_me.lineno" ||
+    { $as_echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2; as_fn_exit 1; }
+
+  # Don't try to exec as it changes $[0], causing all sort of problems
+  # (the dirname of $[0] is not the place where we might find the
+  # original and so on.  Autoconf is especially sensitive to this).
+  . "./$as_me.lineno"
+  # Exit status is that of the last command.
+  exit
+}
+
 # This file is generated from configure.in by Autoconf.  DO NOT EDIT!
  # Local configure fragment for sysdeps/hppa/elf.
 
 if test "$usetls" != no; then
 # Check for support of thread-local storage handling in assembler and
 # linker.
-{ $as_echo "$as_me:$LINENO: checking for hppa TLS support" >&5
+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for hppa TLS support" >&5
 $as_echo_n "checking for hppa TLS support... " >&6; }
-if test "${libc_cv_hppa_tls+set}" = set; then
+if test "${libc_cv_hppa_tls+set}" = set; then :
   $as_echo_n "(cached) " >&6
 else
   cat > conftest.s <<\EOF
@@ -41,23 +123,21 @@
 ; Done all the TLS tests.
 EOF
 if { ac_try='${CC-cc} -c $CFLAGS conftest.s 1>&5'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
   (eval $ac_try) 2>&5
   ac_status=$?
-  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+  test $ac_status = 0; }; }; then
   libc_cv_hppa_tls=yes
 else
   libc_cv_hppa_tls=no
 fi
 rm -f conftest*
 fi
-{ $as_echo "$as_me:$LINENO: result: $libc_cv_hppa_tls" >&5
+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_hppa_tls" >&5
 $as_echo "$libc_cv_hppa_tls" >&6; }
 if test $libc_cv_hppa_tls = yes; then
-  cat >>confdefs.h <<\_ACEOF
-#define HAVE_TLS_SUPPORT 1
-_ACEOF
+  $as_echo "#define HAVE_TLS_SUPPORT 1" >>confdefs.h
 
 fi
 fi
Index: eglibc-2.13/ports/sysdeps/hppa/fpu/fegetenv.c
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/fpu/fegetenv.c	2011-09-04 14:15:52.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/fpu/fegetenv.c	2011-09-04 14:20:23.000000000 -0400
@@ -1,5 +1,5 @@
 /* Store current floating-point environment.
-   Copyright (C) 2000 Free Software Foundation, Inc.
+   Copyright (C) 2000, 2011 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by David Huggins-Daines <dhd@debian.org>, 2000
 
Index: eglibc-2.13/ports/sysdeps/hppa/fpu/feupdateenv.c
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/fpu/feupdateenv.c	2011-09-04 14:16:18.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/fpu/feupdateenv.c	2011-09-04 14:20:23.000000000 -0400
@@ -1,5 +1,5 @@
 /* Install given floating-point environment and raise exceptions.
-   Copyright (C) 2000 Free Software Foundation, Inc.
+   Copyright (C) 2000, 2011 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by David Huggins-Daines <dhd@debian.org>, 2000
 
Index: eglibc-2.13/ports/sysdeps/hppa/fpu/ftestexcept.c
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/fpu/ftestexcept.c	2011-09-04 14:16:49.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/fpu/ftestexcept.c	2011-09-04 14:20:23.000000000 -0400
@@ -1,5 +1,5 @@
 /* Test exception in current environment.
-   Copyright (C) 2000 Free Software Foundation, Inc.
+   Copyright (C) 2000, 2011 Free Software Foundation, Inc.
    This file is part of the GNU C Library.
    Contributed by David Huggins-Daines <dhd@debian.org>, 2000
 
Index: eglibc-2.13/ports/sysdeps/hppa/stackinfo.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/hppa/stackinfo.h	2011-09-04 14:17:22.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/hppa/stackinfo.h	2011-09-04 14:20:23.000000000 -0400
@@ -22,6 +22,12 @@
 #ifndef _STACKINFO_H
 #define _STACKINFO_H	1
 
+#include <elf.h>
+
+/* Default to an executable stack.  PF_X can be overridden if PT_GNU_STACK is
+ * present, but it is presumed absent.  */
+#define DEFAULT_STACK_PERMS (PF_R|PF_W|PF_X)
+
 /* On PA the stack grows up.  */
 #define _STACK_GROWS_UP	1
 
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	2011-09-04 14:17:42.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/bits/fcntl.h	2011-09-04 14:20:23.000000000 -0400
@@ -1,5 +1,5 @@
-/* O_*, F_*, FD_* bit values for Linux/HPPA.
-   Copyright (C) 1995,1996,1997,1998,1999,2000,2002,2004
+/* O_*, F_*, FD_* bit values for Linux.
+   Copyright (C) 1995, 1996, 1997, 1998, 1999, 2000, 2002, 2004, 2010
    Free Software Foundation, Inc.
    This file is part of the GNU C Library.
 
@@ -29,7 +29,7 @@
 
 
 /* open/fcntl - O_SYNC is only implemented on blocks devices and on files
-   located on an ext2 file system */
+   located on a few file systems.  */
 #define O_ACCMODE	   0003
 #define O_RDONLY	     00
 #define O_WRONLY	     01
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h	2011-09-04 14:18:10.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/nptl/sysdep-cancel.h	2011-09-04 14:20:23.000000000 -0400
@@ -61,11 +61,53 @@
    
 # undef PSEUDO
 # define PSEUDO(name, syscall_name, args)				\
+	ENTRY (__##syscall_name##_nocancel)				\
+	DOARGS_##args					ASM_LINE_SEP	\
+	stwm TREG, 64(%sp)				ASM_LINE_SEP	\
+	.cfi_offset TREG, 0				ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	\
+	stw %sp, -4(%sp)				ASM_LINE_SEP	\
+	.cfi_offset 30, -4				ASM_LINE_SEP	\
+	stw %r19, -32(%sp)				ASM_LINE_SEP	\
+	.cfi_offset 19, -32				ASM_LINE_SEP	\
+	/* Save r19 */					ASM_LINE_SEP	\
+	SAVE_PIC(TREG)					ASM_LINE_SEP	\
+	/* Do syscall, delay loads # */			ASM_LINE_SEP	\
+	ble  0x100(%sr2,%r0)				ASM_LINE_SEP	\
+	ldi SYS_ify (syscall_name), %r20 /* delay */	ASM_LINE_SEP	\
+	ldi NO_ERROR,%r1				ASM_LINE_SEP	\
+	cmpb,>>=,n %r1,%ret0,L(pre_nc_end)		ASM_LINE_SEP	\
+	/* Restore r19 from TREG */			ASM_LINE_SEP	\
+	LOAD_PIC(TREG) /* delay */			ASM_LINE_SEP	\
+	SYSCALL_ERROR_HANDLER				ASM_LINE_SEP	\
+	/* Use TREG for temp storage */			ASM_LINE_SEP	\
+	copy %ret0, TREG /* delay */			ASM_LINE_SEP	\
+	/* OPTIMIZE: Don't reload r19 */		ASM_LINE_SEP	\
+	/* do a -1*syscall_ret0 */			ASM_LINE_SEP	\
+	sub %r0, TREG, TREG				ASM_LINE_SEP	\
+	/* Store into errno location */			ASM_LINE_SEP	\
+	stw TREG, 0(%sr0,%ret0)				ASM_LINE_SEP	\
+	/* return -1 as error */			ASM_LINE_SEP	\
+	ldi -1, %ret0					ASM_LINE_SEP	\
+L(pre_nc_end):						ASM_LINE_SEP	\
+	/* No need to LOAD_PIC */			ASM_LINE_SEP	\
+	/* Undo frame */				ASM_LINE_SEP	\
+	ldwm -64(%sp),TREG				ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	\
+	/* Restore rp before exit */			ASM_LINE_SEP	\
+	ldw -20(%sp), %rp				ASM_LINE_SEP	\
+	.cfi_restore 2					ASM_LINE_SEP	\
+	ret						ASM_LINE_SEP	\
+	END(__##syscall_name##_nocancel)		ASM_LINE_SEP	\
+	/**********************************************/ASM_LINE_SEP	\
 	ENTRY (name)							\
 	DOARGS_##args					ASM_LINE_SEP	\
 	stwm TREG, 64(%sp)				ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	\
 	stw %sp, -4(%sp)				ASM_LINE_SEP	\
+	.cfi_offset 30, -4				ASM_LINE_SEP	\
 	stw %r19, -32(%sp)				ASM_LINE_SEP	\
+	.cfi_offset 19, -32				ASM_LINE_SEP	\
 	/* Done setting up frame, continue... */	ASM_LINE_SEP	\
 	SINGLE_THREAD_P					ASM_LINE_SEP	\
 	cmpib,<>,n 0,%ret0,L(pseudo_cancel)		ASM_LINE_SEP	\
@@ -128,26 +170,40 @@
 	/* No need to LOAD_PIC */			ASM_LINE_SEP	\
 	/* Undo frame */				ASM_LINE_SEP	\
 	ldwm -64(%sp),TREG				ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	\
 	/* Restore rp before exit */			ASM_LINE_SEP	\
-	ldw -20(%sp), %rp				ASM_LINE_SEP
+	ldw -20(%sp), %rp				ASM_LINE_SEP	\
+	.cfi_restore 2					ASM_LINE_SEP
 
 /* Save arguments into our frame */
 # define PUSHARGS_0	/* nothing to do */
-# define PUSHARGS_1	PUSHARGS_0 stw %r26, -36(%sr0,%sp)	ASM_LINE_SEP
-# define PUSHARGS_2	PUSHARGS_1 stw %r25, -40(%sr0,%sp)	ASM_LINE_SEP
-# define PUSHARGS_3	PUSHARGS_2 stw %r24, -44(%sr0,%sp)	ASM_LINE_SEP
-# define PUSHARGS_4	PUSHARGS_3 stw %r23, -48(%sr0,%sp)	ASM_LINE_SEP
-# define PUSHARGS_5	PUSHARGS_4 stw %r22, -52(%sr0,%sp)	ASM_LINE_SEP 
-# define PUSHARGS_6	PUSHARGS_5 stw %r21, -56(%sr0,%sp)	ASM_LINE_SEP
+# define PUSHARGS_1	PUSHARGS_0 stw %r26, -36(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 26, -36			ASM_LINE_SEP
+# define PUSHARGS_2	PUSHARGS_1 stw %r25, -40(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 25, -40			ASM_LINE_SEP
+# define PUSHARGS_3	PUSHARGS_2 stw %r24, -44(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 24, -44			ASM_LINE_SEP
+# define PUSHARGS_4	PUSHARGS_3 stw %r23, -48(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 23, -48			ASM_LINE_SEP
+# define PUSHARGS_5	PUSHARGS_4 stw %r22, -52(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 22, -52			ASM_LINE_SEP
+# define PUSHARGS_6	PUSHARGS_5 stw %r21, -56(%sr0,%sp)	ASM_LINE_SEP	\
+			.cfi_offset 21, -56			ASM_LINE_SEP
 
 /* Bring them back from the stack */
 # define POPARGS_0	/* nothing to do */
-# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	ASM_LINE_SEP
-# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	ASM_LINE_SEP
-# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	ASM_LINE_SEP
-# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	ASM_LINE_SEP
-# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	ASM_LINE_SEP
-# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	ASM_LINE_SEP
+# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	ASM_LINE_SEP	\
+			.cfi_restore 26				ASM_LINE_SEP
+# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	ASM_LINE_SEP	\
+			.cfi_restore 25				ASM_LINE_SEP
+# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	ASM_LINE_SEP	\
+			.cfi_restore 24				ASM_LINE_SEP
+# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	ASM_LINE_SEP	\
+			.cfi_restore 23				ASM_LINE_SEP
+# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	ASM_LINE_SEP	\
+			.cfi_restore 22				ASM_LINE_SEP
+# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	ASM_LINE_SEP	\
+			.cfi_restore 21				ASM_LINE_SEP
 
 # ifdef IS_IN_libpthread
 #  ifdef PIC
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/procfs.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/hppa/sys/procfs.h	2011-09-04 14:18:44.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/procfs.h	2011-09-04 14:20:23.000000000 -0400
@@ -29,10 +29,8 @@
    GDB unless you know what you are doing.  */
 
 #include <features.h>
-#include <signal.h>
 #include <sys/time.h>
 #include <sys/types.h>
-#include <sys/ucontext.h>
 #include <sys/user.h>
 
 __BEGIN_DECLS
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sysdep.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/hppa/sysdep.h	2011-09-04 14:19:27.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sysdep.h	2011-09-04 14:20:23.000000000 -0400
@@ -22,7 +22,6 @@
 
 #include <asm/unistd.h>
 #include <sysdeps/generic/sysdep.h>
-#include <sys/syscall.h>
 
 /* In order to get __set_errno() definition in INLINE_SYSCALL.  */
 #ifndef __ASSEMBLER__
@@ -35,32 +34,28 @@
 #undef SYS_ify
 #define SYS_ify(syscall_name)	(__NR_##syscall_name)
 
+/* The vfork, fork, and clone syscalls clobber r19
+ * and r21. We list r21 as either clobbered or as an
+ * input to a 6-argument syscall. We must save and
+ * restore r19 in both PIC and non-PIC cases.
+ */ 
 /* WARNING: TREG must be a callee saves register so 
    that it doesn't have to be restored after a call 
    to another function */
-#ifdef PIC
-# define TREG %r3
-# define SAVE_PIC(SREG) copy %r19, SREG ASM_LINE_SEP
-# define LOAD_PIC(LREG) copy LREG, %r19 ASM_LINE_SEP
-/* Inline assembly defines */
-# define TREG_ASM "%r4" /* Cant clobber r3, it holds framemarker */
-# define SAVE_ASM_PIC	"       copy %%r19, %" TREG_ASM "\n"
-# define LOAD_ASM_PIC	"       copy %" TREG_ASM ", %%r19\n"
-# define CLOB_TREG	TREG_ASM ,
-# define PIC_REG_DEF	register unsigned long __r19 asm("r19");
-# define PIC_REG_USE	, "r" (__r19)
-#else
-# define TREG %r3
-# define SAVE_PIC(SREG) nop ASM_LINE_SEP
-# define LOAD_PIC(LREG) nop ASM_LINE_SEP
+#define TREG 4
+#define SAVE_PIC(SREG) \
+	copy %r19, SREG ASM_LINE_SEP	\
+	.cfi_register 19, SREG
+#define LOAD_PIC(LREG) \
+	copy LREG , %r19 ASM_LINE_SEP	\
+	.cfi_restore 19
 /* Inline assembly defines */
-# define TREG_ASM 
-# define SAVE_ASM_PIC	"nop \n"
-# define LOAD_ASM_PIC	"nop \n"
-# define CLOB_TREG
-# define PIC_REG_DEF
-# define PIC_REG_USE
-#endif
+#define TREG_ASM "%r4" /* Cant clobber r3, it holds framemarker */
+#define SAVE_ASM_PIC	"       copy %%r19, %" TREG_ASM "\n"
+#define LOAD_ASM_PIC	"       copy %" TREG_ASM ", %%r19\n"
+#define CLOB_TREG	TREG_ASM ,
+#define PIC_REG_DEF	register unsigned long __r19 asm("r19");
+#define PIC_REG_USE	, "r" (__r19)
 
 #ifdef __ASSEMBLER__
 
@@ -127,12 +122,14 @@
 	.align ALIGNARG(4)				ASM_LINE_SEP	\
 	.export C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
 	.type	C_SYMBOL_NAME(name),@function		ASM_LINE_SEP	\
+	cfi_startproc					ASM_LINE_SEP	\
 	C_LABEL(name)					ASM_LINE_SEP	\
 	.PROC						ASM_LINE_SEP	\
 	.CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3	ASM_LINE_SEP	\
 	.ENTRY						ASM_LINE_SEP	\
 	/* SAVE_RP says we do */			ASM_LINE_SEP	\
 	stw %rp, -20(%sr0,%sp)				ASM_LINE_SEP	\
+	.cfi_offset 2, -20				ASM_LINE_SEP	\
 	/*FIXME: Call mcount? (carefull with stack!) */
 
 /* Some syscall wrappers do not call other functions, and
@@ -142,18 +139,21 @@
 	.align ALIGNARG(4)				ASM_LINE_SEP	\
 	.export C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
 	.type	C_SYMBOL_NAME(name),@function		ASM_LINE_SEP	\
+	cfi_startproc					ASM_LINE_SEP	\
 	C_LABEL(name)					ASM_LINE_SEP	\
 	.PROC						ASM_LINE_SEP	\
 	.CALLINFO FRAME=64,NO_CALLS,SAVE_RP,ENTRY_GR=3	ASM_LINE_SEP	\
 	.ENTRY						ASM_LINE_SEP	\
 	/* SAVE_RP says we do */			ASM_LINE_SEP	\
 	stw %rp, -20(%sr0,%sp)				ASM_LINE_SEP	\
+	.cfi_offset 2, -20				ASM_LINE_SEP	\
 	/*FIXME: Call mcount? (carefull with stack!) */
 
 #undef	END
 #define END(name)							\
   	.EXIT						ASM_LINE_SEP	\
 	.PROCEND					ASM_LINE_SEP	\
+	cfi_endproc					ASM_LINE_SEP	\
 .size	C_SYMBOL_NAME(name), .-C_SYMBOL_NAME(name)	ASM_LINE_SEP
 
 /* If compiled for profiling, call `mcount' at the start 
@@ -170,9 +170,7 @@
    which means
 	ENTRY(name)
 	DO_CALL(...)
-	nop
-	bv 0(2)
-	nop
+	bv,n 0(2)
 */
 
 #define	PSEUDO(name, syscall_name, args)			\
@@ -180,8 +178,7 @@
   /* If necc. load args from stack */		ASM_LINE_SEP	\
   DOARGS_##args					ASM_LINE_SEP	\
   DO_CALL (syscall_name, args)			ASM_LINE_SEP	\
-  UNDOARGS_##args				ASM_LINE_SEP	\
-  nop						ASM_LINE_SEP
+  UNDOARGS_##args				ASM_LINE_SEP
 
 #define ret \
   /* Return value set by ERRNO code */		ASM_LINE_SEP	\
@@ -196,8 +193,7 @@
   ENTRY_LEAF (name)				ASM_LINE_SEP	\
   DOARGS_##args					ASM_LINE_SEP	\
   DO_CALL_NOERRNO (syscall_name, args)		ASM_LINE_SEP	\
-  UNDOARGS_##args				ASM_LINE_SEP	\
-  nop						ASM_LINE_SEP
+  UNDOARGS_##args				ASM_LINE_SEP
 
 #define ret_NOERRNO ret
 
@@ -211,8 +207,7 @@
   ENTRY_LEAF (name)				ASM_LINE_SEP	\
   DOARGS_##args					ASM_LINE_SEP	\
   DO_CALL_ERRVAL (syscall_name, args)		ASM_LINE_SEP	\
-  UNDOARGS_##args				ASM_LINE_SEP	\
-  nop						ASM_LINE_SEP
+  UNDOARGS_##args				ASM_LINE_SEP
 
 #define ret_ERRVAL ret
 
@@ -290,8 +285,12 @@
 #define DO_CALL(syscall_name, args)				\
 	/* Create a frame */			ASM_LINE_SEP	\
 	stwm TREG, 64(%sp)			ASM_LINE_SEP	\
+	.cfi_offset TREG, 0			ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset 64		ASM_LINE_SEP	\
 	stw %sp, -4(%sp)			ASM_LINE_SEP	\
+	.cfi_offset 30, -4			ASM_LINE_SEP	\
 	stw %r19, -32(%sp)			ASM_LINE_SEP	\
+	.cfi_offset 19, -32			ASM_LINE_SEP	\
 	/* Save r19 */				ASM_LINE_SEP	\
 	SAVE_PIC(TREG)				ASM_LINE_SEP	\
 	/* Do syscall, delay loads # */		ASM_LINE_SEP	\
@@ -314,8 +313,10 @@
 L(pre_end):					ASM_LINE_SEP	\
 	/* Restore our frame, restoring TREG */	ASM_LINE_SEP	\
 	ldwm -64(%sp), TREG			ASM_LINE_SEP	\
+	.cfi_adjust_cfa_offset -64		ASM_LINE_SEP	\
 	/* Restore return pointer */		ASM_LINE_SEP	\
-	ldw -20(%sp),%rp			ASM_LINE_SEP
+	ldw -20(%sp),%rp			ASM_LINE_SEP	\
+	.cfi_restore 2				ASM_LINE_SEP
 
 /* We do nothing with the return, except hand it back to someone else */
 #undef  DO_CALL_NOERRNO

--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="ports-2011-09-17.diff"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="ports-2011-09-17.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h
===================================================================
--- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h	2011-09-05 00:09:53.000000000 -0400
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h	2011-09-17 23:07:14.000000000 -0400
@@ -288,18 +288,20 @@
   __lll_robust_timedlock (&(futex), abstime, id, private)
 
 #define __lll_unlock(futex, private) \
-  (void)					\
-  ({ int val = atomic_exchange_rel (futex, 0);  \
-     if (__builtin_expect (val > 1, 0))         \
-       lll_futex_wake (futex, 1, private);      \
+  (void)						\
+  ({ int *__futex = (futex);				\
+     int val = atomic_exchange_rel (__futex, 0);	\
+     if (__builtin_expect (val > 1, 0))			\
+       lll_futex_wake (__futex, 1, private);		\
   })
 #define lll_unlock(futex, private) __lll_unlock(&(futex), private)
 
 #define  __lll_robust_unlock(futex,private) \
-  (void)                                               \
-    ({ int val = atomic_exchange_rel (futex, 0);       \
-       if (__builtin_expect (val & FUTEX_WAITERS, 0))  \
-         lll_futex_wake (futex, 1, private);           \
+  (void)						\
+    ({ int *__futex = (futex);				\
+       int val = atomic_exchange_rel (__futex, 0);	\
+       if (__builtin_expect (val & FUTEX_WAITERS, 0))	\
+         lll_futex_wake (__futex, 1, private);		\
     })
 #define lll_robust_unlock(futex, private) \
   __lll_robust_unlock(&(futex), private)

--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="ports-2011-10-30.diff"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="ports-2011-10-30.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.13/ports/ChangeLog.hppa
===================================================================
--- eglibc-2.13.orig/ports/ChangeLog.hppa	2011-09-24 18:40:01.000000000 -0400
+++ eglibc-2.13/ports/ChangeLog.hppa	2011-10-30 11:43:20.000000000 -0400
@@ -3,6 +3,19 @@
 	* sysdeps/hppa/dl-machine.h: Update copyright year.
 	(ELF_MACHINE_BEFORE_RTLD_RELOC): Call _dl_fptr_init.
 
+2010-08-06  Guy Martin <gmsoft@tuxicoman.be>
+
+	* ports/sysdeps/unix/sysv/linux/hppa/sys/epoll.h:
+	Fix EPOLL_CLOEXEC and EPOLL_NONBLOCK to match kernel definition.
+	* ports/sysdeps/unix/sysv/linux/hppa/sys/eventfd.h:
+	Fix EFD_CLOEXEC and EFD_NONBLOCK to match kernel definition.
+	* ports/sysdeps/unix/sysv/linux/hppa/sys/inotify.h:
+	Fix IN_CLOEXEC and IN_NONBLOCK to match kernel definition.
+	* ports/sysdeps/unix/sysv/linux/hppa/sys/signalfd.h:
+	Fix SFD_CLOEXEC and SFD_NONBLOCK to match kernel definition.
+	* ports/sysdeps/unix/sysv/linux/hppa/sys/timerfd.h:
+	Fix TFD_CLOEXEC and TFD_NONBLOCK to match kernel definition.
+
 2010-06-24  Carlos O'Donell  <carlos@codesourcery.com>
 
 	* sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S: Only create stack 
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/epoll.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/epoll.h	2011-10-30 11:44:30.000000000 -0400
@@ -0,0 +1,144 @@
+/* Copyright (C) 2002-2006, 2007, 2008, 2009 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef	_SYS_EPOLL_H
+#define	_SYS_EPOLL_H	1
+
+#include <stdint.h>
+#include <sys/types.h>
+
+/* Get __sigset_t.  */
+#include <bits/sigset.h>
+
+#ifndef __sigset_t_defined
+# define __sigset_t_defined
+typedef __sigset_t sigset_t;
+#endif
+
+
+/* Flags to be passed to epoll_create1.  */
+enum
+  {
+    EPOLL_CLOEXEC = 010000000,
+#define EPOLL_CLOEXEC EPOLL_CLOEXEC
+    EPOLL_NONBLOCK = 00200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define EPOLL_NONBLOCK EPOLL_NONBLOCK
+  };
+
+
+enum EPOLL_EVENTS
+  {
+    EPOLLIN = 0x001,
+#define EPOLLIN EPOLLIN
+    EPOLLPRI = 0x002,
+#define EPOLLPRI EPOLLPRI
+    EPOLLOUT = 0x004,
+#define EPOLLOUT EPOLLOUT
+    EPOLLRDNORM = 0x040,
+#define EPOLLRDNORM EPOLLRDNORM
+    EPOLLRDBAND = 0x080,
+#define EPOLLRDBAND EPOLLRDBAND
+    EPOLLWRNORM = 0x100,
+#define EPOLLWRNORM EPOLLWRNORM
+    EPOLLWRBAND = 0x200,
+#define EPOLLWRBAND EPOLLWRBAND
+    EPOLLMSG = 0x400,
+#define EPOLLMSG EPOLLMSG
+    EPOLLERR = 0x008,
+#define EPOLLERR EPOLLERR
+    EPOLLHUP = 0x010,
+#define EPOLLHUP EPOLLHUP
+    EPOLLRDHUP = 0x2000,
+#define EPOLLRDHUP EPOLLRDHUP
+    EPOLLONESHOT = (1 << 30),
+#define EPOLLONESHOT EPOLLONESHOT
+    EPOLLET = (1 << 31)
+#define EPOLLET EPOLLET
+  };
+
+
+/* Valid opcodes ( "op" parameter ) to issue to epoll_ctl().  */
+#define EPOLL_CTL_ADD 1	/* Add a file descriptor to the interface.  */
+#define EPOLL_CTL_DEL 2	/* Remove a file descriptor from the interface.  */
+#define EPOLL_CTL_MOD 3	/* Change file descriptor epoll_event structure.  */
+
+
+typedef union epoll_data
+{
+  void *ptr;
+  int fd;
+  uint32_t u32;
+  uint64_t u64;
+} epoll_data_t;
+
+struct epoll_event
+{
+  uint32_t events;	/* Epoll events */
+  epoll_data_t data;	/* User data variable */
+};
+
+
+__BEGIN_DECLS
+
+/* Creates an epoll instance.  Returns an fd for the new instance.
+   The "size" parameter is a hint specifying the number of file
+   descriptors to be associated with the new instance.  The fd
+   returned by epoll_create() should be closed with close().  */
+extern int epoll_create (int __size) __THROW;
+
+/* Same as epoll_create but with an FLAGS parameter.  The unused SIZE
+   parameter has been dropped.  */
+extern int epoll_create1 (int __flags) __THROW;
+
+
+/* Manipulate an epoll instance "epfd". Returns 0 in case of success,
+   -1 in case of error ( the "errno" variable will contain the
+   specific error code ) The "op" parameter is one of the EPOLL_CTL_*
+   constants defined above. The "fd" parameter is the target of the
+   operation. The "event" parameter describes which events the caller
+   is interested in and any associated user data.  */
+extern int epoll_ctl (int __epfd, int __op, int __fd,
+		      struct epoll_event *__event) __THROW;
+
+
+/* Wait for events on an epoll instance "epfd". Returns the number of
+   triggered events returned in "events" buffer. Or -1 in case of
+   error with the "errno" variable set to the specific error code. The
+   "events" parameter is a buffer that will contain triggered
+   events. The "maxevents" is the maximum number of events to be
+   returned ( usually size of "events" ). The "timeout" parameter
+   specifies the maximum wait time in milliseconds (-1 == infinite).
+
+   This function is a cancellation point and therefore not marked with
+   __THROW.  */
+extern int epoll_wait (int __epfd, struct epoll_event *__events,
+		       int __maxevents, int __timeout);
+
+
+/* Same as epoll_wait, but the thread's signal mask is temporarily
+   and atomically replaced with the one provided as parameter.
+
+   This function is a cancellation point and therefore not marked with
+   __THROW.  */
+extern int epoll_pwait (int __epfd, struct epoll_event *__events,
+			int __maxevents, int __timeout,
+			__const __sigset_t *__ss);
+
+__END_DECLS
+
+#endif /* sys/epoll.h */
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/eventfd.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/eventfd.h	2011-10-30 11:44:30.000000000 -0400
@@ -0,0 +1,54 @@
+/* Copyright (C) 2007, 2008, 2009 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef	_SYS_EVENTFD_H
+#define	_SYS_EVENTFD_H	1
+
+#include <stdint.h>
+
+
+/* Type for event counter.  */
+typedef uint64_t eventfd_t;
+
+/* Flags for signalfd.  */
+enum
+  {
+    EFD_SEMAPHORE = 1,
+#define EFD_SEMAPHORE EFD_SEMAPHORE
+    EFD_CLOEXEC = 010000000,
+#define EFD_CLOEXEC EFD_CLOEXEC
+    EFD_NONBLOCK = 00200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define EFD_NONBLOCK EFD_NONBLOCK
+  };
+
+
+__BEGIN_DECLS
+
+/* Return file descriptor for generic event channel.  Set initial
+   value to COUNT.  */
+extern int eventfd (int __count, int __flags) __THROW;
+
+/* Read event counter and possibly wait for events.  */
+extern int eventfd_read (int __fd, eventfd_t *__value);
+
+/* Increment event counter.  */
+extern int eventfd_write (int __fd, eventfd_t __value);
+
+__END_DECLS
+
+#endif /* sys/eventfd.h */
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/inotify.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/inotify.h	2011-10-30 11:44:30.000000000 -0400
@@ -0,0 +1,105 @@
+/* Copyright (C) 2005, 2006, 2008, 2009 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef	_SYS_INOTIFY_H
+#define	_SYS_INOTIFY_H	1
+
+#include <stdint.h>
+
+
+/* Flags for the parameter of inotify_init1.  */
+enum
+  {
+    IN_CLOEXEC = 010000000,
+#define IN_CLOEXEC IN_CLOEXEC
+    IN_NONBLOCK = 000200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define IN_NONBLOCK IN_NONBLOCK
+  };
+
+
+/* Structure describing an inotify event.  */
+struct inotify_event
+{
+  int wd;		/* Watch descriptor.  */
+  uint32_t mask;	/* Watch mask.  */
+  uint32_t cookie;	/* Cookie to synchronize two events.  */
+  uint32_t len;		/* Length (including NULs) of name.  */
+  char name __flexarr;	/* Name.  */
+};
+
+
+/* Supported events suitable for MASK parameter of INOTIFY_ADD_WATCH.  */
+#define IN_ACCESS	 0x00000001	/* File was accessed.  */
+#define IN_MODIFY	 0x00000002	/* File was modified.  */
+#define IN_ATTRIB	 0x00000004	/* Metadata changed.  */
+#define IN_CLOSE_WRITE	 0x00000008	/* Writtable file was closed.  */
+#define IN_CLOSE_NOWRITE 0x00000010	/* Unwrittable file closed.  */
+#define IN_CLOSE	 (IN_CLOSE_WRITE | IN_CLOSE_NOWRITE) /* Close.  */
+#define IN_OPEN		 0x00000020	/* File was opened.  */
+#define IN_MOVED_FROM	 0x00000040	/* File was moved from X.  */
+#define IN_MOVED_TO      0x00000080	/* File was moved to Y.  */
+#define IN_MOVE		 (IN_MOVED_FROM | IN_MOVED_TO) /* Moves.  */
+#define IN_CREATE	 0x00000100	/* Subfile was created.  */
+#define IN_DELETE	 0x00000200	/* Subfile was deleted.  */
+#define IN_DELETE_SELF	 0x00000400	/* Self was deleted.  */
+#define IN_MOVE_SELF	 0x00000800	/* Self was moved.  */
+
+/* Events sent by the kernel.  */
+#define IN_UNMOUNT	 0x00002000	/* Backing fs was unmounted.  */
+#define IN_Q_OVERFLOW	 0x00004000	/* Event queued overflowed.  */
+#define IN_IGNORED	 0x00008000	/* File was ignored.  */
+
+/* Helper events.  */
+#define IN_CLOSE	 (IN_CLOSE_WRITE | IN_CLOSE_NOWRITE)	/* Close.  */
+#define IN_MOVE		 (IN_MOVED_FROM | IN_MOVED_TO)		/* Moves.  */
+
+/* Special flags.  */
+#define IN_ONLYDIR	 0x01000000	/* Only watch the path if it is a
+					   directory.  */
+#define IN_DONT_FOLLOW	 0x02000000	/* Do not follow a sym link.  */
+#define IN_MASK_ADD	 0x20000000	/* Add to the mask of an already
+					   existing watch.  */
+#define IN_ISDIR	 0x40000000	/* Event occurred against dir.  */
+#define IN_ONESHOT	 0x80000000	/* Only send event once.  */
+
+/* All events which a program can wait on.  */
+#define IN_ALL_EVENTS	 (IN_ACCESS | IN_MODIFY | IN_ATTRIB | IN_CLOSE_WRITE  \
+			  | IN_CLOSE_NOWRITE | IN_OPEN | IN_MOVED_FROM	      \
+			  | IN_MOVED_TO | IN_CREATE | IN_DELETE		      \
+			  | IN_DELETE_SELF | IN_MOVE_SELF)
+
+
+__BEGIN_DECLS
+
+/* Create and initialize inotify instance.  */
+extern int inotify_init (void) __THROW;
+
+/* Create and initialize inotify instance.  */
+extern int inotify_init1 (int __flags) __THROW;
+
+/* Add watch of object NAME to inotify instance FD.  Notify about
+   events specified by MASK.  */
+extern int inotify_add_watch (int __fd, const char *__name, uint32_t __mask)
+  __THROW;
+
+/* Remove the watch specified by WD from the inotify instance FD.  */
+extern int inotify_rm_watch (int __fd, int __wd) __THROW;
+
+__END_DECLS
+
+#endif /* sys/inotify.h */
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/signalfd.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/signalfd.h	2011-10-30 11:44:30.000000000 -0400
@@ -0,0 +1,66 @@
+/* Copyright (C) 2007, 2008 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef	_SYS_SIGNALFD_H
+#define	_SYS_SIGNALFD_H	1
+
+#define __need_sigset_t
+#include <signal.h>
+#include <stdint.h>
+
+
+struct signalfd_siginfo
+{
+  uint32_t ssi_signo;
+  int32_t ssi_errno;
+  int32_t ssi_code;
+  uint32_t ssi_pid;
+  uint32_t ssi_uid;
+  int32_t ssi_fd;
+  uint32_t ssi_tid;
+  uint32_t ssi_band;
+  uint32_t ssi_overrun;
+  uint32_t ssi_trapno;
+  int32_t ssi_status;
+  int32_t ssi_int;
+  uint64_t ssi_ptr;
+  uint64_t ssi_utime;
+  uint64_t ssi_stime;
+  uint64_t ssi_addr;
+  uint8_t __pad[48];
+};
+
+/* Flags for signalfd.  */
+enum
+  {
+    SFD_CLOEXEC = 010000000,
+#define SFD_CLOEXEC SFD_CLOEXEC
+    SFD_NONBLOCK = 00200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define SFD_NONBLOCK SFD_NONBLOCK
+  };
+
+__BEGIN_DECLS
+
+/* Request notification for delivery of signals in MASK to be
+   performed using descriptor FD.*/
+extern int signalfd (int __fd, const sigset_t *__mask, int __flags)
+  __THROW __nonnull ((2));
+
+__END_DECLS
+
+#endif /* sys/signalfd.h */
Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/timerfd.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/hppa/sys/timerfd.h	2011-10-30 11:44:30.000000000 -0400
@@ -0,0 +1,60 @@
+/* Copyright (C) 2008 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef	_SYS_TIMERFD_H
+#define	_SYS_TIMERFD_H	1
+
+#include <time.h>
+
+
+/* Bits to be set in the FLAGS parameter of `timerfd_create'.  */
+enum
+  {
+    TFD_CLOEXEC = 010000000,
+#define TFD_CLOEXEC TFD_CLOEXEC
+    TFD_NONBLOCK = 000200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define TFD_NONBLOCK TFD_NONBLOCK
+  };
+
+
+/* Bits to be set in the FLAGS parameter of `timerfd_settime'.  */
+enum
+  {
+    TFD_TIMER_ABSTIME = 1 << 0
+#define TFD_TIMER_ABSTIME TFD_TIMER_ABSTIME
+  };
+
+
+__BEGIN_DECLS
+
+/* Return file descriptor for new interval timer source.  */
+extern int timerfd_create (clockid_t __clock_id, int __flags) __THROW;
+
+/* Set next expiration time of interval timer source UFD to UTMR.  If
+   FLAGS has the TFD_TIMER_ABSTIME flag set the timeout value is
+   absolute.  Optionally return the old expiration time in OTMR.  */
+extern int timerfd_settime (int __ufd, int __flags,
+			    __const struct itimerspec *__utmr,
+			    struct itimerspec *__otmr) __THROW;
+
+/* Return the next expiration time of UFD.  */
+extern int timerfd_gettime (int __ufd, struct itimerspec *__otmr) __THROW;
+
+__END_DECLS
+
+#endif /* sys/timerfd.h */

--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="elf32-hppa.c.d.1"
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="elf32-hppa.c.d.1"
Content-Transfer-Encoding: 7bit

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.182
diff -u -3 -p -r1.182 elf32-hppa.c
--- elf32-hppa.c	6 Nov 2011 20:25:17 -0000	1.182
+++ elf32-hppa.c	8 Dec 2011 11:47:53 -0000
@@ -3349,10 +3349,16 @@ final_link_relocate (asection *input_sec
       switch (r_type)
 	{
 	  case R_PARISC_DLTIND21L:
+	  case R_PARISC_TLS_GD21L:
+	  case R_PARISC_TLS_LDM21L:
+	  case R_PARISC_TLS_IE21L:
 	    r_type = R_PARISC_DPREL21L;
 	    break;
 
 	  case R_PARISC_DLTIND14R:
+	  case R_PARISC_TLS_GD14R:
+	  case R_PARISC_TLS_LDM14R:
+	  case R_PARISC_TLS_IE14R:
 	    r_type = R_PARISC_DPREL14R;
 	    break;
 
@@ -3418,53 +3424,48 @@ final_link_relocate (asection *input_sec
     case R_PARISC_DPREL21L:
     case R_PARISC_DPREL14R:
     case R_PARISC_DPREL14F:
-    case R_PARISC_TLS_GD21L:
-    case R_PARISC_TLS_LDM21L:
-    case R_PARISC_TLS_IE21L:
       /* Convert instructions that use the linkage table pointer (r19) to
 	 instructions that use the global data pointer (dp).  This is the
 	 most efficient way of using PIC code in an incomplete executable,
 	 but the user must follow the standard runtime conventions for
 	 accessing data for this to work.  */
-      if (orig_r_type == R_PARISC_DLTIND21L
-	  || (!info->shared
-	      && (r_type == R_PARISC_TLS_GD21L
-		  || r_type == R_PARISC_TLS_LDM21L
-		  || r_type == R_PARISC_TLS_IE21L)))
-	{
-	  /* Convert addil instructions if the original reloc was a
-	     DLTIND21L.  GCC sometimes uses a register other than r19 for
-	     the operation, so we must convert any addil instruction
-	     that uses this relocation.  */
-	  if ((insn & 0xfc000000) == ((int) OP_ADDIL << 26))
-	    insn = ADDIL_DP;
-	  else
-	    /* We must have a ldil instruction.  It's too hard to find
-	       and convert the associated add instruction, so issue an
-	       error.  */
-	    (*_bfd_error_handler)
-	      (_("%B(%A+0x%lx): %s fixup for insn 0x%x is not supported in a non-shared link"),
-	       input_bfd,
-	       input_section,
-	       (long) offset,
-	       howto->name,
-	       insn);
-	}
-      else if (orig_r_type == R_PARISC_DLTIND14F)
-	{
-	  /* This must be a format 1 load/store.  Change the base
-	     register to dp.  */
-	  insn = (insn & 0xfc1ffff) | (27 << 21);
-	}
-
-    /* For all the DP relative relocations, we need to examine the symbol's
-       section.  If it has no section or if it's a code section, then
-       "data pointer relative" makes no sense.  In that case we don't
-       adjust the "value", and for 21 bit addil instructions, we change the
-       source addend register from %dp to %r0.  This situation commonly
-       arises for undefined weak symbols and when a variable's "constness"
-       is declared differently from the way the variable is defined.  For
-       instance: "extern int foo" with foo defined as "const int foo".  */
+      if (orig_r_type != r_type)
+	{
+	  if (r_type == R_PARISC_DPREL21L)
+	    {
+	      /* GCC sometimes uses a register other than r19 for the
+		 operation, so we must convert any addil instruction
+		 that uses this relocation.  */
+	      if ((insn & 0xfc000000) == ((int) OP_ADDIL << 26))
+		insn = ADDIL_DP;
+	      else
+		/* We must have a ldil instruction.  It's too hard to find
+		   and convert the associated add instruction, so issue an
+		   error.  */
+		(*_bfd_error_handler)
+		  (_("%B(%A+0x%lx): %s fixup for insn 0x%x is not supported in a non-shared link"),
+		   input_bfd,
+		   input_section,
+		   (long) offset,
+		   howto->name,
+		   insn);
+	    }
+	  else if (r_type == R_PARISC_DPREL14F)
+	    {
+	      /* This must be a format 1 load/store.  Change the base
+		 register to dp.  */
+	      insn = (insn & 0xfc1ffff) | (27 << 21);
+	    }
+	}
+
+      /* For all the DP relative relocations, we need to examine the symbol's
+	 section.  If it has no section or if it's a code section, then
+	 "data pointer relative" makes no sense.  In that case we don't
+	 adjust the "value", and for 21 bit addil instructions, we change the
+	 source addend register from %dp to %r0.  This situation commonly
+	 arises for undefined weak symbols and when a variable's "constness"
+	 is declared differently from the way the variable is defined.  For
+	 instance: "extern int foo" with foo defined as "const int foo".  */
       if (sym_sec == NULL || (sym_sec->flags & SEC_CODE) != 0)
 	{
 	  if ((insn & ((0x3f << 26) | (0x1f << 21)))
@@ -3481,6 +3482,9 @@ final_link_relocate (asection *input_sec
     case R_PARISC_DLTIND21L:
     case R_PARISC_DLTIND14R:
     case R_PARISC_DLTIND14F:
+    case R_PARISC_TLS_GD21L:
+    case R_PARISC_TLS_LDM21L:
+    case R_PARISC_TLS_IE21L:
     case R_PARISC_TLS_GD14R:
     case R_PARISC_TLS_LDM14R:
     case R_PARISC_TLS_IE14R:

--Apple-Mail-35--15589280
Content-Disposition: attachment; filename="hidden.d.2"
Content-Type: application/octet-stream; x-unix-mode=0644; name="hidden.d.2"
Content-Transfer-Encoding: 7bit

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.181
diff -u -3 -p -r1.181 elf32-hppa.c
--- elf32-hppa.c	26 Oct 2011 09:47:58 -0000	1.181
+++ elf32-hppa.c	6 Nov 2011 18:21:46 -0000
@@ -1789,10 +1789,12 @@ elf32_hppa_hide_symbol (struct bfd_link_
 	}
     }
 
-  if (! hppa_elf_hash_entry (eh)->plabel)
+  /* STT_GNU_IFUNC symbol must go through PLT.  */
+  if (! hppa_elf_hash_entry (eh)->plabel
+      && eh->type != STT_GNU_IFUNC)
     {
       eh->needs_plt = 0;
-      eh->plt = elf_hash_table (info)->init_plt_refcount;
+      eh->plt = elf_hash_table (info)->init_plt_offset;
     }
 }
 
@@ -1814,6 +1816,13 @@ elf32_hppa_adjust_dynamic_symbol (struct
   if (eh->type == STT_FUNC
       || eh->needs_plt)
     {
+      /* If the symbol is used by a plabel, we must allocate a PLT slot.
+	 The refcounts are not reliable when it has been hidden since
+	 hide_symbol can be called before the plabel flag is set.  */
+      if (hppa_elf_hash_entry (eh)->plabel
+	  && eh->plt.refcount <= 0)
+	eh->plt.refcount = 1;
+
       if (eh->plt.refcount <= 0
 	  || (eh->def_regular
 	      && eh->root.type != bfd_link_hash_defweak

--Apple-Mail-35--15589280--
