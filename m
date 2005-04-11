From: Max Grabert <parisc@gmail.com>
Subject: [parisc-linux] Re: FDDI (defxx) and Linux/PA = HPMC
Date: Mon, 11 Apr 2005 23:44:55 +0100
Message-ID: <e6eae02905041115445712f17f@mail.gmail.com>
References: <e6eae02905041013203d0517fd@mail.gmail.com>
	<e6eae02905041014314d9bd645@mail.gmail.com>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_2008_17805546.1113259495646"
To: Linux/PA <parisc-linux@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae02905041014314d9bd645@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

------=_Part_2008_17805546.1113259495646
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Apr 10, 2005 10:31 PM, Max Grabert <parisc@gmail.com> wrote:
> On Apr 10, 2005 9:20 PM, Max Grabert <parisc@gmail.com> wrote:
> 
> [...]
> 
> > I'm trying to get FDDI working on Linux/PA.
> >
> > So I put a DEFPA card into my c3k (2.6.12-rc2-pa1, 32bit,
> > gcc-3.4, Debian/testing), but it didn't get far:
> 
> Sorry, hat to reply to myself, forgot to attach a 'ser pim' output ...
> 
> Note the driver (defxx.c) is quite old, but is reported to
> work on x86 and 2.6 (and ppc on 2.4).

Well, apparently the report that the driver was working on
ppc is not true. The driver is not big-endian safe.

BTW, the HPMC is caused by drivers/net/defxx.c#527,
which is the initialization routine for EISA cards, which
is executed regardless whether there is EISA support
compiled into the kernel or not. The inl() in there causes
the HPMC.

Attached a patch that adresses at least the obvious big-endian
issues and disables the EISA initialization if CONFIG_EISA
is not defined.
With the patch my c3k boots up, detects the card and it
seems to work, but I can't test it properly right now, since
I don't have a second FDDI card here (yet).

Greetings,
   Max

------=_Part_2008_17805546.1113259495646
Content-Type: text/x-patch; name="fddi.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="fddi.patch"

LS0tIGxpbnV4LTIuNi9kcml2ZXJzL25ldC9kZWZ4eC5jCTIwMDUtMDQtMTEgMjM6MTc6MjQuMDAw
MDAwMDAwICswMTAwCisrKyBkZWZ4eC5jCTIwMDUtMDQtMTEgMjM6MzQ6NTEuMDAwMDAwMDAwICsw
MTAwCkBAIC01MzQsNyArNTM0LDcgQEAKIAl9CiAJcmV0dXJuIHJjOwogfQotDAorCiAvKgogICog
PT09PT09PT09PT09PT09PQogICogPSBkZnhfYnVzX2luaXQgPQpAQCAtODU3LDYgKzg1Nyw3IEBA
CiAJCSAgICAgICBwcmludF9uYW1lKTsKIAkJcmV0dXJuKERGWF9LX0ZBSUxVUkUpOwogCX0KKwlk
YXRhID0gY3B1X3RvX2xlMzIoZGF0YSk7CiAJbWVtY3B5KCZicC0+ZmFjdG9yeV9tYWNfYWRkclsw
XSwgJmRhdGEsIHNpemVvZih1MzIpKTsKIAogCWlmIChkZnhfaHdfcG9ydF9jdHJsX3JlcShicCwg
UElfUENUUkxfTV9NTEEsIFBJX1BEQVRBX0FfTUxBX0tfSEksIDAsCkBAIC04NjUsNiArODY2LDcg
QEAKIAkJICAgICAgIHByaW50X25hbWUpOwogCQlyZXR1cm4oREZYX0tfRkFJTFVSRSk7CiAJfQor
CWRhdGEgPSBjcHVfdG9fbGUzMihkYXRhKTsKIAltZW1jcHkoJmJwLT5mYWN0b3J5X21hY19hZGRy
WzRdLCAmZGF0YSwgc2l6ZW9mKHUxNikpOwogCiAJLyoKQEAgLTM0MzMsNyArMzQzNSwxMSBAQAog
CXJjX3BjaSA9IHBjaV9tb2R1bGVfaW5pdCgmZGZ4X2RyaXZlcik7CiAJaWYgKHJjX3BjaSA+PSAw
KSBkZnhfaGF2ZV9wY2kgPSAxOwogCQorI2lmZGVmIENPTkZJR19FSVNBCiAJcmNfZWlzYSA9IGRm
eF9laXNhX2luaXQoKTsKKyNlbHNlCisJcmNfZWlzYSA9IC0xOworI2VuZGlmCiAJaWYgKHJjX2Vp
c2EgPj0gMCkgZGZ4X2hhdmVfZWlzYSA9IDE7CiAKIAlyZXR1cm4gKChyY19laXNhIDwgMCkgPyAw
IDogcmNfZWlzYSkgICsgKChyY19wY2kgPCAwKSA/IDAgOiByY19wY2kpOyAK
------=_Part_2008_17805546.1113259495646
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_2008_17805546.1113259495646--
