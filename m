Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08B8C482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 10:31:35 -0700 (MST)
Message-Id: <200302111731.h1BHV1at017679@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Tag Starvation on 715/100
To: badmax@club-internet.fr (Bad Max)
Date: Tue, 11 Feb 2003 12:31:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <yam9172.666.149231680@mail.club-internet.fr> from "Bad Max" at Feb 11, 2003 06:20:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

I believe the problem is the driver is using too many tags on an old
drive.  You want to cut the number or disable tagged queing in the
driver for this drive.  Grant would know the details but early Seagates
had buggy support for this feature.

> SCSI error. It is running under 2.4.17-pa20.
> 
> On 11-fév-03, you wrote:
> 
> | > Hi,
> | > 
> | > today my machine hangs when I tried to do a 'cvs update' for the newest
> | > PA/RISC-Kernel. So I pressed the power button to reboot the machine. But
> | > now during startup when fsck is running, the scsi-driver gives me an
> | > error message, that my harddisc is "suffering from tag starvation".
> | > Later the machine crashes. Booting a 2.5.59-kernel is no problem (even
> | > it's not possible to login on serial console... ).
> | > 
> | > Has anybody the same problem and/or can anybody help?
> | > 
> | > Facts: 715/100, 128 MB, 2 GB Seagate, Kernel 2.4.20-pa22, gcc-3.0.4, 
> | > Debian testing.
> | > System.map is here: 
> | > http://homepages.tu-darmstadt.de/~rscholz/parisc/System.map 
> | > <http://homepages.tu-darmstadt.de/%7Erscholz/parisc/System.map>
> | > 
> | > TIA, Rüdiger
> | > 
> 
> -------
> Bad Max
> ========
> Amiga User
> GNU User
> WWW: perso.club-internet.fr/badmax
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
