From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Tue, 28 Jan 2003 09:47:00 -0500 (EST)
Message-ID: <200301281447.h0SEl0VV007290__10268.9239815392$1416622154$gmane$org@hiauly1.hia.nrc.ca>
References: <20030128073101.GD20940@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@dsl2.external.hp.com, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: tausq@debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030128073101.GD20940@tausq.org> from "Randolph Chung" at Jan 27, 2003 11:31:01 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> gcc translates this to something like this:
>     /* %r4 is &pty_driver */
>     ldo 28(%r4),%r23
>     ldi 28,%r21
>     ldw,ma 4(%r22),%r20
>     ldw,ma 4(%r22),%r19
>     stw,ma %r20,4(%r23)
>     addib,>= -8,%r21,.-12
>     stw,ma %r19,4(%r23)
>     /* ... */
>     stw %r0,28(%r4)
>     stw %r0,32(%r4)
>     stw %r10,36(%r4)
>     stw %r0,40(%r4)
> 
> When optimizations are turned on, gcc reschedules some of those final 
> stw insns above the structure copy loop. When the structure copy 
> happens, the values get overwritten. ick.
> 
> this was kind of interesting to debug :) but i have no idea how to fix
> it. Dave? :)

I don't either at the moment.  It's memory aliasing problem.  It's
most likely not a problem in the backend.

Can you strip the above down to a simple testcase and file a GCC PR?
I will bump it to high-priority as it is a regression.

-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
