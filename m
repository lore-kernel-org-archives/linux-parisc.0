Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51244483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Nov 2003 12:54:14 -0700 (MST)
Message-ID: <3FB28FE6.2040908@tiscali.be>
Date: Wed, 12 Nov 2003 19:54:14 +0000
From: JSO <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de> <20031103214119.GD778@systemhalted> <20031110234414.GA27527@solo.franken.de> <20031111214610.GJ18512@systemhalted>
In-Reply-To: <20031111214610.GJ18512@systemhalted>
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

Carlos O'Donell wrote:

>>I had some thoughts about the conversion stuff, I've added to work
>>around problems introduced because of the change of some structures in
>>glibc/kernel. I finally realized, that these conversion only works,
>>if the "old glibc" is still installed together with the old binary.
>>That's because the newer glibcs don't set the IPC_64 bit when doing 
>>the syscall, but the old binary still uses the wrong structs, so the
>>conversion routine never triggers. I think it's really time to remove that
>>crap. Below is an compiled but not booted patch, which removes it and also
>>forward ports the necessary bits in ipc/util.c from 2.4. 
>>    
>>
>
>The following things confuse me.
>
>a. Our glibc never set IPC_64, we had pass-thru assembly syscall
>   wrappers. Why? Because we don't have an IPC multiplexor, none of the
>   generic glibc code can be used by hppa.
>
>So I don't understand some of your comments about "old glibc setting
>IPC_64."
>
>  
>
>>If someone also wants to change glibc, feel free. I still think changing
>>glibc is a bad idea, because this new glibc won't work with a current 2.4
>>kernel.
>>    
>>
>
>I believed we had the following scenario:
>
>a. Old glibc never called with IPC_64.
>b. Kernel turned IPC_64 on for us so we get the new style structs.
>c. Apps get new style structs without calling IPC_64.
>
>Now we wish to have the hack in the kernel removed, but apps exist that
>expect newstyle structs without calling IPC_64. Thus glibc has to
>call the syscall with IPC_64 to get the right value back to userspace.
>
>AFAIK the following is required:
>
>a. Remove kernel hacks (Thanks Thomas!).
>  
>
So I test it successfuly with 2.4 on my b2k (just re-compile the kernel, 
ssh remote connection, rsync ft, ...) :)
Sorry no more time try 2.6 on a b180 :(

>b. Add glibc code to turn IPC_64 on for all the afflicted syscalls.
>c. Eventually when all the apps disappear we can toss out the code from
>   glibc.
>
>Thomas, did I get this right?
>
>Cheers,
>Carlos.
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>  
>
