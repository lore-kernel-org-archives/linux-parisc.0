Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DDA24852
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  1 Mar 2004 11:43:04 -0700 (MST)
Date: Mon, 1 Mar 2004 19:43:01 +0100
Message-ID: <402A4CA50000CAEF@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an error
	with gcc-3.5
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

As the title mail said, the following warning with gcc-3.3:
../sysdeps/hppa/fpu/feupdateenv.c: In function `feupdateenv':
../sysdeps/hppa/fpu/feupdateenv.c:31: warning: assignment of read-only member
`__status_word'

become an error with gcc-3.5:
../sysdeps/hppa/fpu/feupdateenv.c: In function `feupdateenv':
../sysdeps/hppa/fpu/feupdateenv.c:31: error: assignment of read-only member
`__status_word'
make[2]: *** [/Develop/parisc-linux/build/glibc/math/feupdateenv.o] Error
1
make[2]: Leaving directory `/Develop/parisc-linux/sources/glibc-2.3.3-20040301/math'
make[1]: *** [math/others] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/sources/glibc-2.3.3-20040301'
make: *** [all] Error 2

And regarding the definition of feupdateenv():
int
feupdateenv (const fenv_t *envp)
[snip]

I couldn't blame gcc.

So I would suggest to use sysdeps/mips/fpu/feupdateenv.c as model:
int
feupdateenv (const fenv_t *envp)
{
  int temp;

  /* Save current exceptions.  */
  _FPU_GETCW (temp);
  temp &= FE_ALL_EXCEPT;

  /* Install new environment.  */
  fesetenv (envp);

  /* Raise the safed exception.  Incidently for us the implementation
     defined format of the values in objects of type fexcept_t is the
     same as the ones specified using the FE_* constants.  */
  feraiseexcept (temp);

  /* Success.  */
  return 0;
}

but replacing:
 * 'int temp;' by 'fenv_t *temp;'
 * '_FPU_GETCW (temp);' by 'fegetenv(temp);' (as we don't have _FPU_GETCW()
)

But not sure it's the best solution.

Thanks in advance for all advise,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
