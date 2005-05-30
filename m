From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 18:13:18 -0700
Message-ID: <20050530011318.GE3050@tausq.org>
References: <200505290141.j4T1ffhI006449@hiauly1.hia.nrc.ca>
	<42999A30.6070602@tiscali.be> <4299F8C2.2060400@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4299F8C2.2060400@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> #ifndef CONFIG_64BIT
>         .macro fixup_branch,lbl
>         b           \lbl
>         .endm
> #else
>         .macro fixup_branch,lbl
>         ldil        L%\lbl, %r1
>         ldo         R%\lbl(%r1), %r1
>         bv,n        %r0(%r1)
>         .endm
> #endif

These two do the same thing. The 32-bit version is simpler because we
can rely on the linker to do fixups for us if the branch is too far
away. The 64-bit version always uses a long branch sequence to avoid
stub issues with the 64-bit toolchain. In the C code I have simply not
done this (micro-)optimization.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
