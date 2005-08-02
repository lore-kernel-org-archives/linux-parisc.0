From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] NPTL pthread_cancel and libgcc_s.so.2 vs.
	libgcc_s.so.1 (Why the DSO version bump?)
Date: Tue, 2 Aug 2005 09:59:10 -0400
Message-ID: <20050802135905.GD9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Dave,

When I attempt to test syscall cancellation with NPTL threads the
interface complains that:

libgcc_s.so.1 must be installed for pthread_cancel to work

I don't have this installed, instead I have libgcc_s.so.2 installed by
gcc 4.x during the tls toolchain compile/install.

The code in question is nptl/sysdeps/pthread/unwind-resume.c, which does this:

---
static void
init (void)
{
  void *resume, *personality;
  void *handle;

  handle = __libc_dlopen ("libgcc_s.so.1");

  if (handle == NULL 
      || (resume = __libc_dlsym (handle, "_Unwind_Resume")) == NULL 
      || (personality = __libc_dlsym (handle, "__gcc_personality_v0")) == NULL)
    __libc_fatal ("libgcc_s.so.1 must be installed for pthread_cancel to work\n");

  libgcc_s_resume = resume; 
  libgcc_s_personality = personality;
}
---
or
---
void
pthread_cancel_init (void)
{
  void *resume, *personality, *forcedunwind, *getcfa;
  void *handle;

  if (__builtin_expect (libgcc_s_getcfa != NULL, 1))
    return; 

  handle = __libc_dlopen ("libgcc_s.so.1");

  if (handle == NULL 
      || (resume = __libc_dlsym (handle, "_Unwind_Resume")) == NULL 
      || (personality = __libc_dlsym (handle, "__gcc_personality_v0")) == NULL 
      || (forcedunwind = __libc_dlsym (handle, "_Unwind_ForcedUnwind"))
         == NULL 
      || (getcfa = __libc_dlsym (handle, "_Unwind_GetCFA")) == NULL 
#ifdef ARCH_CANCEL_INIT
      || ARCH_CANCEL_INIT (handle)
#endif
      )
    __libc_fatal ("libgcc_s.so.1 must be installed for pthread_cancel to work\n");

  libgcc_s_resume = resume; 
  libgcc_s_personality = personality;
  libgcc_s_forcedunwind = forcedunwind;
  libgcc_s_getcfa = getcfa; 
}
---

It wants to "forward" the local calls for _Unwind_Resume, __gcc_personality_v0,
_Unwind_ForcedUnwind and _Unwind_GetCFA to those in ligcc_s.so.1.

The call sequence is like this:

(Enter cancellable syscall)
...
__libc_enable_asynccancel
  __do_cancel
    __pthread_unwind
      (Calls _Unwind_GetCFA ...)
...
(Do the syscall)
...
__libc_disable_asynccancel
...
(Done)

This is called to enable unwinding out of a cancelled syscall.
What was the reason for DSO version bump in libgcc_s.so.1?

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
