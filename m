From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Error compiling 3.9.0
Date: Thu, 02 May 2013 14:41:40 +0200
Message-ID: <2d7b2933c7dcaa9e8d7650da13a68795@sf-mail.de>
References: <1742161.3f9jxWykf1@devpool02>
 <e5606dd2f0529641a897f078e3814e82@sf-mail.de> <517FD922.6060408@bell.net>
 <1428267.TfdjUgcdcj@eto> <BLU0-SMTP551CEF6DC18E943F6141C397BD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP551CEF6DC18E943F6141C397BD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 02.05.2013 03:34, schrieb John David Anglin:
> On 30-Apr-13, at 12:40 PM, Rolf Eike Beer wrote:
> 
>>>> Nope, but probably this:
>>>> 
>>>> *hppa64-unknown-linux-gnu-ld: scripts/link-vmlinux.sh: line 52: 
>>>> 5398
>>>> Segmentation fault      ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o  
>>>> ${2} -T
>>>> ${lds} ${KBUILD_VMLINUX_INIT} --start-group ${KBUILD_VMLINUX_MAIN}
>>>> --end-group ${1}
>>> 
>>> No, it's probably a kernel bug.  Is the crash consistent?  If it  
>>> isn't,
>>> then it's an OS or kernel bug.
>> 
>> I have got the same crash again. This are the first 2 tries I ever  
>> made with
>> binutils 2.23.1 for 64 bit binaries, so I have nothing to compare to.
> 
> I have successfully built 3.9.0 with debian binutils 2.23.2-2, so I
> think the above
> issue is specific to your kernel, config, etc.  So, full details are
> needed.  Particularly,
> details on how to reproduce the fault are needed.

It's a plain 3.9.0, the .config was attached to the first mail. I 
always get the same problem at the same place:

   KSYM    .tmp_kallsyms1.o
hppa64-unknown-linux-gnu-ld: scripts/link-vmlinux.sh: line 52: 11674 
Segmentation fault      ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2} -T 
${lds} ${KBUILD_VMLINUX_INIT} --start-group ${KBUILD_VMLINUX_MAIN} 
--end-group ${1}
make: *** [vmlinux] Error 139

Greetings,

Eike
