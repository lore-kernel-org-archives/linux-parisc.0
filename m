Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 555914937
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 01:46:19 -0600 (MDT)
Message-ID: <3F335550.3030804@tiscali.be>
Date: Fri, 08 Aug 2003 07:46:24 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: geos@canada.com
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] adding a second nic to B1000
References: <20030807110141.25427.h020.c009.wm@mail.canada.com.criticalpath.net>
In-Reply-To: <20030807110141.25427.h020.c009.wm@mail.canada.com.criticalpath.net>
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

geos@canada.com wrote:

>Sorry about that 
>im kinda new to this if you cant tell ;)
>make config allowed me to select what nic drivers i
>wanted but this did not compile or load the new driver  
>
>i will have to get the exact errors msg's when i get
>back home 
>
>i ran the recompile kernal found here 
>http://www.parisc-linux.org/kernel/index.html
>using Simple Recipe to Build a Kernel 
>
>this added the source to /usr/src/linux
>that source should be the same as my kernal 
>after doing that i did this 
>http://www.scyld.com/expert/modules.html
>needed to get lib6,cvs after a net-install to do this 
>
>the common error after compileing and doing a insmod
>3c95x.o
>was "this was compiled for 2.4.18 and this version is
>for 2.4.19" 
>so i copy the 3c95x.c from the 2.4.19 kernel and did it
>again now i get an error like this will not function 
>
Well if I well understand you reached to recompile hppa linux kernel 
with module for 3c95x: congratulation.
But to load modules, they have to be build for the kernel you are 
running (I think that will change in 2.6). So the only  think to do now 
is to _reboot_ with the kernel you just rebuild for your nic :)

hth,
    Joel
