Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 813EF482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 13:32:22 -0600 (MDT)
Message-ID: <3F33FAC5.40509@tiscali.be>
Date: Fri, 08 Aug 2003 19:32:21 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] adding a second nic to B1000
References: <20030807110141.25427.h020.c009.wm@mail.canada.com.criticalpath.net> <3F335550.3030804@tiscali.be> <20030808150256.GX1873@lug-owl.de>
In-Reply-To: <20030808150256.GX1873@lug-owl.de>
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

Jan-Benedict Glaw wrote:

>On Fri, 2003-08-08 07:46:24 +0000, Joel Soete <joel.soete@tiscali.be>
>wrote in message <3F335550.3030804@tiscali.be>:
>  
>
>>geos@canada.com wrote:
>>    
>>
>
>  
>
>>But to load modules, they have to be build for the kernel you are 
>>running (I think that will change in 2.6). So the only  think to do now 
>>    
>>
>
>I'm quite sure that won't change, ever. Linux, if it's compatible to
>itself at all, has got "only" a source compatible API. You're somewhat
>on a more save side if you're using symbol versioning, but if you force
>a module to load (into a kernel of different version or even of
>different configuration), you may loose. Right now or sometime later:)
>
>That's what "tainting" was ment for:)
>
>MfG, JBG
>
>  
>
Sorry for this confuion I do have missunderstood some discussion on the 
subject, my bad :(

Thanks for those clarification,
    Joel
