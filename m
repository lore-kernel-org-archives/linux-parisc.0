Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDF154829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 11:37:29 -0600 (MDT)
Message-ID: <3EDA3D21.8070400@tiscali.be>
Date: Sun, 01 Jun 2003 17:51:29 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net> <200306011543.59335.deller@gmx.de> <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
In-Reply-To: <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
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

Bjoern A. Zeeb wrote:

>On Sun, 1 Jun 2003, Helge Deller wrote:
>
>  
>
>>>is there a chance that one can recover from s.t.h like this ?
>>>
>>>Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
>>>palo_kernel=3/boot/vmlinux-2.5.60-pa1' Selected kernel:
>>>/boot/vmlinux-2.5.60-pa1 from partition 3
>>>ERROR: open /boot/vmlinux-2.5.60-pa1 from partition 3 failed
>>>      
>>>
>>You could boot a good kernel via tftp. That's how I test different kernels...
>>    
>>
>
>not a too bad idea but that's not the problem here.
>
>When palo cannot open the kernel and errors out shouldn't it fall back
>to the dialog and ask one to which fields to change instead of simply
>running into a dead end where I think I can only recover from with
>physical access to the machine ?
>
>  
>
Afaik no way right now and I think it would be a good idea to open a bug 
report about this subject.
The current palo status of is specialy anoying when you reboot a server 
as a N (selftest of about 1/4h) and you made some stupid typo (as you 
do: 60 in place of 69) .

Hmm if I still have some time to have a look on this (as well as for 
booting a compressed kernel), which is the best 'model' (the nearest of 
palo) that I would have to analyse?

Cheers,
    Joel
