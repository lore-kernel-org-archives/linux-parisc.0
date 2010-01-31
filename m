From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Questions about hppa *context functions.
Date: Sun, 31 Jan 2010 11:25:09 -0500
Message-ID: <119aab441001310825x6fa7254u85c00dc1b0588950@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e649820cf77a36047e784f02
To: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	libc-ports@sourceware.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--0016e649820cf77a36047e784f02
Content-Type: text/plain; charset=ISO-8859-1

Helge,

On December 15th, 2009 an additional *context test was added to glibc,
see stdlib/tst-makecontext3.c.

This test fails on hppa with:
~~~
makecontext: does not know how to handle more than 8 arguments
~~~

I have a couple of questions and comments about hppa's *context implementation:

1. Why limit the number of input arguments to 8?

The ABI should allow an unlimited number of arguments to be placed on
the stack. It is up to the caller to make sure that
ucp->uc_stack.ss_sp points to enough space to hold all of the
additional arguments.

2. It doesn't appear that the current implementation transfers
ucp->uc_stack.ss_sp to the stack pointer when makecontext() is called.

Take a look at:
http://www.opengroup.org/onlinepubs/009695399/functions/makecontext.html

The caller can set an alternate stack by setting ucp->uc_stack.ss_sp,
and makecontext should likely do:
ucp->uc_mcontext.sc_gr[30] = ucp->uc_stack.ss_sp + <space required by args>;

3. POSIX says that all the arguments must be of type int, but in a
comment you write "XXX: This implementation only handles integer
arguments."

Is there any reason this comment should stay there?

To give you an example, I'm attaching a modified makecontext.diff for
you to comment on.

Cheers,
Carlos.

--0016e649820cf77a36047e784f02
Content-Type: application/octet-stream; name="makecontext.diff"
Content-Disposition: attachment; filename="makecontext.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g541kw7j0

ZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvbWFrZWNvbnRleHQuYyBi
L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvbWFrZWNvbnRleHQuYwppbmRleCA2OWExODEz
Li4zNTZhMDk0IDEwMDY0NAotLS0gYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9ocHBhL21ha2Vj
b250ZXh0LmMKKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvaHBwYS9tYWtlY29udGV4dC5j
CkBAIC0yNSw3ICsyNSw3IEBACiAjaW5jbHVkZSA8c3lzZGVwLmg+CiAjaW5jbHVkZSA8dWNvbnRl
eHQuaD4KIAotLyogWFhYOiBUaGlzIGltcGxlbWVudGF0aW9uIG9ubHkgaGFuZGxlcyBpbnRlZ2Vy
IGFyZ3VtZW50cy4gICovCisvKiBQT1NJWCBvbmx5IHN1cHBvcnRzIGludGVnZXIgYXJndW1lbnRz
LiAgKi8KIAogdm9pZAogX19tYWtlY29udGV4dCAodWNvbnRleHRfdCAqdWNwLCB2b2lkICgqZnVu
YykgKHZvaWQpLCBpbnQgYXJnYywgLi4uKQpAQCAtNTAsMjkgKzUwLDI2IEBAIG1ha2Vjb250ZXh0
OiBkb2VzIG5vdCBrbm93IGhvdyB0byBoYW5kbGUgbW9yZSB0aGFuIDggYXJndW1lbnRzXG4iKSk7
CiAgIHZhX3N0YXJ0IChhcCwgYXJnYyk7CiAgIC8qIEhhbmRsZSBhcmd1bWVudHMuICAqLwogICBm
b3IgKGkgPSAwOyBpIDwgYXJnYzsgKytpKQotICAgIHN3aXRjaCAoaSkKLSAgICAgIHsKLSAgICAg
IGNhc2UgMDoKLSAgICAgIGNhc2UgMToKLSAgICAgIGNhc2UgMjoKLSAgICAgIGNhc2UgMzoKLSAg
ICAgIAl1Y3AtPnVjX21jb250ZXh0LnNjX2dyWzI2LWldID0gdmFfYXJnIChhcCwgaW50KTsKLQli
cmVhazsKLSAgICAgIGNhc2UgNDoKLSAgICAgIGNhc2UgNToKLSAgICAgIGNhc2UgNjoKLSAgICAg
IGNhc2UgNzoKLQlpZiAoc2l6ZW9mKHVuc2lnbmVkIGxvbmcpID09IDQpIHsKLQkJLyogMzJiaXQ6
IHB1dCBhcmc3LWFyZzQgb24gc3RhY2suICAqLwotCQlzcFs3LWldID0gdmFfYXJnIChhcCwgaW50
KTsKLQl9IGVsc2UgewotCQkvKiA2NGJpdDogcjE5LXIyMiBhcmUgYXJnNy1hcmc0LiAgKi8KLQkJ
dWNwLT51Y19tY29udGV4dC5zY19nclsyMis0LWldID0gdmFfYXJnIChhcCwgaW50KTsKKyAgICB7
CisgICAgICBpZiAoaSA8IDQpCisJeworCSAgdWNwLT51Y19tY29udGV4dC5zY19nclsyNi1pXSA9
IHZhX2FyZyAoYXAsIGludCk7CisJICBjb250aW51ZTsKIAl9Ci0JYnJlYWs7Ci0gICAgICB9Ci0g
IHZhX2VuZCAoYXApOwogCisgICAgICBpZiAoKGkgPCA4KSAmJiAoc2l6ZW9mKHVuc2lnbmVkIGlu
dCkgPT0gOCkpCisJeworCSAgLyogNjRiaXQ6IHIxOS1yMjIgYXJlIGFyZzctYXJnNC4gICovCisJ
ICB1Y3AtPnVjX21jb250ZXh0LnNjX2dyWzIyKzQtaV0gPSB2YV9hcmcgKGFwLCBpbnQpOworCSAg
Y29udGludWU7CisJfSAKKworICAgICAgLyogQWxsIG90aGVyIGFyZ3VtZW50cyBnbyBvbiB0aGUg
c3RhY2suICAqLworICAgICAgc3BbaV0gPSB2YV9hcmcgKGFwLCBpbnQpOworICAgIH0KKyAgdmFf
ZW5kIChhcCk7IAorICAvKiBBZGp1c3QgdGhlIHN0YWNrIHBvaW50ZXIgdG8gbGFzdCB1c2VkIGFy
Z3VtZW50LiAgKi8KKyAgdWNwLT51Y19tY29udGV4dC5zY19nclszMF0gPSBzcFthcmdjIC0gMV07
CiB9CiAKIAo=
--0016e649820cf77a36047e784f02--
