From: Petr Salinger <Petr.Salinger@seznam.cz>
Subject: Re: HPPA linux compat wrappers
Date: Mon, 22 Jun 2009 15:29:02 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0906221506540.2390@sci.felk.cvut.cz>
References: <Pine.LNX.4.62.0906221117370.2390@sci.felk.cvut.cz>
 <119aab440906220505l26bda054r4280165627332473@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="546530387-537495902-1245677342=:2390"
Cc: debian-hppa@lists.debian.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906220505l26bda054r4280165627332473@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--546530387-537495902-1245677342=:2390
Content-Type: TEXT/PLAIN; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

>> I still think there should be support for mixed ABI calls.
>> See also thread http://lists.debian.org/debian-hppa/2008/09/msg00018.htm=
l
>
> It sounds like a good feature, but my time is restricted so I
> implemented the simplest interface possible that I could prove worked.
> If you have ample free time I suggest you post a version of the patch
> with your enhancements. I'd be more than willing to test your patches.

I have to admin I will not write the code, I only propose the idea.

1) put "__lt_compat" field in a place where originally is LT initializer.

--- sysdeps/unix/sysv/linux/hppa/nptl/bits/pthreadtypes.h
+++ sysdeps/unix/sysv/linux/hppa/nptl/bits/pthreadtypes.h.compat=20
@@ -70,6 +70,7 @@ pthread_mutex_t
      /* KIND must stay at this position in the structure to maintain
         binary compatibility.  */
      int __kind;
+    int __lt_compat;
      unsigned int __nusers;
      __extension__ union
      {
@@ -95,10 +96,11 @@ pthread_cond_t
    struct
    {
      int __lock;
-    unsigned int __futex;
+    int __lt_compat;
      __extension__ unsigned long long int __total_seq;
      __extension__ unsigned long long int __wakeup_seq;
      __extension__ unsigned long long int __woken_seq;
+    unsigned int __futex;
      void *__mutex;
      unsigned int __nwaiters;
      unsigned int __broadcast_seq;
@@ -130,6 +132,9 @@ pthread_rwlock_t
    struct
    {
      int __lock;
+    int __lt_compat;
+    int __hppa_pad1;
+    int __hppa_pad2;
      unsigned int __nr_readers;
      unsigned int __readers_wakeup;
      unsigned int __writer_wakeup;

2) create hppa specific pthread.h with just altered initializers (more zero=
es)

3) At the begin of each affected function

>> =A0if (v->__lt_compat)
>> =A0{
>> =A0 =A0 lock_global_pt_lock();
>> =A0 =A0 if (v->__lt_compat)
>> =A0 =A0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0zero_the_same_fields_as_NPTL_but_lt_compa=
t_field();
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0barrier();
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0v->__lt_compat =3D 0;
>> =A0 =A0 };
>> =A0 =A0 unlock_global_pt_lock();
>> =A0};

This just atomically converts linuxthreads initialized variable into NPTL=
=20
initialized variable.

>> For the new NPTL layout the zeroing code will not be taken,
>> therefore almost no overhead.
>> There might be a congestion on global_pt_lock, but I do not believe,
>> there are many static initilized mutexes in any real program.
>> There will be no need for allocation any new structures.
>
> There are tons of statically initialized mutexs, gnome and gdk are
> full of them as an example.

Hopefully not many will try to lock global_pt_lock in the same time.
Also rebuild against NPTL enabled libc-dev lowers the number
of possible linuxthreads initialized variables.

Petr

--546530387-537495902-1245677342=:2390--
