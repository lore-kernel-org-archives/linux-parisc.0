Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2B424829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jul 2003 09:57:30 -0600 (MDT)
Message-ID: <3F084A81.9050805@tiscali.be>
Date: Sun, 06 Jul 2003 16:12:49 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
References: <20030705230834.GB9682@dsl2.external.hp.com> <200307052353.h65NrZF4025169@hiauly1.hia.nrc.ca> <20030706041210.GA16894@dsl2.external.hp.com>
In-Reply-To: <20030706041210.GA16894@dsl2.external.hp.com>
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

>On Sat, Jul 05, 2003 at 07:53:34PM -0400, John David Anglin wrote:
>  
>
>>Instead of adding (void *) to each comparison,
>>    
>>
>
>This is just a temporary workaround and I have no plans of committing
>any (void *) casts to fix this problem.
>
>  
>
>>you could add a kernel
>>version of __canonicalize_funcptr_for_compare:
>>
>>__canonicalize_funcptr_for_compare:
>>	bv %r0(%r2)
>>	copy %r26,%r28
>>
>>or for PA 2.0
>>
>>__canonicalize_funcptr_for_compare:
>>        bve (%r2)
>>	copy %r26,%r28
>>
>>I think there was a possible solution along these lines posted on the list
>>a few months ago (joel?).
>>    
>>
Yes I test succesfully (as w-a) some similar solution. (see: 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-May/019982.html>) 
but I doubt that it is the right way ...

>Ok.  I didn't see it when trolling the mail archive.
>No matter, I'll try it.
>Anyone have an opinion on which arch/parisc file this should go in?
>  
>
... arch/parisc/lib/fptr.c seems well the right place (what do you think?)
but the rest of EXPORT_SYMBOL was just 'to make it compile' but do not 
sound (please don't ask me to decribe this sound :) ) to me the way it 
have to be (sorry I was waiting more guidance to submit more complete 
work :( )

hth,
    Joel
