Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25CCB4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jun 2003 14:44:18 -0600 (MDT)
Message-ID: <3EE1007C.3030904@tiscali.be>
Date: Fri, 06 Jun 2003 20:58:36 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0306041917370.12360-300000@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.44.0306041917370.12360-300000@sal.ucc.ie>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Re: compiler & kernel (2)
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

M. Grabert wrote:

>On Tue, 3 Jun 2003, Joel Soete wrote:
>
>  
>
>>Hi Max,
>>
>>    
>>
>>>Attachment: config-2.4.20-pa35-gcc-3.3
>>>
>>>      
>>>
>>32-bits first;
>>I test this config with gcc-3.3-2 and binutils 2.13.90.0.18-7 but I encounter
>>following pb:
>>
>>`gcc-3.3 -print-libgcc-file-name` /usr/src/linux-2.4.20-pa35/arch/parisc/lib/lib.a
>>
>>/usr/src/linux-2.4.20-pa35/lib/lib.a  \
>>        --end-group \
>>        -o vmlinux
>>drivers/net/wireless/wireless_net.o(.init.text+0x78): In function `init_orinoco_cs':
>>
>>    
>>
>Yes, I enabled PCMCIA specific bits in arch/parisc/config.in. I wanted
>to get a PCMCIA wireless network card working.
>Currently hppa doesn't give you the option to select PCMCIA, so you have
>to modify the config.in so that you can select it. Just copy the PCMCIA
>bits it from arch/i386/config.in to arch/parisc/config.in.
>
>OR simpler:
>
>Disable wireless network (orinoco, hermes, orinoco_cs etc.).
>  
>

Well finaly I reach to continue only some test.
I so choose this simpler solution to build 32 kernel with gcc-3.0 first 
and it compiles well (it took about 15min excluded modules).
I launch it on my b2k and it seems to works fine (any boot pb); I so use 
it to rebuild te same kernel with gcc-3.3.
It also compiles well (in about 12min).
But I notice something strange: runing a top in another xterm, I notice 
that swap was well on but absolutly not used where usually my kernel 
(near about debian std cfg) used about 20Mb of swap (with 256Mb of ram).
Is it a wanted behaviour? (config option?)

Thanks,
    Joel

PS: I do not yet reboot with this last kernel (on Tuesday :-) )
