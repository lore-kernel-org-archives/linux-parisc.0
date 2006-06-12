From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 22:27:40 -0400
Message-ID: <119aab440606111927j740b57efgebcb6a33705c639d@mail.gmail.com>
References: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
	<200606120054.k5C0sF1m025654@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606120054.k5C0sF1m025654@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/11/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> (gdb) p *((st_parameter_dt *)$r26)->u.p.current_unit
> $38 = {unit_number = -1, s = 0x193248, left = 0x0, right = 0x0, priority = 0,
>   read_bad = 1, current_record = 1, endfile = NO_ENDFILE, mode = WRITING,
>   flags = {access = ACCESS_SEQUENTIAL, action = ACTION_READWRITE,
>   blank = BLANK_NULL, delim = DELIM_NONE, form = FORM_FORMATTED,
>   is_notpadded = 0, position = POSITION_ASIS, status = STATUS_UNSPECIFIED,
>   pad = PAD_YES, convert = CONVERT_NATIVE}, recl = 36, last_record = 0,
>   maxrec = 0, bytes_left = 0, lock = {__m_reserved = 0, __m_count = 0,
>   __m_owner = 0x0, __m_kind = 0, __m_lock = {__spinlock = {lock = {0, 0, 0,
>   0}}, __status = 0}}, waiting = 0, closed = 0, ls = 0x0, rank = 0,
>   file_len = 0, file = 0x0}
>
> The only unit numbers that I see being initialized are 5, 6 and 0.

The "lock" variable must always be initialized.
The value of __GTHREAD_MUTEX_INIT should be set to PTHREAD_MUTEX_INITIALIZER.

There might be some missing initializers, or memsets, which don't show
problems on i686-pc-linux-gnu, but are invalid things to do on hppa :)

I see that "unit_lock" is initialized properly, without this nothing would work.

There is a bug in "get_internal_unit" where there is a memset of a
"gfc_unit" without a mutex initializer.

Index: libgfortran/io/unit.c
===================================================================
--- libgfortran/io/unit.c       (revision 114219)
+++ libgfortran/io/unit.c       (working copy)
@@ -376,7 +376,16 @@
     }

   memset (iunit, '\0', sizeof (gfc_unit));
+#ifdef __GTHREAD_MUTEX_INIT
+  {
+    __gthread_mutex_t tmp = __GTHREAD_MUTEX_INIT;
+    iunit->lock = tmp;
+  }
+#else
+  __GTHREAD_MUTEX_INIT_FUNCTION (&iunit->lock);
+#endif

+
   iunit->recl = dtp->internal_unit_len;

   /* For internal units we set the unit number to -1.

Please verify.

Cheers,
Carlos.


Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
