Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1D2A4830
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Sep 2003 02:00:22 -0600 (MDT)
Message-ID: <3F52FCA2.5050500@tiscali.be>
Date: Mon, 01 Sep 2003 08:00:34 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [parisc-linux] Security Hole in binfmt_som.c ?
References: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>	 <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk> <1062251389.31150.4.camel@dhcp23.swansea.linux.org.uk>
In-Reply-To: <1062251389.31150.4.camel@dhcp23.swansea.linux.org.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Alan Cox wrote:

>On Sad, 2003-08-30 at 14:15, Matthew Wilcox wrote:
>  
>
>>On Sat, Aug 30, 2003 at 02:42:37PM +0200, Ruediger Scholz wrote:
>>    
>>
>>>binfmt_som.c:216:2: #error "Fix security hole before enabling me"
>>>What's this message about?
>>>      
>>>
>>I don't know.  I wish someone would tell me.  You'd think they'd have the
>>decency to contact the person listed as the author at the top of the file.
>>    
>>
>
>Actually explanations were posted in the previous discussion on this on
>parisc-list.
>
>Someone has to do the equivalent of the 2.4.22 binfmt_elf changes if
>neccessary so that another thread can't change the file handles or 
>steal the exec fd being passed to the loader.
>
>  
>
Yes Alan, it was: 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-July/020386.html>

Sorry Willy I trusted that you read it (My bad next time I will advise 
you directly)

Joel
