Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41A1B482C
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 May 2003 14:35:32 -0600 (MDT)
Message-ID: <3EB42B20.1010504@tiscali.be>
Date: Sat, 03 May 2003 20:48:32 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs
 and -fPIC
References: <20030430003106.GC12492@systemhalted> <3EA9466400001A95@ocpmta7.freegates.net> <20030430181216.GA20779@systemhalted>
In-Reply-To: <20030430181216.GA20779@systemhalted>
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

Carlos O'Donell wrote:

>>>Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
>>>to things like 'vi' ... *sigh* I haven't even looked into this (looks
>>>like gcc/glibc clashes again).
>>>
>>>      
>>>
>>Umm could this be why that my b2k crashed when compiling a kernel to test
>>a patch?
>>    
>>
>
>Quite possibly. If you can get a backtrace of the crash you'll se it die
>inside _Unwind_Find_FDE in glibc.
>
I couldn't anymore check because unfortunately even after comming back 
to libc6 sub debian release -16 my b2k crashes severall times. The last 
time was badly in the middle of a apt-get dist-upgrade; this crash 
corrupt the root fs so that it isn't any more usable. I will try to 
recover it asap to check.

That said, I suspect more another hw pb (it is not the first time with 
this b2k model on which hp had already have to replace the cpu) or a bug 
into cd-ide driver (this is the only model I had the chance to test with 
this kind of feature).

> 
>I'm working on fixing this.
>
>  
>
Thanks for your attention,
    Joel
