Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87C034830
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Sep 2003 13:54:43 -0600 (MDT)
Message-ID: <3F58EA02.8040404@tiscali.be>
Date: Fri, 05 Sep 2003 19:54:42 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a fast fls also for 2.6?
References: <3F58838A.9010203@tiscali.be> <3F5888F3.5060609@tiscali.be> <20030905182621.GC10216@dsl2.external.hp.com> <20030905192927.GD10216@dsl2.external.hp.com>
In-Reply-To: <20030905192927.GD10216@dsl2.external.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Grant Grundler wrote:

>On Fri, Sep 05, 2003 at 12:26:21PM -0600, Grant Grundler wrote:
>  
>
>>>Without any remark, I don't know if you could also be interested to 
>>>include it in 2.6.
>>>      
>>>
>>no - becuase fls() and ffs() return the same values for given input.
>>(I see comments in include/asm-ppc/bitops.h to that effect).
>>    
>>
>
>James Bottomley privately corrected me. fls() != ffs().
>fls() returns most significant bit set.
>
>The examples provided:
>	* Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
>
>have the same value for ffs() and fls(). I didn't read the rest.
>Good examples for showing bit numbering though.
>
>I'll work on adding 64-bit support to your __fls() and commit that.
>
Thanks a lot :) (it just make me happy to be usefull)

>
>sorry for the confusion,
>
Please, don't be sorry, I am frequently the first confusing thought ;)

Cheers,
    Joel
