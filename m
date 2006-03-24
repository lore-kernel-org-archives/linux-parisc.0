From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Fwd: hppa glibc clone() patch proposal (3/3)
Date: Fri, 24 Mar 2006 14:50:50 -0500
Message-ID: <119aab440603241150p3e15057gc23e355732c1dea@mail.gmail.com>
References: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>
	<119aab440603241148k755eb8a1m10982b0538fc2cf3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440603241148k755eb8a1m10982b0538fc2cf3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>         /* Create frame for function */
>         copy            %sp, %r21
> +       stw             %r21, 60(%sp)
>         stwm            %r3, 64(%sp)
> -       stw             %r21, -4(%sp)

Bug.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
