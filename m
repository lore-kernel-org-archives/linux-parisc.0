From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 2 May 2007 12:13:42 +0200
Message-ID: <20070502101342.GA27108__45749.562016181$1416624343$gmane$org@farad.aurel32.net>
References: <46379E8A.8080705@aurel32.net>
	<200705012059.l41Kxj21011265@hiauly1.hia.nrc.ca>
	<119aab440705011847o29e04a2eted8aea1e7c0bb041@mail.gmail.com>
	<463831CA.4060208@aurel32.net>
	<20070502093851.GA26242@farad.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070502093851.GA26242@farad.aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, May 02, 2007 at 11:38:51AM +0200, Aurelien Jarno wrote:
> Please find the reduced testcase below. When the value is assigned to
> __libc_errno, the value of r19 has been overrided by the call to free().
> 

And a smaller one:


extern __thread int __libc_errno __attribute__ ((tls_model ("initial-exec")));
extern void free (void *__ptr) __attribute__ ((__nothrow__));

void test(int *p)
{
  free (p);
  __libc_errno = 25;
}

00000000 <test>:
test():
   0:   6b c2 3f d9     stw rp,-14(sp)
   4:   6f c4 00 80     stw,ma r4,40(sp)
   8:   e8 40 00 00     b,l 10 <test+0x10>,rp
                        8: R_PARISC_PCREL17F    free
   c:   6b d3 3f c1     stw r19,-20(sp)
  10:   2a 60 00 00     addil L%0,r19,r1
                        10: R_PARISC_LTOFF_TP21L        __libc_errno
  14:   48 3c 00 00     ldw 0(r1),ret0
                        14: R_PARISC_LTOFF_TP14R        __libc_errno
  18:   34 15 00 32     ldi 19,r21
  1c:   03 60 08 b4     mfctl tr3,r20
  20:   0b 94 0a 14     add,l r20,ret0,r20
  24:   0e 95 12 80     stw r21,0(r20)
  28:   4b c2 3f 59     ldw -54(sp),rp
  2c:   e8 40 c0 00     bv r0(rp)
  30:   4f c4 3f 81     ldw,mb -40(sp),r4



-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
