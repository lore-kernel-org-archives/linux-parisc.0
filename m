Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E285482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 14:46:24 -0600 (MDT)
Message-ID: <3F340C18.5020801@tiscali.be>
Date: Fri, 08 Aug 2003 20:46:16 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: "Conan C. Albrecht" <conan_albrecht@byu.edu>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Re: Debian on rp 7400
References: <25EEF58E-C82D-11D7-8F19-00039398B282@byu.edu> <20030806205220.GA6353@dsl2.external.hp.com> <3F336914.5020305@tiscali.be> <20030808163744.GA29158@dsl2.external.hp.com>
In-Reply-To: <20030808163744.GA29158@dsl2.external.hp.com>
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

>BTW, this discussion really belongs on parisc-linux.org mailing list.
>It's not specific to debian-hppa and is very kernel centric.
>
>On Fri, Aug 08, 2003 at 09:10:44AM +0000, Joel Soete wrote:
>  
>
>>>IIRC, "non-equivalently mapped aliases" 
>>>      
>>>
>
>  
>
>>Is there much more detailed public doc some where about this stuff?
>>    
>>
>
>sorry - I don't understand the problems well enough.
>The PA 2.0 arch book might describe the cache behaviors sufficiently
>to determine this will be a problem.
>
>  
>
>>>BTW< this topic has been thoroughly discussed on parisc-linux
>>>mailing list. See www.parisc-linux.org mailing list archives.
>>>      
>>>
>
>google search for
>	equivalent mapped [parisc-linux site:lists.parisc-linux.org]
>
>yielded the original thread from Jerry Huck:
>
>http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008101.html
>
I see I was not yet in the list; at this very moment I was still battle 
to build a kernel from hpux and the first cd safe me :)

>
>I only partially understand what Jerry talking about and have no idea
>how linux VM implementation collides with the aliasing rules.
>
>
>Bjorn Helgaas posted a another thread two years later that might
>be more helpful since it's specific to superdome (AFAIK same problems
>as with N-class and L3000):
>
>http://lists.parisc-linux.org/pipermail/parisc-linux/2001-April/012388.html
>
>I didn't see any direct followup to Bjorn's mail in the archive though
>some discussion did occur in other forums (much later).
>
>  
>
Well better starting point I will gona check,

Thanks a lot,
    Joel
