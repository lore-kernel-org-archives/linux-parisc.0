From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Fri, 17 Nov 2006 11:16:24 -0800
Message-ID: <5b2e36650611171116w2306d7d8xd770c89a0f34a9f8@mail.gmail.com>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
	<200611162316.26872.vapier@gentoo.org>
	<200611162359.05014.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0942037714=="
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611162359.05014.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0942037714==
Content-Type: multipart/alternative;
	boundary="----=_Part_28678_31004965.1163790984542"

------=_Part_28678_31004965.1163790984542
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 16/11/06, Mike Frysinger <vapier@gentoo.org> wrote:
>
> On Thursday 16 November 2006 23:16, Mike Frysinger wrote:
> > ok, just tried glibc-2.5 + hppa + linuxthreads and that is for sure
> broken
> > (the defines for handling locking is all broken in the release)
>
> yeah glibc-2.5 fails as well:
> ... -o /var/tmp/portage/cross-hppa2.0-unknown-linux-gnu/glibc-2.5
> /work/build-default-hppa2.0-unknown-linux-gnu-nptl/csu/crtn.o
> In file included from ../nptl/descr.h:30,
>                  from ../ports/sysdeps/hppa/nptl/tls.h:63,
>                  from ../include/tls.h:6,
>                  from <stdin>:2:
> ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h: In
> function '__lll_mutex_trylock':
> ../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:113: error:
> expected ':' or ')' before '-' token
> ...
>
> i leave adding snap updates to GMsoft ... i try to stick with releases
> since i
> have to help so many arches :/
>
> > what is the minimal binutils/gcc versions for TLS support ?
> binutils-2.17
> > + gcc-4.1.1 == no hppa TLS
>
> upgraded to binutils-2.17.50.0.6 and i got TLS with gcc-4.1.1
> -mike



If you want a reference implementation, we have this running in Ubuntu
Feisty now.




-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/

------=_Part_28678_31004965.1163790984542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 16/11/06, <b class="gmail_sendername">Mike Frysinger</b> &lt;<a href="mailto:vapier@gentoo.org">vapier@gentoo.org</a>&gt; wrote:<div><span class="gmail_quote"></span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Thursday 16 November 2006 23:16, Mike Frysinger wrote:<br>&gt; ok, just tried glibc-2.5 + hppa + linuxthreads and that is for sure broken<br>&gt; (the defines for handling locking is all broken in the release)<br><br>yeah 
glibc-2.5 fails as well:<br>... -o /var/tmp/portage/cross-hppa2.0-unknown-linux-gnu/glibc-2.5<br>/work/build-default-hppa2.0-unknown-linux-gnu-nptl/csu/crtn.o<br>In file included from ../nptl/descr.h:30,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../ports/sysdeps/hppa/nptl/tls.h:63,
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../include/tls.h:6,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from &lt;stdin&gt;:2:<br>../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h: In<br>function '__lll_mutex_trylock':<br>../ports/sysdeps/unix/sysv/linux/hppa/nptl/lowlevellock.h:113: error:
<br>expected ':' or ')' before '-' token<br>...<br><br>i leave adding snap updates to GMsoft ... i try to stick with releases since i<br>have to help so many arches :/<br><br>&gt; what is the minimal binutils/gcc versions for TLS support ?&nbsp;&nbsp;
binutils-2.17<br>&gt; + gcc-4.1.1 == no hppa TLS<br><br>upgraded to binutils-2.17.50.0.6 and i got TLS with gcc-4.1.1<br>-mike</blockquote><div><br><br>If you want a reference implementation, we have this running in Ubuntu Feisty now. 
<br></div><br></div><br><br clear="all"><br>-- <br>Jeff Bailey - <a href="http://www.raspberryginger.com/jbailey/">http://www.raspberryginger.com/jbailey/</a>

------=_Part_28678_31004965.1163790984542--

--===============0942037714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0942037714==--
