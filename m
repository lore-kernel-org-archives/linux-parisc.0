Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 0327B482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 03:33:11 -0600 (MDT)
Message-ID: <3D3D2383.7070708@itp.bg>
Date: Tue, 23 Jul 2002 12:36:03 +0300
From: Stephan Trajkoff <stephan@itp.bg>
MIME-Version: 1.0
To: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cannot make kernel
References: <20020723065037.4D5D2482C@dsl2.external.hp.com> <1027414345.3d3d19494be24@webmail.tiscalinet.be>
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

joel.soete@freebel.net wrote:

>Quoting Stephan Trajkoff <stephan@itp.bg>:
>
>  
>
>>-------------------------------------------------------------------
>>-->> FREE Perl CGI scripts add WEB ACCESS to your POP email accounts!
>>-->> Download today!! http://www.adjeweb.com
>>-------------------------------------------------------------------
>>
>>`gcc -print-libgcc-file-name` /usr/src/linux/arch/parisc/lib/lib.a
>>/usr/src/linux/lib/lib.a  \
>>        --end-group \
>>        -o vmlinux
>>drivers/video/video.o: In function `.L1581':
>>drivers/video/video.o(.init.text 0x23e8): undefined reference to
>>`fbcon_sti'
>>drivers/video/video.o: In function `.L1639':
>>drivers/video/video.o(.init.text 0x25d0): undefined reference to
>>`fbcon_sti'
>>make: *** [vmlinux] Error 1
>>
>>I tried to compile pa56
>>I made make oldconfig from pa54
>>    
>>
>
>Do you try make clean after make oldconfig and before make vmlinux?
>
>(I also do it yesterday evening and do not met any problem)
>
>Joel
>
>
>-------------------------------------------------
>This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>Man I am not stupid, make oldconfig && make dep && make clean && make 
>
I working with UNIX(Linux, qnx) for 4 years...
I made apt-get dist-upgrade
very strange dude

>  
>
