Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@parisc-linux.org
Message-Id: <20021228020104.C109D4829@dsl2.external.hp.com>
Date: Fri, 27 Dec 2002 19:01:04 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] misaligned data
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Two more tidbits on the misaligned data problem in 2.5.53:
o using -g instead of -O2 compiles just fine

o The generating the warning is the "tv_add" call in sctp_pack_cookie():
	...
        /* Set an expiration time for the cookie.  */
        do_gettimeofday(&cookie->c.expiration);
        tv_add(&asoc->cookie_life, &cookie->c.expiration);
	...

But I'm under the impression the do_gettimeofday() above would puke when
trying to access the same misaligned timeval_t as well. tv_add() catches
the problem since it is a macro and code gets generated to directly
reference the struct instead of an anonymous address.

The asm output is:
...
        ldw 5144(%r8),%r19
        ldw 8(%r6),%r20
        add,l %r20,%r19,%r20
        ldd 5136(%r8),%r21
        ldd 52(%r3),%r19		# line 2347 is misaligned.
        extrd,s %r20,63,32,%r20
        add,l %r19,%r21,%r25
        ldil L'999999,%r19
        cmpb,*>= %r19,%r20,.L1873
	copy %r4,%r27

	ldil L'-1000000,%r19
	ldo 1(%r25),%r25
	ldo R'-1000000(%r19),%r19
	add,l %r20,%r19,%r20
.L1873:
	std %r25,52(%r3)		# also misaligned

Based on the math, looks like %r25 has the "seconds" field and %r19
the microseconds.

Oh, only one definition and usage of tv_add().
The offending field is "&cookie->c.expiration".
cookie is type "sctp_signed_cookie_t". (include/net/sctp/structs.h)

/* The format of our cookie that we send to our peer. */
typedef struct sctp_signed_cookie {
        __u8 signature[SCTP_SECRET_SIZE];
	sctp_cookie_t c;
} sctp_signed_cookie_t;

struct sctp_cookie mostly uses __u32 except for "struct timeval expiration".
"struct timeval" is declared in include/linux/time.h.
Not sure if it's safe to just pad "struct sctp_cookie" or if something
else needs to be done.

If this isn't a parisc toolchain bug, then other arches (eg ia64) will need 
a fix as well.

cheers,
grant
