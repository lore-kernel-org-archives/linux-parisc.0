Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89FFC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 07:31:32 -0700 (MST)
Date: Mon, 17 Dec 2001 19:57:05 +0530 (IST)
From: Maneesh Singhal <maneesh@india.hp.com>
To: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation..... new problems..
In-Reply-To: <3C1C93FB.8AE6C6E3@freebel.net>
Message-ID: <Pine.HPX.4.21.0112171953100.17005-100000@hpuxsrv.india.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 16 Dec 2001, Joel Soete wrote:

> Hello Maneesh,
> 
> >        selection .. Bus reset detected ..." etc. etc.
> 
> This sound like a problem I met a time ago: the scsi chain was opened
> (ie during test I forgot to reconnect the scsi terminator to my external
> drive).
> 
> If a scsi terminator is well connected may be could it be defective (or
> a one not corresponding to your scsi interface logicaly Single-Ended if
> your CD is connected to the narrow single-ended conector)?

Thanx Joel,

	Exactly this was the problem, my scsi cable was loose, and also
	didn't have the terminator.. Anyway, now I installed the system.

	One new question : I am unable to start my X , whenever I do 
	startx it says 

	"Fatal Server Error :
	no screen found "

	Can anybody tell me why it is happening so ??????

	Also my machine is not able to connect to any other machine...
	though I configured the network !!!


	Thanx again for all the helps !!


> 
> Good luck,
> 	Joel
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
