Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC979482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 02:26:02 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-4.cisco.com (8.11.3/8.9.1) with ESMTP id g049Q1v13675
	for <parisc-linux@lists.parisc-linux.org>; Fri, 4 Jan 2002 01:26:01 -0800 (PST)
Date: Fri, 4 Jan 2002 01:25:59 -0800
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020104012559.69375281.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Need five #defines, please.....
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

Ok,


I'm trying to skin the lizard (mozilla 0.9.7). I can build with the linux
default pthreads, but it doesn' work, windows show up but the content is
not drawn etc.. Hence I'd like to try a build with "classic" NSPR, which
implements it's own threading mechanism. Problem : There is a couple of
hardware-specific definitions that I don't know how to do, but somebody
with some insight in parisc-linux may be able to put it down in 5 minutes
(I hope..). Or maybe it has been solved it already ? 

Here's what I'm missing : 

#elif defined(__hppa__)
/* parisc */    
#define _MD_GET_SP(_t) 
#define _MD_SET_FP(_t, val)
#define _MD_GET_SP_PTR(_t) 
#define _MD_GET_FP_PTR(_t)
#define _MD_SP_TYPE 

As a hint, here some existing defines. As far as my limited incompetence
can tell these provide access to some of the context information of the
threads :

/* Sparc */  
#define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
#define _MD_SET_FP(_t, val) ((_t)->md.context[0].__jmpbuf[JB_FP] = val)
#define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))
#define _MD_GET_FP_PTR(_t) (&(_t)->md.context[0].__jmpbuf[JB_FP])
#define _MD_SP_TYPE int

/* Alpha based Linux */
#define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
#define _MD_SET_FP(_t, val)
#define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))
#define _MD_GET_FP_PTR(_t) ((void *) 0)
#define _MD_SP_TYPE long int


/* Intel based Linux */ 
#define _MD_GET_SP(_t) (_t)->md.context[0].__jmpbuf[JB_SP]
#define _MD_SET_FP(_t, val) ((_t)->md.context[0].__jmpbuf[JB_BP] = val)
#define _MD_GET_SP_PTR(_t) &(_MD_GET_SP(_t))                           
#define _MD_GET_FP_PTR(_t) (&(_t)->md.context[0].__jmpbuf[JB_BP])         
     #define _MD_SP_TYPE int


Thanks,
	Christian 
