Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 519DA482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 11:09:17 -0700 (MST)
Date: Fri, 22 Nov 2002 18:39:39 +0100
Message-ID: <3DAAAD4600004194@ocpmta1.be.tiscali.com>
In-Reply-To: <20021122173319.GG19331@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Squid-2.4.7 problem
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hi Randolph,

>
>> I try to install squid on a sarge install with a kernel 2.4.19-32. This
>squid
>> failled with data_page_fault.
>
>if this is reproducible, it is much better if you generate a core file
>and look at that instead.

Good idea I will try.

>
>> As I would like to build an elementary FW there is no dev tools on this
>box.
>> So I try to debug the problem on my unstable (just update this morning)
>box
>> but here the problem is absolutly different: squid loop and a strace tells
>> me:
>> ...
>> sched_yield()    =0
>> sched_yield()    =0
>
>i suspect this is quite normal, depending on what squid is doing.
>
>strace by default also only looks at the parent task. if any children
>are fork()ed they will not be traced unless you tell it to. 
>
Hmm strace -f -p xxx 

says the same and no forks process?

I will try first the core dump.

Thanks,
    Joel



********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
