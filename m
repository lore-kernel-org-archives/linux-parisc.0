Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id C12A9482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 21:59:01 -0600 (MDT)
Message-ID: <3EF1353C.8030705@bluehash.de>
Date: Thu, 19 Jun 2003 05:59:56 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some 2.5-testing
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca>
In-Reply-To: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca>
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

John David Anglin schrieb:

>Until issues related to the canonicalization of function pointers
>and the alignment of stack locals are resolved, it is best to stick
>with debian gcc-3.0.4 for kernel building.
>
So I installed gcc-3.04 from Debian, did "make distclean", "make 
oldconfig" (selecting "PA7100LC") and booted...
And got the same loop again ;)

---------- SNIP---------------

     md: linear personality registered as nr 1
    Badness in local_bh_enable at at kernel/softirq.c:109
    Kernel addresses on the stack:

     [tirq.c:109
    <4>Kernel addresses on the stack:
    <4> [<10124edcc8>]  [<1010ea4c>]
    <4> [<1012503c>]  [<1028ac08>]  [<10124cc>]
    <4> [<1029a2a4>]  [<103ad4d4>]  [<10100284>]  [<10109c5ab8>] 
    [<101289a8>]  [<1028ac20>]
     [<1028b428>]  [<101070f28ac08>]  [<10124f10>]  [<1028adcc>]
     [<1029a2a4>]  [<103adc>]
    <4> [<1029a2a4>]  [<103ad4d4>]  [<10100284>]  [<10109c>] 
    [<103ad4d4>]  [<10100284>]  [<10109c5c>]


---------- SNAP---------------

Complete Bootlog and System.map is here: rscholz.bluehash.de/parisc .
Can I do something else to help finding the bug?

>  Loops of this kind can
>happen when lock structures are misaligned on PA 1.1 machines.
>
>Dave
>  
>

Rüdiger
