Return-Path: <hppa-linux@puffingroup.com>
Date: Sat, 6 Feb 1999 18:32:09 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902070232.SAA16244@gatekeeper.equator.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Cross compile setup
Cc: jason@gatekeeper.equator.com
Resent-Message-ID: <"xednm.0.b3.WLHls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


> From hppa-linux-request@puffingroup.com Thu Feb  4 03:45:11 1999
> From: "Strelow, Ulrich" <Ulrich.Strelow@Schering.DE>
> To: hppa-linux@puffingroup.com
> Date: Thu, 4 Feb 1999 11:59:00 +0100 
> Subject: [hppa-linux] Cross compile setup
>
...

>      Then the machine stops with the LEDs 123568 on which means "HPMC
> due 
>      to Bus Error".
>      
>      Unfortunately no one on the mklinux mailing list had any help for
> that 
>      problem (probably because the main developers were no longer
> working 
>      on/with mk-linux).
>      
>      So my question here is the following:
>      
>      Is the hppa-linux cross-compile setup for binutils and egcs 
>      possible from linux-x86 ?  
>      

 I have the same problem. Mklinux won't boot on my C160 (even in duplex
 mode through the serial port). So I'll have to
 be working from either an HPUX or Linux-x86 build environment. What build
 environment are most of you planning on using?

 Also, a question to others:
 I have started to tinker with writing an IPL for the native
 port (i.e. bootstrap code). I've been compiling/assembling within HPUX,
 but I can't seem to ascertain how to get "ld" to generate a "straight"
 binary file rather than a SOM object. The bootstrap code obviously
 has to be a plain binary to work. Note that the version of gcc I picked
 up from www.software.hp.com utilizes the HP linker, not GNU ld.

 I tried to use "objcopy -O binary some_file binary_file" with no luck. The
 resulting file was stripped of the SOM garbage, but unfortunately most
 of my code and data was also stripped away and the file was mostly zeroes!! 
 Any ideas on how to generate plain binary? Is the above behavior a objcopy
 bug or was this pilot error?

 Regards, Jason.




----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
