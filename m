Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe41.law4.hotmail.com [216.33.148.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C557482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 03:51:53 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Christian Suder" <csuder@cisco.com>,
	<parisc-linux@lists.parisc-linux.org>
References: <20020104012559.69375281.csuder@cisco.com>
Subject: Re: [parisc-linux] Need five #defines, please.....
Date: Fri, 4 Jan 2002 11:51:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE41uHR2lXB5DtxKHcV00005ff9@hotmail.com>
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

Christian,

Can you keep me informed about this issue, as I am very keen on getting
mozilla to work on my 712/60. I've tried to compile the 0.9.5 version, a
long time ago, without any success (see earlier posts). I'm interested in
which files I need to modify, configure options, compiler options, ... .

Many thanks in advance.


regards,
Kenneth

----- Original Message -----
From: "Christian Suder" <csuder@cisco.com>
To: <parisc-linux@lists.parisc-linux.org>
Sent: Friday, January 04, 2002 10:25 AM
Subject: [parisc-linux] Need five #defines, please.....


> Ok,
>
>
> I'm trying to skin the lizard (mozilla 0.9.7). I can build with the linux
> default pthreads, but it doesn' work, windows show up but the content is
> not drawn etc.. Hence I'd like to try a build with "classic" NSPR, which
> implements it's own threading mechanism. Problem : There is a couple of
> hardware-specific definitions that I don't know how to do, but somebody
> with some insight in parisc-linux may be able to put it down in 5 minutes
> (I hope..). Or maybe it has been solved it already ?
>
> Here's what I'm missing :
>
> #elif defined(__hppa__)
> /* parisc */
> #define _MD_GET_SP(_t)
> #define _MD_SET_FP(_t, val)
> #define _MD_GET_SP_PTR(_t)
> #define _MD_GET_FP_PTR(_t)
> #define _MD_SP_TYPE
>
> As a hint, here some existing defines. As far as my limited incompetence
> can tell these provide access to some of the context information of the
> threads :
>
> /* Sparc */
> #define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
> #define _MD_SET_FP(_t, val) ((_t)->md.context[0].__jmpbuf[JB_FP] = val)
> #define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))
> #define _MD_GET_FP_PTR(_t) (&(_t)->md.context[0].__jmpbuf[JB_FP])
> #define _MD_SP_TYPE int
>
> /* Alpha based Linux */
> #define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
> #define _MD_SET_FP(_t, val)
> #define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))
> #define _MD_GET_FP_PTR(_t) ((void *) 0)
> #define _MD_SP_TYPE long int
>
>
> /* Intel based Linux */
> #define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
> #define _MD_SET_FP(_t, val) ((_t)->md.context[0].__jmpbuf[JB_BP] = val)
> #define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))
> #define _MD_GET_FP_PTR(_t) (&(_t)->md.context[0].__jmpbuf[JB_BP])
>      #define _MD_SP_TYPE int
>
>
> Thanks,
> Christian
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
