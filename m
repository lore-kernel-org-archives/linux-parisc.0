Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C8B44844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 04:23:00 -0600 (MDT)
Message-ID: <3F683606.8000701@tiscali.be>
Date: Wed, 17 Sep 2003 10:23:02 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: mmogenius@v8fiesta.co.uk, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x86 on b2000
References: <Pine.LNX.4.44.0308280022230.16696-100000@sal.ucc.ie> <1062062541.3f4dc9cd843ed@webmail.v8fiesta.co.uk> <1063733943.3f674ab751edb@webmail.v8fiesta.co.uk> <20030916174726.GC30906@dsl2.external.hp.com> <1063738987.3f675e6b22961@webmail.v8fiesta.co.uk> <20030917040849.GA11011@dsl2.external.hp.com>
In-Reply-To: <20030917040849.GA11011@dsl2.external.hp.com>
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

>On Tue, Sep 16, 2003 at 08:03:07PM +0100, mmogenius@v8fiesta.co.uk wrote:
>  
>
>>I have tried this but i am still getting the same error message... 
>>
>>Fatal server error:
>>AddScreen/ScreenInit Failed for driver 0 
>>    
>>
>
>
>  
>
>>With me having 2 cards in the machine do i need to specify wich one to use ?
>>    
>>
>
>Maybe. I would expect the default to be the console.
>Can you remove one of the cards?
>  
>
hmm I presume that the first one is the builtin (not removable) gfx 
(which is not supported :( ) and the additional one is supported and 
pluged into a pci slot (so removable but the one usefull)?

Afaik i don't think that it is possible to 'remove' (even logicaly with 
some strap or switch) the builtin gfx.
Anyway, it is possible to change the default monitor to 'graphics1' (as 
afaik here the pdc would recognise the additional gfx) with help of 
COnfiguration submenu at bootprompt. (may be MO cmd would help to get 
more accurate info?)

Or (into linux system) should it be also possible to create a /dev/fb1 
(MAKEDEV iirc) and change with fbset the default fb device to fb1?

>  
>
>>if so where can i get the information to do this as i am not having much luck 
>>finding any documentation. Thanks
>>    
>>
>
>Try searching tha parisc-linux mailing list for "ScreenInit Failed".
>Plenty of hits on this topic.
>
>If none of the above helps, can you post the full Xfree86.log.0?
>
>grant
>
hth,
    Joel
