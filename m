Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 401AE482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 15:39:49 -0600 (MDT)
Message-ID: <3F19BE5C.2070000@tiscali.be>
Date: Sat, 19 Jul 2003 21:55:40 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.6.0-test1-pa1 64bits failled to compile
References: <3F0C24F800000FBF@ocpmta8.freegates.net> <20030719094114.GC7452@lug-owl.de>
In-Reply-To: <20030719094114.GC7452@lug-owl.de>
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

>On Wed, 2003-07-16 18:35:44 +0200, Joel Soete <jsoe0708@tiscali.be>
>wrote in message <3F0C24F800000FBF@ocpmta8.freegates.net>:
>  
>
>>Hi all,
>>
>>This today cvs update failled to compile on my N4000-55 with this very short
>>message:
>>
>>  LD      init/built-in.o
>>  LD      .tmp_vmlinux1
>>make: *** [.tmp_vmlinux1] Error 139
>>palx4000:/usr/src/linux-2.6.0-test1-pa1# 
>>
>>Is there some tips to get more verbose make output?
>>    
>>
>
>$ make V=1 vmlinux modules
>
>MfG, JBG
>
>  
>
thanks a lot,
    Joel
